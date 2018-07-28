/*
 * Copyright (c) 1997, 2018, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 *
 */

// This file is used to provide some global declarations related to building
// VM with Vector API support. Also, the reason the file is separated is because
// the intent of this file to provide a header that can be included in .s files.

#ifndef SHARE_VM_UTILITIES_GLOBALDEFINITIONS_VECAPI_HPP
#define SHARE_VM_UTILITIES_GLOBALDEFINITIONS_VECAPI_HPP

// VS2013 required to build .s files for math intrinsics
#if defined(_WIN64) && (defined(_MSC_VER) && (_MSC_VER >= 1800))
#define __VECTOR_API_MATH_INTRINSICS_COMMON
#define __VECTOR_API_MATH_INTRINSICS_WINDOWS
#endif

// GCC 4.9+ can build all .s files for Linux
#if defined(LINUX) && defined(AMD64) && (defined(__GNUC__) && (__GNUC__ >= 4))
#define __VECTOR_API_MATH_INTRINSICS_COMMON
#define __VECTOR_API_MATH_INTRINSICS_LINUX
#endif

#endif // SHARE_VM_UTILITIES_GLOBALDEFINITIONS_VECAPI_HPP
