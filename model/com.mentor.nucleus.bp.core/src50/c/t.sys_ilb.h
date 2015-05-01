T_b("/*---------------------------------------------------------------------");
T_b("\n");
T_b(" ");
T_b("* File:  ");
T_b(te_file->ilb);
T_b(".");
T_b(te_file->hdr_file_ext);
T_b("\n");
T_b(" ");
T_b("*");
T_b("\n");
T_b(" ");
T_b("* Description:");
T_b("\n");
T_b(" ");
T_b("* This file provides a means to safely receive calls from interrupt");
T_b("\n");
T_b(" ");
T_b("* handlers or other tasks/threads/contexts.");
T_b("\n");
T_b(" ");
T_b("*");
T_b("\n");
T_b(" ");
T_b("* ");
T_b(te_copyright->body);
T_b("\n");
T_b(" ");
T_b("*-------------------------------------------------------------------*/");
T_b("\n");
T_b("#ifndef ");
T_b(te_prefix->define_u);
T_b(te_file->ilb);
T_b("_");
T_b(te_file->hdr_file_ext);
T_b("\n");
T_b("#define ");
T_b(te_prefix->define_u);
T_b(te_file->ilb);
T_b("_");
T_b(te_file->hdr_file_ext);
T_b("\n");
T_b(te_target->c2cplusplus_linkage_begin);
T_b("\n");
T_b("void * ");
T_b(te_ilb->interleave_bridge);
T_b("( void (vfp)(void) );");
T_b("\n");
T_b("void ");
T_b(te_ilb->interleave_bridge_done);
T_b("( void );");
T_b("\n");
T_b("void ");
T_b(te_ilb->dispatch);
T_b("( void );");
T_b("\n");
T_b("void * ");
T_b(te_ilb->get_data);
T_b("( void );");
T_b("\n");
T_b(te_target->c2cplusplus_linkage_end);
T_b("\n");
T_b("#endif  /* ");
T_b(te_prefix->define_u);
T_b(te_file->ilb);
T_b("_");
T_b(te_file->hdr_file_ext);
T_b(" */");
T_b("\n");