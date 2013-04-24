.//============================================================================
.// Notice:
.// (C) Copyright 1998-2010 Mentor Graphics Corporation
.//     All rights reserved.
.//
.// This document contains confidential and proprietary information and
.// property of Mentor Graphics Corp.  No part of this document may be
.// reproduced without the express written permission of Mentor Graphics Corp.
.//============================================================================
.//
/*----------------------------------------------------------------------------
 * File:  ${pkg_name}.${te_file.hdr_file_ext}
 *
 * UML Package (Top Module) Declaration
 *
 * ${te_copyright.body}
 *--------------------------------------------------------------------------*/

#ifndef $u{pkg_name}_$u{te_file.hdr_file_ext}
#define $u{pkg_name}_$u{te_file.hdr_file_ext}
${te_target.c2cplusplus_linkage_begin}

${include_files}

class ${pkg_name} : public sc_module {
  public:
${top_module_instances}
  ${pkg_name}( sc_module_name name ) : sc_module( name )${top_module_inits} 
  {
${port_initializers}
  }
};

${te_target.c2cplusplus_linkage_end}
#endif  /* $u{pkg_name}_$u{te_file.hdr_file_ext} */
.//