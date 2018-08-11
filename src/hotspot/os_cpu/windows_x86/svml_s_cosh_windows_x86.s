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
	PUBLIC __svml_coshf8_ha_e9

__svml_coshf8_ha_e9	PROC

_B1_1::

        DB        243
        DB        15
        DB        30
        DB        250
L1::

        push      rbx
        push      rdi
        push      r12
        sub       rsp, 304
        lea       rdi, QWORD PTR [__ImageBase]
        vmovups   XMMWORD PTR [192+rsp], xmm15
        vmovups   XMMWORD PTR [208+rsp], xmm14
        vmovups   XMMWORD PTR [224+rsp], xmm11
        vmovups   XMMWORD PTR [240+rsp], xmm10
        vpxor     xmm11, xmm11, xmm11
        vmovups   XMMWORD PTR [256+rsp], xmm9
        vmovups   XMMWORD PTR [272+rsp], xmm8
        mov       QWORD PTR [288+rsp], r13
        lea       r13, QWORD PTR [95+rsp]
        vmovups   ymm8, YMMWORD PTR [rcx]
        and       r13, -64
        vmovups   ymm5, YMMWORD PTR [__svml_scosh_ha_data_internal+1024]
        vmovups   ymm0, YMMWORD PTR [__svml_scosh_ha_data_internal+1280]
        vmovups   xmm14, XMMWORD PTR [__svml_scosh_ha_data_internal+1408]
        vmovups   xmm3, XMMWORD PTR [__svml_scosh_ha_data_internal+1344]
        vandnps   ymm9, ymm5, ymm8
        vmulps    ymm4, ymm9, YMMWORD PTR [__svml_scosh_ha_data_internal+768]
        vaddps    ymm1, ymm0, ymm4
        mov       QWORD PTR [296+rsp], r13
        vpcmpgtd  xmm5, xmm9, xmm14
        vextractf128 xmm2, ymm9, 1
        vpcmpgtd  xmm4, xmm2, xmm14
        vpackssdw xmm2, xmm5, xmm4
        vxorps    ymm4, ymm1, ymm0
        vsubps    ymm0, ymm1, ymm0
        vpacksswb xmm10, xmm2, xmm11
        vpmovmskb ebx, xmm10
        vmulps    ymm1, ymm0, YMMWORD PTR [__svml_scosh_ha_data_internal+896]
        vsubps    ymm9, ymm9, ymm1
        vmulps    ymm1, ymm0, YMMWORD PTR [__svml_scosh_ha_data_internal+960]
        vsubps    ymm1, ymm9, ymm1
        vpsubd    xmm15, xmm3, xmm4
        vextractf128 xmm5, ymm4, 1
        vpsrld    xmm2, xmm15, 28
        vpslld    xmm14, xmm2, 4
        vpor      xmm11, xmm14, xmm4
        vpsubd    xmm10, xmm3, xmm5
        vpand     xmm2, xmm11, xmm3
        vpsrld    xmm15, xmm10, 28
        vpslld    xmm0, xmm2, 4
        vpslld    xmm14, xmm15, 4
        vpsubd    xmm2, xmm4, xmm2
        vpor      xmm11, xmm14, xmm5
        vpslld    xmm4, xmm2, 19
        vmovd     r11d, xmm0
        vpand     xmm3, xmm11, xmm3
        vpslld    xmm15, xmm3, 4
        vpsubd    xmm3, xmm5, xmm3
        vpslld    xmm3, xmm3, 19
        vpextrd   r10d, xmm0, 1
        vpextrd   r9d, xmm0, 2
        vpextrd   r8d, xmm0, 3
        vmovd     ecx, xmm15
        vmovd     xmm14, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+rdi+r11]
        vmovd     xmm11, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+rdi+r10]
        vmovd     xmm10, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+rdi+r9]
        vmovd     xmm9, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+rdi+r8]
        vpextrd   edx, xmm15, 1
        vpextrd   eax, xmm15, 2
        vpextrd   r12d, xmm15, 3
        vpunpcklqdq xmm0, xmm14, xmm11
        vpunpcklqdq xmm14, xmm10, xmm9
        vshufps   xmm10, xmm0, xmm14, 136
        vmovd     xmm15, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+rdi+rcx]
        vmovd     xmm9, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+rdi+rdx]
        vmovd     xmm0, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+rdi+rax]
        vmovd     xmm14, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+rdi+r12]
        vpunpcklqdq xmm11, xmm15, xmm9
        vpunpcklqdq xmm15, xmm0, xmm14
        vshufps   xmm9, xmm11, xmm15, 136
        vmovd     xmm0, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+rdi+r9]
        vmovd     xmm14, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+rdi+r8]
        vpunpcklqdq xmm15, xmm0, xmm14
        vmovd     xmm14, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+rdi+rdx]
        vinsertf128 ymm11, ymm10, xmm9, 1
        vmovd     xmm10, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+rdi+r11]
        vmovd     xmm9, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+rdi+r10]
        vpunpcklqdq xmm10, xmm10, xmm9
        vshufps   xmm0, xmm10, xmm15, 136
        vmovd     xmm9, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+rdi+rcx]
        vmovd     xmm10, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+rdi+rax]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+rdi+r12]
        vpunpcklqdq xmm9, xmm9, xmm14
        vpunpcklqdq xmm14, xmm10, xmm15
        vshufps   xmm10, xmm9, xmm14, 136
        vinsertf128 ymm15, ymm0, xmm10, 1
        vmulps    ymm9, ymm15, ymm1
        vmovd     xmm10, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+rdi+r8]
        vaddps    ymm0, ymm11, ymm11
        vaddps    ymm14, ymm11, ymm9
        vmovd     xmm11, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+rdi+r11]
        vmovd     xmm9, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+rdi+r10]
        vpunpcklqdq xmm15, xmm11, xmm9
        vmovd     xmm11, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+rdi+r9]
        vpunpcklqdq xmm9, xmm11, xmm10
        vmovd     xmm11, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+rdi+rcx]
        vmovd     xmm10, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+rdi+rdx]
        vmulps    ymm14, ymm1, ymm14
        vshufps   xmm9, xmm15, xmm9, 136
        vpunpcklqdq xmm15, xmm11, xmm10
        vmovd     xmm11, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+rdi+rax]
        vmovd     xmm10, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+rdi+r12]
        vpunpcklqdq xmm11, xmm11, xmm10
        vshufps   xmm15, xmm15, xmm11, 136
        vmovd     xmm11, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+rdi+r11]
        vmovd     xmm10, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+rdi+r10]
        vpunpcklqdq xmm11, xmm11, xmm10
        vinsertf128 ymm9, ymm9, xmm15, 1
        vaddps    ymm14, ymm9, ymm14
        vmovd     xmm15, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+rdi+r9]
        vmovd     xmm9, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+rdi+r8]
        vpunpcklqdq xmm10, xmm15, xmm9
        vmovd     xmm15, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+rdi+rcx]
        vmovd     xmm9, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+rdi+rdx]
        vmulps    ymm1, ymm1, ymm14
        vshufps   xmm11, xmm11, xmm10, 136
        vpunpcklqdq xmm10, xmm15, xmm9
        vmovd     xmm15, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+rdi+rax]
        vmovd     xmm9, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+rdi+r12]
        vpunpcklqdq xmm15, xmm15, xmm9
        vshufps   xmm10, xmm10, xmm15, 136
        vinsertf128 ymm11, ymm11, xmm10, 1
        vaddps    ymm9, ymm11, ymm1
        vaddps    ymm0, ymm0, ymm9
        vextractf128 xmm9, ymm0, 1
        vpaddd    xmm0, xmm0, xmm4
        vpaddd    xmm1, xmm9, xmm3
        vinsertf128 ymm0, ymm0, xmm1, 1
        test      bl, bl
        jne       _B1_3

_B1_2::

        vmovups   xmm8, XMMWORD PTR [272+rsp]
        vmovups   xmm9, XMMWORD PTR [256+rsp]
        vmovups   xmm10, XMMWORD PTR [240+rsp]
        vmovups   xmm11, XMMWORD PTR [224+rsp]
        vmovups   xmm14, XMMWORD PTR [208+rsp]
        vmovups   xmm15, XMMWORD PTR [192+rsp]
        mov       r13, QWORD PTR [288+rsp]
        add       rsp, 304
        pop       r12
        pop       rdi
        pop       rbx
        ret

_B1_3::

        vmovups   YMMWORD PTR [r13], ymm8
        vmovups   YMMWORD PTR [64+r13], ymm0
        test      ebx, ebx
        je        _B1_2

_B1_6::

        xor       edi, edi

_B1_7::

        bt        ebx, edi
        jc        _B1_10

_B1_8::

        inc       edi
        cmp       edi, 8
        jl        _B1_7

_B1_9::

        vmovups   ymm0, YMMWORD PTR [64+r13]
        jmp       _B1_2

_B1_10::

        vzeroupper
        lea       rcx, QWORD PTR [r13+rdi*4]
        lea       rdx, QWORD PTR [64+r13+rdi*4]

        call      __svml_scosh_ha_cout_rare_internal
        jmp       _B1_8
        ALIGN     16

_B1_11::

__svml_coshf8_ha_e9 ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_coshf8_ha_e9_B1_B10:
	DD	1267969
	DD	2413657
	DD	1149009
	DD	1087560
	DD	1026106
	DD	964657
	DD	911400
	DD	849951
	DD	2490639
	DD	1879490568
	DD	12293

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B1_1
	DD	imagerel _B1_11
	DD	imagerel _unwind___svml_coshf8_ha_e9_B1_B10

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_TEXT	SEGMENT      'CODE'

TXTST1:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_coshf4_ha_l9

__svml_coshf4_ha_l9	PROC

_B2_1::

        DB        243
        DB        15
        DB        30
        DB        250
L16::

        sub       rsp, 264
        lea       r10, QWORD PTR [__ImageBase]
        vmovups   XMMWORD PTR [192+rsp], xmm15
        vmovups   XMMWORD PTR [208+rsp], xmm14
        vmovups   XMMWORD PTR [224+rsp], xmm12
        mov       QWORD PTR [240+rsp], r13
        lea       r13, QWORD PTR [111+rsp]
        vmovups   xmm1, XMMWORD PTR [rcx]
        and       r13, -64
        vmovups   xmm3, XMMWORD PTR [__svml_scosh_ha_data_internal+1024]
        vmovups   xmm12, XMMWORD PTR [__svml_scosh_ha_data_internal+1280]
        vandnps   xmm2, xmm3, xmm1
        vmovups   xmm14, XMMWORD PTR [__svml_scosh_ha_data_internal+768]
        vfmadd213ps xmm14, xmm2, xmm12
        vmovups   xmm0, XMMWORD PTR [__svml_scosh_ha_data_internal+1344]
        vpcmpgtd  xmm4, xmm2, XMMWORD PTR [__svml_scosh_ha_data_internal+1408]
        vmovmskps ecx, xmm4
        vxorps    xmm3, xmm14, xmm12
        vsubps    xmm12, xmm14, xmm12
        vpsubd    xmm5, xmm0, xmm3
        vpsrld    xmm4, xmm5, 28
        vpslld    xmm5, xmm4, 4
        vpor      xmm15, xmm5, xmm3
        vpand     xmm0, xmm15, xmm0
        vfnmadd231ps xmm2, xmm12, XMMWORD PTR [__svml_scosh_ha_data_internal+896]
        vpslld    xmm14, xmm0, 4
        vmovd     edx, xmm14
        vfnmadd231ps xmm2, xmm12, XMMWORD PTR [__svml_scosh_ha_data_internal+960]
        vmovd     xmm12, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+r10+rdx]
        vpextrd   eax, xmm14, 1
        vpextrd   r8d, xmm14, 2
        vpextrd   r9d, xmm14, 3
        vmovd     xmm14, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+r10+rax]
        vmovd     xmm4, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+r10+r8]
        vmovd     xmm5, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+r10+r9]
        vpunpcklqdq xmm15, xmm12, xmm14
        vpunpcklqdq xmm12, xmm4, xmm5
        vshufps   xmm15, xmm15, xmm12, 136
        vmovd     xmm12, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+r10+r9]
        vmovd     xmm14, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+r10+rdx]
        vmovd     xmm4, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+r10+rax]
        vmovd     xmm5, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+r10+r8]
        vpunpcklqdq xmm14, xmm14, xmm4
        vpunpcklqdq xmm4, xmm5, xmm12
        vaddps    xmm12, xmm15, xmm15
        vshufps   xmm14, xmm14, xmm4, 136
        vfmadd213ps xmm14, xmm2, xmm15
        vmovd     xmm15, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+r10+rdx]
        vmovd     xmm4, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+r10+rax]
        vpunpcklqdq xmm5, xmm15, xmm4
        vmovd     xmm15, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+r10+r8]
        vmovd     xmm4, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+r10+r9]
        vpunpcklqdq xmm15, xmm15, xmm4
        vshufps   xmm5, xmm5, xmm15, 136
        vfmadd213ps xmm14, xmm2, xmm5
        vmovd     xmm4, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+r10+rdx]
        vmovd     xmm5, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+r10+rax]
        vpunpcklqdq xmm4, xmm4, xmm5
        vmovd     xmm15, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+r10+r8]
        vmovd     xmm5, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+r10+r9]
        vpunpcklqdq xmm15, xmm15, xmm5
        vshufps   xmm4, xmm4, xmm15, 136
        vfmadd213ps xmm14, xmm2, xmm4
        vpsubd    xmm2, xmm3, xmm0
        vpslld    xmm0, xmm2, 19
        mov       QWORD PTR [248+rsp], r13
        vaddps    xmm4, xmm12, xmm14
        vpaddd    xmm0, xmm4, xmm0
        test      ecx, ecx
        jne       _B2_3

_B2_2::

        vmovups   xmm12, XMMWORD PTR [224+rsp]
        vmovups   xmm14, XMMWORD PTR [208+rsp]
        vmovups   xmm15, XMMWORD PTR [192+rsp]
        mov       r13, QWORD PTR [240+rsp]
        add       rsp, 264
        ret

_B2_3::

        vmovups   XMMWORD PTR [r13], xmm1
        vmovups   XMMWORD PTR [64+r13], xmm0

_B2_6::

        xor       eax, eax
        mov       QWORD PTR [40+rsp], rbx
        mov       ebx, eax
        mov       QWORD PTR [32+rsp], rsi
        mov       esi, ecx

_B2_7::

        bt        esi, ebx
        jc        _B2_10

_B2_8::

        inc       ebx
        cmp       ebx, 4
        jl        _B2_7

_B2_9::

        mov       rbx, QWORD PTR [40+rsp]
        mov       rsi, QWORD PTR [32+rsp]
        vmovups   xmm0, XMMWORD PTR [64+r13]
        jmp       _B2_2

_B2_10::

        lea       rcx, QWORD PTR [r13+rbx*4]
        lea       rdx, QWORD PTR [64+r13+rbx*4]

        call      __svml_scosh_ha_cout_rare_internal
        jmp       _B2_8
        ALIGN     16

_B2_11::

__svml_coshf4_ha_l9 ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_coshf4_ha_l9_B1_B3:
	DD	668929
	DD	2020405
	DD	968749
	DD	911396
	DD	849947
	DD	2162955

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B2_1
	DD	imagerel _B2_6
	DD	imagerel _unwind___svml_coshf4_ha_l9_B1_B3

.pdata	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_coshf4_ha_l9_B6_B10:
	DD	265761
	DD	287758
	DD	340999
	DD	imagerel _B2_1
	DD	imagerel _B2_6
	DD	imagerel _unwind___svml_coshf4_ha_l9_B1_B3

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B2_6
	DD	imagerel _B2_11
	DD	imagerel _unwind___svml_coshf4_ha_l9_B6_B10

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_TEXT	SEGMENT      'CODE'

TXTST2:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_coshf8_ha_l9

__svml_coshf8_ha_l9	PROC

_B3_1::

        DB        243
        DB        15
        DB        30
        DB        250
L29::

        push      rbx
        push      rsi
        push      rdi
        sub       rsp, 272
        lea       rsi, QWORD PTR [__ImageBase]
        vmovups   XMMWORD PTR [192+rsp], xmm15
        vmovups   XMMWORD PTR [208+rsp], xmm14
        vmovups   XMMWORD PTR [224+rsp], xmm13
        vmovups   XMMWORD PTR [240+rsp], xmm12
        mov       QWORD PTR [256+rsp], r13
        lea       r13, QWORD PTR [95+rsp]
        vmovups   ymm4, YMMWORD PTR [rcx]
        and       r13, -64
        vmovups   ymm3, YMMWORD PTR [__svml_scosh_ha_data_internal+1024]
        vmovups   ymm15, YMMWORD PTR [__svml_scosh_ha_data_internal+1280]
        vmovups   ymm14, YMMWORD PTR [__svml_scosh_ha_data_internal+768]
        vmovups   ymm2, YMMWORD PTR [__svml_scosh_ha_data_internal+1344]
        vandnps   ymm5, ymm3, ymm4
        vfmadd213ps ymm14, ymm5, ymm15
        vpcmpgtd  ymm3, ymm5, YMMWORD PTR [__svml_scosh_ha_data_internal+1408]
        vmovmskps ebx, ymm3
        vxorps    ymm3, ymm14, ymm15
        vpsubd    ymm0, ymm2, ymm3
        vsubps    ymm13, ymm14, ymm15
        vpsrld    ymm1, ymm0, 28
        vfnmadd231ps ymm5, ymm13, YMMWORD PTR [__svml_scosh_ha_data_internal+896]
        vpslld    ymm0, ymm1, 4
        vfnmadd231ps ymm5, ymm13, YMMWORD PTR [__svml_scosh_ha_data_internal+960]
        vpor      ymm1, ymm0, ymm3
        vpand     ymm2, ymm1, ymm2
        vpslld    ymm15, ymm2, 4
        mov       QWORD PTR [264+rsp], r13
        vextracti128 xmm12, ymm15, 1
        vmovd     r10d, xmm15
        vmovd     ecx, xmm12
        vmovd     xmm14, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+rsi+r10]
        vpextrd   r9d, xmm15, 1
        vpextrd   r8d, xmm15, 2
        vpextrd   edi, xmm15, 3
        vpextrd   edx, xmm12, 1
        vmovd     xmm0, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+rsi+r9]
        vmovd     xmm1, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+rsi+r8]
        vmovd     xmm13, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+rsi+rdi]
        vpextrd   eax, xmm12, 2
        vpextrd   r11d, xmm12, 3
        vpunpcklqdq xmm15, xmm14, xmm0
        vpunpcklqdq xmm14, xmm1, xmm13
        vmovd     xmm12, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+rsi+rcx]
        vmovd     xmm0, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+rsi+rdx]
        vshufps   xmm1, xmm15, xmm14, 136
        vpunpcklqdq xmm15, xmm12, xmm0
        vmovd     xmm13, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+rsi+rax]
        vmovd     xmm12, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+rsi+r11]
        vpunpcklqdq xmm14, xmm13, xmm12
        vshufps   xmm0, xmm15, xmm14, 136
        vmovd     xmm12, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+rsi+rdi]
        vinsertf128 ymm13, ymm1, xmm0, 1
        vmovd     xmm1, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+rsi+r10]
        vmovd     xmm0, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+rsi+r9]
        vpunpcklqdq xmm15, xmm1, xmm0
        vmovd     xmm1, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+rsi+r8]
        vpunpcklqdq xmm14, xmm1, xmm12
        vshufps   xmm0, xmm15, xmm14, 136
        vmovd     xmm1, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+rsi+rcx]
        vmovd     xmm12, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+rsi+rdx]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+rsi+rax]
        vmovd     xmm14, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+rsi+r11]
        vpunpcklqdq xmm1, xmm1, xmm12
        vpunpcklqdq xmm12, xmm15, xmm14
        vshufps   xmm15, xmm1, xmm12, 136
        vaddps    ymm1, ymm13, ymm13
        vmovd     xmm12, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+rsi+r9]
        vinsertf128 ymm0, ymm0, xmm15, 1
        vfmadd213ps ymm0, ymm5, ymm13
        vmovd     xmm13, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+rsi+r10]
        vpunpcklqdq xmm14, xmm13, xmm12
        vmovd     xmm13, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+rsi+r8]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+rsi+rdi]
        vpunpcklqdq xmm13, xmm13, xmm15
        vshufps   xmm15, xmm14, xmm13, 136
        vmovd     xmm12, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+rsi+rcx]
        vmovd     xmm14, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+rsi+rdx]
        vpunpcklqdq xmm14, xmm12, xmm14
        vmovd     xmm13, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+rsi+rax]
        vmovd     xmm12, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+rsi+r11]
        vpunpcklqdq xmm13, xmm13, xmm12
        vshufps   xmm14, xmm14, xmm13, 136
        vmovd     xmm13, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+rsi+r10]
        vmovd     xmm12, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+rsi+r9]
        vpunpcklqdq xmm13, xmm13, xmm12
        vinsertf128 ymm15, ymm15, xmm14, 1
        vfmadd213ps ymm0, ymm5, ymm15
        vmovd     xmm14, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+rsi+r8]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+rsi+rdi]
        vpunpcklqdq xmm12, xmm14, xmm15
        vmovd     xmm14, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+rsi+rcx]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+rsi+rdx]
        vshufps   xmm13, xmm13, xmm12, 136
        vpunpcklqdq xmm12, xmm14, xmm15
        vmovd     xmm14, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+rsi+rax]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+rsi+r11]
        vpunpcklqdq xmm14, xmm14, xmm15
        vshufps   xmm12, xmm12, xmm14, 136
        vinsertf128 ymm13, ymm13, xmm12, 1
        vfmadd213ps ymm0, ymm5, ymm13
        vpsubd    ymm5, ymm3, ymm2
        vaddps    ymm0, ymm1, ymm0
        vpslld    ymm1, ymm5, 19
        vpaddd    ymm0, ymm0, ymm1
        test      ebx, ebx
        jne       _B3_3

_B3_2::

        vmovups   xmm12, XMMWORD PTR [240+rsp]
        vmovups   xmm13, XMMWORD PTR [224+rsp]
        vmovups   xmm14, XMMWORD PTR [208+rsp]
        vmovups   xmm15, XMMWORD PTR [192+rsp]
        mov       r13, QWORD PTR [256+rsp]
        add       rsp, 272
        pop       rdi
        pop       rsi
        pop       rbx
        ret

_B3_3::

        vmovups   YMMWORD PTR [r13], ymm4
        vmovups   YMMWORD PTR [64+r13], ymm0

_B3_6::

        xor       esi, esi

_B3_7::

        bt        ebx, esi
        jc        _B3_10

_B3_8::

        inc       esi
        cmp       esi, 8
        jl        _B3_7

_B3_9::

        vmovups   ymm0, YMMWORD PTR [64+r13]
        jmp       _B3_2

_B3_10::

        vzeroupper
        lea       rcx, QWORD PTR [r13+rsi*4]
        lea       rdx, QWORD PTR [64+r13+rsi*4]

        call      __svml_scosh_ha_cout_rare_internal
        jmp       _B3_8
        ALIGN     16

_B3_11::

__svml_coshf8_ha_l9 ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_coshf8_ha_l9_B1_B10:
	DD	999681
	DD	2151489
	DD	1034297
	DD	972848
	DD	911399
	DD	849950
	DD	2228494
	DD	1611034631
	DD	12293

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B3_1
	DD	imagerel _B3_11
	DD	imagerel _unwind___svml_coshf8_ha_l9_B1_B10

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_TEXT	SEGMENT      'CODE'

TXTST3:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_coshf4_ha_ex

__svml_coshf4_ha_ex	PROC

_B4_1::

        DB        243
        DB        15
        DB        30
        DB        250
L40::

        sub       rsp, 264
        lea       r10, QWORD PTR [__ImageBase]
        movups    XMMWORD PTR [208+rsp], xmm15
        movups    XMMWORD PTR [224+rsp], xmm7
        movups    XMMWORD PTR [192+rsp], xmm6
        mov       QWORD PTR [240+rsp], r13
        lea       r13, QWORD PTR [111+rsp]
        movups    xmm4, XMMWORD PTR [rcx]
        and       r13, -64
        movups    xmm1, XMMWORD PTR [__svml_scosh_ha_data_internal+1024]
        movups    xmm7, XMMWORD PTR [__svml_scosh_ha_data_internal+768]
        andnps    xmm1, xmm4
        mulps     xmm7, xmm1
        movaps    xmm2, xmm1
        movups    xmm5, XMMWORD PTR [__svml_scosh_ha_data_internal+1280]
        movdqu    xmm15, XMMWORD PTR [__svml_scosh_ha_data_internal+1344]
        addps     xmm7, xmm5
        movaps    xmm3, xmm7
        subps     xmm7, xmm5
        pcmpgtd   xmm2, XMMWORD PTR [__svml_scosh_ha_data_internal+1408]
        pxor      xmm3, xmm5
        movups    xmm0, XMMWORD PTR [__svml_scosh_ha_data_internal+896]
        movmskps  ecx, xmm2
        movdqa    xmm2, xmm15
        psubd     xmm2, xmm3
        psrld     xmm2, 28
        mulps     xmm0, xmm7
        pslld     xmm2, 4
        movups    xmm6, XMMWORD PTR [__svml_scosh_ha_data_internal+960]
        por       xmm2, xmm3
        mulps     xmm6, xmm7
        subps     xmm1, xmm0
        pand      xmm2, xmm15
        subps     xmm1, xmm6
        movdqa    xmm5, xmm2
        psubd     xmm3, xmm2
        pslld     xmm5, 4
        pslld     xmm3, 19
        pshufd    xmm0, xmm5, 1
        movd      eax, xmm0
        pshufd    xmm0, xmm5, 2
        pshufd    xmm6, xmm5, 3
        movd      edx, xmm5
        movd      r8d, xmm0
        movd      r9d, xmm6
        movd      xmm15, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+r10+rdx]
        movd      xmm7, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+r10+rax]
        movd      xmm6, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+r10+r8]
        movd      xmm0, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+r10+r9]
        punpcklqdq xmm15, xmm7
        punpcklqdq xmm6, xmm0
        movd      xmm0, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+r10+r9]
        shufps    xmm15, xmm6, 136
        movd      xmm7, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+r10+rdx]
        movd      xmm5, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+r10+rax]
        movd      xmm6, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+r10+r8]
        punpcklqdq xmm7, xmm5
        punpcklqdq xmm6, xmm0
        movaps    xmm0, xmm15
        shufps    xmm7, xmm6, 136
        addps     xmm0, xmm15
        mulps     xmm7, xmm1
        movd      xmm6, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+r10+rdx]
        addps     xmm15, xmm7
        mulps     xmm15, xmm1
        movd      xmm5, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+r10+rax]
        punpcklqdq xmm6, xmm5
        movd      xmm5, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+r10+r8]
        movd      xmm7, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+r10+r9]
        punpcklqdq xmm5, xmm7
        shufps    xmm6, xmm5, 136
        movd      xmm5, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+r10+rdx]
        addps     xmm6, xmm15
        mulps     xmm1, xmm6
        movd      xmm15, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+r10+rax]
        punpcklqdq xmm5, xmm15
        movd      xmm15, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+r10+r8]
        movd      xmm7, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+r10+r9]
        punpcklqdq xmm15, xmm7
        shufps    xmm5, xmm15, 136
        mov       QWORD PTR [248+rsp], r13
        addps     xmm5, xmm1
        addps     xmm0, xmm5
        paddd     xmm0, xmm3
        test      ecx, ecx
        jne       _B4_3

_B4_2::

        movups    xmm6, XMMWORD PTR [192+rsp]
        movups    xmm7, XMMWORD PTR [224+rsp]
        movups    xmm15, XMMWORD PTR [208+rsp]
        mov       r13, QWORD PTR [240+rsp]
        add       rsp, 264
        ret

_B4_3::

        movups    XMMWORD PTR [r13], xmm4
        movups    XMMWORD PTR [64+r13], xmm0

_B4_6::

        xor       eax, eax
        mov       QWORD PTR [40+rsp], rbx
        mov       ebx, eax
        mov       QWORD PTR [32+rsp], rsi
        mov       esi, ecx

_B4_7::

        mov       ecx, ebx
        mov       edx, 1
        shl       edx, cl
        test      esi, edx
        jne       _B4_10

_B4_8::

        inc       ebx
        cmp       ebx, 4
        jl        _B4_7

_B4_9::

        mov       rbx, QWORD PTR [40+rsp]
        mov       rsi, QWORD PTR [32+rsp]
        movups    xmm0, XMMWORD PTR [64+r13]
        jmp       _B4_2

_B4_10::

        lea       rcx, QWORD PTR [r13+rbx*4]
        lea       rdx, QWORD PTR [64+r13+rbx*4]

        call      __svml_scosh_ha_cout_rare_internal
        jmp       _B4_8
        ALIGN     16

_B4_11::

__svml_coshf4_ha_ex ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_coshf4_ha_ex_B1_B3:
	DD	668417
	DD	2020403
	DD	813099
	DD	948259
	DD	915483
	DD	2162955

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B4_1
	DD	imagerel _B4_6
	DD	imagerel _unwind___svml_coshf4_ha_ex_B1_B3

.pdata	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_coshf4_ha_ex_B6_B10:
	DD	265761
	DD	287758
	DD	340999
	DD	imagerel _B4_1
	DD	imagerel _B4_6
	DD	imagerel _unwind___svml_coshf4_ha_ex_B1_B3

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B4_6
	DD	imagerel _B4_11
	DD	imagerel _unwind___svml_coshf4_ha_ex_B6_B10

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_TEXT	SEGMENT      'CODE'

TXTST4:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_coshf4_ha_e9

__svml_coshf4_ha_e9	PROC

_B5_1::

        DB        243
        DB        15
        DB        30
        DB        250
L53::

        sub       rsp, 264
        lea       r10, QWORD PTR [__ImageBase]
        vmovups   XMMWORD PTR [192+rsp], xmm15
        vmovups   XMMWORD PTR [208+rsp], xmm11
        vmovups   XMMWORD PTR [224+rsp], xmm7
        mov       QWORD PTR [240+rsp], r13
        lea       r13, QWORD PTR [111+rsp]
        vmovups   xmm2, XMMWORD PTR [rcx]
        and       r13, -64
        vmovups   xmm1, XMMWORD PTR [__svml_scosh_ha_data_internal+1024]
        vandnps   xmm3, xmm1, xmm2
        vmulps    xmm1, xmm3, XMMWORD PTR [__svml_scosh_ha_data_internal+768]
        vmovups   xmm5, XMMWORD PTR [__svml_scosh_ha_data_internal+1280]
        vmovups   xmm0, XMMWORD PTR [__svml_scosh_ha_data_internal+1344]
        vaddps    xmm4, xmm5, xmm1
        vxorps    xmm1, xmm4, xmm5
        vsubps    xmm5, xmm4, xmm5
        vpsubd    xmm15, xmm0, xmm1
        vmulps    xmm4, xmm5, XMMWORD PTR [__svml_scosh_ha_data_internal+896]
        vpsrld    xmm11, xmm15, 28
        vpcmpgtd  xmm7, xmm3, XMMWORD PTR [__svml_scosh_ha_data_internal+1408]
        vsubps    xmm3, xmm3, xmm4
        vmulps    xmm4, xmm5, XMMWORD PTR [__svml_scosh_ha_data_internal+960]
        vmovmskps ecx, xmm7
        vpslld    xmm7, xmm11, 4
        vsubps    xmm3, xmm3, xmm4
        vpor      xmm15, xmm7, xmm1
        vpand     xmm0, xmm15, xmm0
        vpslld    xmm7, xmm0, 4
        vpsubd    xmm0, xmm1, xmm0
        vmovd     edx, xmm7
        vpslld    xmm0, xmm0, 19
        vpextrd   eax, xmm7, 1
        vpextrd   r8d, xmm7, 2
        vpextrd   r9d, xmm7, 3
        vmovd     xmm5, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+r10+rdx]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+r10+rax]
        vmovd     xmm11, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+r10+r8]
        vmovd     xmm4, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1480+r10+r9]
        vpunpcklqdq xmm7, xmm5, xmm15
        vpunpcklqdq xmm5, xmm11, xmm4
        vshufps   xmm7, xmm7, xmm5, 136
        vmovd     xmm5, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+r10+r9]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+r10+rdx]
        vmovd     xmm11, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+r10+rax]
        vmovd     xmm4, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1484+r10+r8]
        vpunpcklqdq xmm15, xmm15, xmm11
        vpunpcklqdq xmm11, xmm4, xmm5
        vaddps    xmm4, xmm7, xmm7
        vshufps   xmm5, xmm15, xmm11, 136
        vmulps    xmm15, xmm5, xmm3
        vmovd     xmm5, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+r10+rax]
        vaddps    xmm15, xmm7, xmm15
        vmulps    xmm15, xmm3, xmm15
        vmovd     xmm7, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+r10+rdx]
        vpunpcklqdq xmm11, xmm7, xmm5
        vmovd     xmm7, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+r10+r8]
        vmovd     xmm5, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1476+r10+r9]
        vpunpcklqdq xmm7, xmm7, xmm5
        vshufps   xmm11, xmm11, xmm7, 136
        vmovd     xmm5, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+r10+rdx]
        vaddps    xmm7, xmm11, xmm15
        vmulps    xmm3, xmm3, xmm7
        vmovd     xmm11, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+r10+rax]
        vpunpcklqdq xmm5, xmm5, xmm11
        vmovd     xmm11, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+r10+r8]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_scosh_ha_data_internal)+1472+r10+r9]
        vpunpcklqdq xmm11, xmm11, xmm15
        vshufps   xmm5, xmm5, xmm11, 136
        mov       QWORD PTR [248+rsp], r13
        vaddps    xmm3, xmm5, xmm3
        vaddps    xmm4, xmm4, xmm3
        vpaddd    xmm0, xmm4, xmm0
        test      ecx, ecx
        jne       _B5_3

_B5_2::

        vmovups   xmm7, XMMWORD PTR [224+rsp]
        vmovups   xmm11, XMMWORD PTR [208+rsp]
        vmovups   xmm15, XMMWORD PTR [192+rsp]
        mov       r13, QWORD PTR [240+rsp]
        add       rsp, 264
        ret

_B5_3::

        vmovups   XMMWORD PTR [r13], xmm2
        vmovups   XMMWORD PTR [64+r13], xmm0

_B5_6::

        xor       eax, eax
        mov       QWORD PTR [40+rsp], rbx
        mov       ebx, eax
        mov       QWORD PTR [32+rsp], rsi
        mov       esi, ecx

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
        vmovups   xmm0, XMMWORD PTR [64+r13]
        jmp       _B5_2

_B5_10::

        lea       rcx, QWORD PTR [r13+rbx*4]
        lea       rdx, QWORD PTR [64+r13+rbx*4]

        call      __svml_scosh_ha_cout_rare_internal
        jmp       _B5_8
        ALIGN     16

_B5_11::

__svml_coshf4_ha_e9 ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_coshf4_ha_e9_B1_B3:
	DD	668929
	DD	2020405
	DD	948269
	DD	899108
	DD	849947
	DD	2162955

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B5_1
	DD	imagerel _B5_6
	DD	imagerel _unwind___svml_coshf4_ha_e9_B1_B3

.pdata	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_coshf4_ha_e9_B6_B10:
	DD	265761
	DD	287758
	DD	340999
	DD	imagerel _B5_1
	DD	imagerel _B5_6
	DD	imagerel _unwind___svml_coshf4_ha_e9_B1_B3

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B5_6
	DD	imagerel _B5_11
	DD	imagerel _unwind___svml_coshf4_ha_e9_B6_B10

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_TEXT	SEGMENT      'CODE'

TXTST5:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_scosh_ha_cout_rare_internal

__svml_scosh_ha_cout_rare_internal	PROC

_B6_1::

        DB        243
        DB        15
        DB        30
        DB        250
L66::

        sub       rsp, 136
        xor       eax, eax
        movzx     r8d, WORD PTR [2+rcx]
        and       r8d, 32640
        movups    XMMWORD PTR [80+rsp], xmm15
        movups    XMMWORD PTR [112+rsp], xmm14
        movups    XMMWORD PTR [96+rsp], xmm9
        cmp       r8d, 32640
        je        _B6_12

_B6_2::

        pxor      xmm0, xmm0
        cvtss2sd  xmm0, DWORD PTR [rcx]
        movsd     QWORD PTR [64+rsp], xmm0
        and       BYTE PTR [71+rsp], 127
        movzx     ecx, WORD PTR [70+rsp]
        and       ecx, 32752
        cmp       ecx, 15504
        jle       _B6_10

_B6_3::

        movsd     xmm15, QWORD PTR [64+rsp]
        movsd     xmm0, QWORD PTR [_vmldCoshHATab+1096]
        comisd    xmm0, xmm15
        jbe       _B6_9

_B6_4::

        mov       rcx, QWORD PTR [_vmldCoshHATab+1128]
        mov       QWORD PTR [64+rsp], rcx
        comisd    xmm15, QWORD PTR [_vmldCoshHATab+1144]
        jb        _B6_8

_B6_5::

        movsd     xmm0, QWORD PTR [_vmldCoshHATab+1040]
        lea       r9, QWORD PTR [__ImageBase]
        mulsd     xmm0, xmm15
        addsd     xmm0, QWORD PTR [_vmldCoshHATab+1048]
        movsd     QWORD PTR [32+rsp], xmm0
        movsd     xmm1, QWORD PTR [32+rsp]
        mov       ecx, DWORD PTR [32+rsp]
        mov       r10d, ecx
        and       r10d, 63
        subsd     xmm1, QWORD PTR [_vmldCoshHATab+1048]
        movsd     QWORD PTR [40+rsp], xmm1
        lea       r8d, DWORD PTR [r10+r10]
        movsd     xmm2, QWORD PTR [40+rsp]
        lea       r11d, DWORD PTR [1+r10+r10]
        mulsd     xmm2, QWORD PTR [_vmldCoshHATab+1104]
        movsd     xmm3, QWORD PTR [40+rsp]
        subsd     xmm15, xmm2
        mulsd     xmm3, QWORD PTR [_vmldCoshHATab+1112]
        movsd     xmm1, QWORD PTR [_vmldCoshHATab+1088]
        subsd     xmm15, xmm3
        mulsd     xmm1, xmm15
        movsd     xmm4, QWORD PTR [imagerel(_vmldCoshHATab)+r9+r8*8]
        mov       r8, r9
        shr       ecx, 6
        addsd     xmm1, QWORD PTR [_vmldCoshHATab+1080]
        mulsd     xmm1, xmm15
        add       ecx, 1022
        and       ecx, 2047
        addsd     xmm1, QWORD PTR [_vmldCoshHATab+1072]
        mulsd     xmm1, xmm15
        addsd     xmm1, QWORD PTR [_vmldCoshHATab+1064]
        mulsd     xmm1, xmm15
        addsd     xmm1, QWORD PTR [_vmldCoshHATab+1056]
        mulsd     xmm1, xmm15
        mulsd     xmm1, xmm15
        addsd     xmm1, xmm15
        mulsd     xmm1, xmm4
        addsd     xmm1, QWORD PTR [imagerel(_vmldCoshHATab)+r8+r11*8]
        addsd     xmm1, xmm4
        cmp       ecx, 2046
        ja        _B6_7

_B6_6::

        mov       r8, QWORD PTR [_vmldCoshHATab+1128]
        shr       r8, 48
        shl       ecx, 4
        and       r8d, -32753
        or        r8d, ecx
        mov       WORD PTR [70+rsp], r8w
        movsd     xmm0, QWORD PTR [64+rsp]
        mulsd     xmm0, xmm1
        cvtsd2ss  xmm0, xmm0
        movss     DWORD PTR [rdx], xmm0
        jmp       _B6_11

_B6_7::

        dec       ecx
        and       ecx, 2047
        movzx     r8d, WORD PTR [70+rsp]
        shl       ecx, 4
        and       r8d, -32753
        or        r8d, ecx
        mov       WORD PTR [70+rsp], r8w
        movsd     xmm0, QWORD PTR [64+rsp]
        mulsd     xmm1, xmm0
        mulsd     xmm1, QWORD PTR [_vmldCoshHATab+1024]
        cvtsd2ss  xmm1, xmm1
        movss     DWORD PTR [rdx], xmm1
        jmp       _B6_11

_B6_8::

        movsd     xmm1, QWORD PTR [_vmldCoshHATab+1040]
        lea       r8, QWORD PTR [__ImageBase]
        mulsd     xmm1, xmm15
        movzx     r9d, WORD PTR [70+rsp]
        and       r9d, -32753
        addsd     xmm1, QWORD PTR [_vmldCoshHATab+1048]
        movsd     QWORD PTR [32+rsp], xmm1
        movsd     xmm9, QWORD PTR [32+rsp]
        mov       r11d, DWORD PTR [32+rsp]
        mov       ecx, r11d
        shr       ecx, 6
        and       r11d, 63
        subsd     xmm9, QWORD PTR [_vmldCoshHATab+1048]
        movsd     QWORD PTR [40+rsp], xmm9
        lea       r10d, DWORD PTR [1023+rcx]
        movsd     xmm14, QWORD PTR [40+rsp]
        add       ecx, 1022
        mulsd     xmm14, QWORD PTR [_vmldCoshHATab+1104]
        and       ecx, 2047
        movsd     xmm4, QWORD PTR [40+rsp]
        neg       r10d
        mulsd     xmm4, QWORD PTR [_vmldCoshHATab+1112]
        subsd     xmm15, xmm14
        movsd     xmm14, QWORD PTR [_vmldCoshHATab+1088]
        add       r10d, -4
        shl       ecx, 4
        and       r10d, 2047
        movsd     xmm9, QWORD PTR [_vmldCoshHATab+1080]
        or        r9d, ecx
        mov       WORD PTR [70+rsp], r9w
        lea       ecx, DWORD PTR [r11+r11]
        shl       r10d, 4
        and       r9d, -32753
        or        r9d, r10d
        subsd     xmm15, xmm4
        movaps    xmm5, xmm15
        mulsd     xmm5, xmm15
        mulsd     xmm14, xmm5
        mulsd     xmm9, xmm5
        addsd     xmm14, QWORD PTR [_vmldCoshHATab+1072]
        addsd     xmm9, QWORD PTR [_vmldCoshHATab+1064]
        mulsd     xmm14, xmm5
        mulsd     xmm9, xmm5
        addsd     xmm14, QWORD PTR [_vmldCoshHATab+1056]
        mulsd     xmm9, xmm15
        mulsd     xmm14, xmm5
        movsd     xmm4, QWORD PTR [imagerel(_vmldCoshHATab)+r8+rcx*8]
        neg       ecx
        movsd     xmm1, QWORD PTR [64+rsp]
        lea       r8d, DWORD PTR [1+r11+r11]
        lea       r11, QWORD PTR [__ImageBase]
        mov       r10, r11
        mov       WORD PTR [70+rsp], r9w
        lea       r9d, DWORD PTR [128+rcx]
        movsd     xmm0, QWORD PTR [64+rsp]
        add       ecx, 129
        movsd     xmm5, QWORD PTR [imagerel(_vmldCoshHATab)+r11+r8*8]
        mov       r8, r11
        movsd     xmm2, QWORD PTR [imagerel(_vmldCoshHATab)+r10+r9*8]
        mulsd     xmm4, xmm1
        mulsd     xmm2, xmm0
        mulsd     xmm5, xmm1
        movaps    xmm1, xmm4
        movsd     xmm3, QWORD PTR [imagerel(_vmldCoshHATab)+r8+rcx*8]
        addsd     xmm1, xmm2
        mulsd     xmm3, xmm0
        movsd     QWORD PTR [48+rsp], xmm1
        movaps    xmm1, xmm4
        movsd     xmm0, QWORD PTR [48+rsp]
        subsd     xmm4, xmm2
        subsd     xmm1, xmm0
        mulsd     xmm9, xmm4
        addsd     xmm1, xmm2
        movaps    xmm2, xmm5
        movsd     QWORD PTR [56+rsp], xmm1
        subsd     xmm2, xmm3
        mulsd     xmm2, xmm15
        mulsd     xmm15, xmm4
        addsd     xmm2, xmm3
        movsd     xmm1, QWORD PTR [48+rsp]
        addsd     xmm2, xmm5
        mulsd     xmm14, xmm1
        movsd     xmm0, QWORD PTR [56+rsp]
        addsd     xmm0, xmm2
        addsd     xmm0, xmm9
        addsd     xmm0, xmm14
        addsd     xmm0, xmm15
        movsd     QWORD PTR [48+rsp], xmm0
        movsd     xmm15, QWORD PTR [48+rsp]
        addsd     xmm1, xmm15
        cvtsd2ss  xmm1, xmm1
        movss     DWORD PTR [rdx], xmm1
        jmp       _B6_11

_B6_9::

        movsd     xmm0, QWORD PTR [_vmldCoshHATab+1120]
        mov       eax, 3
        mulsd     xmm0, xmm0
        cvtsd2ss  xmm0, xmm0
        movss     DWORD PTR [rdx], xmm0
        jmp       _B6_11

_B6_10::

        movsd     xmm0, QWORD PTR [_vmldCoshHATab+1136]
        addsd     xmm0, QWORD PTR [64+rsp]
        cvtsd2ss  xmm0, xmm0
        movss     DWORD PTR [rdx], xmm0

_B6_11::

        movups    xmm9, XMMWORD PTR [96+rsp]
        movups    xmm14, XMMWORD PTR [112+rsp]
        movups    xmm15, XMMWORD PTR [80+rsp]
        add       rsp, 136
        ret

_B6_12::

        movss     xmm0, DWORD PTR [rcx]
        mulss     xmm0, xmm0
        movss     DWORD PTR [rdx], xmm0
        jmp       _B6_11
        ALIGN     16

_B6_13::

__svml_scosh_ha_cout_rare_internal ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_scosh_ha_cout_rare_internal_B1_B12:
	DD	535297
	DD	432171
	DD	518181
	DD	391199
	DD	1114379

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B6_1
	DD	imagerel _B6_13
	DD	imagerel _unwind___svml_scosh_ha_cout_rare_internal_B1_B12

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_RDATA	SEGMENT     READ PAGE   'DATA'
	ALIGN  32
	PUBLIC __svml_scosh_ha_data_internal
__svml_scosh_ha_data_internal	DD	1056964608
	DD	1057148295
	DD	1057336003
	DD	1057527823
	DD	1057723842
	DD	1057924154
	DD	1058128851
	DD	1058338032
	DD	1058551792
	DD	1058770234
	DD	1058993458
	DD	1059221571
	DD	1059454679
	DD	1059692891
	DD	1059936319
	DD	1060185078
	DD	1060439283
	DD	1060699055
	DD	1060964516
	DD	1061235789
	DD	1061513002
	DD	1061796286
	DD	1062085772
	DD	1062381598
	DD	1062683901
	DD	1062992824
	DD	1063308511
	DD	1063631111
	DD	1063960775
	DD	1064297658
	DD	1064641917
	DD	1064993715
	DD	0
	DD	2999887785
	DD	852465809
	DD	3003046475
	DD	2984291233
	DD	3001644133
	DD	854021668
	DD	2997748242
	DD	849550193
	DD	2995541347
	DD	851518274
	DD	809701978
	DD	2997656926
	DD	2996185864
	DD	2980965110
	DD	3002882728
	DD	844097402
	DD	848217591
	DD	2999013352
	DD	2992006718
	DD	831170615
	DD	3002278818
	DD	833158180
	DD	3000769962
	DD	2991891850
	DD	2999994908
	DD	2979965785
	DD	2982419430
	DD	2982221534
	DD	2999469642
	DD	833168438
	DD	2987538264
	DD	1056964608
	DD	1056605107
	DD	1056253309
	DD	1055909050
	DD	1055572167
	DD	1055242503
	DD	1054919903
	DD	1054604216
	DD	1054295293
	DD	1053992990
	DD	1053697164
	DD	1053407678
	DD	1053124394
	DD	1052847181
	DD	1052575908
	DD	1052310447
	DD	1052050675
	DD	1051796470
	DD	1051547711
	DD	1051304283
	DD	1051066071
	DD	1050832963
	DD	1050604850
	DD	1050381626
	DD	1050163184
	DD	1049949424
	DD	1049740243
	DD	1049535546
	DD	1049335234
	DD	1049139215
	DD	1048947395
	DD	1048759687
	DD	1220542464
	DD	1220542464
	DD	1220542464
	DD	1220542464
	DD	1220542464
	DD	1220542464
	DD	1220542464
	DD	1220542464
	DD	1220542464
	DD	1220542464
	DD	1220542464
	DD	1220542464
	DD	1220542464
	DD	1220542464
	DD	1220542464
	DD	1220542464
	DD	31
	DD	31
	DD	31
	DD	31
	DD	31
	DD	31
	DD	31
	DD	31
	DD	31
	DD	31
	DD	31
	DD	31
	DD	31
	DD	31
	DD	31
	DD	31
	DD	1118743630
	DD	1118743630
	DD	1118743630
	DD	1118743630
	DD	1118743630
	DD	1118743630
	DD	1118743630
	DD	1118743630
	DD	1118743630
	DD	1118743630
	DD	1118743630
	DD	1118743630
	DD	1118743630
	DD	1118743630
	DD	1118743630
	DD	1118743630
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1056964879
	DD	1056964879
	DD	1056964879
	DD	1056964879
	DD	1056964879
	DD	1056964879
	DD	1056964879
	DD	1056964879
	DD	1056964879
	DD	1056964879
	DD	1056964879
	DD	1056964879
	DD	1056964879
	DD	1056964879
	DD	1056964879
	DD	1056964879
	DD	1042983629
	DD	1042983629
	DD	1042983629
	DD	1042983629
	DD	1042983629
	DD	1042983629
	DD	1042983629
	DD	1042983629
	DD	1042983629
	DD	1042983629
	DD	1042983629
	DD	1042983629
	DD	1042983629
	DD	1042983629
	DD	1042983629
	DD	1042983629
	DD	1069066811
	DD	1069066811
	DD	1069066811
	DD	1069066811
	DD	1069066811
	DD	1069066811
	DD	1069066811
	DD	1069066811
	DD	1069066811
	DD	1069066811
	DD	1069066811
	DD	1069066811
	DD	1069066811
	DD	1069066811
	DD	1069066811
	DD	1069066811
	DD	849703008
	DD	849703008
	DD	849703008
	DD	849703008
	DD	849703008
	DD	849703008
	DD	849703008
	DD	849703008
	DD	849703008
	DD	849703008
	DD	849703008
	DD	849703008
	DD	849703008
	DD	849703008
	DD	849703008
	DD	849703008
	DD	1060204544
	DD	1060204544
	DD	1060204544
	DD	1060204544
	DD	1060204544
	DD	1060204544
	DD	1060204544
	DD	1060204544
	DD	1060204544
	DD	1060204544
	DD	1060204544
	DD	1060204544
	DD	1060204544
	DD	1060204544
	DD	1060204544
	DD	1060204544
	DD	939916788
	DD	939916788
	DD	939916788
	DD	939916788
	DD	939916788
	DD	939916788
	DD	939916788
	DD	939916788
	DD	939916788
	DD	939916788
	DD	939916788
	DD	939916788
	DD	939916788
	DD	939916788
	DD	939916788
	DD	939916788
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	2147483648
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	3212836864
	DD	3212836864
	DD	3212836864
	DD	3212836864
	DD	3212836864
	DD	3212836864
	DD	3212836864
	DD	3212836864
	DD	3212836864
	DD	3212836864
	DD	3212836864
	DD	3212836864
	DD	3212836864
	DD	3212836864
	DD	3212836864
	DD	3212836864
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	1228931072
	DD	1228931072
	DD	1228931072
	DD	1228931072
	DD	1228931072
	DD	1228931072
	DD	1228931072
	DD	1228931072
	DD	1228931072
	DD	1228931072
	DD	1228931072
	DD	1228931072
	DD	1228931072
	DD	1228931072
	DD	1228931072
	DD	1228931072
	DD	255
	DD	255
	DD	255
	DD	255
	DD	255
	DD	255
	DD	255
	DD	255
	DD	255
	DD	255
	DD	255
	DD	255
	DD	255
	DD	255
	DD	255
	DD	255
	DD	1118922496
	DD	1118922496
	DD	1118922496
	DD	1118922496
	DD	1118922496
	DD	1118922496
	DD	1118922496
	DD	1118922496
	DD	1118922496
	DD	1118922496
	DD	1118922496
	DD	1118922496
	DD	1118922496
	DD	1118922496
	DD	1118922496
	DD	1118922496
	DD	944570348
	DD	870537889
	DD	1056963788
	DD	988584323
	DD	3089368227
	DD	1026654286
	DD	1056972809
	DD	1005362723
	DD	3089410886
	DD	1035053812
	DD	1056996444
	DD	1013759196
	DD	3089450701
	DD	1040545168
	DD	1057035884
	DD	1018294210
	DD	3089519489
	DD	1043486152
	DD	1057091204
	DD	1022210002
	DD	3089622651
	DD	1046449073
	DD	1057162508
	DD	1024792095
	DD	3089732783
	DD	1049007747
	DD	1057249929
	DD	1026787500
	DD	3089879760
	DD	1050519514
	DD	1057353632
	DD	1028802193
	DD	3090009552
	DD	1052050675
	DD	1057473810
	DD	1030843673
	DD	3090201654
	DD	1053604104
	DD	1057610691
	DD	1032358162
	DD	3090393038
	DD	1055182718
	DD	1057764530
	DD	1033401816
	DD	3090624519
	DD	1056789478
	DD	1057935617
	DD	1034476232
	DD	3090859136
	DD	1057696005
	DD	1058124272
	DD	1035562860
	DD	3091126256
	DD	1058532085
	DD	1058330850
	DD	1036689182
	DD	3091401474
	DD	1059386854
	DD	1058555738
	DD	1037824061
	DD	3091713853
	DD	1060261915
	DD	1058799359
	DD	1038999406
	DD	3092054410
	DD	1061158912
	DD	1059062170
	DD	1040187520
	DD	3092413532
	DD	1062079528
	DD	1059344664
	DD	1040796570
	DD	3092816174
	DD	1063025490
	DD	1059647372
	DD	1041432479
	DD	3093223701
	DD	1063998575
	DD	1059970861
	DD	1042082428
	DD	3093662789
	DD	1065000609
	DD	1060315739
	DD	1042753182
	DD	3094122539
	DD	1065693345
	DD	1060682653
	DD	1043434554
	DD	3094645738
	DD	1066226161
	DD	1061072293
	DD	1044155985
	DD	3095155406
	DD	1066776362
	DD	1061485388
	DD	1044890780
	DD	3095550555
	DD	1067344981
	DD	1061922715
	DD	1045635453
	DD	3095847386
	DD	1067933084
	DD	1062385095
	DD	1046418690
	DD	3096168298
	DD	1068541775
	DD	1062873396
	DD	1047240047
	DD	3096488137
	DD	1069172198
	DD	1063388533
	DD	1048071426
	DD	3096841182
	DD	1069825535
	DD	1063931475
	DD	1048758942
	DD	3097209475
	DD	1070503013
	DD	1064503240
	DD	1049207926
	DD	3097589791
	DD	1071205903
	DD	1065104901
	DD	1049678351
	DD	3097993402
	DD	1071935525
	DD	1065545402
	DD	1050164645
	DD	3098411341
	DD	1072693248
	DD	1065877852
	DD	1050673310
	DD	3098859808
	DD	1073480495
	DD	1066227033
	DD	1051198081
	DD	3099325394
	DD	1074020284
	DD	1066593600
	DD	1051736997
	DD	3099839474
	DD	1074445677
	DD	1066978242
	DD	1052300332
	DD	3100370328
	DD	1074888136
	DD	1067381680
	DD	1052909383
	DD	3100909820
	DD	1075348494
	DD	1067804671
	DD	1053514627
	DD	3101459594
	DD	1075827613
	DD	1068248009
	DD	1054160592
	DD	3102047769
	DD	1076326394
	DD	1068712527
	DD	1054814464
	DD	3102677758
	DD	1076845772
	DD	1069199097
	DD	1055502910
	DD	3103340170
	DD	1077386722
	DD	1069708632
	DD	1056225281
	DD	3103903569
	DD	1077950259
	DD	1070242088
	DD	1056977834
	DD	3104249593
	DD	1078537443
	DD	1070800466
	DD	1057360587
	DD	3104632246
	DD	1079149373
	DD	1071384816
	DD	1057776467
	DD	3105038122
	DD	1079787200
	DD	1071996234
	DD	1058202023
	DD	3105440616
	DD	1080452121
	DD	1072635866
	DD	1058640522
	DD	3105862938
	DD	1081145383
	DD	1073304914
	DD	1059104028
	DD	3106308416
	DD	1081868288
	DD	1073873229
	DD	1059586215
	DD	3106787412
	DD	1082376312
	DD	1074239082
	DD	1060097588
	DD	3107276928
	DD	1082769472
	DD	1074621614
	DD	1060619929
	DD	3107776680
	DD	1083179578
	DD	1075021543
	DD	1061153935
	DD	3108330475
	DD	1083607398
	DD	1075439621
	DD	1061737331
	DD	3108881710
	DD	1084053737
	DD	1075876631
	DD	1062331214
	DD	3109487286
	DD	1084519432
	DD	1076333395
	DD	1062953203
	DD	3110070509
	DD	1085005358
	DD	1076810768
	DD	1063586843
	DD	3110728850
	DD	1085512425
	DD	1077309649
	DD	1064276575
	DD	3111383871
	DD	1086041587
	DD	1077830972
	DD	1064978612
	DD	3112084118
	DD	1086593836
	DD	1078375717
	DD	1065536743
	DD	3112493703
	DD	1087170210
	DD	1078944906
	DD	1065913820
	DD	3112867371
	DD	1087771789
	DD	1079539607
	DD	1066317189
	DD	3113278547
	DD	1088399703
	DD	1080160938
	DD	1066739445
	DD	3113690682
	DD	1089055131
	DD	1080810063
	DD	1067177635
	DD	3114113585
	DD	1089739304
	DD	1081488201
	DD	1067625214
	DD	3114565947
	DD	1090453504
	DD	1082163529
	DD	1068105897
	DD	3115052575
	DD	1090859057
	DD	1082533550
	DD	1068596020
	DD	3115539880
	DD	1091248226
	DD	1082920073
	DD	1069111659
	DD	3116077017
	DD	1091654509
	DD	1083323825
	DD	1069663909
	DD	3116603774
	DD	1092078670
	DD	1083745562
	DD	1070225544
	DD	3117166138
	DD	1092521504
	DD	1084186077
	DD	1070821702
	DD	3117769278
	DD	1092983843
	DD	1084646197
	DD	1071437696
	DD	3118359457
	DD	1093466555
	DD	1085126784
	DD	1072071392
	DD	3119000307
	DD	1093970545
	DD	1085628742
	DD	1072746100
	DD	3119686251
	DD	1094496760
	DD	1086153013
	DD	1073443058
	DD	3120382865
	DD	1095046187
	DD	1086700580
	DD	1073960254
	DD	3120829800
	DD	1095619858
	DD	1087272471
	DD	1074341025
	DD	3121221705
	DD	1096218849
	DD	1087869761
	DD	1074743826
	DD	3121630109
	DD	1096844285
	DD	1088493570
	DD	1075162699
	DD	3122040558
	DD	1097497340
	DD	1089145068
	DD	1075598254
	DD	3122471799
	DD	1098179240
	DD	1089825479
	DD	1076049525
	DD	3122921786
	DD	1098891264
	DD	1090527560
	DD	1076527273
	DD	3123410322
	DD	1099271199
	DD	1090898623
	DD	1077017199
	DD	3123905268
	DD	1099659370
	DD	1091286144
	DD	1077536277
	DD	3124427171
	DD	1100064698
	DD	1091690851
	DD	1078077742
	DD	3124955362
	DD	1100487944
	DD	1092113503
	DD	1078639053
	DD	3125512315
	DD	1100929902
	DD	1092554894
	DD	1079230664
	DD	3126114846
	DD	1101391402
	DD	1093015853
	DD	1079845159
	DD	3126723150
	DD	1101873310
	DD	1093497244
	DD	1080489100
	DD	3127384205
	DD	1102376531
	DD	1093999972
	DD	1081154940
	DD	3128045109
	DD	1102902009
	DD	1094524979
	DD	1081855739
	DD	3128757202
	DD	1103450730
	DD	1095073252
	DD	1082365260
	DD	3129233957
	DD	1104023725
	DD	1095645820
	DD	1082749515
	DD	3129593552
	DD	1104622070
	DD	1096243755
	DD	1083141940
	DD	3130009456
	DD	1105246886
	DD	1096868184
	DD	1083565083
	DD	3130431772
	DD	1105899348
	DD	1097520276
	DD	1083997423
	DD	3130861002
	DD	1106580680
	DD	1098201255
	DD	1084447059
	DD	3131310395
	DD	1107292160
	DD	1098910024
	DD	1084924074
	DD	3131783023
	DD	1107665690
	DD	1099281347
	DD	1085424177
	DD	3132296264
	DD	1108053612
	DD	1099669118
	DD	1085933889
	DD	3132789780
	DD	1108458701
	DD	1100074063
	DD	1086477769
	DD	3133359295
	DD	1108881718
	DD	1100496945
	DD	1087044117
	DD	3133914895
	DD	1109323457
	DD	1100938555
	DD	1087634592
	DD	3134525467
	DD	1109784747
	DD	1101399724
	DD	1088253827
	DD	3135105529
	DD	1110266455
	DD	1101881315
	DD	1088879869
	DD	3135755251
	DD	1110769483
	DD	1102384235
	DD	1089558833
	DD	3136442666
	DD	1111294777
	DD	1102909427
	DD	1090255482
	DD	3137142241
	DD	1111843322
	DD	1103457876
	DD	1090755410
	DD	3137605970
	DD	1112416148
	DD	1104030612
	DD	1091140533
	DD	3137986162
	DD	1113014331
	DD	1104628710
	DD	1091535483
	DD	3138387555
	DD	1113638993
	DD	1105253293
	DD	1091949463
	DD	3138804646
	DD	1114291306
	DD	1105905533
	DD	1092388670
	DD	3139233372
	DD	1114972496
	DD	1106586654
	DD	1092837897
	DD	3139699003
	DD	1115683840
	DD	1107297096
	DD	1093314730
	DD	3140167653
	DD	1116055769
	DD	1107668484
	DD	1093812263
	DD	3140669084
	DD	1116443628
	DD	1108056317
	DD	1094334974
	DD	3141171888
	DD	1116848658
	DD	1108461322
	DD	1094864117
	DD	3141735347
	DD	1117271618
	DD	1108884261
	DD	1095426609
	DD	3142298803
	DD	1117713302
	DD	1109325926
	DD	1096021914
	DD	3142894998
	DD	1118174540
	DD	1109787147
	DD	1096632105
	DD	3143500773
	DD	1118656197
	DD	1110268789
	DD	1097274132
	DD	3144147662
	DD	1119159177
	DD	1110771757
	DD	1097951263
	DD	3144833512
	DD	1119684425
	DD	1111296995
	DD	1098646873
	DD	3145529957
	DD	1120232926
	DD	1111845488
	DD	1099144404
	DD	3145990428
	DD	1120805710
	DD	1112418266
	DD	1099527187
	DD	3146379868
	DD	1121403852
	DD	1113016405
	DD	1099927882
	DD	3146785826
	DD	1122028475
	DD	1113641027
	DD	1100344686
	DD	3147185223
	DD	1122680752
	DD	1114293303
	DD	1100772823
	DD	3147622018
	DD	1123361906
	DD	1114974460
	DD	1101227063
	DD	3148087611
	DD	1124073216
	DD	1115685320
	DD	1101703851
	DD	3148547074
	DD	1124444745
	DD	1116056724
	DD	1102195626
	DD	3149061936
	DD	1124832589
	DD	1116444573
	DD	1102706245
	DD	3149567064
	DD	1125237603
	DD	1116849593
	DD	1103257276
	DD	3150120816
	DD	1125660549
	DD	1117272546
	DD	1103813688
	DD	3150694429
	DD	1126102219
	DD	1117714225
	DD	1104415316
	DD	3151287031
	DD	1126563444
	DD	1118175459
	DD	1105023245
	DD	3151907427
	DD	1127045088
	DD	1118657114
	DD	1105674384
	DD	3152520833
	DD	1127548057
	DD	1119160093
	DD	1106330596
	DD	3153222679
	DD	1128073293
	DD	1119685343
	DD	1107036177
	DD	3153918342
	DD	1128621783
	DD	1120233847
	DD	1107533108
	DD	3154369806
	DD	1129194557
	DD	1120806635
	DD	1107910191
	DD	3154757460
	DD	1129792689
	DD	1121404784
	DD	1108309765
	DD	3155168656
	DD	1130417302
	DD	1122029416
	DD	1108729833
	DD	3155580017
	DD	1131069569
	DD	1122681702
	DD	1109165432
	DD	3156018828
	DD	1131750714
	DD	1123362868
	DD	1109620926
	DD	3156476219
	DD	1132462016
	DD	1124073832
	DD	1110092587
	DD	3156933385
	DD	1132833445
	DD	1124445240
	DD	1110582922
	DD	3157451606
	DD	1133221285
	DD	1124833093
	DD	1111095633
	DD	3157965508
	DD	1133626295
	DD	1125238117
	DD	1111652137
	DD	3158533220
	DD	1134049237
	DD	1125661074
	DD	1112217259
	DD	3159060211
	DD	1134490905
	DD	1126102755
	DD	1112789777
	DD	3159676495
	DD	1134952126
	DD	1126563993
	DD	1113412486
	DD	3160292353
	DD	1135433767
	DD	1127045651
	DD	1114060788
	DD	3160905582
	DD	1135936733
	DD	1127548633
	DD	1114716886
	DD	3161611427
	DD	1136461966
	DD	1128073886
	DD	1115424959
	DD	3162315088
	DD	1137010453
	DD	1128622393
	DD	1115924298
	DD	3162768396
	DD	1137583224
	DD	1129195184
	DD	1116305071
	DD	3163147411
	DD	1138181354
	DD	1129793335
	DD	1116699250
	DD	3163551723
	DD	1138805965
	DD	1130417969
	DD	1117115018
	DD	3163974268
	DD	1139458229
	DD	1131070258
	DD	1117557598
	DD	3164409487
	DD	1140139372
	DD	1131751426
	DD	1118010847
	DD	3164864827
	DD	1140850672
	DD	1132462416
	DD	1118481227
	DD	3165321418
	DD	1141222076
	DD	1132833825
	DD	1118971202
	DD	3165840479
	DD	1141609915
	DD	1133221679
	DD	1119484436
	DD	3166356575
	DD	1142014924
	DD	1133626704
	DD	1120042308
	DD	3166895003
	DD	1142437866
	DD	1134049661
	DD	1120589147
	DD	3167459500
	DD	1142879532
	DD	1134491344
	DD	1121185079
	DD	3168048930
	DD	1143340753
	DD	1134952582
	DD	1121791022
	DD	3168671847
	DD	1143822393
	DD	1135434241
	DD	1122443730
	DD	3169293226
	DD	1144325358
	DD	1135937224
	DD	1123104914
	DD	3170008263
	DD	1144850590
	DD	1136462478
	DD	1123818726
	DD	3170689344
	DD	1145399077
	DD	1137010985
	DD	1124308436
	DD	3171155403
	DD	1145971847
	DD	1137583777
	DD	1124692689
	DD	3171540451
	DD	1146569976
	DD	1138181929
	DD	1125090634
	DD	3171951236
	DD	1147194586
	DD	1138806564
	DD	1125510443
	DD	3172347900
	DD	1147846851
	DD	1139458852
	DD	1125936865
	DD	3172790414
	DD	1148527993
	DD	1140140021
	DD	1126394668
	DD	3173253435
	DD	1149239292
	DD	1140851018
	DD	1126869843
	DD	3173701689
	DD	1149610690
	DD	1141222427
	DD	1127354613
	DD	3174212768
	DD	1149998528
	DD	1141610281
	DD	1127883320
	DD	3174721217
	DD	1150403538
	DD	1142015306
	DD	1128415961
	DD	3175285098
	DD	1150826479
	DD	1142438264
	DD	1128978690
	DD	3175842584
	DD	1151268145
	DD	1142879947
	DD	1129570245
	DD	3176458075
	DD	1151729365
	DD	1143341186
	DD	1130192458
	DD	3177074563
	DD	1152211005
	DD	1143822845
	DD	1130841152
	DD	3177689786
	DD	1152713970
	DD	1144325828
	DD	1131498492
	DD	3178398928
	DD	1153239202
	DD	1144851082
	DD	1132208623
	DD	3179074364
	DD	1153787689
	DD	1145399589
	DD	1132695927
	DD	3179539514
	DD	1154360459
	DD	1145972381
	DD	1133078492
	DD	3179921974
	DD	1154958588
	DD	1146570533
	DD	1133474821
	DD	3180330280
	DD	1155583198
	DD	1147195168
	DD	1133893083
	DD	3180740958
	DD	1156235462
	DD	1147847457
	DD	1134328253
	DD	3181181199
	DD	1156916604
	DD	1148528626
	DD	1134784637
	DD	3181625657
	DD	1157627903
	DD	1149239624
	DD	1135258451
	DD	3182104600
	DD	1157999299
	DD	1149611034
	DD	1135752152
	DD	3182613683
	DD	1158387137
	DD	1149998888
	DD	1136279613
	DD	3183120221
	DD	1158792147
	DD	1150403913
	DD	1136811061
	DD	3183682271
	DD	1159215088
	DD	1150826871
	DD	1137372647
	DD	3184238005
	DD	1159656754
	DD	1151268554
	DD	1137963108
	DD	3184851817
	DD	1160117974
	DD	1151729793
	DD	1138584273
	DD	3185433925
	DD	1160599615
	DD	1152211451
	DD	1139211502
	DD	3186080382
	DD	1161102579
	DD	1152714435
	DD	1139888343
	DD	3186788050
	DD	1161627811
	DD	1153239689
	DD	1140597554
	DD	3187462075
	DD	1162176298
	DD	1153788196
	DD	1141084255
	DD	3187926998
	DD	1162749068
	DD	1154360988
	DD	1141466399
	DD	3188308811
	DD	1163347197
	DD	1154959140
	DD	1141862324
	DD	3188716497
	DD	1163971807
	DD	1155583775
	DD	1142280199
	DD	3189126581
	DD	1164624071
	DD	1156236064
	DD	1142714999
	DD	3189566254
	DD	1165305213
	DD	1156917233
	DD	1143171028
	DD	3190026555
	DD	1166016512
	DD	1157628232
	DD	1143644503
	DD	3190504977
	DD	1166387907
	DD	1157999642
	DD	1144148108
	DD	3190980787
	DD	1166775746
	DD	1158387495
	DD	1144654797
	DD	3191519621
	DD	1167180755
	DD	1158792521
	DD	1145206407
	DD	3192081214
	DD	1167603696
	DD	1159215479
	DD	1145767708
	DD	3192636510
	DD	1168045362
	DD	1159657162
	DD	1146357895
	DD	3193217128
	DD	1168506583
	DD	1160118400
	DD	1146958337
	DD	3193831608
	DD	1168988223
	DD	1160600059
	DD	1147605777
	DD	3194477680
	DD	1169491187
	DD	1161103043
	DD	1148282377
	DD	3195152207
	DD	1170016420
	DD	1161628296
	DD	1148970897
	DD	3195858652
	DD	1170564906
	DD	1162176804
	DD	1149475351
	DD	3196319422
	DD	1171137676
	DD	1162749596
	DD	1149857389
	DD	3196701072
	DD	1171735805
	DD	1163347748
	DD	1150253213
	DD	3197108604
	DD	1172360415
	DD	1163972383
	DD	1150670991
	DD	3197518540
	DD	1173012679
	DD	1164624672
	DD	1151105698
	DD	3197958071
	DD	1173693821
	DD	1165305841
	DD	1151561639
	DD	3198418235
	DD	1174405120
	DD	1166016840
	DD	1152035030
	DD	3198896527
	DD	1174776515
	DD	1166388250
	DD	1152538553
	DD	3199372213
	DD	1175164354
	DD	1166776103
	DD	1153045164
	DD	3199910927
	DD	1175569363
	DD	1167181129
	DD	1153596699
	DD	3200472406
	DD	1175992304
	DD	1167604087
	DD	1154157929
	DD	3201027592
	DD	1176433970
	DD	1168045770
	DD	1154748047
	DD	3201608106
	DD	1176895191
	DD	1168507008
	DD	1155348424
	DD	3202222485
	DD	1177376831
	DD	1168988667
	DD	1155995801
	DD	3202868461
	DD	1177879795
	DD	1169491651
	DD	1156672341
	DD	3203542895
	DD	1178405028
	DD	1170016904
	DD	1157360804
	DD	3204249252
	DD	1178953514
	DD	1170565412
	DD	1157864581
	DD	3204708983
	DD	1179526284
	DD	1171138204
	DD	1158246593
	DD	3205090594
	DD	1180124413
	DD	1171736356
	DD	1158642392
	DD	3205498087
	DD	1180749023
	DD	1172360991
	DD	1159060145
	DD	3205907986
	DD	1181401287
	DD	1173013280
	DD	1159494829
	DD	3206347481
	DD	1182082429
	DD	1173694449
	DD	1159950748
	DD	3206807611
	DD	1182793728
	DD	1174405448
	DD	1160424117
	DD	3207285871
	DD	1183165123
	DD	1174776858
	DD	1160927621
	DD	3207761525
	DD	1183552962
	DD	1175164711
	DD	1161434212
	DD	3208300209
	DD	1183957971
	DD	1175569737
	DD	1161985728
	DD	3208861660
	DD	1184380912
	DD	1175992695
	DD	1162546940
	DD	3209416818
	DD	1184822578
	DD	1176434378
	DD	1163137042
	DD	3209997306
	DD	1185283799
	DD	1176895616
	DD	1163737402
	DD	3210611660
	DD	1185765439
	DD	1177377275
	DD	1164384763
	DD	3211257612
	DD	1186268403
	DD	1177880259
	DD	1165061288
	DD	3211932023
	DD	1186793636
	DD	1178405512
	DD	1165749736
	DD	3212638358
	DD	1187342122
	DD	1178954020
	DD	1166253344
	DD	3213097830
	DD	1187914892
	DD	1179526812
	DD	1166635350
	DD	3213479430
	DD	1188513021
	DD	1180124964
	DD	1167031142
	DD	3213886913
	DD	1189137631
	DD	1180749599
	DD	1167448890
	DD	3214296803
	DD	1189789895
	DD	1181401888
	DD	1167883568
	DD	3214736289
	DD	1190471037
	DD	1182083057
	DD	1168339481
_vmldCoshHATab	DD	0
	DD	1072693248
	DD	0
	DD	0
	DD	1048019041
	DD	1072704666
	DD	1398474845
	DD	3161559171
	DD	3541402996
	DD	1072716208
	DD	2759177317
	DD	1015903202
	DD	410360776
	DD	1072727877
	DD	1269990655
	DD	1013024446
	DD	1828292879
	DD	1072739672
	DD	1255956747
	DD	1016636974
	DD	852742562
	DD	1072751596
	DD	667253587
	DD	1010842135
	DD	3490863953
	DD	1072763649
	DD	960797498
	DD	3163997456
	DD	2930322912
	DD	1072775834
	DD	2599499422
	DD	3163762623
	DD	1014845819
	DD	1072788152
	DD	3117910646
	DD	3162607681
	DD	3949972341
	DD	1072800603
	DD	2068408548
	DD	1015962444
	DD	828946858
	DD	1072813191
	DD	10642492
	DD	1016988014
	DD	2288159958
	DD	1072825915
	DD	2169144469
	DD	1015924597
	DD	1853186616
	DD	1072838778
	DD	3066496371
	DD	1016705150
	DD	1709341917
	DD	1072851781
	DD	2571168217
	DD	1015201075
	DD	4112506593
	DD	1072864925
	DD	2947355221
	DD	1015419624
	DD	2799960843
	DD	1072878213
	DD	1423655381
	DD	1016070727
	DD	171030293
	DD	1072891646
	DD	3526460132
	DD	1015477354
	DD	2992903935
	DD	1072905224
	DD	2218154406
	DD	1016276769
	DD	926591435
	DD	1072918951
	DD	3208833762
	DD	3163962090
	DD	887463927
	DD	1072932827
	DD	3596744163
	DD	3161842742
	DD	1276261410
	DD	1072946854
	DD	300981948
	DD	1015732745
	DD	569847338
	DD	1072961034
	DD	472945272
	DD	3160339305
	DD	1617004845
	DD	1072975368
	DD	82804944
	DD	1011391354
	DD	3049340112
	DD	1072989858
	DD	3062915824
	DD	1014219171
	DD	3577096743
	DD	1073004506
	DD	2951496418
	DD	1014842263
	DD	1990012071
	DD	1073019314
	DD	3529070563
	DD	3163861769
	DD	1453150082
	DD	1073034283
	DD	498154669
	DD	3162536638
	DD	917841882
	DD	1073049415
	DD	18715565
	DD	1016707884
	DD	3712504873
	DD	1073064711
	DD	88491949
	DD	1016476236
	DD	363667784
	DD	1073080175
	DD	813753950
	DD	1016833785
	DD	2956612997
	DD	1073095806
	DD	2118169751
	DD	3163784129
	DD	2186617381
	DD	1073111608
	DD	2270764084
	DD	3164321289
	DD	1719614413
	DD	1073127582
	DD	330458198
	DD	3164331316
	DD	1013258799
	DD	1073143730
	DD	1748797611
	DD	3161177658
	DD	3907805044
	DD	1073160053
	DD	2257091225
	DD	3162598983
	DD	1447192521
	DD	1073176555
	DD	1462857171
	DD	3163563097
	DD	1944781191
	DD	1073193236
	DD	3993278767
	DD	3162772855
	DD	919555682
	DD	1073210099
	DD	3121969534
	DD	1013996802
	DD	2571947539
	DD	1073227145
	DD	3558159064
	DD	3164425245
	DD	2604962541
	DD	1073244377
	DD	2614425274
	DD	3164587768
	DD	1110089947
	DD	1073261797
	DD	1451641639
	DD	1016523249
	DD	2568320822
	DD	1073279406
	DD	2732824428
	DD	1015401491
	DD	2966275557
	DD	1073297207
	DD	2176155324
	DD	3160891335
	DD	2682146384
	DD	1073315202
	DD	2082178513
	DD	3164411995
	DD	2191782032
	DD	1073333393
	DD	2960257726
	DD	1014791238
	DD	2069751141
	DD	1073351782
	DD	1562170675
	DD	3163773257
	DD	2990417245
	DD	1073370371
	DD	3683467745
	DD	3164417902
	DD	1434058175
	DD	1073389163
	DD	251133233
	DD	1016134345
	DD	2572866477
	DD	1073408159
	DD	878562433
	DD	1016570317
	DD	3092190715
	DD	1073427362
	DD	814012168
	DD	3160571998
	DD	4076559943
	DD	1073446774
	DD	2119478331
	DD	3161806927
	DD	2420883922
	DD	1073466398
	DD	2049810052
	DD	1015168464
	DD	3716502172
	DD	1073486235
	DD	2303740125
	DD	1015091301
	DD	777507147
	DD	1073506289
	DD	4282924205
	DD	1016236109
	DD	3706687593
	DD	1073526560
	DD	3521726939
	DD	1014301643
	DD	1242007932
	DD	1073547053
	DD	1132034716
	DD	3164388407
	DD	3707479175
	DD	1073567768
	DD	3613079303
	DD	1015213314
	DD	64696965
	DD	1073588710
	DD	1768797490
	DD	1016865536
	DD	863738719
	DD	1073609879
	DD	1326992220
	DD	3163661773
	DD	3884662774
	DD	1073631278
	DD	2158611599
	DD	1015258761
	DD	2728693978
	DD	1073652911
	DD	396109971
	DD	3164511267
	DD	3999357479
	DD	1073674779
	DD	2258941616
	DD	1016973300
	DD	1533953344
	DD	1073696886
	DD	769171851
	DD	1016714209
	DD	2174652632
	DD	1073719233
	DD	4087714590
	DD	1015498835
	DD	0
	DD	1073741824
	DD	0
	DD	0
	DD	1697350398
	DD	1079448903
	DD	0
	DD	1127743488
	DD	0
	DD	1071644672
	DD	1431652600
	DD	1069897045
	DD	1431670732
	DD	1067799893
	DD	984555731
	DD	1065423122
	DD	472530941
	DD	1062650218
	DD	2684354560
	DD	1079401119
	DD	4277796864
	DD	1065758274
	DD	3164486458
	DD	1025308570
	DD	4294967295
	DD	2146435071
	DD	0
	DD	0
	DD	0
	DD	1072693248
	DD	3875694624
	DD	1077247184
_RDATA	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS
EXTRN	__ImageBase:PROC
EXTRN	_fltused:BYTE
	ENDIF
	END
