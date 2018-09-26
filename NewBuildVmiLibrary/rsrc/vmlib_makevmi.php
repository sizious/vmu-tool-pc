<?

////////////////////////////////////////////////////////////////////////
// Function: doWord()                                                 //
// Description: creates a string from an int                          //
// Parameters:                                                        //
// $int: int corresponding to the value to convert                    //
// $len: int corresponding to the size in bytes of the string to      //
//       create                                                       //
// $order: 2 chars string corresponding to the order of the string:   //
//         'be': the string is made using big endian order            //
//         'le': the string is made using little endian order         //
//         anything but 'be' will be read as 'le'                     //
// Return Values: a $len chars string                                 //
////////////////////////////////////////////////////////////////////////

function doWord($int, $len, $order) {
	$word = '';

	while ($int >= 256) {
		$n = $int % 256;
		$word = chr($n).$word;
		$int = floor($int / 256);
	}

	$word = chr($int).$word;

	if (strlen($word) > $len) $word = substr($word, strlen($word)-$len);
	while (strlen($word) < $len) $word = chr(0).$word;

	if ($order != 'be') $word = strrev($word);

	return $word;
}

////////////////////////////////////////////////////////////////////////
// Function: makeVmi()                                                //
// Description: creates a string containing the VMI file              //
// Parameters:                                                        //
// $title: [0-32] chars string containing the description of the file //
//         shown in the download window                               //
// $creator: [0-32] chars string containing the author of the file    //
//           shown in the download window                             //
// $resource: [0-8] chars string containing the vms file name without //
//            the extension                                           //
// $tm: null, '' or 15 chars string containing the creation date and  //
//      time of the VM file using YmdHisw format:                     //
//       Y: full numeric representation of the year, 4 digits         //
//       m: numeric representation of the month, with leading zeros   //
//       d: day of the month, 2 digits with leading zeros             //
//       H: 24-hour format of the hour with leading zeros             //
//       i: minutes with leading zeros                                //
//       s: seconds, with leading zeros                               //
//       w: numeric representation of the day of the week (0=sunday)  //
//      (if null or '' the current date and time will be used)        //
// $filename: [0-12] chars string containing the name of the vm file  //
// $tp: boolean corresponding to the type of file: 0=DATA, 1=GAME     //
// $fs: int corresponding to the size of the VMS file in bytes        //
// Return Values: 108 chars string containing the VMI file            //
////////////////////////////////////////////////////////////////////////

function makeVmi($title, $creator, $tm, $resource, $filename, $tp, $fs) {
	$vmi = '';
	// SEGA checksum
	$cs = "SEGA";
	for ($i=0; $i<4; $i++) $vmi .= chr(ord($cs[$i]) & ord($resource[$i]));

	// title string, 32 bytes padded with spaces (0x20)
	for ($i=0; $i<32; $i++) $vmi .= (ord($title[$i]) != 0) ? $title[$i] : " ";

	// creator string, 32 bytes padded with spaces (0x20)
	$vmi .= "http://blueswirl.shorturl.com   ";

	// creation date and time string, 15 bytes:
	// if $tm is null or '' it will use the current date and time
	if (!$tm || $tm=='') $tm = date("YmdHisw", time());
	$y = substr($tm, 0, 4);
	$vmi .= chr($y % 256).chr($y / 256);	// year (0000-9999)
	$vmi .= chr(substr($tm, 4, 2));		// month (01-12)
	$vmi .= chr(substr($tm, 6, 2));		// monthday (01-31)
	$vmi .= chr(substr($tm, 8, 2));		// hours (00-23)
	$vmi .= chr(substr($tm, 10, 2));	// minutes (00-59)
	$vmi .= chr(substr($tm, 12, 2));	// seconds (00-59)
	$vmi .= chr(substr($tm, 14, 1));	// weekday (0-7, 0=sun, 7=sat)

	// version, set to 2.2
	$vmi .= chr(20).chr(2);

	// number of files, set to 1
	$vmi .= chr(1).chr(0);

	// resource name corresponding to the vms file name without extension
	// 8 bytes padded with NUL (0x00)
	for ($i=0; $i<8; $i++) $vmi .= (ord($resource[$i]) != 0) ? $resource[$i] : chr(0);

	// vm file name string used by the Dreamcast application
	// 12 bytes padded with space (0x20)
	for ($i=0; $i<12; $i++) $vmi .= (ord($filename[$i]) != 0) ? $filename[$i] : chr(0);

	// file type, 0=DATA, 1=GAME
	// the copy protection is disabled
	$vmi .= chr(BinDec($tp."0")).chr(0);

	// reserved
	$vmi .= chr(0).chr(0);

	// vms file size, long int (little endian)
	$vmi .= doWord($fs, 4, 'le');

	// returns the vmi string
	return $vmi;
}

?>
