// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vlng.h for the primary calling header

#ifndef VERILATED_VLNG___024ROOT_H_
#define VERILATED_VLNG___024ROOT_H_  // guard

#include "verilated.h"


class Vlng__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vlng___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clk,0,0);
    VL_IN8(rst,0,0);
    VL_IN8(sck,0,0);
    VL_IN8(mosi,0,0);
    VL_IN8(ss,0,0);
    VL_OUT8(miso,0,0);
    VL_OUT8(dout_p,7,0);
    VL_OUT8(dout_n,7,0);
    CData/*7:0*/ control__DOT__in_reg;
    CData/*0:0*/ control__DOT__uut__DOT__mosi_q;
    CData/*0:0*/ control__DOT__uut__DOT__ss_q;
    CData/*0:0*/ control__DOT__uut__DOT__sck_q;
    CData/*0:0*/ control__DOT__uut__DOT__sck_old_q;
    CData/*7:0*/ control__DOT__uut__DOT__data_d;
    CData/*7:0*/ control__DOT__uut__DOT__data_q;
    CData/*2:0*/ control__DOT__uut__DOT__bit_ct_d;
    CData/*2:0*/ control__DOT__uut__DOT__bit_ct_q;
    CData/*7:0*/ control__DOT__uut__DOT__dout_d;
    CData/*7:0*/ control__DOT__uut__DOT__dout_q;
    CData/*0:0*/ control__DOT__uut__DOT__miso_d;
    CData/*0:0*/ control__DOT__uut__DOT__miso_q;
    CData/*0:0*/ __VstlFirstIteration;
    CData/*0:0*/ __Vtrigprevexpr___TOP__clk__0;
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ __VactIterCount;
    VlTriggerVec<1> __VstlTriggered;
    VlTriggerVec<1> __VactTriggered;
    VlTriggerVec<1> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vlng__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vlng___024root(Vlng__Syms* symsp, const char* v__name);
    ~Vlng___024root();
    VL_UNCOPYABLE(Vlng___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
