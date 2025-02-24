// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vlng.h for the primary calling header

#include "Vlng.h"
#include "Vlng__Syms.h"

//==========

void Vlng::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vlng::eval\n"); );
    Vlng__Syms* __restrict vlSymsp = this->__VlSymsp;  // Setup global symbol table
    Vlng* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
#ifdef VL_DEBUG
    // Debug assertions
    _eval_debug_assertions();
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        _eval(vlSymsp);
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = _change_request(vlSymsp);
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("sar_algo.v", 3, "",
                "Verilated model didn't converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

void Vlng::_eval_initial_loop(Vlng__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    _eval_initial(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        _eval_settle(vlSymsp);
        _eval(vlSymsp);
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = _change_request(vlSymsp);
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("sar_algo.v", 3, "",
                "Verilated model didn't DC converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

VL_INLINE_OPT void Vlng::_sequent__TOP__1(Vlng__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng::_sequent__TOP__1\n"); );
    Vlng* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if ((((IData)(vlTOPp->En) & (~ (IData)(vlTOPp->rst))) 
         & ((IData)(vlTOPp->Op) ^ (IData)(vlTOPp->Om)))) {
        if ((7U != (IData)(vlTOPp->sar_algorithm__DOT__counter))) {
            vlTOPp->D = (((~ ((IData)(1U) << (IData)(vlTOPp->sar_algorithm__DOT__counter))) 
                          & (IData)(vlTOPp->D)) | ((IData)(vlTOPp->Op) 
                                                   << (IData)(vlTOPp->sar_algorithm__DOT__counter)));
            if (vlTOPp->Op) {
                vlTOPp->B = ((IData)(vlTOPp->B) | ((IData)(1U) 
                                                   << (IData)(vlTOPp->sar_algorithm__DOT__counter)));
                vlTOPp->BN = ((~ ((IData)(1U) << (IData)(vlTOPp->sar_algorithm__DOT__counter))) 
                              & (IData)(vlTOPp->BN));
            } else {
                if (vlTOPp->Om) {
                    vlTOPp->B = ((~ ((IData)(1U) << (IData)(vlTOPp->sar_algorithm__DOT__counter))) 
                                 & (IData)(vlTOPp->B));
                    vlTOPp->BN = ((IData)(vlTOPp->BN) 
                                  | ((IData)(1U) << (IData)(vlTOPp->sar_algorithm__DOT__counter)));
                }
            }
            vlTOPp->sar_algorithm__DOT__counter = (7U 
                                                   & ((IData)(1U) 
                                                      + (IData)(vlTOPp->sar_algorithm__DOT__counter)));
        }
    } else {
        if (vlTOPp->rst) {
            vlTOPp->sar_algorithm__DOT__counter = 0U;
            vlTOPp->B = 0U;
            vlTOPp->BN = 0U;
            vlTOPp->D = 0U;
        }
    }
}

void Vlng::_eval(Vlng__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng::_eval\n"); );
    Vlng* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (((IData)(vlTOPp->clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__clk)))) {
        vlTOPp->_sequent__TOP__1(vlSymsp);
    }
    // Final
    vlTOPp->__Vclklast__TOP__clk = vlTOPp->clk;
}

VL_INLINE_OPT QData Vlng::_change_request(Vlng__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng::_change_request\n"); );
    Vlng* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    return (vlTOPp->_change_request_1(vlSymsp));
}

VL_INLINE_OPT QData Vlng::_change_request_1(Vlng__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng::_change_request_1\n"); );
    Vlng* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void Vlng::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng::_eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((Op & 0xfeU))) {
        Verilated::overWidthError("Op");}
    if (VL_UNLIKELY((En & 0xfeU))) {
        Verilated::overWidthError("En");}
    if (VL_UNLIKELY((Om & 0xfeU))) {
        Verilated::overWidthError("Om");}
    if (VL_UNLIKELY((clk & 0xfeU))) {
        Verilated::overWidthError("clk");}
    if (VL_UNLIKELY((rst & 0xfeU))) {
        Verilated::overWidthError("rst");}
}
#endif  // VL_DEBUG
