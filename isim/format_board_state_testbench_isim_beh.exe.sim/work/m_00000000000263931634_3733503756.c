/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "//ad/eng/users/d/s/dsak/EC311/VGATest/format_board_state.v";
static int ng1[] = {0, 0};
static int ng2[] = {9, 0};
static int ng3[] = {1, 0};
static int ng4[] = {2, 0};



static void Always_28_0(char *t0)
{
    char t13[8];
    char t15[8];
    char t25[8];
    char t26[8];
    char t28[8];
    char t51[8];
    char t58[8];
    char t60[8];
    char t84[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t14;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned int t23;
    int t24;
    char *t27;
    char *t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    char *t49;
    char *t50;
    char *t52;
    char *t53;
    char *t54;
    char *t55;
    char *t56;
    char *t57;
    char *t59;
    char *t61;
    char *t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    char *t75;
    char *t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    char *t82;
    char *t83;
    char *t85;
    char *t86;
    char *t87;
    char *t88;
    char *t89;
    char *t90;
    char *t91;
    unsigned int t92;

LAB0:    t1 = (t0 + 1720U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 1916);
    *((int *)t2) = 1;
    t3 = (t0 + 1748);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(28, ng0);

LAB5:    xsi_set_current_line(29, ng0);
    t4 = (t0 + 692U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(37, ng0);

LAB18:    xsi_set_current_line(40, ng0);
    xsi_set_current_line(40, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB19:    t2 = (t0 + 1196);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_signed_less(t13, 32, t4, 32, t5, 32);
    t11 = (t13 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t13);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB20;

LAB21:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(29, ng0);

LAB9:    xsi_set_current_line(32, ng0);
    xsi_set_current_line(32, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 1196);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 32);

LAB10:    t2 = (t0 + 1196);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_signed_less(t13, 32, t4, 32, t5, 32);
    t11 = (t13 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t13);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB11;

LAB12:    goto LAB8;

LAB11:    xsi_set_current_line(32, ng0);

LAB13:    xsi_set_current_line(33, ng0);
    t12 = ((char*)((ng1)));
    t14 = (t0 + 1104);
    t16 = (t0 + 1104);
    t17 = (t16 + 44U);
    t18 = *((char **)t17);
    t19 = (t0 + 1196);
    t20 = (t19 + 36U);
    t21 = *((char **)t20);
    xsi_vlog_generic_convert_bit_index(t15, t18, 2, t21, 32, 1);
    t22 = (t15 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (!(t23));
    if (t24 == 1)
        goto LAB14;

LAB15:    xsi_set_current_line(34, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1012);
    t4 = (t0 + 1012);
    t5 = (t4 + 44U);
    t11 = *((char **)t5);
    t12 = (t0 + 1196);
    t14 = (t12 + 36U);
    t16 = *((char **)t14);
    xsi_vlog_generic_convert_bit_index(t13, t11, 2, t16, 32, 1);
    t17 = (t13 + 4);
    t6 = *((unsigned int *)t17);
    t24 = (!(t6));
    if (t24 == 1)
        goto LAB16;

LAB17:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 1196);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t13, 0, 8);
    xsi_vlog_signed_add(t13, 32, t4, 32, t5, 32);
    t11 = (t0 + 1196);
    xsi_vlogvar_assign_value(t11, t13, 0, 0, 32);
    goto LAB10;

LAB14:    xsi_vlogvar_wait_assign_value(t14, t12, 0, *((unsigned int *)t15), 1, 0LL);
    goto LAB15;

LAB16:    xsi_vlogvar_wait_assign_value(t3, t2, 0, *((unsigned int *)t13), 1, 0LL);
    goto LAB17;

LAB20:    xsi_set_current_line(40, ng0);

LAB22:    xsi_set_current_line(41, ng0);
    t12 = (t0 + 784U);
    t14 = *((char **)t12);
    t12 = (t0 + 760U);
    t16 = (t12 + 44U);
    t17 = *((char **)t16);
    t18 = ((char*)((ng4)));
    t19 = (t0 + 1196);
    t20 = (t19 + 36U);
    t21 = *((char **)t20);
    memset(t25, 0, 8);
    xsi_vlog_signed_multiply(t25, 32, t18, 32, t21, 32);
    t22 = ((char*)((ng3)));
    memset(t26, 0, 8);
    xsi_vlog_signed_add(t26, 32, t25, 32, t22, 32);
    xsi_vlog_generic_get_index_select_value(t15, 32, t14, t17, 2, t26, 32, 1);
    t27 = ((char*)((ng3)));
    memset(t28, 0, 8);
    t29 = (t15 + 4);
    t30 = (t27 + 4);
    t23 = *((unsigned int *)t15);
    t31 = *((unsigned int *)t27);
    t32 = (t23 ^ t31);
    t33 = *((unsigned int *)t29);
    t34 = *((unsigned int *)t30);
    t35 = (t33 ^ t34);
    t36 = (t32 | t35);
    t37 = *((unsigned int *)t29);
    t38 = *((unsigned int *)t30);
    t39 = (t37 | t38);
    t40 = (~(t39));
    t41 = (t36 & t40);
    if (t41 != 0)
        goto LAB26;

LAB23:    if (t39 != 0)
        goto LAB25;

LAB24:    *((unsigned int *)t28) = 1;

LAB26:    t43 = (t28 + 4);
    t44 = *((unsigned int *)t43);
    t45 = (~(t44));
    t46 = *((unsigned int *)t28);
    t47 = (t46 & t45);
    t48 = (t47 != 0);
    if (t48 > 0)
        goto LAB27;

LAB28:    xsi_set_current_line(57, ng0);

LAB48:    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1104);
    t4 = (t0 + 1104);
    t5 = (t4 + 44U);
    t11 = *((char **)t5);
    t12 = (t0 + 1196);
    t14 = (t12 + 36U);
    t16 = *((char **)t14);
    xsi_vlog_generic_convert_bit_index(t13, t11, 2, t16, 32, 1);
    t17 = (t13 + 4);
    t6 = *((unsigned int *)t17);
    t24 = (!(t6));
    if (t24 == 1)
        goto LAB49;

LAB50:    xsi_set_current_line(59, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1012);
    t4 = (t0 + 1012);
    t5 = (t4 + 44U);
    t11 = *((char **)t5);
    t12 = (t0 + 1196);
    t14 = (t12 + 36U);
    t16 = *((char **)t14);
    xsi_vlog_generic_convert_bit_index(t13, t11, 2, t16, 32, 1);
    t17 = (t13 + 4);
    t6 = *((unsigned int *)t17);
    t24 = (!(t6));
    if (t24 == 1)
        goto LAB51;

LAB52:
LAB29:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1196);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t13, 0, 8);
    xsi_vlog_signed_add(t13, 32, t4, 32, t5, 32);
    t11 = (t0 + 1196);
    xsi_vlogvar_assign_value(t11, t13, 0, 0, 32);
    goto LAB19;

LAB25:    t42 = (t28 + 4);
    *((unsigned int *)t28) = 1;
    *((unsigned int *)t42) = 1;
    goto LAB26;

LAB27:    xsi_set_current_line(41, ng0);

LAB30:    xsi_set_current_line(44, ng0);
    t49 = (t0 + 784U);
    t50 = *((char **)t49);
    t49 = (t0 + 760U);
    t52 = (t49 + 44U);
    t53 = *((char **)t52);
    t54 = ((char*)((ng4)));
    t55 = (t0 + 1196);
    t56 = (t55 + 36U);
    t57 = *((char **)t56);
    memset(t58, 0, 8);
    xsi_vlog_signed_multiply(t58, 32, t54, 32, t57, 32);
    xsi_vlog_generic_get_index_select_value(t51, 32, t50, t53, 2, t58, 32, 1);
    t59 = ((char*)((ng1)));
    memset(t60, 0, 8);
    t61 = (t51 + 4);
    t62 = (t59 + 4);
    t63 = *((unsigned int *)t51);
    t64 = *((unsigned int *)t59);
    t65 = (t63 ^ t64);
    t66 = *((unsigned int *)t61);
    t67 = *((unsigned int *)t62);
    t68 = (t66 ^ t67);
    t69 = (t65 | t68);
    t70 = *((unsigned int *)t61);
    t71 = *((unsigned int *)t62);
    t72 = (t70 | t71);
    t73 = (~(t72));
    t74 = (t69 & t73);
    if (t74 != 0)
        goto LAB34;

LAB31:    if (t72 != 0)
        goto LAB33;

LAB32:    *((unsigned int *)t60) = 1;

LAB34:    t76 = (t60 + 4);
    t77 = *((unsigned int *)t76);
    t78 = (~(t77));
    t79 = *((unsigned int *)t60);
    t80 = (t79 & t78);
    t81 = (t80 != 0);
    if (t81 > 0)
        goto LAB35;

LAB36:    xsi_set_current_line(50, ng0);

LAB43:    xsi_set_current_line(51, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1104);
    t4 = (t0 + 1104);
    t5 = (t4 + 44U);
    t11 = *((char **)t5);
    t12 = (t0 + 1196);
    t14 = (t12 + 36U);
    t16 = *((char **)t14);
    xsi_vlog_generic_convert_bit_index(t13, t11, 2, t16, 32, 1);
    t17 = (t13 + 4);
    t6 = *((unsigned int *)t17);
    t24 = (!(t6));
    if (t24 == 1)
        goto LAB44;

LAB45:    xsi_set_current_line(52, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1012);
    t4 = (t0 + 1012);
    t5 = (t4 + 44U);
    t11 = *((char **)t5);
    t12 = (t0 + 1196);
    t14 = (t12 + 36U);
    t16 = *((char **)t14);
    xsi_vlog_generic_convert_bit_index(t13, t11, 2, t16, 32, 1);
    t17 = (t13 + 4);
    t6 = *((unsigned int *)t17);
    t24 = (!(t6));
    if (t24 == 1)
        goto LAB46;

LAB47:
LAB37:    goto LAB29;

LAB33:    t75 = (t60 + 4);
    *((unsigned int *)t60) = 1;
    *((unsigned int *)t75) = 1;
    goto LAB34;

LAB35:    xsi_set_current_line(44, ng0);

LAB38:    xsi_set_current_line(45, ng0);
    t82 = ((char*)((ng3)));
    t83 = (t0 + 1104);
    t85 = (t0 + 1104);
    t86 = (t85 + 44U);
    t87 = *((char **)t86);
    t88 = (t0 + 1196);
    t89 = (t88 + 36U);
    t90 = *((char **)t89);
    xsi_vlog_generic_convert_bit_index(t84, t87, 2, t90, 32, 1);
    t91 = (t84 + 4);
    t92 = *((unsigned int *)t91);
    t24 = (!(t92));
    if (t24 == 1)
        goto LAB39;

LAB40:    xsi_set_current_line(46, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1012);
    t4 = (t0 + 1012);
    t5 = (t4 + 44U);
    t11 = *((char **)t5);
    t12 = (t0 + 1196);
    t14 = (t12 + 36U);
    t16 = *((char **)t14);
    xsi_vlog_generic_convert_bit_index(t13, t11, 2, t16, 32, 1);
    t17 = (t13 + 4);
    t6 = *((unsigned int *)t17);
    t24 = (!(t6));
    if (t24 == 1)
        goto LAB41;

LAB42:    goto LAB37;

LAB39:    xsi_vlogvar_wait_assign_value(t83, t82, 0, *((unsigned int *)t84), 1, 0LL);
    goto LAB40;

LAB41:    xsi_vlogvar_wait_assign_value(t3, t2, 0, *((unsigned int *)t13), 1, 0LL);
    goto LAB42;

LAB44:    xsi_vlogvar_wait_assign_value(t3, t2, 0, *((unsigned int *)t13), 1, 0LL);
    goto LAB45;

LAB46:    xsi_vlogvar_wait_assign_value(t3, t2, 0, *((unsigned int *)t13), 1, 0LL);
    goto LAB47;

LAB49:    xsi_vlogvar_wait_assign_value(t3, t2, 0, *((unsigned int *)t13), 1, 0LL);
    goto LAB50;

LAB51:    xsi_vlogvar_wait_assign_value(t3, t2, 0, *((unsigned int *)t13), 1, 0LL);
    goto LAB52;

}


extern void work_m_00000000000263931634_3733503756_init()
{
	static char *pe[] = {(void *)Always_28_0};
	xsi_register_didat("work_m_00000000000263931634_3733503756", "isim/format_board_state_testbench_isim_beh.exe.sim/work/m_00000000000263931634_3733503756.didat");
	xsi_register_executes(pe);
}
