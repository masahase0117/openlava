/*
 * Copyright (C) 2012 Masahiro HASEGAWA
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of version 2 of the GNU General Public License as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA
 *
 */

#ifndef _LIM_RLOAD_H
#define _LIM_RLOAD_H

#define  EXP3   0.716531311
#define  EXP4   0.77880078
#define  EXP6   0.846481725
#define  EXP12  0.920044415
#define  EXP180 0.994459848

extern float k_hz;
extern void smooth(float*, float, float);
#endif

