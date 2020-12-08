package Constants;

use ThisSite;
use FindBin qw($Bin);

#
# This version number applies to all the software in this directory,
# including the ScanSwitch and SwitchMap programs.
#
$VERSION = '14.0';

$WARNING = 2;
$SUCCESS = 1;
$FAILURE = 0;

$TRUE  = 1;
$FALSE = 0;

#
# This package defines constants used by the Switchmap programs.
#

$MAX_DEBUGGING_MESSAGE_DEPTH = 7;
$MAX_INFORMATIONAL_MESSAGE_DEPTH = 3;
$MAX_WARNING_MESSAGE_DEPTH = 1;

#
# These values are used in Entity MIBs.
#
$CHASSIS = 3;
$MODULE  = 9;
$PORT    = 10;

# These values are used in the POWER-ETHERNET MIB.

$DELIVERING_POWER = 3;

#
# SNMP table types.
#
$INTERFACE   = 0;
$PORT        = 1;
$IP_ADDRESS  = 2;
$MAC_ADDRESS = 3;
$TABLE_ROW   = 4;
@OidPatterns = ();
$OidPatterns[$INTERFACE]   = '\.(\d+)$';                           # just the last octet
$OidPatterns[$PORT]        = '\.(\d+\.\d+)$';                      # last two octets
$OidPatterns[$IP_ADDRESS]  = '\.(\d+\.\d+\.\d+\.\d+)$';            # last four octets
$OidPatterns[$MAC_ADDRESS] = '\.(\d+\.\d+\.\d+\.\d+\.\d+\.\d+)$';  # last six octets
$OidPatterns[$TABLE_ROW]   = '\.(\d+)\.\d+$';                      # second-to-last octet

# The $Config Directory variable is the path to the directory that
# the configs are backed up to.
$ConfDirectory = File::Spec->catfile($ThisSite::DestinationDirectory, 'configs');

# The $CsvDirectory variable is the path to the directory that
# the code writes the output CSV files (similar to map files).
$CsvDirectory = File::Spec->catfile($ThisSite::DestinationDirectory, 'csv');

# The $GigePerVlansDirectory variable is the path to the directory
# that the code writes the HTML files for Gigabit Ethernet ports per
# Vlan to.
$GigePerVlansDirectory = File::Spec->catfile($ThisSite::DestinationDirectory, 'ports', 'gigeportspervlan');

# The $IdleSinceDirectory variable is the path to the directory
# that the code writes the .idlesince files to.
$IdleSinceDirectory = File::Spec->catfile($ThisSite::StateFileDirectory, 'idlesince');

# The $PortsDirectory variable is the path to the directory that
# the code writes the HTML files for unused ports and spare
# ports to.
$PortsDirectory = File::Spec->catfile($ThisSite::DestinationDirectory, 'ports');

# The $SwitchesDirectory variable is the path to the directory
# that the code writes the HTML files for switches to.
$SwitchesDirectory = File::Spec->catfile($ThisSite::DestinationDirectory, 'switches');

# The UnusedDirectory variable is the path to the directory
# that the code writes the HTML files for Unused Ports to.
$UnusedDirectory = File::Spec->catfile($ThisSite::DestinationDirectory, 'ports', 'unused');

# The $VlansDirectory variable is the path to the directory that
# the code writes the HTML files for Vlans to.
$VlansDirectory = File::Spec->catfile($ThisSite::DestinationDirectory, 'vlans');

# The $PLookupDirectory variable is the path to the directory that
# the code writes the index files for the PLookupDirectory to.
$PLookupDirectory            = File::Spec->catfile($ThisSite::DestinationDirectory, 'plookup');
$PLookupIpAddressesDirectory = File::Spec->catfile($PLookupDirectory              , 'ip-addresses');

# This $CommunityDirectory variable is the path to the directory
# that holds a cache for SNMP communities found to be working.
#
# If you have a site with multiple SNMP communities, SwitchMap will try
# each community string until it finds one that matches.  Once it's
# learned the working community string for a device, we save the string
# so that next time we won't have to take time trying all the strings.
# The working community string for each device is stored as one file
# per device.
$CommunityDirectory = File::Spec->catfile($ThisSite::StateFileDirectory, 'community');

$ModulesBySwitchFile          = 'modulesbyswitch.html';
$PortLabelAnalysisFile        = 'portlabelanalysis.html';
$CssFile                      = 'SwitchMap.css';
$SearchHelpFile               = 'helpsearch.html';
$SparePortsFile               = 'spareports.html';
$SwitchStatsFile              = 'switchstats.html';
$PoeFile                      = 'poeports.html';
$SuspiciousFile               = 'suspiciousports.html';
$CiscoProductsMibFile         = File::Spec->catfile($Bin, 'CISCO-PRODUCTS-MIB.my');
$CiscoStackMibFile            = File::Spec->catfile($Bin, 'CISCO-STACK-MIB.my');
$CiscoEntityVendortypeMibFile = File::Spec->catfile($Bin, 'CISCO-ENTITY-VENDORTYPE-OID-MIB.my');
$HpProductsMibFile            = File::Spec->catfile($Bin, 'hh3c-product-id.mib');
#$IanaIfTypeMibFile            = File::Spec->catfile($Bin, 'ianaiftype-mib.txt');
$OuiCodesFile                 = File::Spec->catfile($Bin, 'OuiCodes.txt');
$IeeeFile                     = File::Spec->catfile($Bin, 'oui.txt');
$MacListFile                  = File::Spec->catfile($ThisSite::StateFileDirectory, 'MacList');

$DISABLED = 2;                           # possible value for ifAdminStatus

$SecondsPerDay   = 60 * 60 * 24;         # number of seconds in a day
$SecondsPerMonth = 30 * $SecondsPerDay;  # number of seconds in a 30-day month

#
# To get Foundry MIBs, go to http://www.foundrynet.com -> "Service &
# Support" -> "Knowledge Portal", log in, then "Software".  I couldn't
# log in without registering as a Foundry customer, which requires the
# serial number of a Foundry Switch, so I telephoned Foundry support
# and they emailed me the MIBs.  The file they emailed was named
# something like SXR03100a.mib, and contained a concatenation of 19
# BEGIN-END blocks with names like FOUNDRY-SN-ROOT-MIB.  I broke them
# out into separate files.
#
# Foundry oids
#   1.3.6.1.4.1 = iso.org.dod.internet.private.enterprises
#   1991.1.3.36 = foundry.products.snSwitch.???
#
%FoundrySwitchObjectOids = (
                         '1.3.6.1.4.1.1991.1.2'            => 'Foundry router',
                         '1.3.6.1.4.1.1991.1.3.36.2.2'     => 'Foundry SuperX',
                         '1.3.6.1.4.1.1991.1.3.36.2.2'     => 'Foundry Router',
                         '1.3.6.1.4.1.1991.1.3.36.6.2'     => 'Foundry SX 1600',
                         '1.3.6.1.4.1.1991.1.3.52.1.4.1.1' => 'FWS624G-POE',
                          );


#
# Some of these OIDs are found in the standard MIB-II MIB named
# $OV_SNMP_MIBS/Standard/rfc1213-MIB-II or the Bridge MIB,
# $OV_SNMP_MIBS/Standard/rfc4188-BRIDGE.  Others are found in the
# Cisco Stack MIB, $OV_SNMP_MIBS/Vendor/Cisco/CISCO-STACK-MIB.my,
# which you can get from
# http://www.cisco.com/public/sw-center/netmgmt/cmtk/mibs.shtml.
# Others are found in the Grand Junction/Cisco ESSWITCH MIB,
# $OV_SNMP_MIBS/Vendor/Cisco/ESSWITCH-MIB.my, which you can get from
# http://www.cisco.com/public/sw-center/netmgmt/cmtk/mibs.shtml.
#

%SnmpOids = (
             #
             # The SNMP OID of an ARP table is:
             #   1.3.6.1.2.1 = iso.org.dod.internet.mgmt.mib-2
             #   4.22.1.2    = ip.ipNetToMediaTable.ipNetToMediaEntry.ipNetToMediaPhysAddress
             'ipNetToMediaIfIndex'     => '.1.3.6.1.2.1.4.22.1.1',
             'ipNetToMediaPhysAddress' => '.1.3.6.1.2.1.4.22.1.2',

             # The SNMP OID of the Juniper
             #   1.3.6.1.2.1 = iso.org.dod.internet.private.enterprise
             #   2636.3.40.1 = 2636.jnxMibs.jnxExMibRoot.jnxExSwitching
             #   5.1.7       = jnxExVlan.jnxVlanMIBObjects.jnxExVlanPortGroupTable
             #   1.5         = jnxExVlanPortGroupEntry.jnxExVlanPortAccessMode
#            'jnxExVlanPortStatus'     => '1.3.6.1.4.1.2636.3.40.1.5.1.7.1.3',
             'jnxExVlanPortAccessMode' => '1.3.6.1.4.1.2636.3.40.1.5.1.7.1.5',

             # The SNMP OID of the Juniper
             #   1.3.6.1.2.1 = iso.org.dod.internet.private.enterprise
             #   2636.3.40.1 = 2636.jnxMibs.jnxExMibRoot.jnxExSwitching
             #   5.1.5       = jnxExVlan.jnxVlanMIBObjects.jnxExVlanTable
             #   1.5         = jnxExVlanEntry.jnxExVlanTag
             'jnxExVlanName'           => '1.3.6.1.4.1.2636.3.40.1.5.1.5.1.2',
             'jnxExVlanTag'            => '1.3.6.1.4.1.2636.3.40.1.5.1.5.1.5',

             #
             # The SNMP OID of an ARP table (deprecated) is:
             #   1.3.6.1.2.1 = iso.org.dod.internet.mgmt.mib-2
             #   3.1.1       = at.atTable.atEntry
             'arpTable' => '.1.3.6.1.2.1.3.1.1.2',

             #
             # The SNMP oid of the chassisModel value is
             #   1.3.6.1.4.1 = iso.org.dod.internet.private.enterprises
             #   9.5.1.2.16 = cisco.wkgrpProducts.stack.chassisGrp.chassisModel
             'chassisModel' => '1.3.6.1.4.1.9.5.1.2.16.0',

             #
             # The SNMP oid of the dot1dBasePortIfIndex table isb
             #   1.3.6.1.2.1 = iso.org.dod.internet.mgmt.mib-2
             #       17      dot1dBridge            bridge MIB, RFC 4188
             #       1       dot1dBase
             #       4       dot1dBasePortTable
             #       1       dot1dBasePortEntry
             #       2       dot1dBasePortIfIndex   MIB-II ifIndex
             #
             'dot1dBasePortIfIndex' => '1.3.6.1.2.1.17.1.4.1.2',

             #
             # The SNMP oid of the dot1qVlanStaticTable table isb
             #   1.3.6.1.2.1 = iso.org.dod.internet.mgmt.mib-2
             #       17      dot1dBridge            bridge MIB, RFC 4188
             #       1       dot1dBase
             #       4       dot1dBasePortTable
             #
             'dot1qVlanStaticTable'       => '1.3.6.1.2.1.17.7.1.4.3',
             'dot1qVlanStaticEgressPorts' => '1.3.6.1.2.1.17.7.1.4.3.1.2',

             #
             # The SNMP oid of the dot1dTpFdbPort table is
             #   1.3.6.1.2.1 = iso.org.dod.internet.mgmt.mib-2
             #     17      dot1dBridge            bridge MIB, RFC 4188
             #     4       dot1dTp                transparent bridging
             #     3       dot1dTpFdbTable        forwarding table
             #     1       dot1dTpFdbEntry        entry for 1 MAC
             #     2       dot1dTpFdbPort         bridge port number
             #
             'dot1dTpFdbPort' => '1.3.6.1.2.1.17.4.3.1.2',

             #
             # 1.3.6.1.2.1 = iso.org.dod.internet.mgmt.mib-2
             #     17   dot1dBridge            bridge MIB, RFC 4188
             #     7    qBridgeMIB             qbridge MIB, RFC 4363
             #     1    qBridgeMIBObjects
             #     1    dot1qBase
             #     4    dot1qNumVlans
             'dot1qNumVlans'   => '1.3.6.1.2.1.17.7.1.1.4',

             #
             # 1.3.6.1.2.1 = iso.org.dod.internet.mgmt.mib-2
             #     17   dot1dBridge            bridge MIB, RFC 4188
             #     7    qBridgeMIB             qbridge MIB, RFC 4363
             #     1    qBridgeMIBObjects
             #     2    dot1qTp
             #     2    dot1qTpFdbTable
             #
             'dot1qTpFdbTable' => '1.3.6.1.2.1.17.7.1.2.2',


             #
             # The SNMP oid of the ifAdminStatus table is
             #   1.3.6.1.2.1 = iso.org.dod.internet.mgmt.mib-2 (RFC 1213)
             #   2.2.1.7 = interfaces.ifTable.ifEntry.ifAdminStatus
             'ifType'         => '1.3.6.1.2.1.2.2.1.3',
             'ifSpeed'        => '1.3.6.1.2.1.2.2.1.5',
             'ifPhysAddress'  => '1.3.6.1.2.1.2.2.1.6',
             'ifAdminStatus'  => '1.3.6.1.2.1.2.2.1.7',
             'ifOperStatus'   => '1.3.6.1.2.1.2.2.1.8',
             
             #
             #   1.3.6.1.2.1 = iso.org.dod.internet.mgmt.mib-2 (RFC 1213)
             #   31.1.1.1.15 = ifMIB.ifMIBObjects.ifXTable.ifXEntry.ifHighSpeed
             'ifHighSpeed'    => '1.3.6.1.2.1.31.1.1.1.15',

             #
             # The SNMP oid of the ifName table is
             #   1.3.6.1.2.1 = iso.org.dod.internet.mgmt.mib-2
             #   31        ifMIB (added mib-2 interface MIB items, RFC 2863)
             #   1.1.1.1   ifMIBObjects.ifTable.ifEntry.ifName
             #
             'ifName'  => '1.3.6.1.2.1.31.1.1.1.1',
             'ifAlias' => '1.3.6.1.2.1.31.1.1.1.18',
             #
             # From Standard/rfc2863-IF-MIB, the SNMP oid of the ifStackStatus table is
             #   1.3.6.1.2.1 = iso.org.dod.internet.mgmt.mib-2
             #   31        ifMIB (interface MIB, RFC 2863)
             #   1.2.1.3   ifMIBObjects.ifStackTable.ifStackEntry.ifStackStatus
             #
             'ifStackStatus' => '.1.3.6.1.2.1.31.1.2.1.3',

             #
             # These SNMP oids mean
             #   1.3.6.1.4.1   iso.org.dod.internet.private.enterprises
             #   9.5.1.3       cisco.wkgrpProducts.stack.moduleGrp
             #   1.1.2         moduleTable.moduleEntry.moduleType
             #
             'moduleType'               => '1.3.6.1.4.1.9.5.1.3.1.1.2',
             'moduleSerialNumber'       => '1.3.6.1.4.1.9.5.1.3.1.1.3',
             'moduleStatus'             => '1.3.6.1.4.1.9.5.1.3.1.1.10',
             'moduleName'               => '1.3.6.1.4.1.9.5.1.3.1.1.13',
             'moduleModel'              => '1.3.6.1.4.1.9.5.1.3.1.1.17',
             'moduleHwVersion'          => '1.3.6.1.4.1.9.5.1.3.1.1.18',
             'moduleFwVersion'          => '1.3.6.1.4.1.9.5.1.3.1.1.19',
             'moduleSwVersion'          => '1.3.6.1.4.1.9.5.1.3.1.1.20',
             'moduleSerialNumberString' => '1.3.6.1.4.1.9.5.1.3.1.1.26',

             #
             # This oid is defined in the standard POWER-ETHERNET-MIB,
             # defined in RFC 3621, not by Cisco.
             # This SNMP oid means
             #   1.3.6.1.2.1 = iso.org.dod.internet.mgmt.mib-2
             #   105.1       = powerEthernetMIB.pethObjects
             #   1.1         = pethPsePortTable.pethPsePortEntry
             #   6           = pethPsePortDetectionStatus
             'pethPsePortDetectionStatus' => '.1.3.6.1.2.1.105.1.1.1.6',

             #
             # These SNMP oids mean
             #   1.3.6.1.4.1.9 = iso.org.dod.internet.private.enterprises
             #   5.1.4.1 = wkgrpProducts.stack.portGrp.portTable
             #   1.9 = portEntry.portAdminSpeed
             #
             'portName'       => '1.3.6.1.4.1.9.5.1.4.1.1.4',
             'portAdminSpeed' => '1.3.6.1.4.1.9.5.1.4.1.1.9',
             'portDuplex'     => '1.3.6.1.4.1.9.5.1.4.1.1.10',
             'portIfIndex'    => '1.3.6.1.4.1.9.5.1.4.1.1.11',

             #
             # The SNMP oid of the sysObjectID is .1.3.6.1.2.1.1
             #   1.3.6.1.2.1 = iso.org.dod.internet.mgmt.mib-2
             #
             'sysObjectID'  => '1.3.6.1.2.1.1.2.0',

             #
             # The SNMP oid of the sysDescr is .1.3.6.1.2.1.1.1.0
             #   1.3.6.1.2.1 = iso.org.dod.internet.mgmt.mib-2
             #
             'sysDescr'  => '.1.3.6.1.2.1.1.1.0',

             #
             #   1.3.6.1.4.1.9  = iso.org.dod.internet.private.enterprises.cisco
             #   5.1.9.3.1.3    = wkgrpProducts.stack.vlanGrp.vlanPortTable.vlanPortEntry.vlanPortVlan
             'vlanPortVlan'           => '1.3.6.1.4.1.9.5.1.9.3.1.3',
             'vlanPortIslAdminStatus' => '1.3.6.1.4.1.9.5.1.9.3.1.7',
             'vlanPortIslOperStatus'  => '1.3.6.1.4.1.9.5.1.9.3.1.8',

             #
             #   1.3.6.1.4.1.9  = iso.org.dod.internet.private.enterprises.cisco
             #   9.46.1.6       = ciscoMgmt.ciscoVtpMIB.vtpMIBObjects.vlanTrunkPorts
             #   1.1.5          = vlanTrunkPortTable.vlanTrunkPortEntry.vlanTrunkPortNativeVlan
             'vtpVlanState'                => '1.3.6.1.4.1.9.9.46.1.3.1.1.2',
	     'vlanTrunkPortVlansEnabled'   => '1.3.6.1.4.1.9.9.46.1.6.1.1.4',
             'vlanTrunkPortNativeVlan'     => '1.3.6.1.4.1.9.9.46.1.6.1.1.5',
             'vlanTrunkPortDynamicState'   => '1.3.6.1.4.1.9.9.46.1.6.1.1.13',
             'vlanTrunkPortDynamicStatus'  => '1.3.6.1.4.1.9.9.46.1.6.1.1.14',
	     'vlanTrunkPortVlansEnabled2k' => '1.3.6.1.4.1.9.9.46.1.6.1.1.17',
	     'vlanTrunkPortVlansEnabled3k' => '1.3.6.1.4.1.9.9.46.1.6.1.1.18',
	     'vlanTrunkPortVlansEnabled4k' => '1.3.6.1.4.1.9.9.46.1.6.1.1.19',

             #
             #   1.3.6.1.4.1.9   = iso.org.dod.internet.private.enterprises.cisco
             #   9.173.1.1       = ciscoMgmt.ciscoPrivateVlanMIB.cpvlanMIBObjects.cpvlanVlanObjects1
             #   1.1.1           = cpvlanVlanTable.cpvlanVlanEntry.cpvlanVlanPrivateVlanType
             'cpvlanVlanPrivateVlanType'   => '1.3.6.1.4.1.9.9.173.1.1.1.1.1',

             #   1.3.6.1.4.1.9  = iso.org.dod.internet.private.enterprises.cisco
             #   9.68.1         = ciscoMgmt.ciscoVlanMembershipMIB.ciscoVlanMembershipMIBObjects
             #   5.1.1.1        = vmVoiceVlan.vmVoiceVlanTable.vmVoiceVlanEntry,vmVoiceVlanId
             'vmVoiceVlanId' => '1.3.6.1.4.1.9.9.68.1.5.1.1.1',
             'vmVlan'        => '1.3.6.1.4.1.9.9.68.1.2.2.1.2', # Trunk ports won't appear in this table

             #   1.3.6.1.4.1.9 = iso.org.dod.internet.private.enterprises.cisco
             #   9.87.1.4      = ciscoMgmt.ciscoC2900MIB.c2900MIBObjects.c2900Port
             #   1.1.32        = c2900PortTable.c2900PortEntry.c2900PortDuplexStatus
             'c2900PortLinkbeatStatus' => '1.3.6.1.4.1.9.9.87.1.4.1.1.18',
             'c2900PortDuplexState'    => '1.3.6.1.4.1.9.9.87.1.4.1.1.31',
             'c2900PortDuplexStatus'   => '1.3.6.1.4.1.9.9.87.1.4.1.1.32',
             'c2900PortVoiceVlanId'    => '1.3.6.1.4.1.9.9.87.1.4.1.1.37',

             #
             # The Cisco Discovory Protocol (CDP) cdpCachePlatform
             #
             #   1.3.6.1.4.1.9 = iso.org.dod.internet.private.enterprises.cisco
             #   9.23.1.2      = ciscoMgmt.ciscoCdpMIB.ciscoCdpMIBObjects.cdpCache
             #   1.1.8         = cdpCacheTable.cdpCacheEntry.cdpCachePlatform
             'cdpCacheDeviceId' => '1.3.6.1.4.1.9.9.23.1.2.1.1.6',
             'cdpCachePlatform' => '1.3.6.1.4.1.9.9.23.1.2.1.1.8',

             #
             # LLDP-MIB::lldpRemTable:
             #  1.0.8802.1.1 = iso.std.iso8802.ieee802dot1.ieee802dot1mibs
             #  2.1.4        = lldpMIB.lldpObjects.lldpRemoteSystemsData
             #  1.1.8        = lldpRemTable.lldpRemEntry.lldpRemPortDesc
             'lldpRemPortDesc'  => '1.0.8802.1.1.2.1.4.1.1.8',
             'lldpRemSysName'   => '1.0.8802.1.1.2.1.4.1.1.9',
            #'lldpRemSysDesc'   => '1.0.8802.1.1.2.1.4.1.1.10',
             # but beware the above table doesn't use
             # fIndex.cdpCacheDeviceIndex the same as CDP cache, but
             # instead it uses lldpRemTimeMark.dot1dBasePort.lldpRemIndex
             # which can be mapped back with:
             # CISCO-IF-EXTENSION-MIB::cieIfDot1dBaseMappingTable
             #  1.3.6.1.4.1.9 = iso.org.dod.internet.private.enterprises.cisco
             #  9.276.1.5     = ciscoMgmt.ciscoIfExtensionMIB.ciscoIfExtensionMIBObjects.ciscoIfExtDot1dBaseMapping
             #  1.1.1         = cieIfDot1dBaseMappingTable.cieIfDot1dBaseMappingEntry.cieIfDot1dBaseMappingPort
             'cieIfDot1dBaseMappingPort' => '1.3.6.1.4.1.9.9.276.1.5.1.1.1',

             # LLDP-MIB::lldpRemManAddrTable
             #  1.0.8802.1.1 = iso.std.iso8802.ieee802dot1.ieee802dot1mibs
             #  2.1.4        = lldpMIB.lldpObjects.lldpRemoteSystemsData
             #  2.1.3        = lldpRemManAddrTable.lldpRemManAddrEntry.lldpRemManAddrIfSubtype
             'lldpRemManAddrIfSubtype' => '1.0.8802.1.1.2.1.4.2.1.3', # which remote snmp table has the interface ID
            #'lldpRemManAddrIfId'      => '1.0.8802.1.1.2.1.4.2.1.4', # the interface ID to lookup in the remote table above
            #'lldpRemManAddrOID'       => '1.0.8802.1.1.2.1.4.2.1.5', # ignore value always 0.0 (.ccitt.zeroDotZero); we only care about the IP addr in the key

             #
             # CISCO-STACKWISE-MIB::cswSwitchInfoTable:
             #  1.3.6.1.4.1.9.9.500 = iso.org.dod.internet.private.enterprises.cisco.ciscoMgmt.ciscoStackWiseMIB
             #  1.2.1.1             = ciscoStackWiseMIBObjects.cswStackInfo.cswSwitchInfoTable.cswSwitchInfoEntry
             'cswSwitchRole'       => '1.3.6.1.4.1.9.9.500.1.2.1.1.3',
             'cswSwitchSwPriority' => '1.3.6.1.4.1.9.9.500.1.2.1.1.4',

             #
             # 1.3.6.1.2.1 = iso.org.dod.internet.mgmt.mib-2
             # .47   entityMIB
             # .1    entityMIBObjects
             # .1    entityPhysical
             # .1    entPhysicalTable
             # .1    entPhysicalEntry
             # .5    entPhysicalClass
             'entPhysicalDescr'       => '1.3.6.1.2.1.47.1.1.1.1.2',
             'entPhysicalContainedIn' => '1.3.6.1.2.1.47.1.1.1.1.4',
             'entPhysicalClass'       => '1.3.6.1.2.1.47.1.1.1.1.5',
             'entPhysicalName'        => '1.3.6.1.2.1.47.1.1.1.1.7',
             'entPhysicalHardwareRev' => '1.3.6.1.2.1.47.1.1.1.1.8',
             'entPhysicalFirmwareRev' => '1.3.6.1.2.1.47.1.1.1.1.9',
             'entPhysicalSoftwareRev' => '1.3.6.1.2.1.47.1.1.1.1.10',
             'entPhysicalSerialNum'   => '1.3.6.1.2.1.47.1.1.1.1.11',
             'entPhysicalModelName'   => '1.3.6.1.2.1.47.1.1.1.1.13',

             #
             #   1.3.6.1.4.1 = iso.org.dod.internet.private.enterprises
             #   1991.1.3. = foundry.products.snSwitch
             #   3.5.1.24 = ???
#             'snSwPortVlanId' => '1.3.6.1.4.1.1991.1.1.3.3.5.1.24',

             #
             # The SNMP OID of the ESSWITCH swPortName table is:
             #   1.3.6.1.4.1.437. = iso.org.dod.internet.private.enterprises.grandjunction.
             #         1.1.3.3.1. = products.fastLink.series2000.port.switchPortTable.
             #                1.3 = swPortEntry.swPortName
             'swPortName'         => '1.3.6.1.4.1.437.1.1.3.3.1.1.3',
             'swPortDuplexStatus' => '1.3.6.1.4.1.437.1.1.3.3.1.1.30',

            #
            # The SNMP OID of the EtherLike-MIB dot3StatsTable table is:
            # 1.3.6.1.2.1.10.7. = iso.org.dod.internet.mgmt.mib-2.transmission.dot3
            #            2.1.19 = dot3StatsTable.dot3StatsEntry.dot3StatsDuplexStatus
            'dot3StatsDuplexStatus' => '1.3.6.1.2.1.10.7.2.1.19',
            );

1;
