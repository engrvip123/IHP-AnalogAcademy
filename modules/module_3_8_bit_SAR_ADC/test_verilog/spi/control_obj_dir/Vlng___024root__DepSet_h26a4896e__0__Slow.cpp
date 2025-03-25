// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vlng.h for the primary calling header

#include "Vlng__pch.h"
#include "Vlng___024root.h"

VL_ATTR_COLD void Vlng___024root___eval_static(Vlng___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval_static\n"); );
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void Vlng___024root___eval_initial(Vlng___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval_initial\n"); );
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__Vtrigprevexpr___TOP__clk__0 = vlSelfRef.clk;
}

VL_ATTR_COLD void Vlng___024root___eval_final(Vlng___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval_final\n"); );
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vlng___024root___dump_triggers__stl(Vlng___024root* vlSelf);
#endif  // VL_DEBUG
VL_ATTR_COLD bool Vlng___024root___eval_phase__stl(Vlng___024root* vlSelf);

VL_ATTR_COLD void Vlng___024root___eval_settle(Vlng___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval_settle\n"); );
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __VstlIterCount;
    CData/*0:0*/ __VstlContinue;
    // Body
    __VstlIterCount = 0U;
    vlSelfRef.__VstlFirstIteration = 1U;
    __VstlContinue = 1U;
    while (__VstlContinue) {
        if (VL_UNLIKELY(((0x64U < __VstlIterCount)))) {
#ifdef VL_DEBUG
            Vlng___024root___dump_triggers__stl(vlSelf);
#endif
            VL_FATAL_MT("control.v", 2, "", "Settle region did not converge.");
        }
        __VstlIterCount = ((IData)(1U) + __VstlIterCount);
        __VstlContinue = 0U;
        if (Vlng___024root___eval_phase__stl(vlSelf)) {
            __VstlContinue = 1U;
        }
        vlSelfRef.__VstlFirstIteration = 0U;
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vlng___024root___dump_triggers__stl(Vlng___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___dump_triggers__stl\n"); );
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VstlTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VstlTriggered.word(0U))) {
        VL_DBG_MSGF("         'stl' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vlng___024root___stl_sequent__TOP__0(Vlng___024root* vlSelf);

VL_ATTR_COLD void Vlng___024root___eval_stl(Vlng___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval_stl\n"); );
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VstlTriggered.word(0U))) {
        Vlng___024root___stl_sequent__TOP__0(vlSelf);
    }
}

VL_ATTR_COLD void Vlng___024root___stl_sequent__TOP__0(Vlng___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___stl_sequent__TOP__0\n"); );
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.miso = vlSelfRef.control__DOT__uut__DOT__miso_q;
    vlSelfRef.dout_p = vlSelfRef.control__DOT__uut__DOT__dout_q;
    vlSelfRef.dout_n = (0xffU & (~ (IData)(vlSelfRef.control__DOT__uut__DOT__dout_q)));
    vlSelfRef.control__DOT__uut__DOT__bit_ct_d = vlSelfRef.control__DOT__uut__DOT__bit_ct_q;
    vlSelfRef.control__DOT__uut__DOT__miso_d = vlSelfRef.control__DOT__uut__DOT__miso_q;
    vlSelfRef.control__DOT__uut__DOT__data_d = vlSelfRef.control__DOT__uut__DOT__data_q;
    if (vlSelfRef.control__DOT__uut__DOT__ss_q) {
        vlSelfRef.control__DOT__uut__DOT__bit_ct_d = 0U;
        vlSelfRef.control__DOT__uut__DOT__miso_d = 
            (1U & ((IData)(vlSelfRef.control__DOT__uut__DOT__data_q) 
                   >> 7U));
        vlSelfRef.control__DOT__uut__DOT__data_d = vlSelfRef.control__DOT__in_reg;
    } else {
        if (((~ (IData)(vlSelfRef.control__DOT__uut__DOT__sck_old_q)) 
             & (IData)(vlSelfRef.control__DOT__uut__DOT__sck_q))) {
            vlSelfRef.control__DOT__uut__DOT__bit_ct_d 
                = (7U & ((IData)(1U) + (IData)(vlSelfRef.control__DOT__uut__DOT__bit_ct_q)));
            vlSelfRef.control__DOT__uut__DOT__data_d 
                = ((0xfeU & ((IData)(vlSelfRef.control__DOT__uut__DOT__data_q) 
                             << 1U)) | (IData)(vlSelfRef.control__DOT__uut__DOT__mosi_q));
            if ((7U == (IData)(vlSelfRef.control__DOT__uut__DOT__bit_ct_q))) {
                vlSelfRef.control__DOT__uut__DOT__data_d 
                    = vlSelfRef.control__DOT__in_reg;
            }
        }
        if ((1U & (~ ((~ (IData)(vlSelfRef.control__DOT__uut__DOT__sck_old_q)) 
                      & (IData)(vlSelfRef.control__DOT__uut__DOT__sck_q))))) {
            if (((IData)(vlSelfRef.control__DOT__uut__DOT__sck_old_q) 
                 & (~ (IData)(vlSelfRef.control__DOT__uut__DOT__sck_q)))) {
                vlSelfRef.control__DOT__uut__DOT__miso_d 
                    = (1U & ((IData)(vlSelfRef.control__DOT__uut__DOT__data_q) 
                             >> 7U));
            }
        }
    }
    vlSelfRef.control__DOT__uut__DOT__dout_d = vlSelfRef.control__DOT__uut__DOT__dout_q;
    if ((1U & (~ (IData)(vlSelfRef.control__DOT__uut__DOT__ss_q)))) {
        if (((~ (IData)(vlSelfRef.control__DOT__uut__DOT__sck_old_q)) 
             & (IData)(vlSelfRef.control__DOT__uut__DOT__sck_q))) {
            if ((7U == (IData)(vlSelfRef.control__DOT__uut__DOT__bit_ct_q))) {
                vlSelfRef.control__DOT__uut__DOT__dout_d 
                    = ((0xfeU & ((IData)(vlSelfRef.control__DOT__uut__DOT__data_q) 
                                 << 1U)) | (IData)(vlSelfRef.control__DOT__uut__DOT__mosi_q));
            }
        }
    }
}

VL_ATTR_COLD void Vlng___024root___eval_triggers__stl(Vlng___024root* vlSelf);

VL_ATTR_COLD bool Vlng___024root___eval_phase__stl(Vlng___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval_phase__stl\n"); );
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VstlExecute;
    // Body
    Vlng___024root___eval_triggers__stl(vlSelf);
    __VstlExecute = vlSelfRef.__VstlTriggered.any();
    if (__VstlExecute) {
        Vlng___024root___eval_stl(vlSelf);
    }
    return (__VstlExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vlng___024root___dump_triggers__act(Vlng___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___dump_triggers__act\n"); );
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VactTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 0 is active: @(posedge clk)\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vlng___024root___dump_triggers__nba(Vlng___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___dump_triggers__nba\n"); );
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VnbaTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 0 is active: @(posedge clk)\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vlng___024root___ctor_var_reset(Vlng___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___ctor_var_reset\n"); );
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelf->clk = VL_RAND_RESET_I(1);
    vlSelf->rst = VL_RAND_RESET_I(1);
    vlSelf->sck = VL_RAND_RESET_I(1);
    vlSelf->mosi = VL_RAND_RESET_I(1);
    vlSelf->ss = VL_RAND_RESET_I(1);
    vlSelf->miso = VL_RAND_RESET_I(1);
    vlSelf->dout_p = VL_RAND_RESET_I(8);
    vlSelf->dout_n = VL_RAND_RESET_I(8);
    vlSelf->control__DOT__in_reg = VL_RAND_RESET_I(8);
    vlSelf->control__DOT__uut__DOT__mosi_q = VL_RAND_RESET_I(1);
    vlSelf->control__DOT__uut__DOT__ss_q = VL_RAND_RESET_I(1);
    vlSelf->control__DOT__uut__DOT__sck_q = VL_RAND_RESET_I(1);
    vlSelf->control__DOT__uut__DOT__sck_old_q = VL_RAND_RESET_I(1);
    vlSelf->control__DOT__uut__DOT__data_d = VL_RAND_RESET_I(8);
    vlSelf->control__DOT__uut__DOT__data_q = VL_RAND_RESET_I(8);
    vlSelf->control__DOT__uut__DOT__bit_ct_d = VL_RAND_RESET_I(3);
    vlSelf->control__DOT__uut__DOT__bit_ct_q = VL_RAND_RESET_I(3);
    vlSelf->control__DOT__uut__DOT__dout_d = VL_RAND_RESET_I(8);
    vlSelf->control__DOT__uut__DOT__dout_q = VL_RAND_RESET_I(8);
    vlSelf->control__DOT__uut__DOT__miso_d = VL_RAND_RESET_I(1);
    vlSelf->control__DOT__uut__DOT__miso_q = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__clk__0 = VL_RAND_RESET_I(1);
}
