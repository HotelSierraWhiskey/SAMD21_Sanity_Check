MEMORY
{
	approm   (rx)  : ORIGIN = 0x00000000, LENGTH = 0x00040000
	ram      (rwx) : ORIGIN = 0x20000000, LENGTH = 0x00004000
}

_approm_start  = ORIGIN(approm);
_approm_size   = LENGTH(approm);
