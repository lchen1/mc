.//============================================================================
.// $RCSfile: q.oal.action.arc,v $
.//
.// Description:
.// This query rolls up (accumulates) the translated statements into
.// a single string attribute on the action block anchor (TE_ABA).
.// After this roll-up, the ACT_* and V_* instances are no longer needed.
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
.//
.function TE_ABA_rollup
  .assign parseSuccessful = ( 1 ) .COMMENT ParseStatus::parseSuccessful
  .select any empty_act_blk from instances of ACT_BLK where ( false )
  .select many te_cs from instances of TE_C where ( selected.included_in_build )
  .for each te_c in te_cs
    .select many te_abas related by te_c->TE_ABA[R2088]
    .for each te_aba in te_abas
      .select one te_blk related by te_aba->TE_BLK[R2011]
      .if ( not_empty te_blk )
        .invoke blck_xlate( te_c.StmtTrace, te_blk, te_aba )
      .else
        .assign te_aba.code = ( "\n  /" + "* WARNING!  Skipping unsuccessful or unparsed action.  *" ) + "/\n"
      .end if
    .end for
  .end for
  .// Process EEs outside of components.
  .select many te_ees from instances of TE_EE where ( ( selected.RegisteredName != "TIM" ) and selected.Included )
  .for each te_ee in te_ees
    .select one te_c related by te_ee->TE_C[R2085]
    .if ( empty te_c )
      .select many s_brgs related by te_ee->S_EE[R2020]->S_BRG[R19]
      .for each s_brg in s_brgs
        .select one act_blk related by s_brg->ACT_BRB[R697]->ACT_ACT[R698]->ACT_BLK[R666]
        .select one te_aba related by s_brg->TE_BRG[R2025]->TE_ABA[R2010]
        .if ( not_empty act_blk )
          .select one te_blk related by act_blk->TE_BLK[R2016]
          .invoke blck_xlate( false, te_blk, te_aba )
        .end if
      .end for
    .end if
  .end for
.end function
