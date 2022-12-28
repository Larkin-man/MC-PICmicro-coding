Release Notes for MPASM(tm) assembler version 2.80
July 19, 2001

-----------------------------------------------------------------
Table of Contents
-----------------------------------------------------------------
* Device Support List
* Operating System Support List for v2.80
* Repairs and Enhancements Made in v2.80
* Repairs and Enhancements Made in v2.70
* Repairs and Enhancements Made in v2.60
* Repairs and Enhancements Made in v2.50
* Known Problems
* Serial EEPROM Support
* Using MPASM Assembler
* How to Contact Microchip
* Customer Change Notification - Development Systems 

----------------------------------------------------------------------
Device Support List
----------------------------------------------------------------------
PIC12C508      PIC12C508A     PIC12C509      PIC12C509A
PIC12CR509A    PIC12CE518     PIC12CE519     PIC12C671   
PIC12C672      PIC12CE673     PIC12CE674

PIC14000

PIC16C432      PIC16C433

PIC16C5X       PIC16C52       PIC16C54       PIC16CR54
PIC16C54A      PIC16CR54A     PIC16C54B      PIC16CR54B
PIC16C54C      PIC16CR54C     PIC16C55       PIC16C55A
PIC16C56       PIC16C56A      PIC16CR56A     PIC16C57
PIC16CR57A     PIC16CR57B     PIC16C57C      PIC16CR57C
PIC16C58A      PIC16CR58A     PIC16C58B      PIC16CR58B
PIC16C505      PIC16HV540     PIC16C554      PIC16C558

PIC16CXX       PIC16C61       PIC16C62       PIC16CR62
PIC16C62A      PIC16C62B      PIC16C63       PIC16CR63
PIC16C63A      PIC16C64       PIC16CR64      PIC16C64A
PIC16C65       PIC16CR65      PIC16C65A      PIC16C65B
PIC16C66       PIC16C67       PIC16C620      PIC16C620A
PIC16CR620A    PIC16C621      PIC16C621A     PIC16C622
PIC16C622A     PIC16CE623     PIC16CE624     PIC16CE625
PIC16F627      PIC16F628      PIC16C642      PIC16C662

PIC16C71       PIC16C72       PIC16CR72      PIC16C72A
PIC16C73       PIC16F73       PIC16C73A      PIC16C73B
PIC16C74       PIC16F74       PIC16C74A      PIC16C74B
PIC16C76       PIC16C77       PIC16C710      PIC16C711      
PIC16C712      PIC16C715      PIC16C716      PIC16C717      
PIC16C745      PIC16C765      PIC16C770      PIC16C771      
PIC16C773      PIC16C774      PIC16C781*     PIC16C782*     

PIC16CR83      PIC16F83       PIC16C84       PIC16CR84
PIC16F84       PIC16F84A      PIC16F85*      PIC16F86*       
PIC16F870      PIC16F871      PIC16F872      PIC16F873      
PIC16F874      PIC16F876      PIC16F877      PIC16F877A*

PIC16C923      PIC16C924      PIC16C925      PIC16C926

PIC17CXX       PIC17C42       PIC17CR42      PIC17C42A
PIC17C43       PIC17CR43      PIC17C44       PIC17C752
PIC17C756      PIC17C756A     PIC17C762      PIC17C766

PIC18CXX       PIC18F020*     PIC18C242      PIC18F242*      
PIC18F248*     PIC18C252      PIC18F252*     PIC18F258*     
PIC18C442      PIC18F442*     PIC18F448*     PIC18C452      
PIC18F452*     PIC18F458*     PIC18C601*     PIC18C658      
PIC18C801*     PIC18C858

EEPROM8   EEPROM16

* Indicates new part support in this release

THESE PARTS MAY NOT ALL BE COMMERCIALLY AVAILABLE.

These can be chosen through the introductory screen, on the command
line, or in source file.  Three selections, 16C5X, 16CXX, and 17CXX
are supported as generic family indicators.

The selections EEPROM8 and EEPROM16 are provided for generic memory
product support.  Read below for a description of how to use MPASM
assembler to generate files for programming Microchip Serial EEPROM
and I/O expander (MCP25XX) devices.

The standard header files have been updated to reflect these devices.
One header file, MEMORY.INC, is provided for generic memory product
support. Another header file, MCP25XX.INC, is provided for generic
MCP device support.

NOTE: For the PIC16CR620A device, use the P16C620A.INC header file.

-----------------------------------------------------------------
Operating System Support List for v2.80
-----------------------------------------------------------------
Windows 3.1x   Windows 95     Windows 98     Windows NT
Windows 2000

----------------------------------------------------------------------
Repairs and Enhancements Made in v2.80
----------------------------------------------------------------------

SSR 14921: No error given if you use MOVFF with only one argument.

SSR 15425: PIC18Cxxx MOVFF instruction with the program counter as
destination needs to generate a warning.

----------------------------------------------------------------------
Repairs and Enhancements Made in v2.70
----------------------------------------------------------------------

SSR 14818: PAGESELW not working correctly for PIC16C711.

----------------------------------------------------------------------
Repairs and Enhancements Made in v2.60
----------------------------------------------------------------------
Fixed the header files.

The MPASM assembler automatically sets or clears the access bank bit
in PIC18CXXX devices.

----------------------------------------------------------------------
Repairs and Enhancements Made in v2.50
----------------------------------------------------------------------
This version of MPASM assembler works with MPLINK object linker v2.10
and above.

New PAGESELW directive for MPASM assembler will use movlw and movwf
instructions to modify the PCLATH for 14- and 16-bit core processors.

New PAGESEL directive for MPASM assembler will use bsf and bcf
instructions to modify the STATUS register or PCLATH for 14- and 16-bit
core processors.

----------------------------------------------------------------------
Known Problems
----------------------------------------------------------------------

The following is a list of known problems by SSR number.  For a list of
limitations, please see MPASM Assembler Help, Troubleshooting,
Assembler Limitations.

SSR 4049: Default radix setting does not affect macros. Macros
definitions will not overwrite the radix set in the list directive.

SSR 4065: MPASM assembler will word align DB's and DW's. The work-around
is to enter all DB's on one line, breaking the line at a word boundary.

SSR 14484: Do not use #include in macros. Macros cannot handle #includes.

SSR 14858: Labelling an ENDM statement causes a 202 windows error.

SSR 15531: The default value for the access bit is incorrect for the
PIC18Cx58 CAN registers in Bank 15 when using MPLINK linker. It is
recommended that you always specify the access bit value.

----------------------------------------------------------------------
Serial EEPROM Support
----------------------------------------------------------------------

Two "processor" selections are provided to generate byte data - EEPROM8
and EEPROM16.  Both generate data in terms of bytes, but EEPROM8
considers a "word" to be 8 bits wide, while EEPROM16 considers a "word"
to be 16 bits wide. The "program counter" is always incremented in terms
of bytes.

The default size for memory products is 128 bytes. This can be overridden
by using the LIST M=<max address> directive.  Note that <max address>
is always evaluated as a decimal number. The header file MEMORY.INC
is provided to define the maximum address for available memory devices.
The format of the defined symbols is _<device>; for example, to set the
maximum memory size for a 24LCS21, use the directive LIST M=_24LCS21.

The following data generation directives are supported for memory products:

	DW	   FILL	ORG

The behavior of other data generation directives is not guaranteed.
All other directives are unchanged.

An example of generating a file for programming a memory device is
as follows:

;*************************************************
; Generate data for a 8-bit wide memory device.

        LIST    P=EEPROM8, R=DECIMAL
        INCLUDE "MEMORY.INC"
        LIST    M=_24LCS21

#DEFINE MAX_VALUE       255

        ORG     0

;-------------------------------------------------
; Create a packed-byte, null terminated string.

        DW      "Hello World", 0

;-------------------------------------------------
; Create data representing a line.  The X position
; is implied from the position of the data in the
; device.  The Y values are stored in the device.

; First, define an equation for the line.

#DEFINE Line( X )       Slope * X + Y_Intercept

; Now define the values needed for the equation.

Slope                   EQU     10
Y_Intercept             EQU     5

; Declare and initialize the X and Y values.

        VARIABLE        X = 0, Y = Line( X )

; Generate values until the maximum Y value is
; reached or the device is filled up.

        WHILE (Y <= MAX_VALUE) && ($ <= _24LCS21)
           DW   Y
X = X + 1
Y = Line( X )
        ENDW

;-------------------------------------------------
; Perform some checking based on the line data
; generated above.

; If the device filled up before the end of the
; line was reached, generate an error. Otherwise,
; if the device is almost out of room, generate a
; message.

        IF (Y < MAX_VALUE)
           ERROR        "Device is full."
        ELSE
           IF (($+10) > _24LCS21)
              MESSG     "Device is nearly full."
           ENDIF
        ENDIF

;-------------------------------------------------
; Fill the rest of the device with zeroes.

        FILL    0, _24LCS21 - $ + 1

        END

CLRW COMMAND:

The CLRW encoding was changed on all 14-bit core devices from 0x0100
to 0x0103 (v1.40 and later). This will not affect the expected
operation of the instruction, but it will change the value for the
instruction in the hex file and therefore the checksum.


WARNING MESSAGE:

The text for Message #302 was modified to explain more clearly that
bank indication bits are stripped when assembling instructions that
access file registers. The appropriate bank must be selected by the
appropriate bank selection bits. For example, 14-bit core devices
contain the lower seven bits of the file register address in the
opcode, with two bank selection bits in the STATUS register. The
message was changed from:
        Argument out of range. Least significant bits used.
to:
        Register in operand not in bank 0. Ensure that bank
        bits are correct.


END DIRECTIVE:

Take care to not use the END directive in a macro. If the END directive
is encountered in a macro, it can cause the assembler to loop
indefinitely. Macros should be terminated with the ENDM directive.

----------------------------------------------------------------------
Using MPASM Assembler
----------------------------------------------------------------------

Create your source code with any text editor. The file should contain
ASCII text only. Assemble your code with the command line:

	mpasm <file>[.asm]

Correct any syntax problems, referring to the MPASM Assembler User's
Guide with MPLINK and MPLIB (DS33014) for syntax help. MPASM assembler
assembles with INHX8M as the default hex output, and generates a 
listing file, error file, and .COD file.

MPASM assembler currently runs in DOS real mode. If you have "out of
memory" problems, try using the DOS protected mode (DPMI) version.
To use this assembler, you must have the files RTM.EXE and
DPMI16BI.OVL (distributed with this release) available in your path
or in the current directory. You must also have EMM386 or another
memory manager running or run the assembler from a Windows DOS box.
To invoke this assembler, use the command:

	mpasm_dp <file>[.asm]

A version of MPASM assembler is also available for Windows. To invoke
this assembler, execute:

	mpasmwin

from within Windows. You will then be given a Windows interface window.
Help on using the interface is provided on-line. mpasmwin.exe can also
be invoked with parameters or through drag-and-drop. In these cases,
the interface screen is not displayed and assembly begins immediately.

----------------------------------------------------------------------
How to Contact Microchip
----------------------------------------------------------------------

Online Support
---------------
Microchip provides online support on the Microchip World Wide Web (WWW)
site. The web site is used by Microchip as a means to make files and
information easily available to customers. To view the site, you must
have access to the Internet and a web browser such as Netscape or
Microsoft Explorer. Files are also available for FTP download from
our FTP site.

Connecting to the Microchip Internet Web Site
---------------------------------------------
The Microchip web site is available by using your favorite Internet
browser to attach to:

        www.microchip.com

The file transfer site is available by using an FTP service to connect to:

        ftp://ftp.microchip.com

The web site and file transfer site provide a variety of services.
Users may download files for the latest development tools, data sheets,
application notes, User's guides, articles, and sample programs. A
variety information specific to the business ofMicrochip is also
available, including listings of Microchip sales offices, distributors
and factory representatives. Other data available for consideration is:

        * Latest Microchip Press Releases

        * Technical Support Section with Frequently Asked Questions

        * Design Tips

        * Device Errata

        * Job Postings

        * Microchip Consultant Program Member Listing

        * Links to other useful web sites related to Microchip products

        * Conferences for products, Development Systems, technical
          information and more

        * Listing of seminars and events

Systems Information and Upgrade Hotline
----------------------------------------
The Systems Information and Upgrade Line provides system users with a
listing of the latest versions of all of Microchip's development systems,
software products, and information on how customers can receive any
currently available upgrade kits. The Hot Line Numbers are:

        1-800-755-2345 for U.S. and most of Canada, and

        1-480-792-7302 for the rest of the world.

----------------------------------------------------------------------
Customer Change Notification - Development Systems
----------------------------------------------------------------------

Microchip started the customer notification service to help our 
customers keep current on Microchip products with the least amount 
of effort. Once you subscribe, you will receive email notification
whenever we change, update, revise or have errata related to your
specified product family or development tool of interest.

Go to the Microchip WWW web page (http://www.microchip.com)
and click on Customer Change Notification under Items of Interest.
Follow the instructions to register.

The Development Systems product group catagories are:

* Compilers
* Emulators
* In-Circuit Debuggers
* MPLAB
* Programmers

Here is a description of these catagories:

COMPILERS - The latest information on Microchip C compilers, linkers
and assemblers.  These include MPLAB C17 C compiler, MPLAB C18 
C compiler, MPLINK object linker (as well as the MPLIB object 
librarian) and MPASM assembler.

EMULATORS - The latest information on Microchip in-circuit emulators.
These include the MPLAB ICE 2000 and PICMASTER emulator.

IN-CIRCUIT DEBUGGERS - The latest information on Microchip in-circuit
debuggers. This includes the MPLAB ICD.

MPLAB - The latest information on Microchip MPLAB IDE, the Windows
Integrated Development Environment for development systems tools.
This list is focused on the MPLAB IDE, MPLAB SIM simulator,
MPLAB IDE Project Manager and general editing and debugging features.

PROGRAMMERS - The latest information on Microchip PICmicro device
programmers. These include the PRO MATE II device programmer and
PICSTART Plus development programmer.

