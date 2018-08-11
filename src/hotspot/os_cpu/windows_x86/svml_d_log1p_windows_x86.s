;
; Copyright (c) 2018, Intel Corporation.
; Intel Short Vector Math Library (SVML) Source Code
;
; DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
;
; This code is free software; you can redistribute it and/or modify it
; under the terms of the GNU General Public License version 2 only, as
; published by the Free Software Foundation.
;
; This code is distributed in the hope that it will be useful, but WITHOUT
; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
; FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
; version 2 for more details (a copy is included in the LICENSE file that
; accompanied this code).
;
; You should have received a copy of the GNU General Public License version
; 2 along with this work; if not, write to the Free Software Foundation,
; Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
;
; Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
; or visit www.oracle.com if you need additional information or have any
; questions.
;

INCLUDE globals_vectorApiSupport_windows.hpp
IFNB __VECTOR_API_MATH_INTRINSICS_WINDOWS

	OPTION DOTNAME

_TEXT	SEGMENT      'CODE'

TXTST0:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_log1p4_ha_l9

__svml_log1p4_ha_l9	PROC

_B1_1::

        DB        243
        DB        15
        DB        30
        DB        250
L1::

        sub       rsp, 328
        lea       rax, QWORD PTR [__ImageBase]
        vmovups   XMMWORD PTR [208+rsp], xmm15
        vmovups   XMMWORD PTR [224+rsp], xmm14
        vmovups   XMMWORD PTR [240+rsp], xmm13
        vmovups   XMMWORD PTR [256+rsp], xmm12
        vmovups   XMMWORD PTR [272+rsp], xmm11
        vmovups   XMMWORD PTR [288+rsp], xmm10
        mov       QWORD PTR [304+rsp], r13
        lea       r13, QWORD PTR [111+rsp]
        vmovupd   ymm13, YMMWORD PTR [rcx]
        and       r13, -64
        vmovupd   ymm5, YMMWORD PTR [__svml_dlog1p_ha_data_internal+13056]
        vmovupd   ymm14, YMMWORD PTR [__svml_dlog1p_ha_data_internal+12992]
        vandpd    ymm2, ymm13, ymm5
        vcmplt_oqpd ymm12, ymm2, YMMWORD PTR [__svml_dlog1p_ha_data_internal+13120]
        vaddpd    ymm15, ymm13, ymm14
        vmaxpd    ymm4, ymm14, ymm13
        vminpd    ymm10, ymm14, ymm13
        vorpd     ymm11, ymm12, YMMWORD PTR [__svml_dlog1p_ha_data_internal+13184]
        vandpd    ymm3, ymm15, ymm11
        vandpd    ymm0, ymm3, YMMWORD PTR [__svml_dlog1p_ha_data_internal+12672]
        vandnpd   ymm12, ymm5, ymm13
        vorpd     ymm5, ymm0, YMMWORD PTR [__svml_dlog1p_ha_data_internal+12736]
        vcvtpd2ps xmm2, ymm5
        vsubpd    ymm1, ymm4, ymm3
        vrcpps    xmm15, xmm2
        vaddpd    ymm4, ymm10, ymm1
        vcvtps2pd ymm11, xmm15
        vpsrlq    ymm1, ymm3, 20
        vmovupd   ymm10, YMMWORD PTR [__svml_dlog1p_ha_data_internal+13632]
        vroundpd  ymm0, ymm11, 0
        vandps    ymm3, ymm3, YMMWORD PTR [__svml_dlog1p_ha_data_internal+13568]
        vfmsub213pd ymm5, ymm0, ymm14
        vpsubq    ymm14, ymm10, ymm3
        vpsrlq    ymm15, ymm0, 39
        vmulpd    ymm3, ymm0, ymm14
        vmulpd    ymm3, ymm4, ymm3
        vaddpd    ymm4, ymm5, ymm3
        vsubpd    ymm5, ymm4, ymm5
        mov       QWORD PTR [312+rsp], r13
        vextracti128 xmm10, ymm15, 1
        vmovd     r8d, xmm15
        vmovd     r10d, xmm10
        vpextrd   r9d, xmm15, 2
        vpextrd   r11d, xmm10, 2
        movsxd    r8, r8d
        movsxd    r9, r9d
        movsxd    r10, r10d
        movsxd    r11, r11d
        vextracti128 xmm2, ymm1, 1
        vmovupd   xmm0, XMMWORD PTR [imagerel(__svml_dlog1p_ha_data_internal)-8454144+rax+r9]
        vmovupd   xmm15, XMMWORD PTR [imagerel(__svml_dlog1p_ha_data_internal)-8454144+rax+r10]
        vshufps   xmm11, xmm1, xmm2, 221
        vcmplt_oqpd ymm1, ymm13, YMMWORD PTR [__svml_dlog1p_ha_data_internal+12800]
        vcmpnle_uqpd ymm2, ymm13, YMMWORD PTR [__svml_dlog1p_ha_data_internal+12864]
        vcvtdq2pd ymm11, xmm11
        vorpd     ymm14, ymm1, ymm2
        vmovupd   xmm1, XMMWORD PTR [imagerel(__svml_dlog1p_ha_data_internal)-8454144+rax+r8]
        vmovmskpd edx, ymm14
        vmovupd   xmm14, XMMWORD PTR [imagerel(__svml_dlog1p_ha_data_internal)-8454144+rax+r11]
        test      edx, edx
        vunpcklpd xmm10, xmm1, xmm0
        vunpcklpd xmm2, xmm15, xmm14
        vunpckhpd xmm0, xmm1, xmm0
        vunpckhpd xmm1, xmm15, xmm14
        vmulpd    ymm15, ymm4, ymm4
        vinsertf128 ymm10, ymm10, xmm2, 1
        vfmadd231pd ymm10, ymm11, YMMWORD PTR [__svml_dlog1p_ha_data_internal+13248]
        vinsertf128 ymm14, ymm0, xmm1, 1
        vfmadd132pd ymm11, ymm14, YMMWORD PTR [__svml_dlog1p_ha_data_internal+13312]
        vmovupd   ymm14, YMMWORD PTR [__svml_dlog1p_ha_data_internal+12544]
        vsubpd    ymm0, ymm3, ymm5
        vmovupd   ymm5, YMMWORD PTR [__svml_dlog1p_ha_data_internal+12416]
        vfmadd213pd ymm14, ymm4, YMMWORD PTR [__svml_dlog1p_ha_data_internal+12608]
        vaddpd    ymm11, ymm11, ymm0
        vfmadd213pd ymm5, ymm4, YMMWORD PTR [__svml_dlog1p_ha_data_internal+12480]
        vfmadd213pd ymm5, ymm15, ymm14
        vaddpd    ymm14, ymm10, ymm4
        vfmadd213pd ymm5, ymm15, ymm11
        vsubpd    ymm10, ymm14, ymm10
        vsubpd    ymm4, ymm4, ymm10
        vaddpd    ymm0, ymm4, ymm5
        vaddpd    ymm1, ymm14, ymm0
        vorpd     ymm0, ymm1, ymm12
        jne       _B1_3

_B1_2::

        vmovups   xmm10, XMMWORD PTR [288+rsp]
        vmovups   xmm11, XMMWORD PTR [272+rsp]
        vmovups   xmm12, XMMWORD PTR [256+rsp]
        vmovups   xmm13, XMMWORD PTR [240+rsp]
        vmovups   xmm14, XMMWORD PTR [224+rsp]
        vmovups   xmm15, XMMWORD PTR [208+rsp]
        mov       r13, QWORD PTR [304+rsp]
        add       rsp, 328
        ret

_B1_3::

        vmovupd   YMMWORD PTR [r13], ymm13
        vmovupd   YMMWORD PTR [64+r13], ymm0

_B1_6::

        xor       eax, eax
        mov       QWORD PTR [40+rsp], rbx
        mov       ebx, eax
        mov       QWORD PTR [32+rsp], rsi
        mov       esi, edx

_B1_7::

        bt        esi, ebx
        jc        _B1_10

_B1_8::

        inc       ebx
        cmp       ebx, 4
        jl        _B1_7

_B1_9::

        mov       rbx, QWORD PTR [40+rsp]
        mov       rsi, QWORD PTR [32+rsp]
        vmovupd   ymm0, YMMWORD PTR [64+r13]
        jmp       _B1_2

_B1_10::

        vzeroupper
        lea       rcx, QWORD PTR [r13+rbx*8]
        lea       rdx, QWORD PTR [64+r13+rbx*8]

        call      __svml_dlog1p_ha_cout_rare_internal
        jmp       _B1_8
        ALIGN     16

_B1_11::

__svml_log1p4_ha_l9 ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_log1p4_ha_l9_B1_B3:
	DD	1069057
	DD	2544720
	DD	1222728
	DD	1161279
	DD	1099830
	DD	1038381
	DD	976932
	DD	915483
	DD	2687243

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B1_1
	DD	imagerel _B1_6
	DD	imagerel _unwind___svml_log1p4_ha_l9_B1_B3

.pdata	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_log1p4_ha_l9_B6_B10:
	DD	265761
	DD	287758
	DD	340999
	DD	imagerel _B1_1
	DD	imagerel _B1_6
	DD	imagerel _unwind___svml_log1p4_ha_l9_B1_B3

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B1_6
	DD	imagerel _B1_11
	DD	imagerel _unwind___svml_log1p4_ha_l9_B6_B10

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_TEXT	SEGMENT      'CODE'

TXTST1:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_log1p2_ha_ex

__svml_log1p2_ha_ex	PROC

_B2_1::

        DB        243
        DB        15
        DB        30
        DB        250
L20::

        sub       rsp, 280
        lea       r9, QWORD PTR [__ImageBase]
        movups    XMMWORD PTR [192+rsp], xmm12
        movups    XMMWORD PTR [208+rsp], xmm9
        movups    XMMWORD PTR [224+rsp], xmm8
        movups    XMMWORD PTR [240+rsp], xmm7
        mov       QWORD PTR [256+rsp], r13
        lea       r13, QWORD PTR [111+rsp]
        movups    xmm5, XMMWORD PTR [rcx]
        and       r13, -64
        movups    xmm4, XMMWORD PTR [__svml_dlog1p_ha_data_internal+13056]
        movaps    xmm2, xmm5
        andps     xmm2, xmm4
        movaps    xmm0, xmm5
        movups    xmm12, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12992]
        andnps    xmm4, xmm5
        cmpltpd   xmm2, XMMWORD PTR [__svml_dlog1p_ha_data_internal+13120]
        addpd     xmm0, xmm12
        orps      xmm2, XMMWORD PTR [__svml_dlog1p_ha_data_internal+13184]
        movaps    xmm9, xmm12
        andps     xmm0, xmm2
        movaps    xmm3, xmm12
        movups    xmm2, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12672]
        andps     xmm2, xmm0
        orps      xmm2, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12736]
        cvtpd2ps  xmm1, xmm2
        maxpd     xmm9, xmm5
        minpd     xmm3, xmm5
        subpd     xmm9, xmm0
        movlhps   xmm1, xmm1
        rcpps     xmm8, xmm1
        addpd     xmm3, xmm9
        cvtps2pd  xmm9, xmm8
        movups    xmm8, XMMWORD PTR [_2il0floatpacket_18]
        addpd     xmm9, xmm8
        subpd     xmm9, xmm8
        movdqu    xmm7, XMMWORD PTR [__svml_dlog1p_ha_data_internal+13568]
        movaps    xmm8, xmm5
        movdqu    xmm1, XMMWORD PTR [__svml_dlog1p_ha_data_internal+13632]
        pand      xmm7, xmm0
        psubq     xmm1, xmm7
        mulpd     xmm2, xmm9
        mulpd     xmm1, xmm9
        subpd     xmm2, xmm12
        cmpltpd   xmm8, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12800]
        mulpd     xmm3, xmm1
        psrlq     xmm9, 39
        movaps    xmm7, xmm5
        psrlq     xmm0, 20
        movd      edx, xmm9
        pshufd    xmm12, xmm9, 2
        pshufd    xmm0, xmm0, 221
        cmpnlepd  xmm7, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12864]
        cvtdq2pd  xmm0, xmm0
        movd      r8d, xmm12
        orps      xmm8, xmm7
        movsxd    rdx, edx
        movsxd    r8, r8d
        movmskpd  eax, xmm8
        movups    xmm8, XMMWORD PTR [__svml_dlog1p_ha_data_internal+13248]
        movups    xmm7, XMMWORD PTR [imagerel(__svml_dlog1p_ha_data_internal)-8454144+r9+rdx]
        movups    xmm9, XMMWORD PTR [imagerel(__svml_dlog1p_ha_data_internal)-8454144+r9+r8]
        movaps    xmm12, xmm7
        mulpd     xmm8, xmm0
        mulpd     xmm0, XMMWORD PTR [__svml_dlog1p_ha_data_internal+13312]
        unpcklpd  xmm12, xmm9
        unpckhpd  xmm7, xmm9
        movaps    xmm9, xmm2
        addpd     xmm9, xmm3
        addpd     xmm7, xmm0
        addpd     xmm12, xmm8
        movaps    xmm1, xmm9
        subpd     xmm1, xmm2
        movups    xmm0, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12416]
        mulpd     xmm0, xmm9
        subpd     xmm3, xmm1
        addpd     xmm0, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12480]
        addpd     xmm7, xmm3
        movaps    xmm1, xmm9
        mulpd     xmm1, xmm9
        movups    xmm2, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12544]
        mulpd     xmm2, xmm9
        mulpd     xmm0, xmm1
        addpd     xmm2, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12608]
        addpd     xmm2, xmm0
        movaps    xmm0, xmm12
        addpd     xmm0, xmm9
        mulpd     xmm1, xmm2
        movaps    xmm8, xmm0
        subpd     xmm8, xmm12
        addpd     xmm7, xmm1
        subpd     xmm9, xmm8
        addpd     xmm9, xmm7
        addpd     xmm0, xmm9
        mov       QWORD PTR [264+rsp], r13
        orps      xmm0, xmm4
        test      eax, eax
        jne       _B2_3

_B2_2::

        movups    xmm7, XMMWORD PTR [240+rsp]
        movups    xmm8, XMMWORD PTR [224+rsp]
        movups    xmm9, XMMWORD PTR [208+rsp]
        movups    xmm12, XMMWORD PTR [192+rsp]
        mov       r13, QWORD PTR [256+rsp]
        add       rsp, 280
        ret

_B2_3::

        movups    XMMWORD PTR [r13], xmm5
        movups    XMMWORD PTR [64+r13], xmm0

_B2_6::

        xor       ecx, ecx
        mov       QWORD PTR [40+rsp], rbx
        mov       ebx, ecx
        mov       QWORD PTR [32+rsp], rsi
        mov       esi, eax

_B2_7::

        mov       ecx, ebx
        mov       edx, 1
        shl       edx, cl
        test      esi, edx
        jne       _B2_10

_B2_8::

        inc       ebx
        cmp       ebx, 2
        jl        _B2_7

_B2_9::

        mov       rbx, QWORD PTR [40+rsp]
        mov       rsi, QWORD PTR [32+rsp]
        movups    xmm0, XMMWORD PTR [64+r13]
        jmp       _B2_2

_B2_10::

        lea       rcx, QWORD PTR [r13+rbx*8]
        lea       rdx, QWORD PTR [64+r13+rbx*8]

        call      __svml_dlog1p_ha_cout_rare_internal
        jmp       _B2_8
        ALIGN     16

_B2_11::

__svml_log1p2_ha_ex ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_log1p2_ha_ex_B1_B3:
	DD	802049
	DD	2151485
	DD	1013813
	DD	952365
	DD	890916
	DD	837659
	DD	2294027

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B2_1
	DD	imagerel _B2_6
	DD	imagerel _unwind___svml_log1p2_ha_ex_B1_B3

.pdata	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_log1p2_ha_ex_B6_B10:
	DD	265761
	DD	287758
	DD	340999
	DD	imagerel _B2_1
	DD	imagerel _B2_6
	DD	imagerel _unwind___svml_log1p2_ha_ex_B1_B3

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B2_6
	DD	imagerel _B2_11
	DD	imagerel _unwind___svml_log1p2_ha_ex_B6_B10

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_TEXT	SEGMENT      'CODE'

TXTST2:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_log1p1_ha_l9

__svml_log1p1_ha_l9	PROC

_B3_1::

        DB        243
        DB        15
        DB        30
        DB        250
L35::

        sub       rsp, 264
        lea       rdx, QWORD PTR [__ImageBase]
        vmovups   XMMWORD PTR [208+rsp], xmm15
        vmovups   XMMWORD PTR [240+rsp], xmm14
        vmovups   XMMWORD PTR [224+rsp], xmm9
        vmovups   XMMWORD PTR [176+rsp], xmm8
        vmovups   XMMWORD PTR [192+rsp], xmm7
        mov       QWORD PTR [168+rsp], r13
        lea       r13, QWORD PTR [95+rsp]
        vmovupd   xmm15, XMMWORD PTR [rcx]
        and       r13, -64
        vmovsd    xmm9, QWORD PTR [__svml_dlog1p_ha_data_internal+13056]
        vandpd    xmm14, xmm15, xmm9
        vmovsd    xmm0, QWORD PTR [__svml_dlog1p_ha_data_internal+12992]
        vmovddup  xmm5, QWORD PTR [__svml_dlog1p_ha_data_internal+12992]
        vaddsd    xmm1, xmm0, xmm15
        vcmpltsd  xmm4, xmm14, QWORD PTR [__svml_dlog1p_ha_data_internal+13120]
        vmovddup  xmm8, QWORD PTR [rcx]
        vandnpd   xmm14, xmm9, xmm15
        vmaxpd    xmm2, xmm5, xmm8
        vminpd    xmm8, xmm5, xmm8
        vmovsd    xmm3, QWORD PTR [__svml_dlog1p_ha_data_internal+13184]
        vorpd     xmm3, xmm3, xmm4
        vandpd    xmm1, xmm1, xmm3
        vmovsd    xmm7, QWORD PTR [__svml_dlog1p_ha_data_internal+12736]
        vsubsd    xmm5, xmm2, xmm1
        vmovsd    xmm2, QWORD PTR [__svml_dlog1p_ha_data_internal+12672]
        vaddsd    xmm5, xmm5, xmm8
        vandpd    xmm4, xmm1, xmm2
        vorpd     xmm8, xmm4, xmm7
        vcvtpd2ps xmm2, xmm8
        vmovlhps  xmm3, xmm2, xmm2
        vrcpps    xmm4, xmm3
        vcmpltsd  xmm3, xmm15, QWORD PTR [__svml_dlog1p_ha_data_internal+12800]
        vcvtps2pd xmm2, xmm4
        vcmpnlesd xmm4, xmm15, QWORD PTR [__svml_dlog1p_ha_data_internal+12864]
        vmovq     xmm7, QWORD PTR [__svml_dlog1p_ha_data_internal+13568]
        vorpd     xmm3, xmm3, xmm4
        vroundsd  xmm2, xmm2, xmm2, 0
        vmovq     xmm9, QWORD PTR [__svml_dlog1p_ha_data_internal+13632]
        vfmsub213sd xmm8, xmm2, xmm0
        vpand     xmm0, xmm1, xmm7
        vpsubq    xmm9, xmm9, xmm0
        vpsrlq    xmm1, xmm1, 20
        vmovsd    xmm4, QWORD PTR [__svml_dlog1p_ha_data_internal+13248]
        vmulsd    xmm0, xmm9, xmm2
        vpsrlq    xmm2, xmm2, 39
        vmovd     eax, xmm2
        vmovmskpd ecx, xmm3
        vpshufd   xmm9, xmm1, 85
        vpshufd   xmm7, xmm9, 0
        vcvtdq2pd xmm9, xmm7
        vmulsd    xmm5, xmm5, xmm0
        movsxd    rax, eax
        vmovapd   xmm7, xmm9
        vmovsd    xmm2, QWORD PTR [__svml_dlog1p_ha_data_internal+12416]
        vmovsd    xmm0, QWORD PTR [__svml_dlog1p_ha_data_internal+12544]
        mov       QWORD PTR [256+rsp], r13
        vfmadd213sd xmm7, xmm4, QWORD PTR [imagerel(__svml_dlog1p_ha_data_internal)-8454144+rdx+rax]
        vaddsd    xmm4, xmm8, xmm5
        vmovddup  xmm1, QWORD PTR [imagerel(__svml_dlog1p_ha_data_internal)-8454136+rdx+rax]
        vsubsd    xmm8, xmm4, xmm8
        vfmadd132sd xmm9, xmm1, QWORD PTR [__svml_dlog1p_ha_data_internal+13312]
        vfmadd213sd xmm2, xmm4, QWORD PTR [__svml_dlog1p_ha_data_internal+12480]
        vfmadd213sd xmm0, xmm4, QWORD PTR [__svml_dlog1p_ha_data_internal+12608]
        vmulsd    xmm3, xmm4, xmm4
        vsubsd    xmm8, xmm5, xmm8
        vaddsd    xmm5, xmm7, xmm4
        vfmadd213sd xmm2, xmm3, xmm0
        vaddsd    xmm8, xmm9, xmm8
        vsubsd    xmm0, xmm5, xmm7
        vfmadd213sd xmm2, xmm3, xmm8
        vsubsd    xmm1, xmm4, xmm0
        vaddsd    xmm2, xmm1, xmm2
        vaddsd    xmm3, xmm2, xmm5
        vorpd     xmm0, xmm3, xmm14
        and       ecx, 1
        jne       _B3_3

_B3_2::

        vmovups   xmm7, XMMWORD PTR [192+rsp]
        vmovups   xmm8, XMMWORD PTR [176+rsp]
        vmovups   xmm9, XMMWORD PTR [224+rsp]
        vmovups   xmm14, XMMWORD PTR [240+rsp]
        vmovups   xmm15, XMMWORD PTR [208+rsp]
        mov       r13, QWORD PTR [168+rsp]
        add       rsp, 264
        ret

_B3_3::

        vmovsd    QWORD PTR [r13], xmm15
        vmovsd    QWORD PTR [64+r13], xmm0
        jne       _B3_6

_B3_4::

        vmovsd    xmm0, QWORD PTR [64+r13]
        jmp       _B3_2

_B3_6::

        lea       rcx, QWORD PTR [r13]
        lea       rdx, QWORD PTR [64+r13]

        call      __svml_dlog1p_ha_cout_rare_internal
        jmp       _B3_4
        ALIGN     16

_B3_7::

__svml_log1p1_ha_l9 ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_log1p1_ha_l9_B1_B6:
	DD	935681
	DD	1430599
	DD	817215
	DD	755766
	DD	956461
	DD	1042468
	DD	915483
	DD	2162955

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B3_1
	DD	imagerel _B3_7
	DD	imagerel _unwind___svml_log1p1_ha_l9_B1_B6

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_TEXT	SEGMENT      'CODE'

TXTST3:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_log1p1_ha_e9

__svml_log1p1_ha_e9	PROC

_B4_1::

        DB        243
        DB        15
        DB        30
        DB        250
L48::

        sub       rsp, 264
        lea       rdx, QWORD PTR [__ImageBase]
        vmovups   XMMWORD PTR [176+rsp], xmm15
        vmovups   XMMWORD PTR [224+rsp], xmm14
        vmovups   XMMWORD PTR [192+rsp], xmm13
        vmovups   XMMWORD PTR [208+rsp], xmm12
        vmovups   XMMWORD PTR [240+rsp], xmm6
        mov       QWORD PTR [168+rsp], r13
        lea       r13, QWORD PTR [95+rsp]
        vmovupd   xmm12, XMMWORD PTR [rcx]
        and       r13, -64
        vmovsd    xmm15, QWORD PTR [__svml_dlog1p_ha_data_internal+13056]
        vandpd    xmm6, xmm12, xmm15
        vmovsd    xmm13, QWORD PTR [__svml_dlog1p_ha_data_internal+12992]
        vmovddup  xmm3, QWORD PTR [__svml_dlog1p_ha_data_internal+12992]
        vaddsd    xmm5, xmm13, xmm12
        vcmpltsd  xmm1, xmm6, QWORD PTR [__svml_dlog1p_ha_data_internal+13120]
        vmovddup  xmm4, QWORD PTR [rcx]
        vandnpd   xmm6, xmm15, xmm12
        vmaxpd    xmm2, xmm3, xmm4
        vminpd    xmm3, xmm3, xmm4
        vmovsd    xmm0, QWORD PTR [__svml_dlog1p_ha_data_internal+13184]
        vorpd     xmm0, xmm0, xmm1
        vandpd    xmm1, xmm5, xmm0
        vmovsd    xmm5, QWORD PTR [__svml_dlog1p_ha_data_internal+12672]
        vsubsd    xmm4, xmm2, xmm1
        vmovsd    xmm14, QWORD PTR [__svml_dlog1p_ha_data_internal+12736]
        vandpd    xmm2, xmm1, xmm5
        vorpd     xmm0, xmm2, xmm14
        vaddsd    xmm4, xmm4, xmm3
        vcvtpd2ps xmm5, xmm0
        vmovlhps  xmm3, xmm5, xmm5
        vrcpps    xmm2, xmm3
        vcvtps2pd xmm5, xmm2
        vcmpnlesd xmm2, xmm12, QWORD PTR [__svml_dlog1p_ha_data_internal+12864]
        vroundsd  xmm3, xmm5, xmm5, 0
        vmulsd    xmm0, xmm0, xmm3
        vcmpltsd  xmm5, xmm12, QWORD PTR [__svml_dlog1p_ha_data_internal+12800]
        vmovq     xmm14, QWORD PTR [__svml_dlog1p_ha_data_internal+13568]
        vorpd     xmm5, xmm5, xmm2
        vmovq     xmm15, QWORD PTR [__svml_dlog1p_ha_data_internal+13632]
        vsubsd    xmm0, xmm0, xmm13
        vmovmskpd ecx, xmm5
        vpand     xmm13, xmm1, xmm14
        vpsrlq    xmm1, xmm1, 20
        vpsubq    xmm13, xmm15, xmm13
        vmulsd    xmm15, xmm13, xmm3
        vpsrlq    xmm3, xmm3, 39
        vmovd     eax, xmm3
        vpshufd   xmm1, xmm1, 85
        vmulsd    xmm4, xmm4, xmm15
        vpshufd   xmm13, xmm1, 0
        vcvtdq2pd xmm14, xmm13
        vaddsd    xmm13, xmm0, xmm4
        vmulsd    xmm2, xmm14, QWORD PTR [__svml_dlog1p_ha_data_internal+13248]
        vsubsd    xmm0, xmm13, xmm0
        vmulsd    xmm14, xmm14, QWORD PTR [__svml_dlog1p_ha_data_internal+13312]
        vsubsd    xmm1, xmm4, xmm0
        vmovsd    xmm15, QWORD PTR [__svml_dlog1p_ha_data_internal+12416]
        vmulsd    xmm4, xmm15, xmm13
        movsxd    rax, eax
        vmovsd    xmm5, QWORD PTR [__svml_dlog1p_ha_data_internal+12544]
        vmulsd    xmm0, xmm5, xmm13
        vmulsd    xmm5, xmm13, xmm13
        vaddsd    xmm3, xmm14, QWORD PTR [imagerel(__svml_dlog1p_ha_data_internal)-8454136+rdx+rax]
        vaddsd    xmm14, xmm4, QWORD PTR [__svml_dlog1p_ha_data_internal+12480]
        vaddsd    xmm2, xmm2, QWORD PTR [imagerel(__svml_dlog1p_ha_data_internal)-8454144+rdx+rax]
        vaddsd    xmm4, xmm0, QWORD PTR [__svml_dlog1p_ha_data_internal+12608]
        vaddsd    xmm3, xmm3, xmm1
        vmulsd    xmm15, xmm14, xmm5
        mov       QWORD PTR [256+rsp], r13
        vaddsd    xmm0, xmm15, xmm4
        vaddsd    xmm4, xmm2, xmm13
        vmulsd    xmm1, xmm0, xmm5
        vsubsd    xmm2, xmm4, xmm2
        vaddsd    xmm0, xmm1, xmm3
        vsubsd    xmm13, xmm13, xmm2
        vaddsd    xmm1, xmm13, xmm0
        vaddsd    xmm2, xmm1, xmm4
        vorpd     xmm0, xmm2, xmm6
        and       ecx, 1
        jne       _B4_3

_B4_2::

        vmovups   xmm6, XMMWORD PTR [240+rsp]
        vmovups   xmm12, XMMWORD PTR [208+rsp]
        vmovups   xmm13, XMMWORD PTR [192+rsp]
        vmovups   xmm14, XMMWORD PTR [224+rsp]
        vmovups   xmm15, XMMWORD PTR [176+rsp]
        mov       r13, QWORD PTR [168+rsp]
        add       rsp, 264
        ret

_B4_3::

        vmovsd    QWORD PTR [r13], xmm12
        vmovsd    QWORD PTR [64+r13], xmm0
        jne       _B4_6

_B4_4::

        vmovsd    xmm0, QWORD PTR [64+r13]
        jmp       _B4_2

_B4_6::

        lea       rcx, QWORD PTR [r13]
        lea       rdx, QWORD PTR [64+r13]

        call      __svml_dlog1p_ha_cout_rare_internal
        jmp       _B4_4
        ALIGN     16

_B4_7::

__svml_log1p1_ha_e9 ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_log1p1_ha_e9_B1_B6:
	DD	935681
	DD	1430599
	DD	1009727
	DD	903222
	DD	841773
	DD	976932
	DD	784411
	DD	2162955

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B4_1
	DD	imagerel _B4_7
	DD	imagerel _unwind___svml_log1p1_ha_e9_B1_B6

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_TEXT	SEGMENT      'CODE'

TXTST4:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_log1p4_ha_e9

__svml_log1p4_ha_e9	PROC

_B5_1::

        DB        243
        DB        15
        DB        30
        DB        250
L61::

        sub       rsp, 344
        lea       rax, QWORD PTR [__ImageBase]
        vmovups   XMMWORD PTR [208+rsp], xmm15
        vmovups   XMMWORD PTR [224+rsp], xmm14
        vmovups   XMMWORD PTR [240+rsp], xmm13
        vmovups   XMMWORD PTR [288+rsp], xmm11
        vmovups   XMMWORD PTR [272+rsp], xmm10
        vmovups   XMMWORD PTR [256+rsp], xmm9
        vmovups   XMMWORD PTR [304+rsp], xmm7
        mov       QWORD PTR [320+rsp], r13
        lea       r13, QWORD PTR [111+rsp]
        vmovupd   ymm3, YMMWORD PTR [rcx]
        and       r13, -64
        vmovupd   ymm1, YMMWORD PTR [__svml_dlog1p_ha_data_internal+13056]
        vmovupd   ymm15, YMMWORD PTR [__svml_dlog1p_ha_data_internal+12992]
        vandpd    ymm2, ymm3, ymm1
        vcmplt_oqpd ymm2, ymm2, YMMWORD PTR [__svml_dlog1p_ha_data_internal+13120]
        vaddpd    ymm0, ymm3, ymm15
        vmaxpd    ymm10, ymm15, ymm3
        vorpd     ymm5, ymm2, YMMWORD PTR [__svml_dlog1p_ha_data_internal+13184]
        vandpd    ymm7, ymm0, ymm5
        vandpd    ymm13, ymm7, YMMWORD PTR [__svml_dlog1p_ha_data_internal+12672]
        vorpd     ymm0, ymm13, YMMWORD PTR [__svml_dlog1p_ha_data_internal+12736]
        vcvtpd2ps xmm14, ymm0
        vmovupd   xmm5, XMMWORD PTR [__svml_dlog1p_ha_data_internal+13632]
        vsubpd    ymm4, ymm10, ymm7
        vrcpps    xmm9, xmm14
        vcvtps2pd ymm11, xmm9
        vroundpd  ymm10, ymm11, 0
        vmulpd    ymm0, ymm0, ymm10
        vandnpd   ymm2, ymm1, ymm3
        vminpd    ymm1, ymm15, ymm3
        vsubpd    ymm0, ymm0, ymm15
        vaddpd    ymm1, ymm1, ymm4
        vmovupd   xmm4, XMMWORD PTR [__svml_dlog1p_ha_data_internal+13568]
        mov       QWORD PTR [328+rsp], r13
        vpsrlq    xmm13, xmm7, 20
        vextractf128 xmm9, ymm7, 1
        vpand     xmm15, xmm7, xmm4
        vpsubq    xmm15, xmm5, xmm15
        vpsrlq    xmm14, xmm9, 20
        vandps    xmm4, xmm9, xmm4
        vshufps   xmm11, xmm13, xmm14, 221
        vcmplt_oqpd ymm13, ymm3, YMMWORD PTR [__svml_dlog1p_ha_data_internal+12800]
        vcmpnle_uqpd ymm14, ymm3, YMMWORD PTR [__svml_dlog1p_ha_data_internal+12864]
        vpsubq    xmm5, xmm5, xmm4
        vcvtdq2pd ymm11, xmm11
        vorpd     ymm13, ymm13, ymm14
        vinsertf128 ymm7, ymm15, xmm5, 1
        vmulpd    ymm5, ymm10, ymm7
        vmulpd    ymm1, ymm1, ymm5
        vextractf128 xmm14, ymm13, 1
        vextractf128 xmm4, ymm10, 1
        vpsrlq    xmm10, xmm10, 39
        vmovd     r8d, xmm10
        vshufps   xmm9, xmm13, xmm14, 221
        vpsrlq    xmm14, xmm4, 39
        vmovd     r10d, xmm14
        vmovmskps edx, xmm9
        vpextrd   r11d, xmm14, 2
        movsxd    r10, r10d
        movsxd    r11, r11d
        vpextrd   r9d, xmm10, 2
        movsxd    r8, r8d
        movsxd    r9, r9d
        vmovupd   xmm10, XMMWORD PTR [imagerel(__svml_dlog1p_ha_data_internal)-8454144+rax+r10]
        vmovupd   xmm7, XMMWORD PTR [imagerel(__svml_dlog1p_ha_data_internal)-8454144+rax+r11]
        vaddpd    ymm14, ymm0, ymm1
        vunpcklpd xmm15, xmm10, xmm7
        vunpckhpd xmm7, xmm10, xmm7
        vmulpd    ymm10, ymm11, YMMWORD PTR [__svml_dlog1p_ha_data_internal+13248]
        vmovupd   xmm13, XMMWORD PTR [imagerel(__svml_dlog1p_ha_data_internal)-8454144+rax+r8]
        vmovupd   xmm4, XMMWORD PTR [imagerel(__svml_dlog1p_ha_data_internal)-8454144+rax+r9]
        vunpcklpd xmm9, xmm13, xmm4
        vunpckhpd xmm13, xmm13, xmm4
        vmulpd    ymm5, ymm14, YMMWORD PTR [__svml_dlog1p_ha_data_internal+12416]
        vmulpd    ymm11, ymm11, YMMWORD PTR [__svml_dlog1p_ha_data_internal+13312]
        vsubpd    ymm0, ymm14, ymm0
        vinsertf128 ymm15, ymm9, xmm15, 1
        vaddpd    ymm9, ymm15, ymm10
        vmulpd    ymm10, ymm14, ymm14
        vinsertf128 ymm4, ymm13, xmm7, 1
        vsubpd    ymm13, ymm1, ymm0
        vaddpd    ymm0, ymm5, YMMWORD PTR [__svml_dlog1p_ha_data_internal+12480]
        vaddpd    ymm4, ymm4, ymm11
        vmulpd    ymm1, ymm14, YMMWORD PTR [__svml_dlog1p_ha_data_internal+12544]
        vmulpd    ymm7, ymm0, ymm10
        vaddpd    ymm4, ymm4, ymm13
        vaddpd    ymm5, ymm1, YMMWORD PTR [__svml_dlog1p_ha_data_internal+12608]
        vaddpd    ymm1, ymm9, ymm14
        vaddpd    ymm11, ymm5, ymm7
        vsubpd    ymm9, ymm1, ymm9
        vmulpd    ymm10, ymm10, ymm11
        vsubpd    ymm14, ymm14, ymm9
        vaddpd    ymm13, ymm4, ymm10
        vaddpd    ymm15, ymm14, ymm13
        vaddpd    ymm0, ymm1, ymm15
        vorpd     ymm0, ymm0, ymm2
        test      edx, edx
        jne       _B5_3

_B5_2::

        vmovups   xmm7, XMMWORD PTR [304+rsp]
        vmovups   xmm9, XMMWORD PTR [256+rsp]
        vmovups   xmm10, XMMWORD PTR [272+rsp]
        vmovups   xmm11, XMMWORD PTR [288+rsp]
        vmovups   xmm13, XMMWORD PTR [240+rsp]
        vmovups   xmm14, XMMWORD PTR [224+rsp]
        vmovups   xmm15, XMMWORD PTR [208+rsp]
        mov       r13, QWORD PTR [320+rsp]
        add       rsp, 344
        ret

_B5_3::

        vmovupd   YMMWORD PTR [r13], ymm3
        vmovupd   YMMWORD PTR [64+r13], ymm0

_B5_6::

        xor       eax, eax
        mov       QWORD PTR [40+rsp], rbx
        mov       ebx, eax
        mov       QWORD PTR [32+rsp], rsi
        mov       esi, edx

_B5_7::

        bt        esi, ebx
        jc        _B5_10

_B5_8::

        inc       ebx
        cmp       ebx, 4
        jl        _B5_7

_B5_9::

        mov       rbx, QWORD PTR [40+rsp]
        mov       rsi, QWORD PTR [32+rsp]
        vmovupd   ymm0, YMMWORD PTR [64+r13]
        jmp       _B5_2

_B5_10::

        vzeroupper
        lea       rcx, QWORD PTR [r13+rbx*8]
        lea       rdx, QWORD PTR [64+r13+rbx*8]

        call      __svml_dlog1p_ha_cout_rare_internal
        jmp       _B5_8
        ALIGN     16

_B5_11::

__svml_log1p4_ha_e9 ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_log1p4_ha_e9_B1_B3:
	DD	1202433
	DD	2675801
	DD	1275985
	DD	1087560
	DD	1157183
	DD	1226806
	DD	1038381
	DD	976932
	DD	915483
	DD	2818315

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B5_1
	DD	imagerel _B5_6
	DD	imagerel _unwind___svml_log1p4_ha_e9_B1_B3

.pdata	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_log1p4_ha_e9_B6_B10:
	DD	265761
	DD	287758
	DD	340999
	DD	imagerel _B5_1
	DD	imagerel _B5_6
	DD	imagerel _unwind___svml_log1p4_ha_e9_B1_B3

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B5_6
	DD	imagerel _B5_11
	DD	imagerel _unwind___svml_log1p4_ha_e9_B6_B10

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_TEXT	SEGMENT      'CODE'

TXTST5:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_log1p1_ha_ex

__svml_log1p1_ha_ex	PROC

_B6_1::

        DB        243
        DB        15
        DB        30
        DB        250
L82::

        sub       rsp, 264
        lea       rdx, QWORD PTR [__ImageBase]
        movups    XMMWORD PTR [240+rsp], xmm13
        movups    XMMWORD PTR [176+rsp], xmm12
        movups    XMMWORD PTR [192+rsp], xmm11
        movups    XMMWORD PTR [208+rsp], xmm10
        movups    XMMWORD PTR [224+rsp], xmm9
        mov       QWORD PTR [168+rsp], r13
        lea       r13, QWORD PTR [95+rsp]
        movups    xmm10, XMMWORD PTR [rcx]
        and       r13, -64
        movsd     xmm9, QWORD PTR [__svml_dlog1p_ha_data_internal+13056]
        movaps    xmm0, xmm10
        movsd     xmm12, QWORD PTR [__svml_dlog1p_ha_data_internal+12992]
        andps     xmm0, xmm9
        movaps    xmm11, xmm12
        movaps    xmm1, xmm12
        movsd     xmm3, QWORD PTR [__svml_dlog1p_ha_data_internal+13184]
        movaps    xmm5, xmm10
        unpcklpd  xmm1, xmm12
        andnps    xmm9, xmm10
        unpcklpd  xmm5, xmm10
        movaps    xmm4, xmm1
        maxpd     xmm4, xmm5
        minpd     xmm1, xmm5
        cmpltsd   xmm0, QWORD PTR [__svml_dlog1p_ha_data_internal+13120]
        addsd     xmm11, xmm10
        orps      xmm3, xmm0
        movsd     xmm5, QWORD PTR [__svml_dlog1p_ha_data_internal+12672]
        andps     xmm11, xmm3
        movsd     xmm2, QWORD PTR [__svml_dlog1p_ha_data_internal+12736]
        andps     xmm5, xmm11
        orps      xmm5, xmm2
        subsd     xmm4, xmm11
        cvtpd2ps  xmm0, xmm5
        addsd     xmm4, xmm1
        movlhps   xmm0, xmm0
        rcpps     xmm1, xmm0
        cvtps2pd  xmm0, xmm1
        movups    xmm2, XMMWORD PTR [_2il0floatpacket_18]
        movaps    xmm1, xmm10
        addpd     xmm0, xmm2
        cmpltsd   xmm1, QWORD PTR [__svml_dlog1p_ha_data_internal+12800]
        subpd     xmm0, xmm2
        movq      xmm13, QWORD PTR [__svml_dlog1p_ha_data_internal+13568]
        movaps    xmm2, xmm10
        movq      xmm3, QWORD PTR [__svml_dlog1p_ha_data_internal+13632]
        pand      xmm13, xmm11
        psubq     xmm3, xmm13
        mulsd     xmm5, xmm0
        cmpnlesd  xmm2, QWORD PTR [__svml_dlog1p_ha_data_internal+12864]
        mulsd     xmm3, xmm0
        subsd     xmm5, xmm12
        mulsd     xmm4, xmm3
        psrlq     xmm0, 39
        psrlq     xmm11, 20
        movd      eax, xmm0
        movaps    xmm0, xmm5
        pshufd    xmm13, xmm11, 85
        orps      xmm1, xmm2
        pshufd    xmm11, xmm13, 0
        addsd     xmm0, xmm4
        cvtdq2pd  xmm12, xmm11
        movmskpd  ecx, xmm1
        movaps    xmm3, xmm0
        movaps    xmm11, xmm12
        mulsd     xmm11, QWORD PTR [__svml_dlog1p_ha_data_internal+13248]
        subsd     xmm3, xmm5
        mulsd     xmm12, QWORD PTR [__svml_dlog1p_ha_data_internal+13312]
        subsd     xmm4, xmm3
        movsd     xmm3, QWORD PTR [__svml_dlog1p_ha_data_internal+12416]
        movaps    xmm2, xmm0
        mulsd     xmm3, xmm0
        and       ecx, 1
        mulsd     xmm2, xmm0
        addsd     xmm3, QWORD PTR [__svml_dlog1p_ha_data_internal+12480]
        movsxd    rax, eax
        movsd     xmm5, QWORD PTR [__svml_dlog1p_ha_data_internal+12544]
        mulsd     xmm5, xmm0
        mulsd     xmm3, xmm2
        addsd     xmm11, QWORD PTR [imagerel(__svml_dlog1p_ha_data_internal)-8454144+rdx+rax]
        addsd     xmm12, QWORD PTR [imagerel(__svml_dlog1p_ha_data_internal)-8454136+rdx+rax]
        addsd     xmm5, QWORD PTR [__svml_dlog1p_ha_data_internal+12608]
        addsd     xmm12, xmm4
        addsd     xmm3, xmm5
        movaps    xmm13, xmm11
        mulsd     xmm3, xmm2
        addsd     xmm13, xmm0
        movaps    xmm1, xmm13
        addsd     xmm3, xmm12
        subsd     xmm1, xmm11
        mov       QWORD PTR [256+rsp], r13
        subsd     xmm0, xmm1
        addsd     xmm0, xmm3
        addsd     xmm0, xmm13
        orps      xmm0, xmm9
        jne       _B6_3

_B6_2::

        movups    xmm9, XMMWORD PTR [224+rsp]
        movups    xmm10, XMMWORD PTR [208+rsp]
        movups    xmm11, XMMWORD PTR [192+rsp]
        movups    xmm12, XMMWORD PTR [176+rsp]
        movups    xmm13, XMMWORD PTR [240+rsp]
        mov       r13, QWORD PTR [168+rsp]
        add       rsp, 264
        ret

_B6_3::

        movsd     QWORD PTR [r13], xmm10
        movsd     QWORD PTR [64+r13], xmm0
        jne       _B6_6

_B6_4::

        movsd     xmm0, QWORD PTR [64+r13]
        jmp       _B6_2

_B6_6::

        lea       rcx, QWORD PTR [r13]
        lea       rdx, QWORD PTR [64+r13]

        call      __svml_dlog1p_ha_cout_rare_internal
        jmp       _B6_4
        ALIGN     16

_B6_7::

__svml_log1p1_ha_ex ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_log1p1_ha_ex_B1_B6:
	DD	935681
	DD	1430599
	DD	956479
	DD	895030
	DD	833581
	DD	772132
	DD	1038363
	DD	2162955

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B6_1
	DD	imagerel _B6_7
	DD	imagerel _unwind___svml_log1p1_ha_ex_B1_B6

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_TEXT	SEGMENT      'CODE'

TXTST6:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_log1p2_ha_e9

__svml_log1p2_ha_e9	PROC

_B7_1::

        DB        243
        DB        15
        DB        30
        DB        250
L95::

        sub       rsp, 280
        lea       r9, QWORD PTR [__ImageBase]
        vmovups   XMMWORD PTR [192+rsp], xmm14
        vmovups   XMMWORD PTR [208+rsp], xmm13
        vmovups   XMMWORD PTR [224+rsp], xmm12
        vmovups   XMMWORD PTR [240+rsp], xmm11
        mov       QWORD PTR [256+rsp], r13
        lea       r13, QWORD PTR [111+rsp]
        vmovupd   xmm5, XMMWORD PTR [rcx]
        and       r13, -64
        vmovupd   xmm13, XMMWORD PTR [__svml_dlog1p_ha_data_internal+13056]
        vandpd    xmm4, xmm5, xmm13
        vmovupd   xmm14, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12992]
        vcmpltpd  xmm4, xmm4, XMMWORD PTR [__svml_dlog1p_ha_data_internal+13120]
        vaddpd    xmm1, xmm5, xmm14
        vmaxpd    xmm3, xmm14, xmm5
        vminpd    xmm11, xmm14, xmm5
        vorpd     xmm2, xmm4, XMMWORD PTR [__svml_dlog1p_ha_data_internal+13184]
        vandnpd   xmm4, xmm13, xmm5
        vandpd    xmm2, xmm1, xmm2
        vandpd    xmm0, xmm2, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12672]
        vorpd     xmm1, xmm0, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12736]
        vcvtpd2ps xmm12, xmm1
        vsubpd    xmm3, xmm3, xmm2
        vmovlhps  xmm13, xmm12, xmm12
        vaddpd    xmm3, xmm11, xmm3
        vrcpps    xmm11, xmm13
        vcmpnlepd xmm13, xmm5, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12864]
        vcvtps2pd xmm11, xmm11
        vroundpd  xmm11, xmm11, 0
        vmulpd    xmm1, xmm1, xmm11
        vpand     xmm12, xmm2, XMMWORD PTR [__svml_dlog1p_ha_data_internal+13568]
        vpsrlq    xmm2, xmm2, 20
        vmovdqu   xmm0, XMMWORD PTR [__svml_dlog1p_ha_data_internal+13632]
        vpsubq    xmm0, xmm0, xmm12
        vsubpd    xmm1, xmm1, xmm14
        vcmpltpd  xmm12, xmm5, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12800]
        vmulpd    xmm0, xmm11, xmm0
        vpshufd   xmm14, xmm2, 221
        vpsrlq    xmm2, xmm11, 39
        vcvtdq2pd xmm14, xmm14
        vmulpd    xmm3, xmm3, xmm0
        vmovd     eax, xmm2
        vorpd     xmm13, xmm12, xmm13
        vmulpd    xmm11, xmm14, XMMWORD PTR [__svml_dlog1p_ha_data_internal+13248]
        vmulpd    xmm14, xmm14, XMMWORD PTR [__svml_dlog1p_ha_data_internal+13312]
        vmovmskpd edx, xmm13
        vpextrd   r8d, xmm2, 2
        movsxd    rax, eax
        movsxd    r8, r8d
        mov       QWORD PTR [264+rsp], r13
        vmovupd   xmm12, XMMWORD PTR [imagerel(__svml_dlog1p_ha_data_internal)-8454144+r9+rax]
        vmovupd   xmm13, XMMWORD PTR [imagerel(__svml_dlog1p_ha_data_internal)-8454144+r9+r8]
        vunpcklpd xmm2, xmm12, xmm13
        vunpckhpd xmm13, xmm12, xmm13
        vaddpd    xmm12, xmm2, xmm11
        vaddpd    xmm11, xmm13, xmm14
        vaddpd    xmm14, xmm1, xmm3
        vmulpd    xmm2, xmm14, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12544]
        vsubpd    xmm13, xmm14, xmm1
        vmulpd    xmm1, xmm14, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12416]
        vsubpd    xmm0, xmm3, xmm13
        vaddpd    xmm13, xmm2, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12608]
        vaddpd    xmm3, xmm1, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12480]
        vmulpd    xmm2, xmm14, xmm14
        vaddpd    xmm0, xmm11, xmm0
        vmulpd    xmm1, xmm3, xmm2
        vaddpd    xmm3, xmm13, xmm1
        vaddpd    xmm13, xmm12, xmm14
        vmulpd    xmm2, xmm2, xmm3
        vsubpd    xmm12, xmm13, xmm12
        vaddpd    xmm0, xmm0, xmm2
        vsubpd    xmm1, xmm14, xmm12
        vaddpd    xmm1, xmm1, xmm0
        vaddpd    xmm3, xmm13, xmm1
        vorpd     xmm0, xmm3, xmm4
        test      edx, edx
        jne       _B7_3

_B7_2::

        vmovups   xmm11, XMMWORD PTR [240+rsp]
        vmovups   xmm12, XMMWORD PTR [224+rsp]
        vmovups   xmm13, XMMWORD PTR [208+rsp]
        vmovups   xmm14, XMMWORD PTR [192+rsp]
        mov       r13, QWORD PTR [256+rsp]
        add       rsp, 280
        ret

_B7_3::

        vmovupd   XMMWORD PTR [r13], xmm5
        vmovupd   XMMWORD PTR [64+r13], xmm0

_B7_6::

        xor       eax, eax
        mov       QWORD PTR [40+rsp], rbx
        mov       ebx, eax
        mov       QWORD PTR [32+rsp], rsi
        mov       esi, edx

_B7_7::

        bt        esi, ebx
        jc        _B7_10

_B7_8::

        inc       ebx
        cmp       ebx, 2
        jl        _B7_7

_B7_9::

        mov       rbx, QWORD PTR [40+rsp]
        mov       rsi, QWORD PTR [32+rsp]
        vmovupd   xmm0, XMMWORD PTR [64+r13]
        jmp       _B7_2

_B7_10::

        lea       rcx, QWORD PTR [r13+rbx*8]
        lea       rdx, QWORD PTR [64+r13+rbx*8]

        call      __svml_dlog1p_ha_cout_rare_internal
        jmp       _B7_8
        ALIGN     16

_B7_11::

__svml_log1p2_ha_e9 ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_log1p2_ha_e9_B1_B3:
	DD	802305
	DD	2151486
	DD	1030198
	DD	968749
	DD	907300
	DD	845851
	DD	2294027

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B7_1
	DD	imagerel _B7_6
	DD	imagerel _unwind___svml_log1p2_ha_e9_B1_B3

.pdata	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_log1p2_ha_e9_B6_B10:
	DD	265761
	DD	287758
	DD	340999
	DD	imagerel _B7_1
	DD	imagerel _B7_6
	DD	imagerel _unwind___svml_log1p2_ha_e9_B1_B3

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B7_6
	DD	imagerel _B7_11
	DD	imagerel _unwind___svml_log1p2_ha_e9_B6_B10

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_TEXT	SEGMENT      'CODE'

TXTST7:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_log1p2_ha_l9

__svml_log1p2_ha_l9	PROC

_B8_1::

        DB        243
        DB        15
        DB        30
        DB        250
L110::

        sub       rsp, 280
        lea       r9, QWORD PTR [__ImageBase]
        vmovups   XMMWORD PTR [192+rsp], xmm15
        vmovups   XMMWORD PTR [208+rsp], xmm14
        vmovups   XMMWORD PTR [224+rsp], xmm13
        vmovups   XMMWORD PTR [240+rsp], xmm12
        mov       QWORD PTR [256+rsp], r13
        lea       r13, QWORD PTR [111+rsp]
        vmovupd   xmm13, XMMWORD PTR [rcx]
        and       r13, -64
        vmovupd   xmm0, XMMWORD PTR [__svml_dlog1p_ha_data_internal+13056]
        vandpd    xmm12, xmm13, xmm0
        vmovupd   xmm14, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12992]
        vcmpltpd  xmm2, xmm12, XMMWORD PTR [__svml_dlog1p_ha_data_internal+13120]
        vaddpd    xmm5, xmm13, xmm14
        vmaxpd    xmm4, xmm14, xmm13
        vminpd    xmm1, xmm14, xmm13
        vorpd     xmm3, xmm2, XMMWORD PTR [__svml_dlog1p_ha_data_internal+13184]
        vandnpd   xmm12, xmm0, xmm13
        vandpd    xmm15, xmm5, xmm3
        vsubpd    xmm4, xmm4, xmm15
        vandpd    xmm2, xmm15, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12672]
        vaddpd    xmm5, xmm1, xmm4
        vorpd     xmm4, xmm2, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12736]
        vcvtpd2ps xmm0, xmm4
        vmovlhps  xmm3, xmm0, xmm0
        vrcpps    xmm1, xmm3
        vcmpltpd  xmm3, xmm13, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12800]
        vcvtps2pd xmm1, xmm1
        vpand     xmm0, xmm15, XMMWORD PTR [__svml_dlog1p_ha_data_internal+13568]
        vpsrlq    xmm15, xmm15, 20
        vmovdqu   xmm2, XMMWORD PTR [__svml_dlog1p_ha_data_internal+13632]
        vpsubq    xmm2, xmm2, xmm0
        vcmpnlepd xmm0, xmm13, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12864]
        vroundpd  xmm1, xmm1, 0
        vorpd     xmm0, xmm3, xmm0
        vmulpd    xmm2, xmm1, xmm2
        vfmsub213pd xmm4, xmm1, xmm14
        vpsrlq    xmm3, xmm1, 39
        vpshufd   xmm14, xmm15, 221
        vmovd     eax, xmm3
        vmovmskpd edx, xmm0
        vmulpd    xmm2, xmm5, xmm2
        vcvtdq2pd xmm14, xmm14
        vpextrd   r8d, xmm3, 2
        movsxd    rax, eax
        movsxd    r8, r8d
        mov       QWORD PTR [264+rsp], r13
        vmovupd   xmm15, XMMWORD PTR [imagerel(__svml_dlog1p_ha_data_internal)-8454144+r9+rax]
        vmovupd   xmm0, XMMWORD PTR [imagerel(__svml_dlog1p_ha_data_internal)-8454144+r9+r8]
        vunpcklpd xmm1, xmm15, xmm0
        vunpckhpd xmm3, xmm15, xmm0
        vfmadd231pd xmm1, xmm14, XMMWORD PTR [__svml_dlog1p_ha_data_internal+13248]
        vfmadd132pd xmm14, xmm3, XMMWORD PTR [__svml_dlog1p_ha_data_internal+13312]
        vmovupd   xmm0, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12416]
        vmovupd   xmm15, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12544]
        vaddpd    xmm3, xmm4, xmm2
        vsubpd    xmm4, xmm3, xmm4
        vfmadd213pd xmm0, xmm3, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12480]
        vfmadd213pd xmm15, xmm3, XMMWORD PTR [__svml_dlog1p_ha_data_internal+12608]
        vsubpd    xmm5, xmm2, xmm4
        vaddpd    xmm4, xmm1, xmm3
        vmulpd    xmm2, xmm3, xmm3
        vsubpd    xmm1, xmm4, xmm1
        vaddpd    xmm5, xmm14, xmm5
        vfmadd213pd xmm0, xmm2, xmm15
        vsubpd    xmm1, xmm3, xmm1
        vfmadd213pd xmm0, xmm2, xmm5
        vaddpd    xmm0, xmm1, xmm0
        vaddpd    xmm2, xmm4, xmm0
        vorpd     xmm0, xmm2, xmm12
        test      edx, edx
        jne       _B8_3

_B8_2::

        vmovups   xmm12, XMMWORD PTR [240+rsp]
        vmovups   xmm13, XMMWORD PTR [224+rsp]
        vmovups   xmm14, XMMWORD PTR [208+rsp]
        vmovups   xmm15, XMMWORD PTR [192+rsp]
        mov       r13, QWORD PTR [256+rsp]
        add       rsp, 280
        ret

_B8_3::

        vmovupd   XMMWORD PTR [r13], xmm13
        vmovupd   XMMWORD PTR [64+r13], xmm0

_B8_6::

        xor       eax, eax
        mov       QWORD PTR [40+rsp], rbx
        mov       ebx, eax
        mov       QWORD PTR [32+rsp], rsi
        mov       esi, edx

_B8_7::

        bt        esi, ebx
        jc        _B8_10

_B8_8::

        inc       ebx
        cmp       ebx, 2
        jl        _B8_7

_B8_9::

        mov       rbx, QWORD PTR [40+rsp]
        mov       rsi, QWORD PTR [32+rsp]
        vmovupd   xmm0, XMMWORD PTR [64+r13]
        jmp       _B8_2

_B8_10::

        lea       rcx, QWORD PTR [r13+rbx*8]
        lea       rdx, QWORD PTR [64+r13+rbx*8]

        call      __svml_dlog1p_ha_cout_rare_internal
        jmp       _B8_8
        ALIGN     16

_B8_11::

__svml_log1p2_ha_l9 ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_log1p2_ha_l9_B1_B3:
	DD	802305
	DD	2151486
	DD	1034294
	DD	972845
	DD	911396
	DD	849947
	DD	2294027

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B8_1
	DD	imagerel _B8_6
	DD	imagerel _unwind___svml_log1p2_ha_l9_B1_B3

.pdata	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_log1p2_ha_l9_B6_B10:
	DD	265761
	DD	287758
	DD	340999
	DD	imagerel _B8_1
	DD	imagerel _B8_6
	DD	imagerel _unwind___svml_log1p2_ha_l9_B1_B3

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B8_6
	DD	imagerel _B8_11
	DD	imagerel _unwind___svml_log1p2_ha_l9_B6_B10

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_TEXT	SEGMENT      'CODE'

TXTST8:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_dlog1p_ha_cout_rare_internal

__svml_dlog1p_ha_cout_rare_internal	PROC

_B9_1::

        DB        243
        DB        15
        DB        30
        DB        250
L125::

        sub       rsp, 56
        xor       eax, eax
        movsd     xmm0, QWORD PTR [_2il0floatpacket_83]
        movsd     xmm3, QWORD PTR [rcx]
        addsd     xmm3, xmm0
        movsd     QWORD PTR [40+rsp], xmm3
        movzx     r8d, WORD PTR [46+rsp]
        and       r8d, 32752
        cmp       r8d, 32752
        je        _B9_12

_B9_2::

        movsd     QWORD PTR [48+rsp], xmm3
        xor       r8d, r8d
        movzx     ecx, WORD PTR [54+rsp]
        test      ecx, 32752
        jne       _B9_4

_B9_3::

        mulsd     xmm3, QWORD PTR [_imldLnHATab+1600]
        mov       r8d, -60
        movsd     QWORD PTR [48+rsp], xmm3

_B9_4::

        movsd     xmm1, QWORD PTR [_imldLnHATab+1608]
        comisd    xmm3, xmm1
        jbe       _B9_8

_B9_5::

        movaps    xmm2, xmm3
        subsd     xmm2, xmm0
        movsd     QWORD PTR [40+rsp], xmm2
        and       BYTE PTR [47+rsp], 127
        movsd     xmm1, QWORD PTR [40+rsp]
        comisd    xmm1, QWORD PTR [_imldLnHATab+1592]
        jbe       _B9_7

_B9_6::

        movsd     QWORD PTR [40+rsp], xmm3
        pxor      xmm1, xmm1
        movzx     r9d, WORD PTR [46+rsp]
        and       r9d, -32753
        add       r9d, 16368
        mov       WORD PTR [46+rsp], r9w
        movsd     xmm5, QWORD PTR [40+rsp]
        movaps    xmm3, xmm5
        movzx     ecx, WORD PTR [54+rsp]
        and       ecx, 32752
        addsd     xmm3, QWORD PTR [_imldLnHATab+1576]
        shr       ecx, 4
        movsd     QWORD PTR [32+rsp], xmm3
        movaps    xmm3, xmm5
        mov       r10d, DWORD PTR [32+rsp]
        and       r10d, 127
        addsd     xmm3, QWORD PTR [_imldLnHATab+1584]
        movsd     QWORD PTR [32+rsp], xmm3
        lea       r8d, DWORD PTR [-1023+r8+rcx]
        cvtsi2sd  xmm1, r8d
        movsd     xmm3, QWORD PTR [32+rsp]
        lea       rcx, QWORD PTR [__ImageBase]
        movsd     xmm2, QWORD PTR [_imldLnHATab+1560]
        lea       r11d, DWORD PTR [r10+r10*2]
        movsd     xmm4, QWORD PTR [_imldLnHATab+1568]
        mov       r9, rcx
        mov       r8, rcx
        subsd     xmm3, QWORD PTR [_imldLnHATab+1584]
        mulsd     xmm2, xmm1
        mulsd     xmm1, xmm4
        subsd     xmm5, xmm3
        addsd     xmm2, QWORD PTR [imagerel(_imldLnHATab)+8+r8+r11*8]
        addsd     xmm1, QWORD PTR [imagerel(_imldLnHATab)+16+r9+r11*8]
        movsd     xmm4, QWORD PTR [imagerel(_imldLnHATab)+rcx+r11*8]
        mulsd     xmm3, xmm4
        mulsd     xmm4, xmm5
        subsd     xmm3, xmm0
        movaps    xmm0, xmm3
        addsd     xmm3, xmm2
        addsd     xmm0, xmm4
        addsd     xmm4, xmm1
        movsd     xmm5, QWORD PTR [_imldLnHATab+1672]
        mulsd     xmm5, xmm0
        addsd     xmm5, QWORD PTR [_imldLnHATab+1664]
        mulsd     xmm5, xmm0
        addsd     xmm5, QWORD PTR [_imldLnHATab+1656]
        mulsd     xmm5, xmm0
        addsd     xmm5, QWORD PTR [_imldLnHATab+1648]
        mulsd     xmm5, xmm0
        addsd     xmm5, QWORD PTR [_imldLnHATab+1640]
        mulsd     xmm5, xmm0
        addsd     xmm5, QWORD PTR [_imldLnHATab+1632]
        mulsd     xmm5, xmm0
        addsd     xmm5, QWORD PTR [_imldLnHATab+1624]
        mulsd     xmm5, xmm0
        mulsd     xmm5, xmm0
        addsd     xmm4, xmm5
        addsd     xmm3, xmm4
        movsd     QWORD PTR [rdx], xmm3
        add       rsp, 56
        ret

_B9_7::

        movsd     xmm0, QWORD PTR [_imldLnHATab+1672]
        mulsd     xmm0, xmm2
        addsd     xmm0, QWORD PTR [_imldLnHATab+1664]
        mulsd     xmm0, xmm2
        addsd     xmm0, QWORD PTR [_imldLnHATab+1656]
        mulsd     xmm0, xmm2
        addsd     xmm0, QWORD PTR [_imldLnHATab+1648]
        mulsd     xmm0, xmm2
        addsd     xmm0, QWORD PTR [_imldLnHATab+1640]
        mulsd     xmm0, xmm2
        addsd     xmm0, QWORD PTR [_imldLnHATab+1632]
        mulsd     xmm0, xmm2
        addsd     xmm0, QWORD PTR [_imldLnHATab+1624]
        mulsd     xmm0, xmm2
        mulsd     xmm0, xmm2
        addsd     xmm2, xmm0
        movsd     QWORD PTR [rdx], xmm2
        add       rsp, 56
        ret

_B9_8::

        ucomisd   xmm3, xmm1
        jp        _B9_9
        je        _B9_11

_B9_9::

        divsd     xmm1, xmm1
        movsd     QWORD PTR [rdx], xmm1
        mov       eax, 1

_B9_10::

        add       rsp, 56
        ret

_B9_11::

        movsd     xmm0, QWORD PTR [_imldLnHATab+1616]
        mov       eax, 2
        xorps     xmm0, XMMWORD PTR [_2il0floatpacket_84]
        divsd     xmm0, xmm1
        movsd     QWORD PTR [rdx], xmm0
        add       rsp, 56
        ret

_B9_12::

        mov       cl, BYTE PTR [47+rsp]
        and       cl, -128
        cmp       cl, -128
        je        _B9_14

_B9_13::

        mulsd     xmm3, xmm3
        movsd     QWORD PTR [rdx], xmm3
        add       rsp, 56
        ret

_B9_14::

        test      DWORD PTR [44+rsp], 1048575
        jne       _B9_13

_B9_15::

        cmp       DWORD PTR [40+rsp], 0
        jne       _B9_13

_B9_16::

        movsd     xmm0, QWORD PTR [_imldLnHATab+1608]
        mov       eax, 1
        divsd     xmm0, xmm0
        movsd     QWORD PTR [rdx], xmm0
        add       rsp, 56
        ret
        ALIGN     16

_B9_17::

__svml_dlog1p_ha_cout_rare_internal ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_dlog1p_ha_cout_rare_internal_B1_B16:
	DD	67585
	DD	25096

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B9_1
	DD	imagerel _B9_17
	DD	imagerel _unwind___svml_dlog1p_ha_cout_rare_internal_B1_B16

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_RDATA	SEGMENT     READ PAGE   'DATA'
	ALIGN  32
	PUBLIC __svml_dlog1p_ha_data_internal_avx512
__svml_dlog1p_ha_data_internal_avx512	DD	0
	DD	0
	DD	3222405120
	DD	3215919664
	DD	1848311808
	DD	3216910087
	DD	1890025472
	DD	3217424176
	DD	3348791296
	DD	3217854455
	DD	2880159744
	DD	3218171740
	DD	3256631296
	DD	3218366859
	DD	4139499520
	DD	3218553303
	DD	288669696
	DD	1070754146
	DD	1823703040
	DD	1070569756
	DD	1015742464
	DD	1070240749
	DD	1800667136
	DD	1069924160
	DD	2183659520
	DD	1069619086
	DD	1566113792
	DD	1069101918
	DD	3047030784
	DD	1068533144
	DD	2313682944
	DD	1067467101
	DD	0
	DD	0
	DD	3496399314
	DD	1028893491
	DD	720371772
	DD	1026176044
	DD	1944193543
	DD	3175338952
	DD	634920691
	DD	3175752108
	DD	1664625295
	DD	1029304828
	DD	192624563
	DD	3177103997
	DD	3796653051
	DD	3176138396
	DD	1005287031
	DD	1029411448
	DD	3433090547
	DD	1029291198
	DD	1779090477
	DD	3176336968
	DD	3242817150
	DD	1029626109
	DD	3430202884
	DD	3175842849
	DD	2270669051
	DD	1028809259
	DD	1375653371
	DD	1028457284
	DD	4246237509
	DD	3176626033
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	0
	DD	2147483648
	DD	0
	DD	2147483648
	DD	0
	DD	2147483648
	DD	0
	DD	2147483648
	DD	0
	DD	2147483648
	DD	0
	DD	2147483648
	DD	0
	DD	2147483648
	DD	0
	DD	2147483648
	DD	0
	DD	1072168960
	DD	0
	DD	1072168960
	DD	0
	DD	1072168960
	DD	0
	DD	1072168960
	DD	0
	DD	1072168960
	DD	0
	DD	1072168960
	DD	0
	DD	1072168960
	DD	0
	DD	1072168960
	DD	815627376
	DD	1069318605
	DD	815627376
	DD	1069318605
	DD	815627376
	DD	1069318605
	DD	815627376
	DD	1069318605
	DD	815627376
	DD	1069318605
	DD	815627376
	DD	1069318605
	DD	815627376
	DD	1069318605
	DD	815627376
	DD	1069318605
	DD	2123607906
	DD	3217033013
	DD	2123607906
	DD	3217033013
	DD	2123607906
	DD	3217033013
	DD	2123607906
	DD	3217033013
	DD	2123607906
	DD	3217033013
	DD	2123607906
	DD	3217033013
	DD	2123607906
	DD	3217033013
	DD	2123607906
	DD	3217033013
	DD	2632876527
	DD	1069697314
	DD	2632876527
	DD	1069697314
	DD	2632876527
	DD	1069697314
	DD	2632876527
	DD	1069697314
	DD	2632876527
	DD	1069697314
	DD	2632876527
	DD	1069697314
	DD	2632876527
	DD	1069697314
	DD	2632876527
	DD	1069697314
	DD	4213758726
	DD	3217380691
	DD	4213758726
	DD	3217380691
	DD	4213758726
	DD	3217380691
	DD	4213758726
	DD	3217380691
	DD	4213758726
	DD	3217380691
	DD	4213758726
	DD	3217380691
	DD	4213758726
	DD	3217380691
	DD	4213758726
	DD	3217380691
	DD	2580324188
	DD	1070176665
	DD	2580324188
	DD	1070176665
	DD	2580324188
	DD	1070176665
	DD	2580324188
	DD	1070176665
	DD	2580324188
	DD	1070176665
	DD	2580324188
	DD	1070176665
	DD	2580324188
	DD	1070176665
	DD	2580324188
	DD	1070176665
	DD	787901
	DD	3218079744
	DD	787901
	DD	3218079744
	DD	787901
	DD	3218079744
	DD	787901
	DD	3218079744
	DD	787901
	DD	3218079744
	DD	787901
	DD	3218079744
	DD	787901
	DD	3218079744
	DD	787901
	DD	3218079744
	DD	1431655526
	DD	1070945621
	DD	1431655526
	DD	1070945621
	DD	1431655526
	DD	1070945621
	DD	1431655526
	DD	1070945621
	DD	1431655526
	DD	1070945621
	DD	1431655526
	DD	1070945621
	DD	1431655526
	DD	1070945621
	DD	1431655526
	DD	1070945621
	DD	4294967238
	DD	3219128319
	DD	4294967238
	DD	3219128319
	DD	4294967238
	DD	3219128319
	DD	4294967238
	DD	3219128319
	DD	4294967238
	DD	3219128319
	DD	4294967238
	DD	3219128319
	DD	4294967238
	DD	3219128319
	DD	4294967238
	DD	3219128319
	DD	4277796864
	DD	1072049730
	DD	4277796864
	DD	1072049730
	DD	4277796864
	DD	1072049730
	DD	4277796864
	DD	1072049730
	DD	4277796864
	DD	1072049730
	DD	4277796864
	DD	1072049730
	DD	4277796864
	DD	1072049730
	DD	4277796864
	DD	1072049730
	DD	3164471296
	DD	1031600026
	DD	3164471296
	DD	1031600026
	DD	3164471296
	DD	1031600026
	DD	3164471296
	DD	1031600026
	DD	3164471296
	DD	1031600026
	DD	3164471296
	DD	1031600026
	DD	3164471296
	DD	1031600026
	DD	3164471296
	DD	1031600026
	DD	0
	DD	1048576
	DD	0
	DD	1048576
	DD	0
	DD	1048576
	DD	0
	DD	1048576
	DD	0
	DD	1048576
	DD	0
	DD	1048576
	DD	0
	DD	1048576
	DD	0
	DD	1048576
	DD	4294967295
	DD	2146435071
	DD	4294967295
	DD	2146435071
	DD	4294967295
	DD	2146435071
	DD	4294967295
	DD	2146435071
	DD	4294967295
	DD	2146435071
	DD	4294967295
	DD	2146435071
	DD	4294967295
	DD	2146435071
	DD	4294967295
	DD	2146435071
	DD	120
	DD	0
	DD	120
	DD	0
	DD	120
	DD	0
	DD	120
	DD	0
	DD	120
	DD	0
	DD	120
	DD	0
	DD	120
	DD	0
	DD	120
	DD	0
	PUBLIC __svml_dlog1p_ha_data_internal
__svml_dlog1p_ha_data_internal	DD	3715793664
	DD	3230016299
	DD	4013928704
	DD	3189565726
	DD	3699038248
	DD	3230016303
	DD	4255595370
	DD	3189567439
	DD	3648859040
	DD	3230016307
	DD	1732833791
	DD	3189567296
	DD	3565385952
	DD	3230016311
	DD	2485752410
	DD	3189567274
	DD	3448748152
	DD	3230016315
	DD	3514744523
	DD	3189567800
	DD	3299074072
	DD	3230016319
	DD	3686511262
	DD	3189567474
	DD	3116491376
	DD	3230016323
	DD	716063611
	DD	3189567908
	DD	2901127016
	DD	3230016327
	DD	354437295
	DD	3189567291
	DD	2653107184
	DD	3230016331
	DD	3777462366
	DD	3189567264
	DD	2372557360
	DD	3230016335
	DD	3590663412
	DD	3189567498
	DD	2059602304
	DD	3230016339
	DD	1680795031
	DD	3189567428
	DD	1714366048
	DD	3230016343
	DD	2010344982
	DD	3189567986
	DD	1336971936
	DD	3230016347
	DD	166254822
	DD	3189567184
	DD	927542568
	DD	3230016351
	DD	59552610
	DD	3189567972
	DD	486199888
	DD	3230016355
	DD	2268824919
	DD	3189567664
	DD	13065112
	DD	3230016359
	DD	3005381643
	DD	3189567835
	DD	3803226080
	DD	3230016362
	DD	4018973165
	DD	3189567825
	DD	3266868056
	DD	3230016366
	DD	3693925101
	DD	3189567457
	DD	2699077504
	DD	3230016370
	DD	4005905743
	DD	3189567697
	DD	2099972936
	DD	3230016374
	DD	3580935118
	DD	3189567215
	DD	1469672176
	DD	3230016378
	DD	2928784295
	DD	3189567129
	DD	808292392
	DD	3230016382
	DD	674298833
	DD	3189567553
	DD	115950104
	DD	3230016386
	DD	2555938320
	DD	3189567208
	DD	3687728456
	DD	3230016389
	DD	532458218
	DD	3189567130
	DD	2933808064
	DD	3230016393
	DD	3888913110
	DD	3189567192
	DD	2149270784
	DD	3230016397
	DD	2365955494
	DD	3189567756
	DD	1334230552
	DD	3230016401
	DD	3325722981
	DD	3189567206
	DD	488800640
	DD	3230016405
	DD	1496133617
	DD	3189567683
	DD	3908061016
	DD	3230016408
	DD	1824836379
	DD	3189567490
	DD	3002189112
	DD	3230016412
	DD	1222174320
	DD	3189567837
	DD	2066263648
	DD	3230016416
	DD	2472769660
	DD	3189567285
	DD	1100395408
	DD	3230016420
	DD	447932460
	DD	3189567455
	DD	104694584
	DD	3230016424
	DD	1006807684
	DD	3189567460
	DD	3374238048
	DD	3230016427
	DD	4121834935
	DD	3189567556
	DD	2319200184
	DD	3230016431
	DD	3019906587
	DD	3189567664
	DD	1234656664
	DD	3230016435
	DD	3882744783
	DD	3189567930
	DD	120715280
	DD	3230016439
	DD	1927363170
	DD	3189567242
	DD	3272450504
	DD	3230016442
	DD	8203115
	DD	3189567876
	DD	2100034368
	DD	3230016446
	DD	1260625560
	DD	3189567855
	DD	898540192
	DD	3230016450
	DD	1791679111
	DD	3189567639
	DD	3963040720
	DD	3230016453
	DD	831133439
	DD	3189567590
	DD	2703706240
	DD	3230016457
	DD	2803140504
	DD	3189567482
	DD	1415608352
	DD	3230016461
	DD	2955844462
	DD	3189568058
	DD	98850816
	DD	3230016465
	DD	4017967070
	DD	3189567455
	DD	3048504096
	DD	3230016468
	DD	3974385451
	DD	3189567871
	DD	1674736240
	DD	3230016472
	DD	2424114556
	DD	3189567887
	DD	272616624
	DD	3230016476
	DD	4261883032
	DD	3189567073
	DD	3137214056
	DD	3230016479
	DD	3716750895
	DD	3189567522
	DD	1678694944
	DD	3230016483
	DD	498025304
	DD	3189567180
	DD	192127016
	DD	3230016487
	DD	1011852160
	DD	3189567511
	DD	2972577480
	DD	3230016490
	DD	558940916
	DD	3189567850
	DD	1430211120
	DD	3230016494
	DD	2550865739
	DD	3189567935
	DD	4155061376
	DD	3230016497
	DD	1930847170
	DD	3189567371
	DD	2557291968
	DD	3230016501
	DD	1716354804
	DD	3189567130
	DD	931967984
	DD	3230016505
	DD	2729403392
	DD	3189567981
	DD	3574154016
	DD	3230016508
	DD	1067280599
	DD	3189567890
	DD	1894012232
	DD	3230016512
	DD	2094260282
	DD	3189567604
	DD	186606176
	DD	3230016516
	DD	3897933165
	DD	3189568046
	DD	2746998904
	DD	3230016519
	DD	1935720459
	DD	3189567701
	DD	985351064
	DD	3230016523
	DD	2170344821
	DD	3189567164
	DD	3491691984
	DD	3230016526
	DD	4220979537
	DD	3189567547
	DD	1676181328
	DD	3230016530
	DD	1953924393
	DD	3189567854
	DD	4128847448
	DD	3230016533
	DD	1689829067
	DD	3189567468
	DD	2259849008
	DD	3230016537
	DD	2367753130
	DD	3189567619
	DD	364246088
	DD	3230016541
	DD	2263309073
	DD	3189567722
	DD	2737098280
	DD	3230016544
	DD	2366756869
	DD	3189567856
	DD	788562816
	DD	3230016548
	DD	2294653975
	DD	3189567145
	DD	3108665616
	DD	3230016551
	DD	1786494117
	DD	3189567254
	DD	1107562960
	DD	3230016555
	DD	3655887416
	DD	3189567689
	DD	3375279848
	DD	3230016558
	DD	1178948625
	DD	3189567241
	DD	1321971608
	DD	3230016562
	DD	1620080441
	DD	3189567466
	DD	3537662304
	DD	3230016565
	DD	154455618
	DD	3189567981
	DD	1432506360
	DD	3230016569
	DD	3128192125
	DD	3189567889
	DD	3596526920
	DD	3230016572
	DD	2026842750
	DD	3189567212
	DD	1439877480
	DD	3230016576
	DD	1384431897
	DD	3189567284
	DD	3552580280
	DD	3230016579
	DD	1999983129
	DD	3189568079
	DD	1344787944
	DD	3230016583
	DD	4035436820
	DD	3189567579
	DD	3406521808
	DD	3230016586
	DD	77799817
	DD	3189567285
	DD	1147933592
	DD	3230016590
	DD	1261060207
	DD	3189567477
	DD	3159043768
	DD	3230016593
	DD	2102717775
	DD	3189567605
	DD	850003184
	DD	3230016597
	DD	161472469
	DD	3189567688
	DD	2810831440
	DD	3230016600
	DD	1937336881
	DD	3189567665
	DD	451678520
	DD	3230016604
	DD	2268353549
	DD	3189567773
	DD	2362563168
	DD	3230016607
	DD	1785871595
	DD	3189567889
	DD	4248601816
	DD	3230016610
	DD	2434669991
	DD	3189567898
	DD	1814910472
	DD	3230016614
	DD	2666999375
	DD	3189568058
	DD	3651506624
	DD	3230016617
	DD	1033139811
	DD	3189567312
	DD	1168538136
	DD	3230016621
	DD	4004618418
	DD	3189567740
	DD	2956021672
	DD	3230016624
	DD	3799928764
	DD	3189567751
	DD	424104288
	DD	3230016628
	DD	3650233137
	DD	3189567549
	DD	2162801816
	DD	3230016631
	DD	437313833
	DD	3189567438
	DD	3877227800
	DD	3230016634
	DD	2138293494
	DD	3189567140
	DD	1272495376
	DD	3230016638
	DD	2891370752
	DD	3189567168
	DD	2938619176
	DD	3230016641
	DD	1704142730
	DD	3189567114
	DD	285744240
	DD	3230016645
	DD	500817607
	DD	3189568035
	DD	1903884424
	DD	3230016648
	DD	3102571944
	DD	3189567668
	DD	3498151272
	DD	3230016651
	DD	2374193154
	DD	3189567933
	DD	773655960
	DD	3230016655
	DD	2898331636
	DD	3189568089
	DD	2320411168
	DD	3230016658
	DD	1983295500
	DD	3189567113
	DD	3843527280
	DD	3230016661
	DD	2132853542
	DD	3189567093
	DD	1048114320
	DD	3230016665
	DD	3551155364
	DD	3189567407
	DD	2524183824
	DD	3230016668
	DD	2564000663
	DD	3189567090
	DD	3976845048
	DD	3230016671
	DD	361581803
	DD	3189567196
	DD	1111206880
	DD	3230016675
	DD	696765230
	DD	3189568040
	DD	2517279744
	DD	3230016678
	DD	941542475
	DD	3189567463
	DD	3900171776
	DD	3230016681
	DD	2377895552
	DD	3189567282
	DD	964990760
	DD	3230016685
	DD	1173605489
	DD	3189567454
	DD	2301746008
	DD	3230016688
	DD	3096720313
	DD	3189567400
	DD	3615544576
	DD	3230016691
	DD	1942008121
	DD	3189567335
	DD	611493160
	DD	3230016695
	DD	3375481119
	DD	3189567537
	DD	1879599992
	DD	3230016698
	DD	4103239143
	DD	3189567624
	DD	3124971056
	DD	3230016701
	DD	3773474925
	DD	3189567869
	DD	52711992
	DD	3230016705
	DD	2465315445
	DD	3189567444
	DD	1252829960
	DD	3230016708
	DD	1041581158
	DD	3189567781
	DD	2430429904
	DD	3230016711
	DD	166620501
	DD	3189567739
	DD	3585583704
	DD	3230016714
	DD	2379237630
	DD	3189567984
	DD	423395616
	DD	3230016718
	DD	134834559
	DD	3189567178
	DD	1533871416
	DD	3230016721
	DD	1449318760
	DD	3189567373
	DD	2622114680
	DD	3230016724
	DD	3042372984
	DD	3189567127
	DD	3688195920
	DD	3230016727
	DD	1265290101
	DD	3189567921
	DD	437218048
	DD	3230016731
	DD	2248549362
	DD	3189567262
	DD	1459185496
	DD	3230016734
	DD	1293250365
	DD	3189567151
	DD	2459200496
	DD	3230016737
	DD	313786605
	DD	3189567180
	DD	3437332240
	DD	3230016740
	DD	3289151823
	DD	3189567872
	DD	98682312
	DD	3230016744
	DD	2693758821
	DD	3189567877
	DD	1033253848
	DD	3230016747
	DD	4237443192
	DD	3189567301
	DD	1946147760
	DD	3230016750
	DD	4099404586
	DD	3189567972
	DD	2837431968
	DD	3230016753
	DD	343640666
	DD	3189567552
	DD	3707174040
	DD	3230016756
	DD	4238401458
	DD	3189567983
	DD	260473960
	DD	3230016760
	DD	21423548
	DD	3189567559
	DD	1087333264
	DD	3230016763
	DD	3515278593
	DD	3189567309
	DD	1892851296
	DD	3230016766
	DD	629106375
	DD	3189567166
	DD	2677094384
	DD	3230016769
	DD	2048670044
	DD	3189567227
	DD	3440128544
	DD	3230016772
	DD	3739217292
	DD	3189568009
	DD	4182019504
	DD	3230016775
	DD	3662039444
	DD	3189567618
	DD	607865368
	DD	3230016779
	DD	1766486991
	DD	3189567112
	DD	1307665824
	DD	3230016782
	DD	512689457
	DD	3189567670
	DD	1986518392
	DD	3230016785
	DD	1704577378
	DD	3189567760
	DD	2644487576
	DD	3230016788
	DD	4001935135
	DD	3189567473
	DD	3281637576
	DD	3230016791
	DD	1184452342
	DD	3189567735
	DD	3898032312
	DD	3230016794
	DD	2714793956
	DD	3189567464
	DD	198768096
	DD	3230016798
	DD	3657654418
	DD	3189567905
	DD	773842856
	DD	3230016801
	DD	2809688013
	DD	3189567736
	DD	1328352328
	DD	3230016804
	DD	390727591
	DD	3189567393
	DD	1862359256
	DD	3230016807
	DD	1135237925
	DD	3189567248
	DD	2375926096
	DD	3230016810
	DD	1377572509
	DD	3189567837
	DD	2869115032
	DD	3230016813
	DD	3148383775
	DD	3189568032
	DD	3341987960
	DD	3230016816
	DD	3809536738
	DD	3189567313
	DD	3794606472
	DD	3230016819
	DD	4243445934
	DD	3189568034
	DD	4227031920
	DD	3230016822
	DD	1302642088
	DD	3189567451
	DD	344358048
	DD	3230016826
	DD	3239125361
	DD	3189567151
	DD	736580224
	DD	3230016829
	DD	3753161736
	DD	3189567129
	DD	1108791648
	DD	3230016832
	DD	624357483
	DD	3189568045
	DD	1461052568
	DD	3230016835
	DD	3153257064
	DD	3189567338
	DD	1793422920
	DD	3230016838
	DD	2705820149
	DD	3189567635
	DD	2105962400
	DD	3230016841
	DD	911564860
	DD	3189567737
	DD	2398730424
	DD	3230016844
	DD	1086958332
	DD	3189567948
	DD	2671786152
	DD	3230016847
	DD	1598984535
	DD	3189567210
	DD	2925188456
	DD	3230016850
	DD	4113385879
	DD	3189567401
	DD	3158995968
	DD	3230016853
	DD	2426812671
	DD	3189567396
	DD	3373267048
	DD	3230016856
	DD	3480845679
	DD	3189567359
	DD	3568059792
	DD	3230016859
	DD	3306230729
	DD	3189567924
	DD	3743432056
	DD	3230016862
	DD	3853821277
	DD	3189567317
	DD	3899441408
	DD	3230016865
	DD	2049309148
	DD	3189567699
	DD	4036145192
	DD	3230016868
	DD	2667321817
	DD	3189567166
	DD	4153600472
	DD	3230016871
	DD	3540670389
	DD	3189567114
	DD	4251864072
	DD	3230016874
	DD	404207883
	DD	3189567310
	DD	36025272
	DD	3230016878
	DD	2837617046
	DD	3189567103
	DD	96074976
	DD	3230016881
	DD	1231280453
	DD	3189567669
	DD	137101976
	DD	3230016884
	DD	792492437
	DD	3189567071
	DD	159162080
	DD	3230016887
	DD	2385525292
	DD	3189567618
	DD	162310880
	DD	3230016890
	DD	3272051015
	DD	3189567858
	DD	146603712
	DD	3230016893
	DD	623573538
	DD	3189567881
	DD	112095672
	DD	3230016896
	DD	2151835939
	DD	3189567451
	DD	58841608
	DD	3230016899
	DD	958006130
	DD	3189567217
	DD	4281863424
	DD	3230016901
	DD	549948691
	DD	3189567863
	DD	4191280920
	DD	3230016904
	DD	4177689987
	DD	3189567217
	DD	4082115512
	DD	3230016907
	DD	2895765193
	DD	3189567599
	DD	3954421112
	DD	3230016910
	DD	1055606208
	DD	3189567799
	DD	3808251392
	DD	3230016913
	DD	1966521217
	DD	3189567351
	DD	3643659776
	DD	3230016916
	DD	1017382758
	DD	3189567732
	DD	3460699480
	DD	3230016919
	DD	3485890155
	DD	3189567410
	DD	3259423472
	DD	3230016922
	DD	2657419170
	DD	3189567140
	DD	3039884488
	DD	3230016925
	DD	4198858220
	DD	3189568080
	DD	2802135064
	DD	3230016928
	DD	2343740494
	DD	3189567869
	DD	2546227480
	DD	3230016931
	DD	2423084215
	DD	3189567957
	DD	2272213808
	DD	3230016934
	DD	3887273856
	DD	3189567631
	DD	1980145888
	DD	3230016937
	DD	3992755473
	DD	3189567251
	DD	1670075336
	DD	3230016940
	DD	722498073
	DD	3189567389
	DD	1342053552
	DD	3230016943
	DD	3573506400
	DD	3189567965
	DD	996131728
	DD	3230016946
	DD	714695829
	DD	3189567392
	DD	632360808
	DD	3230016949
	DD	2816704229
	DD	3189567846
	DD	250791552
	DD	3230016952
	DD	386951333
	DD	3189567243
	DD	4146441768
	DD	3230016954
	DD	2155319939
	DD	3189567580
	DD	3729427184
	DD	3230016957
	DD	4227840137
	DD	3189567931
	DD	3294765200
	DD	3230016960
	DD	1718354212
	DD	3189567672
	DD	2842505696
	DD	3230016963
	DD	4243880582
	DD	3189567656
	DD	2372698352
	DD	3230016966
	DD	3784093842
	DD	3189567302
	DD	1885392624
	DD	3230016969
	DD	2318733051
	DD	3189567813
	DD	1380637784
	DD	3230016972
	DD	497929746
	DD	3189567210
	DD	858482864
	DD	3230016975
	DD	3218883783
	DD	3189567649
	DD	318976720
	DD	3230016978
	DD	3492652862
	DD	3189567382
	DD	4057135272
	DD	3230016980
	DD	473724673
	DD	3189568069
	DD	3483072376
	DD	3230016983
	DD	150485010
	DD	3189567757
	DD	2891803552
	DD	3230016986
	DD	3028900958
	DD	3189567173
	DD	2283376816
	DD	3230016989
	DD	321242596
	DD	3189567822
	DD	1657840008
	DD	3230016992
	DD	151305746
	DD	3189568029
	DD	1015240760
	DD	3230016995
	DD	2208026401
	DD	3189567184
	DD	355626480
	DD	3230016998
	DD	2487781842
	DD	3189567931
	DD	3974011720
	DD	3230017000
	DD	2391142094
	DD	3189567091
	DD	3280508896
	DD	3230017003
	DD	734457618
	DD	3189568092
	DD	2570132168
	DD	3230017006
	DD	3070902701
	DD	3189567794
	DD	1842928168
	DD	3230017009
	DD	1110877923
	DD	3189567896
	DD	1098943352
	DD	3230017012
	DD	3880360185
	DD	3189567898
	DD	338223984
	DD	3230017015
	DD	391995809
	DD	3189567294
	DD	3855783416
	DD	3230017017
	DD	4186345433
	DD	3189567745
	DD	3061732952
	DD	3230017020
	DD	3682852050
	DD	3189567081
	DD	2251085560
	DD	3230017023
	DD	3057037137
	DD	3189567617
	DD	1423886760
	DD	3230017026
	DD	3352664894
	DD	3189567074
	DD	580181848
	DD	3230017029
	DD	1170568982
	DD	3189567927
	DD	4014983272
	DD	3230017031
	DD	671148579
	DD	3189567293
	DD	3138401368
	DD	3230017034
	DD	267496658
	DD	3189567304
	DD	2245448192
	DD	3230017037
	DD	1285167087
	DD	3189568066
	DD	1336168336
	DD	3230017040
	DD	4259909589
	DD	3189567788
	DD	410606184
	DD	3230017043
	DD	1494078902
	DD	3189568031
	DD	3763773256
	DD	3230017045
	DD	261935754
	DD	3189567685
	DD	2805778992
	DD	3230017048
	DD	3679585605
	DD	3189567195
	DD	1831634536
	DD	3230017051
	DD	809066513
	DD	3189567664
	DD	841383576
	DD	3230017054
	DD	385945238
	DD	3189567897
	DD	4130036912
	DD	3230017056
	DD	825579909
	DD	3189567603
	DD	3107703272
	DD	3230017059
	DD	3911295427
	DD	3189567514
	DD	2069393104
	DD	3230017062
	DD	3473784588
	DD	3189567461
	DD	1015149384
	DD	3230017065
	DD	629861200
	DD	3189567515
	DD	4239982216
	DD	3230017067
	DD	2659142760
	DD	3189567083
	DD	3153999632
	DD	3230017070
	DD	1251680713
	DD	3189567080
	DD	2052211384
	DD	3230017073
	DD	3168705163
	DD	3189567992
	DD	934659776
	DD	3230017076
	DD	1674797624
	DD	3189567952
	DD	4096354216
	DD	3230017078
	DD	437847902
	DD	3189567971
	DD	2947402064
	DD	3230017081
	DD	4024401533
	DD	3189567960
	DD	1782812400
	DD	3230017084
	DD	786902458
	DD	3189567873
	DD	602626840
	DD	3230017087
	DD	2593792633
	DD	3189567812
	DD	3701854136
	DD	3230017089
	DD	3989721221
	DD	3189567126
	DD	2490600968
	DD	3230017092
	DD	2545746866
	DD	3189567591
	DD	1263875768
	DD	3230017095
	DD	3115843521
	DD	3189567377
	DD	21719488
	DD	3230017098
	DD	1730226063
	DD	3189567307
	DD	3059140216
	DD	3230017100
	DD	690350922
	DD	3189567892
	DD	1786244008
	DD	3230017103
	DD	3350998585
	DD	3189567394
	DD	498038616
	DD	3230017106
	DD	1499123379
	DD	3189568082
	DD	3489531672
	DD	3230017108
	DD	2598665922
	DD	3189567118
	DD	2170828712
	DD	3230017111
	DD	2436376826
	DD	3189567935
	DD	836937048
	DD	3230017114
	DD	1977004902
	DD	3189568052
	DD	3782863816
	DD	3230017116
	DD	4027224619
	DD	3189567373
	DD	2418714096
	DD	3230017119
	DD	2616869856
	DD	3189567271
	DD	1039494712
	DD	3230017122
	DD	3775628133
	DD	3189567616
	DD	3940212336
	DD	3230017124
	DD	419018052
	DD	3189567909
	DD	2530971600
	DD	3230017127
	DD	150919657
	DD	3189567379
	DD	1106778856
	DD	3230017130
	DD	2926254537
	DD	3189567139
	DD	3962640312
	DD	3230017132
	DD	1610863810
	DD	3189567216
	DD	2508660136
	DD	3230017135
	DD	1166015244
	DD	3189567672
	DD	1039844240
	DD	3230017138
	DD	645159638
	DD	3189567685
	DD	3851198376
	DD	3230017140
	DD	2449439581
	DD	3189567695
	DD	2352826264
	DD	3230017143
	DD	1619104640
	DD	3189567458
	DD	839733360
	DD	3230017146
	DD	2427070371
	DD	3189567165
	DD	3606924968
	DD	3230017148
	DD	2166480890
	DD	3189567544
	DD	2064504368
	DD	3230017151
	DD	2283025905
	DD	3189567907
	DD	507476584
	DD	3230017154
	DD	3923356754
	DD	3189567272
	DD	3230846472
	DD	3230017156
	DD	805331677
	DD	3189567533
	DD	1644716880
	DD	3230017159
	DD	3790469685
	DD	3189567406
	DD	44092384
	DD	3230017162
	DD	2689788214
	DD	3189567653
	DD	2723977432
	DD	3230017164
	DD	2762250221
	DD	3189567072
	DD	1094474416
	DD	3230017167
	DD	2781925193
	DD	3189567716
	DD	3745554800
	DD	3230017169
	DD	593120878
	DD	3189567817
	DD	2087320704
	DD	3230017172
	DD	403414988
	DD	3189568021
	DD	414776008
	DD	3230017175
	DD	359307328
	DD	3189567387
	DD	3022924432
	DD	3230017177
	DD	3373547966
	DD	3189567572
	DD	1321867688
	DD	3230017180
	DD	3978711340
	DD	3189567805
	DD	3901576528
	DD	3230017182
	DD	2765663238
	DD	3189568046
	DD	2172152384
	DD	3230017185
	DD	1181150766
	DD	3189568053
	DD	428598440
	DD	3230017188
	DD	2473022131
	DD	3189567471
	DD	2965917728
	DD	3230017190
	DD	1621744488
	DD	3189567971
	DD	1194211288
	DD	3230017193
	DD	2931299013
	DD	3189567190
	DD	3703449168
	DD	3230017195
	DD	873154950
	DD	3189568039
	DD	1903732144
	DD	3230017198
	DD	1510784525
	DD	3189567521
	DD	90062704
	DD	3230017201
	DD	2918231590
	DD	3189568086
	DD	2557443240
	DD	3230017203
	DD	3329944838
	DD	3189567475
	DD	715974088
	DD	3230017206
	DD	2679715410
	DD	3189568021
	DD	3155624672
	DD	3230017208
	DD	1841110143
	DD	3189567518
	DD	1286495072
	DD	3230017211
	DD	3881638924
	DD	3189567497
	DD	3698554440
	DD	3230017213
	DD	167906931
	DD	3189567169
	DD	1801902600
	DD	3230017216
	DD	1468264167
	DD	3189567597
	DD	4186508448
	DD	3230017218
	DD	2400624638
	DD	3189567691
	DD	2262471560
	DD	3230017221
	DD	3796182064
	DD	3189567357
	DD	324793264
	DD	3230017224
	DD	2801238958
	DD	3189567581
	DD	2668474776
	DD	3230017226
	DD	2273142813
	DD	3189567436
	DD	703615288
	DD	3230017229
	DD	831867571
	DD	3189567237
	DD	3020183048
	DD	3230017231
	DD	2238048829
	DD	3189567595
	DD	1028277008
	DD	3230017234
	DD	1163763070
	DD	3189567452
	DD	3317865168
	DD	3230017236
	DD	1206450788
	DD	3189567228
	DD	1299046216
	DD	3230017239
	DD	737162226
	DD	3189567879
	DD	3561787920
	DD	3230017241
	DD	2433253277
	DD	3189567901
	DD	1516188728
	DD	3230017244
	DD	3561277099
	DD	3189567506
	DD	3752216144
	DD	3230017246
	DD	1385095507
	DD	3189567674
	DD	1679968384
	DD	3230017249
	DD	829462408
	DD	3189567156
	DD	3889412704
	DD	3230017251
	DD	2939266725
	DD	3189567673
	DD	1790647080
	DD	3230017254
	DD	4214100827
	DD	3189567848
	DD	3973638544
	DD	3230017256
	DD	2537954451
	DD	3189567376
	DD	1848484816
	DD	3230017259
	DD	1128740312
	DD	3189567098
	DD	4005152680
	DD	3230017261
	DD	1932232434
	DD	3189568053
	DD	1853739648
	DD	3230017264
	DD	1359710694
	DD	3189567457
	DD	3984212256
	DD	3230017266
	DD	1268482287
	DD	3189567990
	DD	1806667776
	DD	3230017269
	DD	839689017
	DD	3189567631
	DD	3911072520
	DD	3230017271
	DD	3727165601
	DD	3189567921
	DD	1707523520
	DD	3230017274
	DD	1836550952
	DD	3189567895
	DD	3785986872
	DD	3230017276
	DD	172951407
	DD	3189567220
	DD	1556559360
	DD	3230017279
	DD	1166449891
	DD	3189567294
	DD	3609206856
	DD	3230017281
	DD	28625366
	DD	3189567222
	DD	1354025920
	DD	3230017284
	DD	4038426582
	DD	3189567978
	DD	3380982208
	DD	3230017286
	DD	2756284659
	DD	3189567362
	DD	1100172048
	DD	3230017289
	DD	848830252
	DD	3189567230
	DD	3101560856
	DD	3230017291
	DD	1868170309
	DD	3189567423
	DD	795244752
	DD	3230017294
	DD	3128260908
	DD	3189567885
	DD	2771188936
	DD	3230017296
	DD	1691261279
	DD	3189567706
	DD	439489304
	DD	3230017299
	DD	2886711298
	DD	3189567236
	DD	2390110824
	DD	3230017301
	DD	1311431101
	DD	3189567133
	DD	33149176
	DD	3230017304
	DD	3042183093
	DD	3189567401
	DD	1958569120
	DD	3230017306
	DD	3174208880
	DD	3189567462
	DD	3871433416
	DD	3230017308
	DD	302374021
	DD	3189567243
	DD	1476804712
	DD	3230017311
	DD	712531519
	DD	3189567241
	DD	3364647440
	DD	3230017313
	DD	3705318448
	DD	3189567568
	DD	945056744
	DD	3230017316
	DD	2424171915
	DD	3189568016
	DD	2807996856
	DD	3230017318
	DD	199511961
	DD	3189567094
	DD	363562688
	DD	3230017321
	DD	3766234060
	DD	3189567214
	DD	2201718256
	DD	3230017323
	DD	1956195829
	DD	3189567592
	DD	4027525584
	DD	3230017325
	DD	2891794585
	DD	3189567375
	DD	1546046576
	DD	3230017328
	DD	843173017
	DD	3189567760
	DD	3347244936
	DD	3230017330
	DD	1609532414
	DD	3189567955
	DD	841215080
	DD	3230017333
	DD	3356704285
	DD	3189567294
	DD	2617920488
	DD	3230017335
	DD	1641729240
	DD	3189567346
	DD	87455368
	DD	3230017338
	DD	1455753222
	DD	3189567878
	DD	1839783016
	DD	3230017340
	DD	1936589978
	DD	3189567944
	DD	3579964728
	DD	3230017342
	DD	1006586129
	DD	3189567993
	DD	1013061704
	DD	3230017345
	DD	2766825484
	DD	3189567880
	DD	2729036928
	DD	3230017347
	DD	1888685184
	DD	3189567954
	DD	137984104
	DD	3230017350
	DD	848046306
	DD	3189568090
	DD	1829866024
	DD	3230017352
	DD	4178224056
	DD	3189567750
	DD	3509743488
	DD	3230017354
	DD	2637072474
	DD	3189567070
	DD	882677184
	DD	3230017357
	DD	3133305384
	DD	3189567936
	DD	2538629624
	DD	3230017359
	DD	1343200028
	DD	3189567905
	DD	4182661312
	DD	3230017361
	DD	107195460
	DD	3189567427
	DD	1519832648
	DD	3230017364
	DD	602154914
	DD	3189567857
	DD	3140105848
	DD	3230017366
	DD	659160740
	DD	3189567417
	DD	453573824
	DD	3230017369
	DD	236889930
	DD	3189567396
	DD	2050198592
	DD	3230017371
	DD	1175634921
	DD	3189567087
	DD	3635040168
	DD	3230017373
	DD	1241855527
	DD	3189567941
	DD	913158504
	DD	3230017376
	DD	3947904414
	DD	3189567477
	DD	2474515312
	DD	3230017378
	DD	1206979822
	DD	3189567534
	DD	4024170344
	DD	3230017380
	DD	1847397805
	DD	3189567152
	DD	1267183240
	DD	3230017383
	DD	2916539301
	DD	3189567754
	DD	2793515456
	DD	3230017385
	DD	2568213263
	DD	3189568078
	DD	13259168
	DD	3230017388
	DD	3003245330
	DD	3189567303
	DD	1516375624
	DD	3230017390
	DD	3472633477
	DD	3189567153
	DD	3007924104
	DD	3230017392
	DD	532406289
	DD	3189567855
	DD	192963816
	DD	3230017395
	DD	4149310663
	DD	3189567165
	DD	1661455728
	DD	3230017397
	DD	946970842
	DD	3189567598
	DD	3118458864
	DD	3230017399
	DD	2040517972
	DD	3189567254
	DD	269032128
	DD	3230017402
	DD	3669971831
	DD	3189568072
	DD	1703136256
	DD	3230017404
	DD	2375197389
	DD	3189567687
	DD	3125829976
	DD	3230017406
	DD	296757744
	DD	3189567673
	DD	242171944
	DD	3230017409
	DD	611424102
	DD	3189567452
	DD	1642122608
	DD	3230017411
	DD	1700968423
	DD	3189567419
	DD	3030740440
	DD	3230017413
	DD	2947762668
	DD	3189567968
	DD	113083840
	DD	3230017416
	DD	690901756
	DD	3189567496
	DD	1479112984
	DD	3230017418
	DD	121139903
	DD	3189567571
	DD	2833886088
	DD	3230017420
	DD	173386055
	DD	3189567866
	DD	4177428584
	DD	3230017422
	DD	2964718132
	DD	3189567231
	DD	1214798496
	DD	3230017425
	DD	541562024
	DD	3189567842
	DD	2535955680
	DD	3230017427
	DD	3368765612
	DD	3189568076
	DD	3845958008
	DD	3230017429
	DD	3194541507
	DD	3189567689
	DD	849863256
	DD	3230017432
	DD	3443356552
	DD	3189567858
	DD	2137631024
	DD	3230017434
	DD	1180679397
	DD	3189567138
	DD	3414318912
	DD	3230017436
	DD	2261929999
	DD	3189567651
	DD	384984464
	DD	3230017439
	DD	954057098
	DD	3189567971
	DD	1639587024
	DD	3230017441
	DD	1346995839
	DD	3189567263
	DD	2883183944
	DD	3230017443
	DD	3253373727
	DD	3189567382
	DD	4115799808
	DD	3230017445
	DD	4143791142
	DD	3189567800
	DD	1042491824
	DD	3230017448
	DD	4240432954
	DD	3189567700
	DD	2253218992
	DD	3230017450
	DD	1891708033
	DD	3189568072
	DD	3453038360
	DD	3230017452
	DD	710292621
	DD	3189567662
	DD	347006880
	DD	3230017455
	DD	2712254611
	DD	3189567116
	DD	1525083304
	DD	3230017457
	DD	349583280
	DD	3189568004
	DD	2692324448
	DD	3230017459
	DD	1803227864
	DD	3189567740
	DD	3848754312
	DD	3230017461
	DD	3644606976
	DD	3189567826
	DD	699429536
	DD	3230017464
	DD	1067153346
	DD	3189567751
	DD	1834308568
	DD	3230017466
	DD	1335350692
	DD	3189567081
	DD	2958447872
	DD	3230017468
	DD	1803696599
	DD	3189567557
	DD	4071871152
	DD	3230017470
	DD	1232152547
	DD	3189568017
	DD	879634736
	DD	3230017473
	DD	1455437901
	DD	3189567512
	DD	1971696744
	DD	3230017475
	DD	3708110750
	DD	3189567399
	DD	3053113344
	DD	3230017477
	DD	3907324819
	DD	3189567290
	DD	4123907920
	DD	3230017479
	DD	4080000314
	DD	3189567141
	DD	889136480
	DD	3230017482
	DD	1286519001
	DD	3189567298
	DD	1938756848
	DD	3230017484
	DD	1292347423
	DD	3189567513
	DD	2977824880
	DD	3230017486
	DD	1159725249
	DD	3189568015
	DD	4006363664
	DD	3230017488
	DD	895621348
	DD	3189567502
	DD	729428896
	DD	3230017491
	DD	1212894155
	DD	3189567280
	DD	1736978096
	DD	3230017493
	DD	296117275
	DD	3189567210
	DD	2734066816
	DD	3230017495
	DD	2463481211
	DD	3189567796
	DD	3720717848
	DD	3230017497
	DD	76524950
	DD	3189567159
	DD	401986584
	DD	3230017500
	DD	1718551671
	DD	3189567216
	DD	1367830248
	DD	3230017502
	DD	3568874946
	DD	3189567584
	DD	2323304104
	DD	3230017504
	DD	2763456396
	DD	3189567666
	DD	3268430632
	DD	3230017506
	DD	1208592501
	DD	3189567715
	DD	4203232240
	DD	3230017508
	DD	4148835618
	DD	3189567851
	DD	832763976
	DD	3230017511
	DD	610418007
	DD	3189567082
	DD	1746982680
	DD	3230017513
	DD	3035714190
	DD	3189567431
	DD	2650943256
	DD	3230017515
	DD	85931336
	DD	3189567843
	DD	3544667832
	DD	3230017517
	DD	3006685957
	DD	3189567286
	DD	133211144
	DD	3230017520
	DD	878859600
	DD	3189567873
	DD	1006529776
	DD	3230017522
	DD	854333969
	DD	3189567724
	DD	1869678336
	DD	3230017524
	DD	3058646748
	DD	3189567155
	DD	2722678648
	DD	3230017526
	DD	360733640
	DD	3189567693
	DD	3565552488
	DD	3230017528
	DD	3015564990
	DD	3189568013
	DD	103354256
	DD	3230017531
	DD	2286095909
	DD	3189568081
	DD	926040176
	DD	3230017533
	DD	1899270393
	DD	3189567137
	DD	1738664488
	DD	3230017535
	DD	1377641292
	DD	3189567833
	DD	2541248696
	DD	3230017537
	DD	4266686523
	DD	3189568077
	DD	3333814224
	DD	3230017539
	DD	4018775563
	DD	3189567218
	DD	4116382408
	DD	3230017541
	DD	3373913644
	DD	3189567103
	DD	594007232
	DD	3230017544
	DD	2818265402
	DD	3189568021
	DD	1356644520
	DD	3230017546
	DD	1075601108
	DD	3189567716
	DD	2109348112
	DD	3230017548
	DD	3342127702
	DD	3189567566
	DD	2852139088
	DD	3230017550
	DD	2910355434
	DD	3189567504
	DD	3585038464
	DD	3230017552
	DD	611858749
	DD	3189567074
	DD	13099880
	DD	3230017555
	DD	1954698831
	DD	3189567516
	DD	726278816
	DD	3230017557
	DD	550712630
	DD	3189567710
	DD	1429628792
	DD	3230017559
	DD	3672474493
	DD	3189567278
	DD	2123170544
	DD	3230017561
	DD	1160875209
	DD	3189567651
	DD	2806924760
	DD	3230017563
	DD	2242524344
	DD	3189568000
	DD	3480912064
	DD	3230017565
	DD	2823138691
	DD	3189567327
	DD	4145152992
	DD	3230017567
	DD	3521079748
	DD	3189567568
	DD	504700744
	DD	3230017570
	DD	1136670137
	DD	3189567486
	DD	1149510328
	DD	3230017572
	DD	806933442
	DD	3189567823
	DD	1784634816
	DD	3230017574
	DD	1606084669
	DD	3189567242
	DD	2410094488
	DD	3230017576
	DD	2841342625
	DD	3189567480
	DD	3025909584
	DD	3230017578
	DD	984188059
	DD	3189567239
	DD	3632100264
	DD	3230017580
	DD	3011730434
	DD	3189567337
	DD	4228686632
	DD	3230017582
	DD	328432041
	DD	3189567676
	DD	520721440
	DD	3230017585
	DD	2057225622
	DD	3189567268
	DD	1098159248
	DD	3230017587
	DD	3150727306
	DD	3189567348
	DD	1666052680
	DD	3230017589
	DD	3291380622
	DD	3189567307
	DD	2224421584
	DD	3230017591
	DD	3570771984
	DD	3189567798
	DD	2773285760
	DD	3230017593
	DD	2427604440
	DD	3189567698
	DD	3312664936
	DD	3230017595
	DD	3733848165
	DD	3189567211
	DD	3842578768
	DD	3230017597
	DD	2673912350
	DD	3189567904
	DD	68079584
	DD	3230017600
	DD	960995892
	DD	3189567616
	DD	579121512
	DD	3230017602
	DD	4150493479
	DD	3189567659
	DD	1080756744
	DD	3230017604
	DD	1054941272
	DD	3189567735
	DD	1573004704
	DD	3230017606
	DD	2574365292
	DD	3189568007
	DD	2055884768
	DD	3230017608
	DD	2507498673
	DD	3189567092
	DD	2529416224
	DD	3230017610
	DD	2082176323
	DD	3189567207
	DD	2993618320
	DD	3230017612
	DD	3719982601
	DD	3189568058
	DD	3448510256
	DD	3230017614
	DD	4104247904
	DD	3189567897
	DD	3894111152
	DD	3230017616
	DD	3735557011
	DD	3189567647
	DD	35472776
	DD	3230017619
	DD	2914260983
	DD	3189567862
	DD	462548736
	DD	3230017621
	DD	1334094042
	DD	3189567734
	DD	880390688
	DD	3230017623
	DD	1291097379
	DD	3189567171
	DD	1289017512
	DD	3230017625
	DD	1627119803
	DD	3189567853
	DD	1688448064
	DD	3230017627
	DD	3886873723
	DD	3189567117
	DD	2078701104
	DD	3230017629
	DD	627887757
	DD	3189567206
	DD	2459795360
	DD	3230017631
	DD	1722013861
	DD	3189567101
	DD	2831749488
	DD	3230017633
	DD	4163262354
	DD	3189567678
	DD	3194582104
	DD	3230017635
	DD	4170237688
	DD	3189567639
	DD	3548311752
	DD	3230017637
	DD	47563772
	DD	3189567637
	DD	3892956928
	DD	3230017639
	DD	2990136007
	DD	3189567231
	DD	4228536056
	DD	3230017641
	DD	4294532248
	DD	3189567995
	DD	260100240
	DD	3230017644
	DD	2060709623
	DD	3189567397
	DD	577602376
	DD	3230017646
	DD	1488525373
	DD	3189568044
	DD	886093456
	DD	3230017648
	DD	1657840200
	DD	3189567474
	DD	1185591680
	DD	3230017650
	DD	3155771782
	DD	3189567399
	DD	1476115208
	DD	3230017652
	DD	2195162329
	DD	3189567591
	DD	1757682144
	DD	3230017654
	DD	1292806663
	DD	3189567956
	DD	2030310544
	DD	3230017656
	DD	2151451208
	DD	3189567540
	DD	2294018392
	DD	3230017658
	DD	2224122735
	DD	3189567630
	DD	2548823632
	DD	3230017660
	DD	3554417607
	DD	3189567684
	DD	2794744152
	DD	3230017662
	DD	3831650627
	DD	3189567409
	DD	3031797776
	DD	3230017664
	DD	4024246224
	DD	3189567811
	DD	3260002296
	DD	3230017666
	DD	2530219738
	DD	3189567128
	DD	3479375416
	DD	3230017668
	DD	1618145996
	DD	3189568024
	DD	3689934832
	DD	3230017670
	DD	392379700
	DD	3189567378
	DD	3891698144
	DD	3230017672
	DD	55874694
	DD	3189567574
	DD	4084682928
	DD	3230017674
	DD	4294251475
	DD	3189567312
	DD	4268906688
	DD	3230017676
	DD	1899705040
	DD	3189567783
	DD	149419600
	DD	3230017679
	DD	357699389
	DD	3189567568
	DD	316173656
	DD	3230017681
	DD	3025711727
	DD	3189567790
	DD	474218920
	DD	3230017683
	DD	2921891821
	DD	3189568046
	DD	623572704
	DD	3230017685
	DD	1716968749
	DD	3189567453
	DD	764252248
	DD	3230017687
	DD	2393171526
	DD	3189567748
	DD	896274768
	DD	3230017689
	DD	1343317993
	DD	3189567172
	DD	1019657400
	DD	3230017691
	DD	1388235839
	DD	3189567661
	DD	1134417256
	DD	3230017693
	DD	2766147125
	DD	3189567706
	DD	1240571384
	DD	3230017695
	DD	2162068842
	DD	3189567499
	DD	1338136776
	DD	3230017697
	DD	4075455588
	DD	3189567932
	DD	1427130392
	DD	3230017699
	DD	1579647664
	DD	3189567555
	DD	1507569120
	DD	3230017701
	DD	3785749868
	DD	3189567715
	DD	1579469816
	DD	3230017703
	DD	2639950365
	DD	3189567469
	DD	1642849272
	DD	3230017705
	DD	3611501026
	DD	3189567698
	DD	1697724240
	DD	3230017707
	DD	15422953
	DD	3189568066
	DD	1744111424
	DD	3230017709
	DD	2642213241
	DD	3189568062
	DD	1782027472
	DD	3230017711
	DD	143606300
	DD	3189568058
	DD	1811488992
	DD	3230017713
	DD	501328690
	DD	3189567276
	DD	1832512520
	DD	3230017715
	DD	3258054578
	DD	3189567915
	DD	1845114576
	DD	3230017717
	DD	1297851139
	DD	3189568007
	DD	1849311616
	DD	3230017719
	DD	3589200000
	DD	3189567580
	DB 0
	ORG $+46
	DB	0
	DD	0
	DD	2147483648
	DD	2846560486
	DD	3210737666
	DD	2729511872
	DD	3211784202
	DD	3956813460
	DD	3212307985
	DD	1796237193
	DD	3212828714
	DD	1562748889
	DD	3213092649
	DD	1602292343
	DD	3213352007
	DD	745814092
	DD	3213610865
	DD	2969306084
	DD	3213869224
	DD	3953060839
	DD	3214006263
	DD	1128703349
	DD	3214134948
	DD	1371067273
	DD	3214263386
	DD	131445019
	DD	3214391579
	DD	1427948820
	DD	3214519527
	DD	665817496
	DD	3214647232
	DD	1817459908
	DD	3214774694
	DD	242758400
	DD	3214901915
	DD	2082038134
	DD	3214981455
	DD	2300828032
	DD	3215044825
	DD	571795571
	DD	3215108076
	DD	3120479584
	DD	3215171207
	DD	3276640540
	DD	3215234220
	DD	2949178581
	DD	3215297115
	DD	4036279704
	DD	3215359892
	DD	4130528508
	DD	3215422552
	DD	813954767
	DD	3215485096
	DD	248046571
	DD	3215547523
	DD	4288926261
	DD	3215609833
	DD	1897492927
	DD	3215672029
	DD	3499237165
	DD	3215734109
	DD	2329611090
	DD	3215796075
	DD	203907094
	DD	3215857927
	DD	3222364838
	DD	3215919664
	DD	295408387
	DD	3215981289
	DD	899212401
	DD	3216012696
	DD	2606049022
	DD	3216043395
	DD	4003691233
	DD	3216074038
	DD	1675303236
	DD	3216104626
	DD	789189655
	DD	3216135158
	DD	2213928479
	DD	3216165634
	DD	2518405585
	DD	3216196055
	DD	2561783534
	DD	3216226421
	DD	3198568176
	DD	3216256732
	DD	983674944
	DD	3216286989
	DD	1057364031
	DD	3216317191
	DD	4260371496
	DD	3216347338
	DD	2838974660
	DD	3216377432
	DD	1919860988
	DD	3216407472
	DD	2330291020
	DD	3216437458
	DD	598130195
	DD	3216467391
	DD	1836782285
	DD	3216497270
	DD	2565351466
	DD	3216527096
	DD	3593575201
	DD	3216556869
	DD	1431920350
	DD	3216586590
	DD	1176515501
	DD	3216616258
	DD	3624279252
	DD	3216645873
	DD	977982819
	DD	3216675437
	DD	2616083454
	DD	3216704948
	DD	733015457
	DD	3216734408
	DD	403990373
	DD	3216763816
	DD	2405156675
	DD	3216793172
	DD	3213628385
	DD	3216822477
	DD	3597448029
	DD	3216851731
	DD	25680167
	DD	3216880935
	DD	1848308454
	DD	3216910087
	DD	1231492199
	DD	3216939189
	DD	3222364838
	DD	3216968240
	DD	4274224607
	DD	3216997241
	DD	836496059
	DD	3217026193
	DD	1119829323
	DD	3217043131
	DD	315251054
	DD	3217057557
	DD	518461891
	DD	3217071958
	DD	2094042713
	DD	3217086334
	DD	1109735857
	DD	3217100686
	DD	2221359788
	DD	3217115013
	DD	1492952593
	DD	3217129316
	DD	3576653728
	DD	3217143594
	DD	237880003
	DD	3217157849
	DD	420109003
	DD	3217172079
	DD	180120274
	DD	3217186285
	DD	4162843939
	DD	3217200466
	DD	4126536273
	DD	3217214624
	DD	417628115
	DD	3217228759
	DD	1970736719
	DD	3217242869
	DD	538873716
	DD	3217256956
	DD	758227830
	DD	3217271019
	DD	2968307242
	DD	3217285058
	DD	3211951040
	DD	3217299074
	DD	1825275166
	DD	3217313067
	DD	3437683677
	DD	3217327036
	DD	4086978021
	DD	3217340982
	DD	4104270002
	DD	3217354905
	DD	3819025464
	DD	3217368805
	DD	3559075183
	DD	3217382682
	DD	3650625670
	DD	3217396536
	DD	123302585
	DD	3217410368
	DD	1890030548
	DD	3217424176
	DD	682272600
	DD	3217437962
	DD	1114811729
	DD	3217451725
	DD	3505892050
	DD	3217465465
	DD	3877229085
	DD	3217479183
	DD	2543954549
	DD	3217492879
	DD	4114626469
	DD	3217506552
	DD	311370023
	DD	3217520204
	DD	34658569
	DD	3217533833
	DD	3593519732
	DD	3217547439
	DD	2705545195
	DD	3217561024
	DD	1971736889
	DD	3217574587
	DD	1696647441
	DD	3217588128
	DD	2183357019
	DD	3217601647
	DD	3733482817
	DD	3217615144
	DD	2352221150
	DD	3217628620
	DD	2633258676
	DD	3217642074
	DD	578912458
	DD	3217655507
	DD	780008323
	DD	3217668918
	DD	3530988084
	DD	3217682307
	DD	534951267
	DD	3217695676
	DD	673467853
	DD	3217709023
	DD	4236783385
	DD	3217722348
	DD	2923827788
	DD	3217735653
	DD	1317060595
	DD	3217748937
	DD	3997577740
	DD	3217762199
	DD	2660218276
	DD	3217775441
	DD	1883376699
	DD	3217788662
	DD	1949142230
	DD	3217801862
	DD	3138274530
	DD	3217815041
	DD	1435244737
	DD	3217828200
	DD	1413145637
	DD	3217841338
	DD	3348797986
	DD	3217854455
	DD	3222758658
	DD	3217867552
	DD	1309263324
	DD	3217880629
	DD	2176234471
	DD	3217893685
	DD	1800387473
	DD	3217906721
	DD	452140382
	DD	3217919737
	DD	2695621757
	DD	3217932732
	DD	208809263
	DD	3217945708
	DD	1848308454
	DD	3217958663
	DD	3584589359
	DD	3217971598
	DD	1386895968
	DD	3217984514
	DD	4108155659
	DD	3217997409
	DD	3420215606
	DD	3218010285
	DD	3878621277
	DD	3218023141
	DD	1447787319
	DD	3218035978
	DD	680874053
	DD	3218048795
	DD	1834892843
	DD	3218061592
	DD	870713292
	DD	3218074370
	DD	1168986141
	DD	3218083436
	DD	3245089583
	DD	3218089805
	DD	2494877761
	DD	3218096165
	DD	3338922950
	DD	3218102515
	DD	1607293197
	DD	3218108856
	DD	1719424943
	DD	3218115187
	DD	3799224547
	DD	3218121508
	DD	3675071677
	DD	3218127820
	DD	1469757259
	DD	3218134123
	DD	1600486820
	DD	3218140416
	DD	4188949205
	DD	3218146699
	DD	766352567
	DD	3218152974
	DD	43231408
	DD	3218159239
	DD	2139646042
	DD	3218165494
	DD	2880153102
	DD	3218171740
	DD	2383743325
	DD	3218177977
	DD	768877423
	DD	3218184205
	DD	2448456521
	DD	3218190423
	DD	3244923387
	DD	3218196632
	DD	3275167422
	DD	3218202832
	DD	2655560435
	DD	3218209023
	DD	1501959692
	DD	3218215205
	DD	4224678246
	DD	3218221377
	DD	2348618756
	DD	3218227541
	DD	283080250
	DD	3218233696
	DD	2436859197
	DD	3218239841
	DD	333350563
	DD	3218245978
	DD	2675321801
	DD	3218252105
	DD	985177381
	DD	3218258224
	DD	3964700035
	DD	3218264333
	DD	3135315249
	DD	3218270434
	DD	2902865164
	DD	3218276526
	DD	3377742213
	DD	3218282609
	DD	374891912
	DD	3218288684
	DD	2593684821
	DD	3218294749
	DD	1553148222
	DD	3218300806
	DD	1656739931
	DD	3218306854
	DD	3012481825
	DD	3218312893
	DD	1432962538
	DD	3218318924
	DD	1320242026
	DD	3218324946
	DD	2780952336
	DD	3218330959
	DD	1626300240
	DD	3218336964
	DD	2256971748
	DD	3218342960
	DD	483265518
	DD	3218348948
	DD	704964628
	DD	3218354927
	DD	3026437244
	DD	3218360897
	DD	3256639170
	DD	3218366859
	DD	1499050969
	DD	3218372813
	DD	2151680465
	DD	3218378758
	DD	1022163351
	DD	3218384695
	DD	2507634849
	DD	3218390623
	DD	2414862975
	DD	3218396543
	DD	845152874
	DD	3218402455
	DD	2194349235
	DD	3218408358
	DD	2267936813
	DD	3218414253
	DD	1165944702
	DD	3218420140
	DD	3282948707
	DD	3218426018
	DD	128204514
	DD	3218431889
	DD	390421100
	DD	3218437751
	DD	4167959282
	DD	3218443604
	DD	2968834018
	DD	3218449450
	DD	1185553177
	DD	3218455288
	DD	3210217930
	DD	3218461117
	DD	549623114
	DD	3218466939
	DD	1890030548
	DD	3218472752
	DD	3032400188
	DD	3218478557
	DD	4072261525
	DD	3218484354
	DD	3450874911
	DD	1070995813
	DD	2331021804
	DD	1070990032
	DD	1029453230
	DD	1070984259
	DD	3747176240
	DD	1070978493
	DD	1800682930
	DD	1070972736
	DD	3686719393
	DD	1070966986
	DD	722545241
	DD	1070961245
	DD	1405669883
	DD	1070955511
	DD	1349079372
	DD	1070949785
	DD	461103529
	DD	1070944067
	DD	2945413886
	DD	1070938356
	DD	121152472
	DD	1070932654
	DD	487700860
	DD	1070926959
	DD	3954874384
	DD	1070921271
	DD	1842920138
	DD	1070915592
	DD	2652318780
	DD	1070909920
	DD	1999011482
	DD	1070904256
	DD	4089234463
	DD	1070898599
	DD	244680560
	DD	1070892951
	DD	3262235675
	DD	1070887309
	DD	169336595
	DD	1070881676
	DD	3763576649
	DD	1070876049
	DD	1073096258
	DD	1070870431
	DD	601221319
	DD	1070864820
	DD	2261690268
	DD	1070859216
	DD	1673619518
	DD	1070853620
	DD	3046403514
	DD	1070848031
	DD	1999843716
	DD	1070842450
	DD	2744015967
	DD	1070836876
	DD	899399508
	DD	1070831310
	DD	676744370
	DD	1070825751
	DD	1992167703
	DD	1070820199
	DD	467152011
	DD	1070814655
	DD	313445281
	DD	1070809118
	DD	1448157352
	DD	1070803588
	DD	3788725476
	DD	1070798065
	DD	2957945300
	DD	1070792550
	DD	3168871046
	DD	1070787042
	DD	44944622
	DD	1070781542
	DD	2094830420
	DD	1070776048
	DD	647642559
	DD	1070770562
	DD	4212681596
	DD	1070765082
	DD	4119694493
	DD	1070759610
	DD	288676754
	DD	1070754146
	DD	1229870791
	DD	1070748688
	DD	2568927817
	DD	1070743237
	DD	4226775419
	DD	1070737793
	DD	1829681364
	DD	1070732357
	DD	3889121191
	DD	1070726927
	DD	1737005556
	DD	1070721505
	DD	3885417029
	DD	1070716089
	DD	1666870165
	DD	1070710681
	DD	3594048319
	DD	1070705279
	DD	1000063738
	DD	1070699885
	DD	2398194399
	DD	1070694497
	DD	3417111411
	DD	1070689116
	DD	3980746691
	DD	1070683742
	DD	4013324163
	DD	1070678375
	DD	3439358267
	DD	1070673015
	DD	2183652476
	DD	1070667662
	DD	171297820
	DD	1070662316
	DD	1622638721
	DD	1070656976
	DD	2168369647
	DD	1070651643
	DD	1734435555
	DD	1070646317
	DD	247063161
	DD	1070640998
	DD	1927726804
	DD	1070635685
	DD	2408245143
	DD	1070630379
	DD	1615681634
	DD	1070625080
	DD	3772343130
	DD	1070619787
	DD	215909304
	DD	1070614502
	DD	3759169634
	DD	1070609222
	DD	1445381777
	DD	1070603950
	DD	1792910451
	DD	1070598684
	DD	870975437
	DD	1070590754
	DD	3194096222
	DD	1070580248
	DD	1823716217
	DD	1070569756
	DD	913800688
	DD	1070559277
	DD	323875369
	DD	1070548811
	DD	4208958430
	DD	1070538357
	DD	3839688678
	DD	1070527917
	DD	3372126730
	DD	1070517490
	DD	2667883253
	DD	1070507076
	DD	1589083690
	DD	1070496675
	DD	4293333010
	DD	1070486286
	DD	2053843986
	DD	1070475911
	DD	3324205749
	DD	1070465548
	DD	3673610217
	DD	1070455198
	DD	2966718784
	DD	1070444861
	DD	1068692560
	DD	1070434537
	DD	2140157205
	DD	1070424225
	DD	1752298597
	DD	1070413926
	DD	4066729595
	DD	1070403639
	DD	360651144
	DD	1070393366
	DD	3386588242
	DD	1070383104
	DD	127747308
	DD	1070372856
	DD	3337621361
	DD	1070362619
	DD	380113
	DD	1070352396
	DD	2870475188
	DD	1070342184
	DD	3227997535
	DD	1070331985
	DD	943446189
	DD	1070321799
	DD	182758681
	DD	1070311625
	DD	817374162
	DD	1070301463
	DD	2719198427
	DD	1070291313
	DD	1465634365
	DD	1070281176
	DD	1224481606
	DD	1070271051
	DD	1869032404
	DD	1070260938
	DD	3273036717
	DD	1070250837
	DD	1015732707
	DD	1070240749
	DD	3561713742
	DD	1070230672
	DD	2196155141
	DD	1070220608
	DD	1089583089
	DD	1070210556
	DD	118003300
	DD	1070200516
	DD	3452833475
	DD	1070190487
	DD	2381031992
	DD	1070180471
	DD	1074899573
	DD	1070170467
	DD	3707175295
	DD	1070160474
	DD	1566132617
	DD	1070150494
	DD	3120348377
	DD	1070140525
	DD	3953929663
	DD	1070130568
	DD	3946380940
	DD	1070120623
	DD	2977634725
	DD	1070110690
	DD	928049556
	DD	1070100769
	DD	1973375279
	DD	1070090859
	DD	1699849154
	DD	1070080961
	DD	4284063055
	DD	1070071074
	DD	1018125008
	DD	1070061200
	DD	374428300
	DD	1070051337
	DD	2235845747
	DD	1070041485
	DD	2190695046
	DD	1070031645
	DD	122671437
	DD	1070021817
	DD	210845780
	DD	1070012000
	DD	2339728060
	DD	1070002194
	DD	2099265479
	DD	1069992400
	DD	3669742467
	DD	1069982617
	DD	2641909617
	DD	1069972846
	DD	3196851002
	DD	1069963086
	DD	926113142
	DD	1069953338
	DD	11572342
	DD	1069943601
	DD	340530969
	DD	1069933875
	DD	1800682930
	DD	1069924160
	DD	4280111857
	DD	1069914456
	DD	3372322013
	DD	1069904764
	DD	3261138386
	DD	1069895083
	DD	3835803021
	DD	1069885413
	DD	690973253
	DD	1069875755
	DD	2306589128
	DD	1069866107
	DD	4278067876
	DD	1069856470
	DD	2201204065
	DD	1069846845
	DD	262102455
	DD	1069837231
	DD	2647241692
	DD	1069827627
	DD	658570708
	DD	1069818035
	DD	2778278092
	DD	1069808453
	DD	309052031
	DD	1069798883
	DD	1733817001
	DD	1069789323
	DD	2650961017
	DD	1069779774
	DD	2954203158
	DD	1069770236
	DD	2537624622
	DD	1069760709
	DD	1295667077
	DD	1069751193
	DD	3418098326
	DD	1069741687
	DD	210141498
	DD	1069732193
	DD	157244505
	DD	1069722709
	DD	3155274661
	DD	1069713235
	DD	510517079
	DD	1069703773
	DD	709476866
	DD	1069694321
	DD	3649073763
	DD	1069684879
	DD	636640577
	DD	1069675449
	DD	159725394
	DD	1069666029
	DD	2116286250
	DD	1069656619
	DD	2109656884
	DD	1069647220
	DD	38479793
	DD	1069637832
	DD	96704707
	DD	1069628454
	DD	2183652476
	DD	1069619086
	DD	1904013563
	DD	1069609729
	DD	3452748429
	DD	1069600382
	DD	2435216853
	DD	1069591046
	DD	3047045639
	DD	1069581720
	DD	894257944
	DD	1069572405
	DD	173141005
	DD	1069563100
	DD	785342784
	DD	1069553805
	DD	970708326
	DD	1069541521
	DD	2645916898
	DD	1069522972
	DD	2106590683
	DD	1069504444
	DD	3453588195
	DD	1069485936
	DD	2198475040
	DD	1069467449
	DD	2443390270
	DD	1069448982
	DD	3996141691
	DD	1069430535
	DD	2370203065
	DD	1069412109
	DD	1669613218
	DD	1069393703
	DD	1704071394
	DD	1069375317
	DD	2283901796
	DD	1069356951
	DD	3220050856
	DD	1069338605
	DD	29117219
	DD	1069320280
	DD	1113218225
	DD	1069301974
	DD	1990183441
	DD	1069283688
	DD	2473421172
	DD	1069265422
	DD	2376948508
	DD	1069247176
	DD	1515388672
	DD	1069228950
	DD	3998935692
	DD	1069210743
	DD	1053482595
	DD	1069192557
	DD	1085389880
	DD	1069174390
	DD	3911679148
	DD	1069156242
	DD	760030536
	DD	1069138115
	DD	38583924
	DD	1069120007
	DD	1566132617
	DD	1069101918
	DD	867088104
	DD	1069083849
	DD	2056379433
	DD	1069065799
	DD	659581512
	DD	1069047769
	DD	792781808
	DD	1069029758
	DD	2277675977
	DD	1069011766
	DD	641565395
	DD	1068993794
	DD	2256601
	DD	1068975841
	DD	183156961
	DD	1068957907
	DD	1008239542
	DD	1068939992
	DD	2302040698
	DD	1068922096
	DD	3889657667
	DD	1068904219
	DD	1301778891
	DD	1068886362
	DD	2954550821
	DD	1068868523
	DD	84804484
	DD	1068850704
	DD	1109791498
	DD	1068832903
	DD	1562410668
	DD	1068815121
	DD	1271074840
	DD	1068797358
	DD	64741293
	DD	1068779614
	DD	2067876735
	DD	1068761888
	DD	2815553124
	DD	1068744181
	DD	2138347284
	DD	1068726493
	DD	4162338635
	DD	1068708823
	DD	129237761
	DD	1068691173
	DD	2756122533
	DD	1068673540
	DD	3285762921
	DD	1068655926
	DD	1551389854
	DD	1068638331
	DD	1681725707
	DD	1068620754
	DD	3511047527
	DD	1068603195
	DD	2579184841
	DD	1068585655
	DD	3016419377
	DD	1068568133
	DD	363613719
	DD	1068550630
	DD	3047045639
	DD	1068533144
	DD	2313634884
	DD	1068515677
	DD	296456961
	DD	1068497513
	DD	1367328035
	DD	1068462651
	DD	3221665916
	DD	1068427825
	DD	1242258971
	DD	1068393036
	DD	3697798734
	DD	1068358282
	DD	1678104687
	DD	1068323565
	DD	3453858508
	DD	1068288883
	DD	116861598
	DD	1068254238
	DD	4234736672
	DD	1068219627
	DD	2606283437
	DD	1068185053
	DD	3506114812
	DD	1068150514
	DD	2324914545
	DD	1068116011
	DD	3044269692
	DD	1068081543
	DD	1056797460
	DD	1068047111
	DD	346010435
	DD	1068012714
	DD	601410756
	DD	1067978352
	DD	1513453498
	DD	1067944025
	DD	2773542775
	DD	1067909733
	DD	4074027864
	DD	1067875476
	DD	813232056
	DD	1067841255
	DD	1275317999
	DD	1067807068
	DD	860480111
	DD	1067772916
	DD	3559777258
	DD	1067738798
	DD	480292498
	DD	1067704716
	DD	4204867691
	DD	1067670667
	DD	1547459502
	DD	1067636654
	DD	797775935
	DD	1067602675
	DD	1656501562
	DD	1067568730
	DD	3825228429
	DD	1067534819
	DD	2711485098
	DD	1067500943
	DD	2313634884
	DD	1067467101
	DD	376973398
	DD	1067416219
	DD	672386641
	DD	1067348671
	DD	630691842
	DD	1067281191
	DD	3960777458
	DD	1067213778
	DD	1488394470
	DD	1067146434
	DD	1220920383
	DD	1067079157
	DD	2577548405
	DD	1067011947
	DD	684247743
	DD	1066944805
	DD	3553625811
	DD	1066877729
	DD	2020150230
	DD	1066810721
	DD	4099880293
	DD	1066743779
	DD	630721729
	DD	1066676905
	DD	3927125538
	DD	1066610096
	DD	535440936
	DD	1066543355
	DD	2773516144
	DD	1066476679
	DD	1486051399
	DD	1066410070
	DD	808661260
	DD	1066285262
	DD	2227658502
	DD	1066152307
	DD	1813447778
	DD	1066019484
	DD	2743640746
	DD	1065886792
	DD	3904192454
	DD	1065754231
	DD	4184355568
	DD	1065621801
	DD	2476667369
	DD	1065489502
	DD	1971904113
	DD	1065357333
	DD	3138267131
	DD	1065097372
	DD	341338964
	DD	1064833554
	DD	1954052322
	DD	1064569994
	DD	1498975029
	DD	1064306693
	DD	2190050752
	DD	1063782660
	DD	1440057502
	DD	1063257089
	DD	1432705161
	DD	1062208000
	DD	0
	DD	0
	DB 0
	ORG $+54
	DB	0
	DD	2900053258
	DD	1070176668
	DD	2900053258
	DD	1070176668
	DD	2900053258
	DD	1070176668
	DD	2900053258
	DD	1070176668
	DD	2900053258
	DD	1070176668
	DD	2900053258
	DD	1070176668
	DD	2900053258
	DD	1070176668
	DD	2900053258
	DD	1070176668
	DD	1208323809
	DD	3218079745
	DD	1208323809
	DD	3218079745
	DD	1208323809
	DD	3218079745
	DD	1208323809
	DD	3218079745
	DD	1208323809
	DD	3218079745
	DD	1208323809
	DD	3218079745
	DD	1208323809
	DD	3218079745
	DD	1208323809
	DD	3218079745
	DD	1431651269
	DD	1070945621
	DD	1431651269
	DD	1070945621
	DD	1431651269
	DD	1070945621
	DD	1431651269
	DD	1070945621
	DD	1431651269
	DD	1070945621
	DD	1431651269
	DD	1070945621
	DD	1431651269
	DD	1070945621
	DD	1431651269
	DD	1070945621
	DD	4294965279
	DD	3219128319
	DD	4294965279
	DD	3219128319
	DD	4294965279
	DD	3219128319
	DD	4294965279
	DD	3219128319
	DD	4294965279
	DD	3219128319
	DD	4294965279
	DD	3219128319
	DD	4294965279
	DD	3219128319
	DD	4294965279
	DD	3219128319
	DD	4294967295
	DD	1048575
	DD	4294967295
	DD	1048575
	DD	4294967295
	DD	1048575
	DD	4294967295
	DD	1048575
	DD	4294967295
	DD	1048575
	DD	4294967295
	DD	1048575
	DD	4294967295
	DD	1048575
	DD	4294967295
	DD	1048575
	DD	0
	DD	1062207488
	DD	0
	DD	1062207488
	DD	0
	DD	1062207488
	DD	0
	DD	1062207488
	DD	0
	DD	1062207488
	DD	0
	DD	1062207488
	DD	0
	DD	1062207488
	DD	0
	DD	1062207488
	DD	4294967295
	DD	3220176895
	DD	4294967295
	DD	3220176895
	DD	4294967295
	DD	3220176895
	DD	4294967295
	DD	3220176895
	DD	4294967295
	DD	3220176895
	DD	4294967295
	DD	3220176895
	DD	4294967295
	DD	3220176895
	DD	4294967295
	DD	3220176895
	DD	4294963200
	DD	2134900735
	DD	4294963200
	DD	2134900735
	DD	4294963200
	DD	2134900735
	DD	4294963200
	DD	2134900735
	DD	4294963200
	DD	2134900735
	DD	4294963200
	DD	2134900735
	DD	4294963200
	DD	2134900735
	DD	4294963200
	DD	2134900735
	DD	4227858432
	DD	4294967295
	DD	4227858432
	DD	4294967295
	DD	4227858432
	DD	4294967295
	DD	4227858432
	DD	4294967295
	DD	4227858432
	DD	4294967295
	DD	4227858432
	DD	4294967295
	DD	4227858432
	DD	4294967295
	DD	4227858432
	DD	4294967295
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	0
	DD	1072693248
	DD	4294967295
	DD	2147483647
	DD	4294967295
	DD	2147483647
	DD	4294967295
	DD	2147483647
	DD	4294967295
	DD	2147483647
	DD	4294967295
	DD	2147483647
	DD	4294967295
	DD	2147483647
	DD	4294967295
	DD	2147483647
	DD	4294967295
	DD	2147483647
	DD	0
	DD	1040187392
	DD	0
	DD	1040187392
	DD	0
	DD	1040187392
	DD	0
	DD	1040187392
	DD	0
	DD	1040187392
	DD	0
	DD	1040187392
	DD	0
	DD	1040187392
	DD	0
	DD	1040187392
	DD	4294966272
	DD	4294967295
	DD	4294966272
	DD	4294967295
	DD	4294966272
	DD	4294967295
	DD	4294966272
	DD	4294967295
	DD	4294966272
	DD	4294967295
	DD	4294966272
	DD	4294967295
	DD	4294966272
	DD	4294967295
	DD	4294966272
	DD	4294967295
	DD	4277796864
	DD	1072049730
	DD	4277796864
	DD	1072049730
	DD	4277796864
	DD	1072049730
	DD	4277796864
	DD	1072049730
	DD	4277796864
	DD	1072049730
	DD	4277796864
	DD	1072049730
	DD	4277796864
	DD	1072049730
	DD	4277796864
	DD	1072049730
	DD	3164471296
	DD	1031600026
	DD	3164471296
	DD	1031600026
	DD	3164471296
	DD	1031600026
	DD	3164471296
	DD	1031600026
	DD	3164471296
	DD	1031600026
	DD	3164471296
	DD	1031600026
	DD	3164471296
	DD	1031600026
	DD	3164471296
	DD	1031600026
	DD	0
	DD	1082564608
	DD	0
	DD	1082564608
	DD	0
	DD	1082564608
	DD	0
	DD	1082564608
	DD	0
	DD	1082564608
	DD	0
	DD	1082564608
	DD	0
	DD	1082564608
	DD	0
	DD	1082564608
	DD	0
	DD	1083176960
	DD	0
	DD	1083176960
	DD	0
	DD	1083176960
	DD	0
	DD	1083176960
	DD	0
	DD	1083176960
	DD	0
	DD	1083176960
	DD	0
	DD	1083176960
	DD	0
	DD	1083176960
	DD	0
	DD	1083174912
	DD	0
	DD	1083174912
	DD	0
	DD	1083174912
	DD	0
	DD	1083174912
	DD	0
	DD	1083174912
	DD	0
	DD	1083174912
	DD	0
	DD	1083174912
	DD	0
	DD	1083174912
	DD	0
	DD	2146435072
	DD	0
	DD	2146435072
	DD	0
	DD	2146435072
	DD	0
	DD	2146435072
	DD	0
	DD	2146435072
	DD	0
	DD	2146435072
	DD	0
	DD	2146435072
	DD	0
	DD	2146435072
	DD	0
	DD	2134900736
	DD	0
	DD	2134900736
	DD	0
	DD	2134900736
	DD	0
	DD	2134900736
	DD	0
	DD	2134900736
	DD	0
	DD	2134900736
	DD	0
	DD	2134900736
	DD	0
	DD	2134900736
	DD	4277811695
	DD	1072049730
	DD	4277811695
	DD	1072049730
	DD	4277811695
	DD	1072049730
	DD	4277811695
	DD	1072049730
	DD	4277811695
	DD	1072049730
	DD	4277811695
	DD	1072049730
	DD	4277811695
	DD	1072049730
	DD	4277811695
	DD	1072049730
	DD	0
	DD	2146435072
	DD	0
	DD	4293918720
	DB 0
	ORG $+46
	DB	0
	DD	0
	DD	1072693248
	DD	0
	DD	3220176896
	DB 0
	ORG $+46
	DB	0
	DD	0
	DD	0
	DD	0
	DD	2147483648
	DB 0
	ORG $+46
	DB	0
_imldLnHATab	DD	0
	DD	1072693248
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	1072660480
	DD	1486880768
	DD	1066410070
	DD	1813744607
	DD	3179892593
	DD	0
	DD	1072629760
	DD	377487360
	DD	1067416219
	DD	919019713
	DD	3179241129
	DD	0
	DD	1072599040
	DD	1513619456
	DD	1067944025
	DD	874573033
	DD	3178512940
	DD	0
	DD	1072570368
	DD	3221749760
	DD	1068427825
	DD	4181665006
	DD	3177478212
	DD	0
	DD	1072541696
	DD	4162322432
	DD	1068708823
	DD	627020255
	DD	1028629941
	DD	0
	DD	1072513024
	DD	183107584
	DD	1068957907
	DD	2376703469
	DD	1030233118
	DD	0
	DD	1072486400
	DD	1053425664
	DD	1069192557
	DD	696277142
	DD	1030474863
	DD	0
	DD	1072459776
	DD	3996123136
	DD	1069430535
	DD	2630798680
	DD	1028792016
	DD	0
	DD	1072435200
	DD	3452764160
	DD	1069600382
	DD	624954044
	DD	3177101741
	DD	0
	DD	1072409600
	DD	207650816
	DD	1069717971
	DD	3272735636
	DD	3175176575
	DD	0
	DD	1072386048
	DD	2647228416
	DD	1069827627
	DD	3594228712
	DD	1029303785
	DD	0
	DD	1072362496
	DD	2712010752
	DD	1069938736
	DD	3653242769
	DD	3176839013
	DD	0
	DD	1072338944
	DD	374439936
	DD	1070051337
	DD	4072775574
	DD	3176577495
	DD	0
	DD	1072316416
	DD	3707174912
	DD	1070160474
	DD	1486946159
	DD	1023930920
	DD	0
	DD	1072294912
	DD	1443954688
	DD	1070265993
	DD	293532967
	DD	3176278277
	DD	0
	DD	1072273408
	DD	127762432
	DD	1070372856
	DD	3404145447
	DD	3177023955
	DD	0
	DD	1072252928
	DD	2053832704
	DD	1070475911
	DD	1575076358
	DD	1029048544
	DD	0
	DD	1072232448
	DD	3194093568
	DD	1070580248
	DD	1864169120
	DD	1026866084
	DD	0
	DD	1072212992
	DD	3917201408
	DD	1070638340
	DD	2362145246
	DD	3175606197
	DD	0
	DD	1072193536
	DD	3417112576
	DD	1070689116
	DD	70087871
	DD	3174183577
	DD	0
	DD	1072175104
	DD	4226777088
	DD	1070737793
	DD	1620410586
	DD	3174700065
	DD	0
	DD	1072156672
	DD	3168870400
	DD	1070787042
	DD	311238082
	DD	1025781772
	DD	0
	DD	1072139264
	DD	2150580224
	DD	1070834092
	DD	1664262457
	DD	3175299224
	DD	0
	DD	1072120832
	DD	4095672320
	DD	1070884491
	DD	1657121015
	DD	3174674199
	DD	0
	DD	1072104448
	DD	2595577856
	DD	1070929805
	DD	2014006823
	DD	3175423830
	DD	0
	DD	1072087040
	DD	3747176448
	DD	1070978493
	DD	144991708
	DD	3171552042
	DD	0
	DD	1072070656
	DD	1050435584
	DD	1071024840
	DD	3386227432
	DD	1027876916
	DD	0
	DD	1072055296
	DD	255516672
	DD	1071068760
	DD	2637594316
	DD	1028049573
	DD	0
	DD	1072038912
	DD	1640783872
	DD	1071116120
	DD	893247007
	DD	1028452162
	DD	0
	DD	1072023552
	DD	2940411904
	DD	1071161011
	DD	813240633
	DD	1027664048
	DD	0
	DD	1072009216
	DD	882917376
	DD	1071203348
	DD	2376597551
	DD	3175828767
	DD	0
	DD	1071993856
	DD	213966848
	DD	1071249188
	DD	2977204125
	DD	1028350609
	DD	0
	DD	1071979520
	DD	2921504768
	DD	1071292428
	DD	523218347
	DD	1028007004
	DD	0
	DD	1071965184
	DD	3186655232
	DD	1071336119
	DD	2352907891
	DD	1026967097
	DD	0
	DD	1071951872
	DD	2653364224
	DD	1071377101
	DD	2453418583
	DD	3174349512
	DD	0
	DD	1071938560
	DD	3759783936
	DD	1071418487
	DD	3685870403
	DD	3175415611
	DD	0
	DD	1071925248
	DD	2468364288
	DD	1071460286
	DD	1578908842
	DD	3175510517
	DD	0
	DD	1071911936
	DD	81903616
	DD	1071502506
	DD	770710269
	DD	1026742353
	DD	0
	DD	1071899648
	DD	2799321088
	DD	1071541858
	DD	3822266185
	DD	1028434427
	DD	0
	DD	1071886336
	DD	2142265344
	DD	1071584911
	DD	175901806
	DD	3173871540
	DD	0
	DD	1071874048
	DD	2944024576
	DD	1071625048
	DD	2747360403
	DD	1027672159
	DD	0
	DD	1071862784
	DD	3434301440
	DD	1071653426
	DD	4194662196
	DD	3173893003
	DD	0
	DD	1071850496
	DD	1547755520
	DD	1071673870
	DD	4248764681
	DD	3172759087
	DD	0
	DD	1071839232
	DD	4246986752
	DD	1071692786
	DD	2840205638
	DD	3174430911
	DD	0
	DD	1071826944
	DD	3418390528
	DD	1071713619
	DD	3041880823
	DD	1025440860
	DD	0
	DD	1071816704
	DD	4143093760
	DD	1071731139
	DD	2727587401
	DD	3173965207
	DD	0
	DD	1071805440
	DD	3121326080
	DD	1071750582
	DD	3173887692
	DD	3174190163
	DD	0
	DD	1071794176
	DD	1852893184
	DD	1071770207
	DD	3951060252
	DD	1027348295
	DD	0
	DD	1071783936
	DD	3636379648
	DD	1071788208
	DD	1684924001
	DD	3174777086
	DD	0
	DD	1071773696
	DD	516505600
	DD	1071806366
	DD	429181199
	DD	3173211033
	DD	0
	DD	1071763456
	DD	4186185728
	DD	1071824681
	DD	2044904577
	DD	3174967132
	DD	0
	DD	1071753216
	DD	877596672
	DD	1071843159
	DD	1396318105
	DD	3173959727
	DD	0
	DD	1071742976
	DD	2912784384
	DD	1071861800
	DD	448136789
	DD	3174814192
	DD	0
	DD	1071733760
	DD	3722825728
	DD	1071878720
	DD	714165913
	DD	3173439560
	DD	0
	DD	1071723520
	DD	2522374144
	DD	1071897682
	DD	3227240353
	DD	3173394323
	DD	0
	DD	1071714304
	DD	4165410816
	DD	1071914895
	DD	1365684961
	DD	3174365060
	DD	0
	DD	1071705088
	DD	3477135360
	DD	1071932251
	DD	368482985
	DD	3174140821
	DD	0
	DD	1071695872
	DD	2079455232
	DD	1071949752
	DD	1320576317
	DD	1026822714
	DD	0
	DD	1071687680
	DD	851795968
	DD	1071965432
	DD	3702467026
	DD	1025224125
	DD	0
	DD	1071678464
	DD	647743488
	DD	1071983213
	DD	772992109
	DD	3174038459
	DD	0
	DD	1071670272
	DD	26537984
	DD	1071999146
	DD	2360214276
	DD	3174861275
	DD	0
	DD	1071661056
	DD	1547061248
	DD	1072017216
	DD	2886781435
	DD	1026423395
	DD	0
	DD	1071652864
	DD	2854492160
	DD	1072033410
	DD	215631550
	DD	1025638968
	DD	0
	DD	1071644672
	DD	4277811200
	DD	1072049730
	DD	2479318832
	DD	1026487127
	DD	4277811200
	DD	1072049730
	DD	2479318832
	DD	1026487127
	DD	64
	DD	1120927744
	DD	0
	DD	1094713344
	DD	0
	DD	1065615360
	DD	0
	DD	1135607808
	DD	0
	DD	0
	DD	0
	DD	1072693248
	DD	0
	DD	3219128320
	DD	1431655955
	DD	1070945621
	DD	610
	DD	3218079744
	DD	2545118337
	DD	1070176665
	DD	1378399119
	DD	3217380693
	DD	612435357
	DD	1069697472
	DD	94536557
	DD	3217031348
_2il0floatpacket_18	DD	000000000H,043380000H,000000000H,043380000H
_2il0floatpacket_84	DD	000000000H,080000000H,000000000H,000000000H
_2il0floatpacket_83	DD	000000000H,03ff00000H
_RDATA	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS
EXTRN	__ImageBase:PROC
EXTRN	_fltused:BYTE
	ENDIF
	END
