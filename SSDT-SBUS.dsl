DefinitionBlock ("", "SSDT", 2, "ZPSS", "SMBS", 0x00000000)
{
    External (_SB_.PCI0.SMBS, DeviceObj)

    Scope (\_SB.PCI0.SMBS)
    {
        Device (BUS0)
        {
            Name (_CID, "smbus")
            Name (_ADR, Zero)
            Method (_STA, 0, NotSerialized)
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
}
