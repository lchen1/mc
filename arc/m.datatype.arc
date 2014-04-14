.//============================================================================
.// $RCSfile: m.datatype.arc,v $
.//
.// Description:
.// This archetype file contains the implementation functions for marks
.// specified in the (user supplied/modified) datatype.clr file.
.//
.// Notice:
.// (C) Copyright 1998-2013 Mentor Graphics Corporation
.//     All rights reserved.
.//
.// This document contains confidential and proprietary information and
.// property of Mentor Graphics Corp.  No part of this document may be
.// reproduced without the express written permission of Mentor Graphics Corp.
.//============================================================================
.//
.//============================================================================
.function TagDataTypePrecision
  .param string component_name
  .param string dt_name
  .param string tagged_name
  .param string initial_value
  .assign component_name = "$r{component_name}"
  .select any tm_precision from instances of TM_PRECISION where ( ( selected.Domain == component_name ) and ( selected.DT_name == dt_name ) )
  .if ( empty tm_precision )
    .create object instance tm_precision of TM_PRECISION
  .end if
  .assign tm_precision.Domain = component_name
  .assign tm_precision.DT_name = dt_name
  .assign tm_precision.xName = tagged_name
  .assign tm_precision.initial_value = initial_value
  .print "TagDataTypePrecision:  ${dt_name} in ${component_name} given ${tagged_name} precision with ${initial_value}."
.end function
.//
.//============================================================================
.// Map a user defined data type to a pointer.  This allows the system
.// to pass arbitrarily shaped data around by simply pointing to it.
.//============================================================================
.function MapDataTypeAsPointer
  .param string component_name
  .param string dt_name
  .param string pointer_type
  .param string include_file
  .assign component_name = "$r{component_name}"
  .select any tm_pointer from instances of TM_POINTER where ( ( selected.Domain == component_name ) and ( selected.DT_name == dt_name ) )
  .if ( empty tm_pointer )
    .create object instance tm_pointer of TM_POINTER
  .end if
  .assign tm_pointer.Domain = component_name
  .assign tm_pointer.DT_name = dt_name
  .assign tm_pointer.pointer_type = pointer_type
  .assign tm_pointer.include_file = include_file
  .print "MapDataTypeAsPointer:  ${dt_name} in ${component_name} given ${pointer_type} mapping (${include_file})."
.end function
.//
.//============================================================================
.// Specifying Values for Enumerators
.//
.// To indicate to the model compiler that a user defined enumeration
.// data type enumerator (defined in the BridgePoint Subsystem Partitioning
.// Model (SPM) component data editor) shall have a value other than the default,
.// use the following invocation:
.//
.// TagEnumeratorDiscreteValue( "component", "enumeration", "enumerator", "value"
.//
.// Where the input parameters are:
.//   component - Registered component name.  Use "*" to indicate a system wide
.//     enumeration data type (to be applied to all components containing
.//     the user defined enumeration data type).
.//   enumeration - name of the enumeration data type as known in the
.//     application analysis
.//   enumerator - name of the enumerator as known in the application analysis
.//   value - a string containing the value to be assigned to the enumerator
.//
.// Examples:
.//  Domain specific:
.//   .invoke TagEnumeratorDiscreteValue( "MO", "tube_wattage", "low", "4" )
.//   .invoke TagEnumeratorDiscreteValue( "MO", "tube_wattage", "med", "0x20" )
.//  System Wide:
.//   .invoke TagEnumeratorDiscreteValue( "*", "tube_wattage", "high", "0x40" )
.//
.//============================================================================
.function TagEnumeratorDiscreteValue
  .param string component_name
  .param string enumeration
  .param string enumerator
  .param string value
  .assign component_name = "$r{component_name}"
  .select any tm_enumval from instances of TM_ENUMVAL where ( ( ( selected.Domain == component_name ) and ( selected.enumeration == enumeration ) ) and ( selected.enumerator == enumerator ) )
  .if ( empty tm_enumval )
    .create object instance tm_enumval of TM_ENUMVAL
  .end if
  .assign tm_enumval.Domain = component_name
  .assign tm_enumval.enumeration = enumeration
  .assign tm_enumval.enumerator = enumerator
  .assign tm_enumval.value = value
  .print "TagEnumeratorDiscreteValue:  ${enumeration}::${enumerator} in ${component_name} given discrete value ${value}."
.end function
.//
.//============================================================================
.// Specifying Value for the Default Un-Initialized Enumerator
.//
.// To indicate to the software architecture that the un-initialized enumerator
.// of an enumeration (defined in the BridgePoint Subsystem Partitioning Model
.// (SPM) component data editor) shall have a value other than the default,
.// use the following invocation:
.//
.// TagUninitializedEnumerationValue( "component", "enumeration", "value" )
.//
.// Where the input parameters are:
.//   component - Registered component name.  Use "*" to indicate a system wide
.//     enumeration data type (to be applied to all components containing
.//     the user defined enumeration data type).
.//   enumeration - Name of the enumeration data type as known in the
.//     application analysis. Use "*" to indicate ALL enumerations.
.//   value - A string containing the value to be assigned to the uninitialized
.//     enumerator.
.//
.// Examples:
.//  Domain specific:
.//   .invoke TagUninitializedEnumerationValue( "MO", "tube_wattage", "4" )
.//  All Enumerations in Domain:
.//   .invoke TagUninitializedEnumerationValue( "MO", "*", "40" )
.//  System Wide:
.//   .invoke TagUninitializedEnumerationValue( "*", "tube_wattage", "20" )
.//  All Enumerations in All Domains:
.//   .invoke TagUninitializedEnumerationValue( "*", "*", "100" )
.//
.//============================================================================
.function TagUninitializedEnumerationValue
  .param string component_name
  .param string enumeration
  .param string value
  .assign component_name = "$r{component_name}"
  .select any tm_enuminit from instances of TM_ENUMINIT where ( ( selected.Domain == component_name ) and ( selected.enumeration == enumeration ) )
  .if ( empty tm_enuminit )
    .create object instance tm_enuminit of TM_ENUMINIT
  .end if
  .assign tm_enuminit.Domain = component_name
  .assign tm_enuminit.enumeration = enumeration
  .assign tm_enuminit.value = value
  .print "TagUninitializedEnumerationValue:  ${enumeration} in ${component_name} given default uninitialized value ${value}."
.end function
.//
.//
.//============================================================================
.// Specifying "Direct" manipulation to "SystemC UDT Pacakage"
.//
.// to indicate that this UDT package should be generated using its name
.// instead of core type
.//============================================================================
.function AssignDirectToUDTPackage
  .param string package_name
  .print "AssignDirectToUDTPackage is not a supported marking function."
  .exit 1
.end function
.//
.//============================================================================
.//
.//-- 002: 20140122 Add Start (saitou) 
.function specify_user_defined_enum_type_as_external_macro
	.param string dt_name
	.param string ext_name
	.param string initial_value
	.param string include_file
.//	.param string ext_event_name
	.//
	.select any s_dt from instances of S_DT where ( selected.Name == dt_name )
	.select one s_udt related by s_dt->S_UDT[R17]
	.if ( ( empty s_dt ) or ( empty s_udt ) )
		.print "\n  specify_user_defined_enum_type_as_external_macro - Data Type '${dt_name}' does not exist"
	.else
		.select any s_cdt from instances of S_CDT where ( selected.DT_ID == s_udt.CDT_DT_ID )
		.if ( s_cdt.Core_Typ == 4 )
			.create object instance tm_dtmacro of TM_DTMACRO
			.assign tm_dtmacro.component = ""
			.assign tm_dtmacro.DT_name = dt_name
			.assign tm_dtmacro.IsExternalMacro = true
			.assign tm_dtmacro.genName = ext_name
			.assign tm_dtmacro.Include_File = include_file
			.assign tm_dtmacro.DefaultValue = initial_value
			.//
			.print "specify_user_defined_enum_type_as_external_macro - Data Type '${dt_name}' is specified as '${ext_name}'(initial value='${initial_value}') in ${include_file}"
		.else
			.print "specify_user_defined_enum_type_as_external_macro - Data Type '${dt_name}' is not external macro ( because CoreType is not string! )"
		.end if
	.end if
	.//
.end function
.//
.function specify_user_defined_type
	.param string dt_name
	.param string ext_name
	.param string initial_value
	.param string include_file
	.//
	.select any s_dt from instances of S_DT where ( selected.Name == dt_name )
	.if ( empty s_dt )
		.print "\n  specify_user_defined_type - Data Type '${dt_name}' does not exist"
	.else
		.create object instance tm_dtmacro of TM_DTMACRO
		.assign tm_dtmacro.component = ""
		.assign tm_dtmacro.DT_name = dt_name
		.assign tm_dtmacro.genName = ext_name
		.assign tm_dtmacro.Include_File = include_file
		.assign tm_dtmacro.DefaultValue = initial_value
		.print "specify_user_defined_type - Data Type '${dt_name}' is specified as '${ext_name}'(initial value='${initial_value}') in ${include_file}"
	.end if
.end function
.//-- 002: 20140122 Add End (saitou) 

