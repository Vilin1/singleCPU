
p
Command: %s
53*	vivadotcl2B
.synth_design -top CPUTOP -part xc7a35tcpg236-12default:defaultZ4-113h px
7
Starting synth_design
149*	vivadotclZ4-321h px
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-347h px
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-349h px
�
�The version limit for your license is '%s' and will expire in %s days. A version limit expiration means that, although you may be able to continue to use the current version of tools or IP with this license, you will not be eligible for any updates or new releases.
519*common2
2017.032default:default2
-4142default:defaultZ17-1223h px
�
=concatenation with unsized literal; will interpret as 32 bits1849*oasys2N
8D:/vivado/CPU/CPU.srcs/sources_1/new/decodeInstruction.v2default:default2
442default:default8@Z8-1849h px
�
=concatenation with unsized literal; will interpret as 32 bits1849*oasys2N
8D:/vivado/CPU/CPU.srcs/sources_1/new/decodeInstruction.v2default:default2
442default:default8@Z8-1849h px
�
%s*synth2�
rStarting Synthesize : Time (s): cpu = 00:00:04 ; elapsed = 00:00:06 . Memory (MB): peak = 274.164 ; gain = 96.340
2default:defaulth px
�
synthesizing module '%s'638*oasys2
CPUTOP2default:default2@
*D:/vivado/CPU/CPU.srcs/sources_1/new/CPU.v2default:default2
232default:default8@Z8-638h px
�
synthesizing module '%s'638*oasys2%
instructionMemory2default:default2N
8D:/vivado/CPU/CPU.srcs/sources_1/new/instructionMemory.v2default:default2
232default:default8@Z8-638h px
�
ignoring %s2898*oasys2@
,malformed $readmem task: invalid memory name2default:default2N
8D:/vivado/CPU/CPU.srcs/sources_1/new/instructionMemory.v2default:default2
312default:default8@Z8-2898h px
�
8referenced signal '%s' should be on the sensitivity list567*oasys2
storage2default:default2N
8D:/vivado/CPU/CPU.srcs/sources_1/new/instructionMemory.v2default:default2
332default:default8@Z8-567h px
�
8referenced signal '%s' should be on the sensitivity list567*oasys2
IDataOut2default:default2N
8D:/vivado/CPU/CPU.srcs/sources_1/new/instructionMemory.v2default:default2
332default:default8@Z8-567h px
�
%done synthesizing module '%s' (%s#%s)256*oasys2%
instructionMemory2default:default2
12default:default2
12default:default2N
8D:/vivado/CPU/CPU.srcs/sources_1/new/instructionMemory.v2default:default2
232default:default8@Z8-256h px
�
synthesizing module '%s'638*oasys2
ALU322default:default2B
,D:/vivado/CPU/CPU.srcs/sources_1/new/ALU32.v2default:default2
232default:default8@Z8-638h px
�
%done synthesizing module '%s' (%s#%s)256*oasys2
ALU322default:default2
22default:default2
12default:default2B
,D:/vivado/CPU/CPU.srcs/sources_1/new/ALU32.v2default:default2
232default:default8@Z8-256h px
�
synthesizing module '%s'638*oasys2
controlUnit2default:default2H
2D:/vivado/CPU/CPU.srcs/sources_1/new/controlUnit.v2default:default2
232default:default8@Z8-638h px
�
%done synthesizing module '%s' (%s#%s)256*oasys2
controlUnit2default:default2
32default:default2
12default:default2H
2D:/vivado/CPU/CPU.srcs/sources_1/new/controlUnit.v2default:default2
232default:default8@Z8-256h px
�
synthesizing module '%s'638*oasys2
RAM2default:default2@
*D:/vivado/CPU/CPU.srcs/sources_1/new/RAM.v2default:default2
232default:default8@Z8-638h px
�
qTrying to implement RAM '%s' in registers. Block RAM or DRAM implementation is not possible; see log for reasons.3901*oasys2
ram_reg2default:defaultZ8-4767h px
R
%s*synth2=
)Reason is one or more of the following :
2default:defaulth px
�
%s*synth2�
~	1: RAM has multiple writes via different ports in same process. If RAM inferencing intended, write to one port per process. 
2default:defaulth px
g
%s*synth2R
>	2: Unable to determine number of words or word size in RAM. 
2default:defaulth px
P
%s*synth2;
'RAM "ram_reg" dissolved into registers
2default:defaulth px
�
%done synthesizing module '%s' (%s#%s)256*oasys2
RAM2default:default2
42default:default2
12default:default2@
*D:/vivado/CPU/CPU.srcs/sources_1/new/RAM.v2default:default2
232default:default8@Z8-256h px
�
synthesizing module '%s'638*oasys2
PC2default:default2?
)D:/vivado/CPU/CPU.srcs/sources_1/new/PC.v2default:default2
232default:default8@Z8-638h px
�
%done synthesizing module '%s' (%s#%s)256*oasys2
PC2default:default2
52default:default2
12default:default2?
)D:/vivado/CPU/CPU.srcs/sources_1/new/PC.v2default:default2
232default:default8@Z8-256h px
�
synthesizing module '%s'638*oasys2
RegFile2default:default2D
.D:/vivado/CPU/CPU.srcs/sources_1/new/RegFile.v2default:default2
232default:default8@Z8-638h px
�
Wmixed level sensitive and edge triggered event controls are not supported for synthesis434*oasys2D
.D:/vivado/CPU/CPU.srcs/sources_1/new/RegFile.v2default:default2
392default:default8@Z8-434h px
�
failed synthesizing module '%s'285*oasys2
RegFile2default:default2D
.D:/vivado/CPU/CPU.srcs/sources_1/new/RegFile.v2default:default2
232default:default8@Z8-285h px
�
failed synthesizing module '%s'285*oasys2
CPUTOP2default:default2@
*D:/vivado/CPU/CPU.srcs/sources_1/new/CPU.v2default:default2
232default:default8@Z8-285h px
�
%s*synth2�
sFinished Synthesize : Time (s): cpu = 00:00:06 ; elapsed = 00:00:08 . Memory (MB): peak = 350.566 ; gain = 172.742
2default:defaulth px
R
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
152default:default2
62default:default2
02default:default2
42default:defaultZ4-41h px
K

%s failed
30*	vivadotcl2 
synth_design2default:defaultZ4-43h px
]
Command failed: %s
69*common2+
Vivado Synthesis failed2default:defaultZ17-69h px
}
Exiting %s at %s...
206*common2
Vivado2default:default2,
Sat May 19 17:36:59 20182default:defaultZ17-206h px