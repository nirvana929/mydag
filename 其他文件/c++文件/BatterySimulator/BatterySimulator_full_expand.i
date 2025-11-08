# 1 "src/modules/simulation/battery_simulator/BatterySimulator.cpp"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "src/modules/simulation/battery_simulator/BatterySimulator.cpp"
# 34 "src/modules/simulation/battery_simulator/BatterySimulator.cpp"
# 1 "src/modules/simulation/battery_simulator/BatterySimulator.hpp" 1
# 34 "src/modules/simulation/battery_simulator/BatterySimulator.hpp"
       

# 1 "./src/lib/battery/battery.h" 1
# 43 "./src/lib/battery/battery.h"
       

# 1 "/usr/include/c++/9/math.h" 1 3
# 36 "/usr/include/c++/9/math.h" 3
# 1 "/usr/include/c++/9/cmath" 1 3
# 39 "/usr/include/c++/9/cmath" 3
       
# 40 "/usr/include/c++/9/cmath" 3

# 1 "/usr/include/x86_64-linux-gnu/c++/9/bits/c++config.h" 1 3
# 256 "/usr/include/x86_64-linux-gnu/c++/9/bits/c++config.h" 3

# 256 "/usr/include/x86_64-linux-gnu/c++/9/bits/c++config.h" 3
namespace std
{
  typedef long unsigned int size_t;
  typedef long int ptrdiff_t;


  typedef decltype(nullptr) nullptr_t;

}
# 278 "/usr/include/x86_64-linux-gnu/c++/9/bits/c++config.h" 3
namespace std
{
  inline namespace __cxx11 __attribute__((__abi_tag__ ("cxx11"))) { }
}
namespace __gnu_cxx
{
  inline namespace __cxx11 __attribute__((__abi_tag__ ("cxx11"))) { }
}
# 528 "/usr/include/x86_64-linux-gnu/c++/9/bits/c++config.h" 3
# 1 "/usr/include/x86_64-linux-gnu/c++/9/bits/os_defines.h" 1 3
# 39 "/usr/include/x86_64-linux-gnu/c++/9/bits/os_defines.h" 3
# 1 "/usr/include/features.h" 1 3 4
# 461 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 1 3 4
# 452 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 453 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/long-double.h" 1 3 4
# 454 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 462 "/usr/include/features.h" 2 3 4
# 485 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h" 1 3 4
# 11 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 2 3 4
# 486 "/usr/include/features.h" 2 3 4
# 40 "/usr/include/x86_64-linux-gnu/c++/9/bits/os_defines.h" 2 3
# 529 "/usr/include/x86_64-linux-gnu/c++/9/bits/c++config.h" 2 3


# 1 "/usr/include/x86_64-linux-gnu/c++/9/bits/cpu_defines.h" 1 3
# 532 "/usr/include/x86_64-linux-gnu/c++/9/bits/c++config.h" 2 3
# 694 "/usr/include/x86_64-linux-gnu/c++/9/bits/c++config.h" 3
# 1 "/usr/include/c++/9/pstl/pstl_config.h" 1 3
# 695 "/usr/include/x86_64-linux-gnu/c++/9/bits/c++config.h" 2 3
# 42 "/usr/include/c++/9/cmath" 2 3
# 1 "/usr/include/c++/9/bits/cpp_type_traits.h" 1 3
# 35 "/usr/include/c++/9/bits/cpp_type_traits.h" 3
       
# 36 "/usr/include/c++/9/bits/cpp_type_traits.h" 3
# 67 "/usr/include/c++/9/bits/cpp_type_traits.h" 3
extern "C++" {

namespace std __attribute__ ((__visibility__ ("default")))
{


  struct __true_type { };
  struct __false_type { };

  template<bool>
    struct __truth_type
    { typedef __false_type __type; };

  template<>
    struct __truth_type<true>
    { typedef __true_type __type; };



  template<class _Sp, class _Tp>
    struct __traitor
    {
      enum { __value = bool(_Sp::__value) || bool(_Tp::__value) };
      typedef typename __truth_type<__value>::__type __type;
    };


  template<typename, typename>
    struct __are_same
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<typename _Tp>
    struct __are_same<_Tp, _Tp>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };


  template<typename _Tp>
    struct __is_void
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<>
    struct __is_void<void>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };




  template<typename _Tp>
    struct __is_integer
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };





  template<>
    struct __is_integer<bool>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<signed char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<unsigned char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };


  template<>
    struct __is_integer<wchar_t>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
# 184 "/usr/include/c++/9/bits/cpp_type_traits.h" 3
  template<>
    struct __is_integer<char16_t>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<char32_t>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };


  template<>
    struct __is_integer<short>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<unsigned short>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<int>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<unsigned int>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<long>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<unsigned long>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<long long>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<unsigned long long>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
# 287 "/usr/include/c++/9/bits/cpp_type_traits.h" 3
  template<typename _Tp>
    struct __is_floating
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };


  template<>
    struct __is_floating<float>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_floating<double>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_floating<long double>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };




  template<typename _Tp>
    struct __is_pointer
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<typename _Tp>
    struct __is_pointer<_Tp*>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };




  template<typename _Tp>
    struct __is_arithmetic
    : public __traitor<__is_integer<_Tp>, __is_floating<_Tp> >
    { };




  template<typename _Tp>
    struct __is_scalar
    : public __traitor<__is_arithmetic<_Tp>, __is_pointer<_Tp> >
    { };




  template<typename _Tp>
    struct __is_char
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<>
    struct __is_char<char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };


  template<>
    struct __is_char<wchar_t>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };


  template<typename _Tp>
    struct __is_byte
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<>
    struct __is_byte<char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_byte<signed char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_byte<unsigned char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };


  enum class byte : unsigned char;

  template<>
    struct __is_byte<byte>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };





  template<typename _Tp>
    struct __is_move_iterator
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };



  template<typename _Iterator>
    inline _Iterator
    __miter_base(_Iterator __it)
    { return __it; }


}
}
# 43 "/usr/include/c++/9/cmath" 2 3
# 1 "/usr/include/c++/9/ext/type_traits.h" 1 3
# 32 "/usr/include/c++/9/ext/type_traits.h" 3
       
# 33 "/usr/include/c++/9/ext/type_traits.h" 3




extern "C++" {

namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{



  template<bool, typename>
    struct __enable_if
    { };

  template<typename _Tp>
    struct __enable_if<true, _Tp>
    { typedef _Tp __type; };



  template<bool _Cond, typename _Iftrue, typename _Iffalse>
    struct __conditional_type
    { typedef _Iftrue __type; };

  template<typename _Iftrue, typename _Iffalse>
    struct __conditional_type<false, _Iftrue, _Iffalse>
    { typedef _Iffalse __type; };



  template<typename _Tp>
    struct __add_unsigned
    {
    private:
      typedef __enable_if<std::__is_integer<_Tp>::__value, _Tp> __if_type;

    public:
      typedef typename __if_type::__type __type;
    };

  template<>
    struct __add_unsigned<char>
    { typedef unsigned char __type; };

  template<>
    struct __add_unsigned<signed char>
    { typedef unsigned char __type; };

  template<>
    struct __add_unsigned<short>
    { typedef unsigned short __type; };

  template<>
    struct __add_unsigned<int>
    { typedef unsigned int __type; };

  template<>
    struct __add_unsigned<long>
    { typedef unsigned long __type; };

  template<>
    struct __add_unsigned<long long>
    { typedef unsigned long long __type; };


  template<>
    struct __add_unsigned<bool>;

  template<>
    struct __add_unsigned<wchar_t>;



  template<typename _Tp>
    struct __remove_unsigned
    {
    private:
      typedef __enable_if<std::__is_integer<_Tp>::__value, _Tp> __if_type;

    public:
      typedef typename __if_type::__type __type;
    };

  template<>
    struct __remove_unsigned<char>
    { typedef signed char __type; };

  template<>
    struct __remove_unsigned<unsigned char>
    { typedef signed char __type; };

  template<>
    struct __remove_unsigned<unsigned short>
    { typedef short __type; };

  template<>
    struct __remove_unsigned<unsigned int>
    { typedef int __type; };

  template<>
    struct __remove_unsigned<unsigned long>
    { typedef long __type; };

  template<>
    struct __remove_unsigned<unsigned long long>
    { typedef long long __type; };


  template<>
    struct __remove_unsigned<bool>;

  template<>
    struct __remove_unsigned<wchar_t>;



  template<typename _Type>
    inline bool
    __is_null_pointer(_Type* __ptr)
    { return __ptr == 0; }

  template<typename _Type>
    inline bool
    __is_null_pointer(_Type)
    { return false; }


  inline bool
  __is_null_pointer(std::nullptr_t)
  { return true; }



  template<typename _Tp, bool = std::__is_integer<_Tp>::__value>
    struct __promote
    { typedef double __type; };




  template<typename _Tp>
    struct __promote<_Tp, false>
    { };

  template<>
    struct __promote<long double>
    { typedef long double __type; };

  template<>
    struct __promote<double>
    { typedef double __type; };

  template<>
    struct __promote<float>
    { typedef float __type; };

  template<typename _Tp, typename _Up,
           typename _Tp2 = typename __promote<_Tp>::__type,
           typename _Up2 = typename __promote<_Up>::__type>
    struct __promote_2
    {
      typedef __typeof__(_Tp2() + _Up2()) __type;
    };

  template<typename _Tp, typename _Up, typename _Vp,
           typename _Tp2 = typename __promote<_Tp>::__type,
           typename _Up2 = typename __promote<_Up>::__type,
           typename _Vp2 = typename __promote<_Vp>::__type>
    struct __promote_3
    {
      typedef __typeof__(_Tp2() + _Up2() + _Vp2()) __type;
    };

  template<typename _Tp, typename _Up, typename _Vp, typename _Wp,
           typename _Tp2 = typename __promote<_Tp>::__type,
           typename _Up2 = typename __promote<_Up>::__type,
           typename _Vp2 = typename __promote<_Vp>::__type,
           typename _Wp2 = typename __promote<_Wp>::__type>
    struct __promote_4
    {
      typedef __typeof__(_Tp2() + _Up2() + _Vp2() + _Wp2()) __type;
    };


}
}
# 44 "/usr/include/c++/9/cmath" 2 3

# 1 "/usr/include/math.h" 1 3 4
# 27 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h" 1 3 4
# 28 "/usr/include/math.h" 2 3 4






extern "C" {


# 1 "/usr/include/x86_64-linux-gnu/bits/types.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/timesize.h" 1 3 4
# 29 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;






typedef __int8_t __int_least8_t;
typedef __uint8_t __uint_least8_t;
typedef __int16_t __int_least16_t;
typedef __uint16_t __uint_least16_t;
typedef __int32_t __int_least32_t;
typedef __uint32_t __uint_least32_t;
typedef __int64_t __int_least64_t;
typedef __uint64_t __uint_least64_t;



typedef long int __quad_t;
typedef unsigned long int __u_quad_t;







typedef long int __intmax_t;
typedef unsigned long int __uintmax_t;
# 141 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/typesizes.h" 1 3 4
# 142 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/time64.h" 1 3 4
# 143 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;

typedef int __daddr_t;
typedef int __key_t;


typedef int __clockid_t;


typedef void * __timer_t;


typedef long int __blksize_t;




typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;


typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;


typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;


typedef long int __fsword_t;

typedef long int __ssize_t;


typedef long int __syscall_slong_t;

typedef unsigned long int __syscall_ulong_t;



typedef __off64_t __loff_t;
typedef char *__caddr_t;


typedef long int __intptr_t;


typedef unsigned int __socklen_t;




typedef int __sig_atomic_t;
# 38 "/usr/include/math.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/math-vector.h" 1 3 4
# 25 "/usr/include/x86_64-linux-gnu/bits/math-vector.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/libm-simd-decl-stubs.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/bits/math-vector.h" 2 3 4
# 41 "/usr/include/math.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/floatn.h" 1 3 4
# 75 "/usr/include/x86_64-linux-gnu/bits/floatn.h" 3 4
typedef _Complex float __cfloat128 __attribute__ ((__mode__ (__TC__)));
# 87 "/usr/include/x86_64-linux-gnu/bits/floatn.h" 3 4
typedef __float128 _Float128;
# 120 "/usr/include/x86_64-linux-gnu/bits/floatn.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/long-double.h" 1 3 4
# 25 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h" 2 3 4
# 214 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h" 3 4
typedef float _Float32;
# 251 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h" 3 4
typedef double _Float64;
# 268 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h" 3 4
typedef double _Float32x;
# 285 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h" 3 4
typedef long double _Float64x;
# 121 "/usr/include/x86_64-linux-gnu/bits/floatn.h" 2 3 4
# 44 "/usr/include/math.h" 2 3 4
# 138 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/flt-eval-method.h" 1 3 4
# 139 "/usr/include/math.h" 2 3 4
# 149 "/usr/include/math.h" 3 4
typedef float float_t;
typedef double double_t;
# 190 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/fp-logb.h" 1 3 4
# 191 "/usr/include/math.h" 2 3 4
# 233 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/fp-fast.h" 1 3 4
# 234 "/usr/include/math.h" 2 3 4



enum
  {
    FP_INT_UPWARD =

      0,
    FP_INT_DOWNWARD =

      1,
    FP_INT_TOWARDZERO =

      2,
    FP_INT_TONEARESTFROMZERO =

      3,
    FP_INT_TONEAREST =

      4,
  };
# 289 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h" 1 3 4
# 21 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h" 3 4
extern int __fpclassify (double __value) throw ()
     __attribute__ ((__const__));


extern int __signbit (double __value) throw ()
     __attribute__ ((__const__));



extern int __isinf (double __value) throw () __attribute__ ((__const__));


extern int __finite (double __value) throw () __attribute__ ((__const__));


extern int __isnan (double __value) throw () __attribute__ ((__const__));


extern int __iseqsig (double __x, double __y) throw ();


extern int __issignaling (double __value) throw ()
     __attribute__ ((__const__));
# 290 "/usr/include/math.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 1 3 4
# 53 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern double acos (double __x) throw (); extern double __acos (double __x) throw ();

extern double asin (double __x) throw (); extern double __asin (double __x) throw ();

extern double atan (double __x) throw (); extern double __atan (double __x) throw ();

extern double atan2 (double __y, double __x) throw (); extern double __atan2 (double __y, double __x) throw ();


 extern double cos (double __x) throw (); extern double __cos (double __x) throw ();

 extern double sin (double __x) throw (); extern double __sin (double __x) throw ();

extern double tan (double __x) throw (); extern double __tan (double __x) throw ();




extern double cosh (double __x) throw (); extern double __cosh (double __x) throw ();

extern double sinh (double __x) throw (); extern double __sinh (double __x) throw ();

extern double tanh (double __x) throw (); extern double __tanh (double __x) throw ();



 extern void sincos (double __x, double *__sinx, double *__cosx) throw (); extern void __sincos (double __x, double *__sinx, double *__cosx) throw ()
                                                        ;




extern double acosh (double __x) throw (); extern double __acosh (double __x) throw ();

extern double asinh (double __x) throw (); extern double __asinh (double __x) throw ();

extern double atanh (double __x) throw (); extern double __atanh (double __x) throw ();





 extern double exp (double __x) throw (); extern double __exp (double __x) throw ();


extern double frexp (double __x, int *__exponent) throw (); extern double __frexp (double __x, int *__exponent) throw ();


extern double ldexp (double __x, int __exponent) throw (); extern double __ldexp (double __x, int __exponent) throw ();


 extern double log (double __x) throw (); extern double __log (double __x) throw ();


extern double log10 (double __x) throw (); extern double __log10 (double __x) throw ();


extern double modf (double __x, double *__iptr) throw (); extern double __modf (double __x, double *__iptr) throw () __attribute__ ((__nonnull__ (2)));



extern double exp10 (double __x) throw (); extern double __exp10 (double __x) throw ();




extern double expm1 (double __x) throw (); extern double __expm1 (double __x) throw ();


extern double log1p (double __x) throw (); extern double __log1p (double __x) throw ();


extern double logb (double __x) throw (); extern double __logb (double __x) throw ();




extern double exp2 (double __x) throw (); extern double __exp2 (double __x) throw ();


extern double log2 (double __x) throw (); extern double __log2 (double __x) throw ();






 extern double pow (double __x, double __y) throw (); extern double __pow (double __x, double __y) throw ();


extern double sqrt (double __x) throw (); extern double __sqrt (double __x) throw ();



extern double hypot (double __x, double __y) throw (); extern double __hypot (double __x, double __y) throw ();




extern double cbrt (double __x) throw (); extern double __cbrt (double __x) throw ();






extern double ceil (double __x) throw () __attribute__ ((__const__)); extern double __ceil (double __x) throw () __attribute__ ((__const__));


extern double fabs (double __x) throw () __attribute__ ((__const__)); extern double __fabs (double __x) throw () __attribute__ ((__const__));


extern double floor (double __x) throw () __attribute__ ((__const__)); extern double __floor (double __x) throw () __attribute__ ((__const__));


extern double fmod (double __x, double __y) throw (); extern double __fmod (double __x, double __y) throw ();
# 182 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern int finite (double __value) throw () __attribute__ ((__const__));


extern double drem (double __x, double __y) throw (); extern double __drem (double __x, double __y) throw ();



extern double significand (double __x) throw (); extern double __significand (double __x) throw ();






extern double copysign (double __x, double __y) throw () __attribute__ ((__const__)); extern double __copysign (double __x, double __y) throw () __attribute__ ((__const__));




extern double nan (const char *__tagb) throw (); extern double __nan (const char *__tagb) throw ();
# 217 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern double j0 (double) throw (); extern double __j0 (double) throw ();
extern double j1 (double) throw (); extern double __j1 (double) throw ();
extern double jn (int, double) throw (); extern double __jn (int, double) throw ();
extern double y0 (double) throw (); extern double __y0 (double) throw ();
extern double y1 (double) throw (); extern double __y1 (double) throw ();
extern double yn (int, double) throw (); extern double __yn (int, double) throw ();





extern double erf (double) throw (); extern double __erf (double) throw ();
extern double erfc (double) throw (); extern double __erfc (double) throw ();
extern double lgamma (double) throw (); extern double __lgamma (double) throw ();




extern double tgamma (double) throw (); extern double __tgamma (double) throw ();





extern double gamma (double) throw (); extern double __gamma (double) throw ();







extern double lgamma_r (double, int *__signgamp) throw (); extern double __lgamma_r (double, int *__signgamp) throw ();






extern double rint (double __x) throw (); extern double __rint (double __x) throw ();


extern double nextafter (double __x, double __y) throw (); extern double __nextafter (double __x, double __y) throw ();

extern double nexttoward (double __x, long double __y) throw (); extern double __nexttoward (double __x, long double __y) throw ();




extern double nextdown (double __x) throw (); extern double __nextdown (double __x) throw ();

extern double nextup (double __x) throw (); extern double __nextup (double __x) throw ();



extern double remainder (double __x, double __y) throw (); extern double __remainder (double __x, double __y) throw ();



extern double scalbn (double __x, int __n) throw (); extern double __scalbn (double __x, int __n) throw ();



extern int ilogb (double __x) throw (); extern int __ilogb (double __x) throw ();




extern long int llogb (double __x) throw (); extern long int __llogb (double __x) throw ();




extern double scalbln (double __x, long int __n) throw (); extern double __scalbln (double __x, long int __n) throw ();



extern double nearbyint (double __x) throw (); extern double __nearbyint (double __x) throw ();



extern double round (double __x) throw () __attribute__ ((__const__)); extern double __round (double __x) throw () __attribute__ ((__const__));



extern double trunc (double __x) throw () __attribute__ ((__const__)); extern double __trunc (double __x) throw () __attribute__ ((__const__));




extern double remquo (double __x, double __y, int *__quo) throw (); extern double __remquo (double __x, double __y, int *__quo) throw ();






extern long int lrint (double __x) throw (); extern long int __lrint (double __x) throw ();
__extension__
extern long long int llrint (double __x) throw (); extern long long int __llrint (double __x) throw ();



extern long int lround (double __x) throw (); extern long int __lround (double __x) throw ();
__extension__
extern long long int llround (double __x) throw (); extern long long int __llround (double __x) throw ();



extern double fdim (double __x, double __y) throw (); extern double __fdim (double __x, double __y) throw ();


extern double fmax (double __x, double __y) throw () __attribute__ ((__const__)); extern double __fmax (double __x, double __y) throw () __attribute__ ((__const__));


extern double fmin (double __x, double __y) throw () __attribute__ ((__const__)); extern double __fmin (double __x, double __y) throw () __attribute__ ((__const__));


extern double fma (double __x, double __y, double __z) throw (); extern double __fma (double __x, double __y, double __z) throw ();




extern double roundeven (double __x) throw () __attribute__ ((__const__)); extern double __roundeven (double __x) throw () __attribute__ ((__const__));



extern __intmax_t fromfp (double __x, int __round, unsigned int __width) throw (); extern __intmax_t __fromfp (double __x, int __round, unsigned int __width) throw ()
                            ;



extern __uintmax_t ufromfp (double __x, int __round, unsigned int __width) throw (); extern __uintmax_t __ufromfp (double __x, int __round, unsigned int __width) throw ()
                              ;




extern __intmax_t fromfpx (double __x, int __round, unsigned int __width) throw (); extern __intmax_t __fromfpx (double __x, int __round, unsigned int __width) throw ()
                             ;




extern __uintmax_t ufromfpx (double __x, int __round, unsigned int __width) throw (); extern __uintmax_t __ufromfpx (double __x, int __round, unsigned int __width) throw ()
                               ;


extern double fmaxmag (double __x, double __y) throw () __attribute__ ((__const__)); extern double __fmaxmag (double __x, double __y) throw () __attribute__ ((__const__));


extern double fminmag (double __x, double __y) throw () __attribute__ ((__const__)); extern double __fminmag (double __x, double __y) throw () __attribute__ ((__const__));


extern int canonicalize (double *__cx, const double *__x) throw ();




extern int totalorder (const double *__x, const double *__y) throw ()

     __attribute__ ((__pure__));


extern int totalordermag (const double *__x, const double *__y) throw ()

     __attribute__ ((__pure__));


extern double getpayload (const double *__x) throw (); extern double __getpayload (const double *__x) throw ();


extern int setpayload (double *__x, double __payload) throw ();


extern int setpayloadsig (double *__x, double __payload) throw ();







extern double scalb (double __x, double __n) throw (); extern double __scalb (double __x, double __n) throw ();
# 291 "/usr/include/math.h" 2 3 4
# 306 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h" 1 3 4
# 21 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h" 3 4
extern int __fpclassifyf (float __value) throw ()
     __attribute__ ((__const__));


extern int __signbitf (float __value) throw ()
     __attribute__ ((__const__));



extern int __isinff (float __value) throw () __attribute__ ((__const__));


extern int __finitef (float __value) throw () __attribute__ ((__const__));


extern int __isnanf (float __value) throw () __attribute__ ((__const__));


extern int __iseqsigf (float __x, float __y) throw ();


extern int __issignalingf (float __value) throw ()
     __attribute__ ((__const__));
# 307 "/usr/include/math.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 1 3 4
# 53 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern float acosf (float __x) throw (); extern float __acosf (float __x) throw ();

extern float asinf (float __x) throw (); extern float __asinf (float __x) throw ();

extern float atanf (float __x) throw (); extern float __atanf (float __x) throw ();

extern float atan2f (float __y, float __x) throw (); extern float __atan2f (float __y, float __x) throw ();


 extern float cosf (float __x) throw (); extern float __cosf (float __x) throw ();

 extern float sinf (float __x) throw (); extern float __sinf (float __x) throw ();

extern float tanf (float __x) throw (); extern float __tanf (float __x) throw ();




extern float coshf (float __x) throw (); extern float __coshf (float __x) throw ();

extern float sinhf (float __x) throw (); extern float __sinhf (float __x) throw ();

extern float tanhf (float __x) throw (); extern float __tanhf (float __x) throw ();



 extern void sincosf (float __x, float *__sinx, float *__cosx) throw (); extern void __sincosf (float __x, float *__sinx, float *__cosx) throw ()
                                                        ;




extern float acoshf (float __x) throw (); extern float __acoshf (float __x) throw ();

extern float asinhf (float __x) throw (); extern float __asinhf (float __x) throw ();

extern float atanhf (float __x) throw (); extern float __atanhf (float __x) throw ();





 extern float expf (float __x) throw (); extern float __expf (float __x) throw ();


extern float frexpf (float __x, int *__exponent) throw (); extern float __frexpf (float __x, int *__exponent) throw ();


extern float ldexpf (float __x, int __exponent) throw (); extern float __ldexpf (float __x, int __exponent) throw ();


 extern float logf (float __x) throw (); extern float __logf (float __x) throw ();


extern float log10f (float __x) throw (); extern float __log10f (float __x) throw ();


extern float modff (float __x, float *__iptr) throw (); extern float __modff (float __x, float *__iptr) throw () __attribute__ ((__nonnull__ (2)));



extern float exp10f (float __x) throw (); extern float __exp10f (float __x) throw ();




extern float expm1f (float __x) throw (); extern float __expm1f (float __x) throw ();


extern float log1pf (float __x) throw (); extern float __log1pf (float __x) throw ();


extern float logbf (float __x) throw (); extern float __logbf (float __x) throw ();




extern float exp2f (float __x) throw (); extern float __exp2f (float __x) throw ();


extern float log2f (float __x) throw (); extern float __log2f (float __x) throw ();






 extern float powf (float __x, float __y) throw (); extern float __powf (float __x, float __y) throw ();


extern float sqrtf (float __x) throw (); extern float __sqrtf (float __x) throw ();



extern float hypotf (float __x, float __y) throw (); extern float __hypotf (float __x, float __y) throw ();




extern float cbrtf (float __x) throw (); extern float __cbrtf (float __x) throw ();






extern float ceilf (float __x) throw () __attribute__ ((__const__)); extern float __ceilf (float __x) throw () __attribute__ ((__const__));


extern float fabsf (float __x) throw () __attribute__ ((__const__)); extern float __fabsf (float __x) throw () __attribute__ ((__const__));


extern float floorf (float __x) throw () __attribute__ ((__const__)); extern float __floorf (float __x) throw () __attribute__ ((__const__));


extern float fmodf (float __x, float __y) throw (); extern float __fmodf (float __x, float __y) throw ();
# 177 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern int isinff (float __value) throw () __attribute__ ((__const__));




extern int finitef (float __value) throw () __attribute__ ((__const__));


extern float dremf (float __x, float __y) throw (); extern float __dremf (float __x, float __y) throw ();



extern float significandf (float __x) throw (); extern float __significandf (float __x) throw ();






extern float copysignf (float __x, float __y) throw () __attribute__ ((__const__)); extern float __copysignf (float __x, float __y) throw () __attribute__ ((__const__));




extern float nanf (const char *__tagb) throw (); extern float __nanf (const char *__tagb) throw ();
# 211 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern int isnanf (float __value) throw () __attribute__ ((__const__));





extern float j0f (float) throw (); extern float __j0f (float) throw ();
extern float j1f (float) throw (); extern float __j1f (float) throw ();
extern float jnf (int, float) throw (); extern float __jnf (int, float) throw ();
extern float y0f (float) throw (); extern float __y0f (float) throw ();
extern float y1f (float) throw (); extern float __y1f (float) throw ();
extern float ynf (int, float) throw (); extern float __ynf (int, float) throw ();





extern float erff (float) throw (); extern float __erff (float) throw ();
extern float erfcf (float) throw (); extern float __erfcf (float) throw ();
extern float lgammaf (float) throw (); extern float __lgammaf (float) throw ();




extern float tgammaf (float) throw (); extern float __tgammaf (float) throw ();





extern float gammaf (float) throw (); extern float __gammaf (float) throw ();







extern float lgammaf_r (float, int *__signgamp) throw (); extern float __lgammaf_r (float, int *__signgamp) throw ();






extern float rintf (float __x) throw (); extern float __rintf (float __x) throw ();


extern float nextafterf (float __x, float __y) throw (); extern float __nextafterf (float __x, float __y) throw ();

extern float nexttowardf (float __x, long double __y) throw (); extern float __nexttowardf (float __x, long double __y) throw ();




extern float nextdownf (float __x) throw (); extern float __nextdownf (float __x) throw ();

extern float nextupf (float __x) throw (); extern float __nextupf (float __x) throw ();



extern float remainderf (float __x, float __y) throw (); extern float __remainderf (float __x, float __y) throw ();



extern float scalbnf (float __x, int __n) throw (); extern float __scalbnf (float __x, int __n) throw ();



extern int ilogbf (float __x) throw (); extern int __ilogbf (float __x) throw ();




extern long int llogbf (float __x) throw (); extern long int __llogbf (float __x) throw ();




extern float scalblnf (float __x, long int __n) throw (); extern float __scalblnf (float __x, long int __n) throw ();



extern float nearbyintf (float __x) throw (); extern float __nearbyintf (float __x) throw ();



extern float roundf (float __x) throw () __attribute__ ((__const__)); extern float __roundf (float __x) throw () __attribute__ ((__const__));



extern float truncf (float __x) throw () __attribute__ ((__const__)); extern float __truncf (float __x) throw () __attribute__ ((__const__));




extern float remquof (float __x, float __y, int *__quo) throw (); extern float __remquof (float __x, float __y, int *__quo) throw ();






extern long int lrintf (float __x) throw (); extern long int __lrintf (float __x) throw ();
__extension__
extern long long int llrintf (float __x) throw (); extern long long int __llrintf (float __x) throw ();



extern long int lroundf (float __x) throw (); extern long int __lroundf (float __x) throw ();
__extension__
extern long long int llroundf (float __x) throw (); extern long long int __llroundf (float __x) throw ();



extern float fdimf (float __x, float __y) throw (); extern float __fdimf (float __x, float __y) throw ();


extern float fmaxf (float __x, float __y) throw () __attribute__ ((__const__)); extern float __fmaxf (float __x, float __y) throw () __attribute__ ((__const__));


extern float fminf (float __x, float __y) throw () __attribute__ ((__const__)); extern float __fminf (float __x, float __y) throw () __attribute__ ((__const__));


extern float fmaf (float __x, float __y, float __z) throw (); extern float __fmaf (float __x, float __y, float __z) throw ();




extern float roundevenf (float __x) throw () __attribute__ ((__const__)); extern float __roundevenf (float __x) throw () __attribute__ ((__const__));



extern __intmax_t fromfpf (float __x, int __round, unsigned int __width) throw (); extern __intmax_t __fromfpf (float __x, int __round, unsigned int __width) throw ()
                            ;



extern __uintmax_t ufromfpf (float __x, int __round, unsigned int __width) throw (); extern __uintmax_t __ufromfpf (float __x, int __round, unsigned int __width) throw ()
                              ;




extern __intmax_t fromfpxf (float __x, int __round, unsigned int __width) throw (); extern __intmax_t __fromfpxf (float __x, int __round, unsigned int __width) throw ()
                             ;




extern __uintmax_t ufromfpxf (float __x, int __round, unsigned int __width) throw (); extern __uintmax_t __ufromfpxf (float __x, int __round, unsigned int __width) throw ()
                               ;


extern float fmaxmagf (float __x, float __y) throw () __attribute__ ((__const__)); extern float __fmaxmagf (float __x, float __y) throw () __attribute__ ((__const__));


extern float fminmagf (float __x, float __y) throw () __attribute__ ((__const__)); extern float __fminmagf (float __x, float __y) throw () __attribute__ ((__const__));


extern int canonicalizef (float *__cx, const float *__x) throw ();




extern int totalorderf (const float *__x, const float *__y) throw ()

     __attribute__ ((__pure__));


extern int totalordermagf (const float *__x, const float *__y) throw ()

     __attribute__ ((__pure__));


extern float getpayloadf (const float *__x) throw (); extern float __getpayloadf (const float *__x) throw ();


extern int setpayloadf (float *__x, float __payload) throw ();


extern int setpayloadsigf (float *__x, float __payload) throw ();







extern float scalbf (float __x, float __n) throw (); extern float __scalbf (float __x, float __n) throw ();
# 308 "/usr/include/math.h" 2 3 4
# 349 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h" 1 3 4
# 21 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h" 3 4
extern int __fpclassifyl (long double __value) throw ()
     __attribute__ ((__const__));


extern int __signbitl (long double __value) throw ()
     __attribute__ ((__const__));



extern int __isinfl (long double __value) throw () __attribute__ ((__const__));


extern int __finitel (long double __value) throw () __attribute__ ((__const__));


extern int __isnanl (long double __value) throw () __attribute__ ((__const__));


extern int __iseqsigl (long double __x, long double __y) throw ();


extern int __issignalingl (long double __value) throw ()
     __attribute__ ((__const__));
# 350 "/usr/include/math.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 1 3 4
# 53 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern long double acosl (long double __x) throw (); extern long double __acosl (long double __x) throw ();

extern long double asinl (long double __x) throw (); extern long double __asinl (long double __x) throw ();

extern long double atanl (long double __x) throw (); extern long double __atanl (long double __x) throw ();

extern long double atan2l (long double __y, long double __x) throw (); extern long double __atan2l (long double __y, long double __x) throw ();


 extern long double cosl (long double __x) throw (); extern long double __cosl (long double __x) throw ();

 extern long double sinl (long double __x) throw (); extern long double __sinl (long double __x) throw ();

extern long double tanl (long double __x) throw (); extern long double __tanl (long double __x) throw ();




extern long double coshl (long double __x) throw (); extern long double __coshl (long double __x) throw ();

extern long double sinhl (long double __x) throw (); extern long double __sinhl (long double __x) throw ();

extern long double tanhl (long double __x) throw (); extern long double __tanhl (long double __x) throw ();



 extern void sincosl (long double __x, long double *__sinx, long double *__cosx) throw (); extern void __sincosl (long double __x, long double *__sinx, long double *__cosx) throw ()
                                                        ;




extern long double acoshl (long double __x) throw (); extern long double __acoshl (long double __x) throw ();

extern long double asinhl (long double __x) throw (); extern long double __asinhl (long double __x) throw ();

extern long double atanhl (long double __x) throw (); extern long double __atanhl (long double __x) throw ();





 extern long double expl (long double __x) throw (); extern long double __expl (long double __x) throw ();


extern long double frexpl (long double __x, int *__exponent) throw (); extern long double __frexpl (long double __x, int *__exponent) throw ();


extern long double ldexpl (long double __x, int __exponent) throw (); extern long double __ldexpl (long double __x, int __exponent) throw ();


 extern long double logl (long double __x) throw (); extern long double __logl (long double __x) throw ();


extern long double log10l (long double __x) throw (); extern long double __log10l (long double __x) throw ();


extern long double modfl (long double __x, long double *__iptr) throw (); extern long double __modfl (long double __x, long double *__iptr) throw () __attribute__ ((__nonnull__ (2)));



extern long double exp10l (long double __x) throw (); extern long double __exp10l (long double __x) throw ();




extern long double expm1l (long double __x) throw (); extern long double __expm1l (long double __x) throw ();


extern long double log1pl (long double __x) throw (); extern long double __log1pl (long double __x) throw ();


extern long double logbl (long double __x) throw (); extern long double __logbl (long double __x) throw ();




extern long double exp2l (long double __x) throw (); extern long double __exp2l (long double __x) throw ();


extern long double log2l (long double __x) throw (); extern long double __log2l (long double __x) throw ();






 extern long double powl (long double __x, long double __y) throw (); extern long double __powl (long double __x, long double __y) throw ();


extern long double sqrtl (long double __x) throw (); extern long double __sqrtl (long double __x) throw ();



extern long double hypotl (long double __x, long double __y) throw (); extern long double __hypotl (long double __x, long double __y) throw ();




extern long double cbrtl (long double __x) throw (); extern long double __cbrtl (long double __x) throw ();






extern long double ceill (long double __x) throw () __attribute__ ((__const__)); extern long double __ceill (long double __x) throw () __attribute__ ((__const__));


extern long double fabsl (long double __x) throw () __attribute__ ((__const__)); extern long double __fabsl (long double __x) throw () __attribute__ ((__const__));


extern long double floorl (long double __x) throw () __attribute__ ((__const__)); extern long double __floorl (long double __x) throw () __attribute__ ((__const__));


extern long double fmodl (long double __x, long double __y) throw (); extern long double __fmodl (long double __x, long double __y) throw ();
# 177 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern int isinfl (long double __value) throw () __attribute__ ((__const__));




extern int finitel (long double __value) throw () __attribute__ ((__const__));


extern long double dreml (long double __x, long double __y) throw (); extern long double __dreml (long double __x, long double __y) throw ();



extern long double significandl (long double __x) throw (); extern long double __significandl (long double __x) throw ();






extern long double copysignl (long double __x, long double __y) throw () __attribute__ ((__const__)); extern long double __copysignl (long double __x, long double __y) throw () __attribute__ ((__const__));




extern long double nanl (const char *__tagb) throw (); extern long double __nanl (const char *__tagb) throw ();
# 211 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern int isnanl (long double __value) throw () __attribute__ ((__const__));





extern long double j0l (long double) throw (); extern long double __j0l (long double) throw ();
extern long double j1l (long double) throw (); extern long double __j1l (long double) throw ();
extern long double jnl (int, long double) throw (); extern long double __jnl (int, long double) throw ();
extern long double y0l (long double) throw (); extern long double __y0l (long double) throw ();
extern long double y1l (long double) throw (); extern long double __y1l (long double) throw ();
extern long double ynl (int, long double) throw (); extern long double __ynl (int, long double) throw ();





extern long double erfl (long double) throw (); extern long double __erfl (long double) throw ();
extern long double erfcl (long double) throw (); extern long double __erfcl (long double) throw ();
extern long double lgammal (long double) throw (); extern long double __lgammal (long double) throw ();




extern long double tgammal (long double) throw (); extern long double __tgammal (long double) throw ();





extern long double gammal (long double) throw (); extern long double __gammal (long double) throw ();







extern long double lgammal_r (long double, int *__signgamp) throw (); extern long double __lgammal_r (long double, int *__signgamp) throw ();






extern long double rintl (long double __x) throw (); extern long double __rintl (long double __x) throw ();


extern long double nextafterl (long double __x, long double __y) throw (); extern long double __nextafterl (long double __x, long double __y) throw ();

extern long double nexttowardl (long double __x, long double __y) throw (); extern long double __nexttowardl (long double __x, long double __y) throw ();




extern long double nextdownl (long double __x) throw (); extern long double __nextdownl (long double __x) throw ();

extern long double nextupl (long double __x) throw (); extern long double __nextupl (long double __x) throw ();



extern long double remainderl (long double __x, long double __y) throw (); extern long double __remainderl (long double __x, long double __y) throw ();



extern long double scalbnl (long double __x, int __n) throw (); extern long double __scalbnl (long double __x, int __n) throw ();



extern int ilogbl (long double __x) throw (); extern int __ilogbl (long double __x) throw ();




extern long int llogbl (long double __x) throw (); extern long int __llogbl (long double __x) throw ();




extern long double scalblnl (long double __x, long int __n) throw (); extern long double __scalblnl (long double __x, long int __n) throw ();



extern long double nearbyintl (long double __x) throw (); extern long double __nearbyintl (long double __x) throw ();



extern long double roundl (long double __x) throw () __attribute__ ((__const__)); extern long double __roundl (long double __x) throw () __attribute__ ((__const__));



extern long double truncl (long double __x) throw () __attribute__ ((__const__)); extern long double __truncl (long double __x) throw () __attribute__ ((__const__));




extern long double remquol (long double __x, long double __y, int *__quo) throw (); extern long double __remquol (long double __x, long double __y, int *__quo) throw ();






extern long int lrintl (long double __x) throw (); extern long int __lrintl (long double __x) throw ();
__extension__
extern long long int llrintl (long double __x) throw (); extern long long int __llrintl (long double __x) throw ();



extern long int lroundl (long double __x) throw (); extern long int __lroundl (long double __x) throw ();
__extension__
extern long long int llroundl (long double __x) throw (); extern long long int __llroundl (long double __x) throw ();



extern long double fdiml (long double __x, long double __y) throw (); extern long double __fdiml (long double __x, long double __y) throw ();


extern long double fmaxl (long double __x, long double __y) throw () __attribute__ ((__const__)); extern long double __fmaxl (long double __x, long double __y) throw () __attribute__ ((__const__));


extern long double fminl (long double __x, long double __y) throw () __attribute__ ((__const__)); extern long double __fminl (long double __x, long double __y) throw () __attribute__ ((__const__));


extern long double fmal (long double __x, long double __y, long double __z) throw (); extern long double __fmal (long double __x, long double __y, long double __z) throw ();




extern long double roundevenl (long double __x) throw () __attribute__ ((__const__)); extern long double __roundevenl (long double __x) throw () __attribute__ ((__const__));



extern __intmax_t fromfpl (long double __x, int __round, unsigned int __width) throw (); extern __intmax_t __fromfpl (long double __x, int __round, unsigned int __width) throw ()
                            ;



extern __uintmax_t ufromfpl (long double __x, int __round, unsigned int __width) throw (); extern __uintmax_t __ufromfpl (long double __x, int __round, unsigned int __width) throw ()
                              ;




extern __intmax_t fromfpxl (long double __x, int __round, unsigned int __width) throw (); extern __intmax_t __fromfpxl (long double __x, int __round, unsigned int __width) throw ()
                             ;




extern __uintmax_t ufromfpxl (long double __x, int __round, unsigned int __width) throw (); extern __uintmax_t __ufromfpxl (long double __x, int __round, unsigned int __width) throw ()
                               ;


extern long double fmaxmagl (long double __x, long double __y) throw () __attribute__ ((__const__)); extern long double __fmaxmagl (long double __x, long double __y) throw () __attribute__ ((__const__));


extern long double fminmagl (long double __x, long double __y) throw () __attribute__ ((__const__)); extern long double __fminmagl (long double __x, long double __y) throw () __attribute__ ((__const__));


extern int canonicalizel (long double *__cx, const long double *__x) throw ();




extern int totalorderl (const long double *__x, const long double *__y) throw ()

     __attribute__ ((__pure__));


extern int totalordermagl (const long double *__x, const long double *__y) throw ()

     __attribute__ ((__pure__));


extern long double getpayloadl (const long double *__x) throw (); extern long double __getpayloadl (const long double *__x) throw ();


extern int setpayloadl (long double *__x, long double __payload) throw ();


extern int setpayloadsigl (long double *__x, long double __payload) throw ();







extern long double scalbl (long double __x, long double __n) throw (); extern long double __scalbl (long double __x, long double __n) throw ();
# 351 "/usr/include/math.h" 2 3 4
# 389 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 1 3 4
# 53 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern _Float32 acosf32 (_Float32 __x) throw (); extern _Float32 __acosf32 (_Float32 __x) throw ();

extern _Float32 asinf32 (_Float32 __x) throw (); extern _Float32 __asinf32 (_Float32 __x) throw ();

extern _Float32 atanf32 (_Float32 __x) throw (); extern _Float32 __atanf32 (_Float32 __x) throw ();

extern _Float32 atan2f32 (_Float32 __y, _Float32 __x) throw (); extern _Float32 __atan2f32 (_Float32 __y, _Float32 __x) throw ();


 extern _Float32 cosf32 (_Float32 __x) throw (); extern _Float32 __cosf32 (_Float32 __x) throw ();

 extern _Float32 sinf32 (_Float32 __x) throw (); extern _Float32 __sinf32 (_Float32 __x) throw ();

extern _Float32 tanf32 (_Float32 __x) throw (); extern _Float32 __tanf32 (_Float32 __x) throw ();




extern _Float32 coshf32 (_Float32 __x) throw (); extern _Float32 __coshf32 (_Float32 __x) throw ();

extern _Float32 sinhf32 (_Float32 __x) throw (); extern _Float32 __sinhf32 (_Float32 __x) throw ();

extern _Float32 tanhf32 (_Float32 __x) throw (); extern _Float32 __tanhf32 (_Float32 __x) throw ();



 extern void sincosf32 (_Float32 __x, _Float32 *__sinx, _Float32 *__cosx) throw (); extern void __sincosf32 (_Float32 __x, _Float32 *__sinx, _Float32 *__cosx) throw ()
                                                        ;




extern _Float32 acoshf32 (_Float32 __x) throw (); extern _Float32 __acoshf32 (_Float32 __x) throw ();

extern _Float32 asinhf32 (_Float32 __x) throw (); extern _Float32 __asinhf32 (_Float32 __x) throw ();

extern _Float32 atanhf32 (_Float32 __x) throw (); extern _Float32 __atanhf32 (_Float32 __x) throw ();





 extern _Float32 expf32 (_Float32 __x) throw (); extern _Float32 __expf32 (_Float32 __x) throw ();


extern _Float32 frexpf32 (_Float32 __x, int *__exponent) throw (); extern _Float32 __frexpf32 (_Float32 __x, int *__exponent) throw ();


extern _Float32 ldexpf32 (_Float32 __x, int __exponent) throw (); extern _Float32 __ldexpf32 (_Float32 __x, int __exponent) throw ();


 extern _Float32 logf32 (_Float32 __x) throw (); extern _Float32 __logf32 (_Float32 __x) throw ();


extern _Float32 log10f32 (_Float32 __x) throw (); extern _Float32 __log10f32 (_Float32 __x) throw ();


extern _Float32 modff32 (_Float32 __x, _Float32 *__iptr) throw (); extern _Float32 __modff32 (_Float32 __x, _Float32 *__iptr) throw () __attribute__ ((__nonnull__ (2)));



extern _Float32 exp10f32 (_Float32 __x) throw (); extern _Float32 __exp10f32 (_Float32 __x) throw ();




extern _Float32 expm1f32 (_Float32 __x) throw (); extern _Float32 __expm1f32 (_Float32 __x) throw ();


extern _Float32 log1pf32 (_Float32 __x) throw (); extern _Float32 __log1pf32 (_Float32 __x) throw ();


extern _Float32 logbf32 (_Float32 __x) throw (); extern _Float32 __logbf32 (_Float32 __x) throw ();




extern _Float32 exp2f32 (_Float32 __x) throw (); extern _Float32 __exp2f32 (_Float32 __x) throw ();


extern _Float32 log2f32 (_Float32 __x) throw (); extern _Float32 __log2f32 (_Float32 __x) throw ();






 extern _Float32 powf32 (_Float32 __x, _Float32 __y) throw (); extern _Float32 __powf32 (_Float32 __x, _Float32 __y) throw ();


extern _Float32 sqrtf32 (_Float32 __x) throw (); extern _Float32 __sqrtf32 (_Float32 __x) throw ();



extern _Float32 hypotf32 (_Float32 __x, _Float32 __y) throw (); extern _Float32 __hypotf32 (_Float32 __x, _Float32 __y) throw ();




extern _Float32 cbrtf32 (_Float32 __x) throw (); extern _Float32 __cbrtf32 (_Float32 __x) throw ();






extern _Float32 ceilf32 (_Float32 __x) throw () __attribute__ ((__const__)); extern _Float32 __ceilf32 (_Float32 __x) throw () __attribute__ ((__const__));


extern _Float32 fabsf32 (_Float32 __x) throw () __attribute__ ((__const__)); extern _Float32 __fabsf32 (_Float32 __x) throw () __attribute__ ((__const__));


extern _Float32 floorf32 (_Float32 __x) throw () __attribute__ ((__const__)); extern _Float32 __floorf32 (_Float32 __x) throw () __attribute__ ((__const__));


extern _Float32 fmodf32 (_Float32 __x, _Float32 __y) throw (); extern _Float32 __fmodf32 (_Float32 __x, _Float32 __y) throw ();
# 196 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern _Float32 copysignf32 (_Float32 __x, _Float32 __y) throw () __attribute__ ((__const__)); extern _Float32 __copysignf32 (_Float32 __x, _Float32 __y) throw () __attribute__ ((__const__));




extern _Float32 nanf32 (const char *__tagb) throw (); extern _Float32 __nanf32 (const char *__tagb) throw ();
# 217 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern _Float32 j0f32 (_Float32) throw (); extern _Float32 __j0f32 (_Float32) throw ();
extern _Float32 j1f32 (_Float32) throw (); extern _Float32 __j1f32 (_Float32) throw ();
extern _Float32 jnf32 (int, _Float32) throw (); extern _Float32 __jnf32 (int, _Float32) throw ();
extern _Float32 y0f32 (_Float32) throw (); extern _Float32 __y0f32 (_Float32) throw ();
extern _Float32 y1f32 (_Float32) throw (); extern _Float32 __y1f32 (_Float32) throw ();
extern _Float32 ynf32 (int, _Float32) throw (); extern _Float32 __ynf32 (int, _Float32) throw ();





extern _Float32 erff32 (_Float32) throw (); extern _Float32 __erff32 (_Float32) throw ();
extern _Float32 erfcf32 (_Float32) throw (); extern _Float32 __erfcf32 (_Float32) throw ();
extern _Float32 lgammaf32 (_Float32) throw (); extern _Float32 __lgammaf32 (_Float32) throw ();




extern _Float32 tgammaf32 (_Float32) throw (); extern _Float32 __tgammaf32 (_Float32) throw ();
# 249 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern _Float32 lgammaf32_r (_Float32, int *__signgamp) throw (); extern _Float32 __lgammaf32_r (_Float32, int *__signgamp) throw ();






extern _Float32 rintf32 (_Float32 __x) throw (); extern _Float32 __rintf32 (_Float32 __x) throw ();


extern _Float32 nextafterf32 (_Float32 __x, _Float32 __y) throw (); extern _Float32 __nextafterf32 (_Float32 __x, _Float32 __y) throw ();






extern _Float32 nextdownf32 (_Float32 __x) throw (); extern _Float32 __nextdownf32 (_Float32 __x) throw ();

extern _Float32 nextupf32 (_Float32 __x) throw (); extern _Float32 __nextupf32 (_Float32 __x) throw ();



extern _Float32 remainderf32 (_Float32 __x, _Float32 __y) throw (); extern _Float32 __remainderf32 (_Float32 __x, _Float32 __y) throw ();



extern _Float32 scalbnf32 (_Float32 __x, int __n) throw (); extern _Float32 __scalbnf32 (_Float32 __x, int __n) throw ();



extern int ilogbf32 (_Float32 __x) throw (); extern int __ilogbf32 (_Float32 __x) throw ();




extern long int llogbf32 (_Float32 __x) throw (); extern long int __llogbf32 (_Float32 __x) throw ();




extern _Float32 scalblnf32 (_Float32 __x, long int __n) throw (); extern _Float32 __scalblnf32 (_Float32 __x, long int __n) throw ();



extern _Float32 nearbyintf32 (_Float32 __x) throw (); extern _Float32 __nearbyintf32 (_Float32 __x) throw ();



extern _Float32 roundf32 (_Float32 __x) throw () __attribute__ ((__const__)); extern _Float32 __roundf32 (_Float32 __x) throw () __attribute__ ((__const__));



extern _Float32 truncf32 (_Float32 __x) throw () __attribute__ ((__const__)); extern _Float32 __truncf32 (_Float32 __x) throw () __attribute__ ((__const__));




extern _Float32 remquof32 (_Float32 __x, _Float32 __y, int *__quo) throw (); extern _Float32 __remquof32 (_Float32 __x, _Float32 __y, int *__quo) throw ();






extern long int lrintf32 (_Float32 __x) throw (); extern long int __lrintf32 (_Float32 __x) throw ();
__extension__
extern long long int llrintf32 (_Float32 __x) throw (); extern long long int __llrintf32 (_Float32 __x) throw ();



extern long int lroundf32 (_Float32 __x) throw (); extern long int __lroundf32 (_Float32 __x) throw ();
__extension__
extern long long int llroundf32 (_Float32 __x) throw (); extern long long int __llroundf32 (_Float32 __x) throw ();



extern _Float32 fdimf32 (_Float32 __x, _Float32 __y) throw (); extern _Float32 __fdimf32 (_Float32 __x, _Float32 __y) throw ();


extern _Float32 fmaxf32 (_Float32 __x, _Float32 __y) throw () __attribute__ ((__const__)); extern _Float32 __fmaxf32 (_Float32 __x, _Float32 __y) throw () __attribute__ ((__const__));


extern _Float32 fminf32 (_Float32 __x, _Float32 __y) throw () __attribute__ ((__const__)); extern _Float32 __fminf32 (_Float32 __x, _Float32 __y) throw () __attribute__ ((__const__));


extern _Float32 fmaf32 (_Float32 __x, _Float32 __y, _Float32 __z) throw (); extern _Float32 __fmaf32 (_Float32 __x, _Float32 __y, _Float32 __z) throw ();




extern _Float32 roundevenf32 (_Float32 __x) throw () __attribute__ ((__const__)); extern _Float32 __roundevenf32 (_Float32 __x) throw () __attribute__ ((__const__));



extern __intmax_t fromfpf32 (_Float32 __x, int __round, unsigned int __width) throw (); extern __intmax_t __fromfpf32 (_Float32 __x, int __round, unsigned int __width) throw ()
                            ;



extern __uintmax_t ufromfpf32 (_Float32 __x, int __round, unsigned int __width) throw (); extern __uintmax_t __ufromfpf32 (_Float32 __x, int __round, unsigned int __width) throw ()
                              ;




extern __intmax_t fromfpxf32 (_Float32 __x, int __round, unsigned int __width) throw (); extern __intmax_t __fromfpxf32 (_Float32 __x, int __round, unsigned int __width) throw ()
                             ;




extern __uintmax_t ufromfpxf32 (_Float32 __x, int __round, unsigned int __width) throw (); extern __uintmax_t __ufromfpxf32 (_Float32 __x, int __round, unsigned int __width) throw ()
                               ;


extern _Float32 fmaxmagf32 (_Float32 __x, _Float32 __y) throw () __attribute__ ((__const__)); extern _Float32 __fmaxmagf32 (_Float32 __x, _Float32 __y) throw () __attribute__ ((__const__));


extern _Float32 fminmagf32 (_Float32 __x, _Float32 __y) throw () __attribute__ ((__const__)); extern _Float32 __fminmagf32 (_Float32 __x, _Float32 __y) throw () __attribute__ ((__const__));


extern int canonicalizef32 (_Float32 *__cx, const _Float32 *__x) throw ();




extern int totalorderf32 (const _Float32 *__x, const _Float32 *__y) throw ()

     __attribute__ ((__pure__));


extern int totalordermagf32 (const _Float32 *__x, const _Float32 *__y) throw ()

     __attribute__ ((__pure__));


extern _Float32 getpayloadf32 (const _Float32 *__x) throw (); extern _Float32 __getpayloadf32 (const _Float32 *__x) throw ();


extern int setpayloadf32 (_Float32 *__x, _Float32 __payload) throw ();


extern int setpayloadsigf32 (_Float32 *__x, _Float32 __payload) throw ();
# 390 "/usr/include/math.h" 2 3 4
# 406 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 1 3 4
# 53 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern _Float64 acosf64 (_Float64 __x) throw (); extern _Float64 __acosf64 (_Float64 __x) throw ();

extern _Float64 asinf64 (_Float64 __x) throw (); extern _Float64 __asinf64 (_Float64 __x) throw ();

extern _Float64 atanf64 (_Float64 __x) throw (); extern _Float64 __atanf64 (_Float64 __x) throw ();

extern _Float64 atan2f64 (_Float64 __y, _Float64 __x) throw (); extern _Float64 __atan2f64 (_Float64 __y, _Float64 __x) throw ();


 extern _Float64 cosf64 (_Float64 __x) throw (); extern _Float64 __cosf64 (_Float64 __x) throw ();

 extern _Float64 sinf64 (_Float64 __x) throw (); extern _Float64 __sinf64 (_Float64 __x) throw ();

extern _Float64 tanf64 (_Float64 __x) throw (); extern _Float64 __tanf64 (_Float64 __x) throw ();




extern _Float64 coshf64 (_Float64 __x) throw (); extern _Float64 __coshf64 (_Float64 __x) throw ();

extern _Float64 sinhf64 (_Float64 __x) throw (); extern _Float64 __sinhf64 (_Float64 __x) throw ();

extern _Float64 tanhf64 (_Float64 __x) throw (); extern _Float64 __tanhf64 (_Float64 __x) throw ();



 extern void sincosf64 (_Float64 __x, _Float64 *__sinx, _Float64 *__cosx) throw (); extern void __sincosf64 (_Float64 __x, _Float64 *__sinx, _Float64 *__cosx) throw ()
                                                        ;




extern _Float64 acoshf64 (_Float64 __x) throw (); extern _Float64 __acoshf64 (_Float64 __x) throw ();

extern _Float64 asinhf64 (_Float64 __x) throw (); extern _Float64 __asinhf64 (_Float64 __x) throw ();

extern _Float64 atanhf64 (_Float64 __x) throw (); extern _Float64 __atanhf64 (_Float64 __x) throw ();





 extern _Float64 expf64 (_Float64 __x) throw (); extern _Float64 __expf64 (_Float64 __x) throw ();


extern _Float64 frexpf64 (_Float64 __x, int *__exponent) throw (); extern _Float64 __frexpf64 (_Float64 __x, int *__exponent) throw ();


extern _Float64 ldexpf64 (_Float64 __x, int __exponent) throw (); extern _Float64 __ldexpf64 (_Float64 __x, int __exponent) throw ();


 extern _Float64 logf64 (_Float64 __x) throw (); extern _Float64 __logf64 (_Float64 __x) throw ();


extern _Float64 log10f64 (_Float64 __x) throw (); extern _Float64 __log10f64 (_Float64 __x) throw ();


extern _Float64 modff64 (_Float64 __x, _Float64 *__iptr) throw (); extern _Float64 __modff64 (_Float64 __x, _Float64 *__iptr) throw () __attribute__ ((__nonnull__ (2)));



extern _Float64 exp10f64 (_Float64 __x) throw (); extern _Float64 __exp10f64 (_Float64 __x) throw ();




extern _Float64 expm1f64 (_Float64 __x) throw (); extern _Float64 __expm1f64 (_Float64 __x) throw ();


extern _Float64 log1pf64 (_Float64 __x) throw (); extern _Float64 __log1pf64 (_Float64 __x) throw ();


extern _Float64 logbf64 (_Float64 __x) throw (); extern _Float64 __logbf64 (_Float64 __x) throw ();




extern _Float64 exp2f64 (_Float64 __x) throw (); extern _Float64 __exp2f64 (_Float64 __x) throw ();


extern _Float64 log2f64 (_Float64 __x) throw (); extern _Float64 __log2f64 (_Float64 __x) throw ();






 extern _Float64 powf64 (_Float64 __x, _Float64 __y) throw (); extern _Float64 __powf64 (_Float64 __x, _Float64 __y) throw ();


extern _Float64 sqrtf64 (_Float64 __x) throw (); extern _Float64 __sqrtf64 (_Float64 __x) throw ();



extern _Float64 hypotf64 (_Float64 __x, _Float64 __y) throw (); extern _Float64 __hypotf64 (_Float64 __x, _Float64 __y) throw ();




extern _Float64 cbrtf64 (_Float64 __x) throw (); extern _Float64 __cbrtf64 (_Float64 __x) throw ();






extern _Float64 ceilf64 (_Float64 __x) throw () __attribute__ ((__const__)); extern _Float64 __ceilf64 (_Float64 __x) throw () __attribute__ ((__const__));


extern _Float64 fabsf64 (_Float64 __x) throw () __attribute__ ((__const__)); extern _Float64 __fabsf64 (_Float64 __x) throw () __attribute__ ((__const__));


extern _Float64 floorf64 (_Float64 __x) throw () __attribute__ ((__const__)); extern _Float64 __floorf64 (_Float64 __x) throw () __attribute__ ((__const__));


extern _Float64 fmodf64 (_Float64 __x, _Float64 __y) throw (); extern _Float64 __fmodf64 (_Float64 __x, _Float64 __y) throw ();
# 196 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern _Float64 copysignf64 (_Float64 __x, _Float64 __y) throw () __attribute__ ((__const__)); extern _Float64 __copysignf64 (_Float64 __x, _Float64 __y) throw () __attribute__ ((__const__));




extern _Float64 nanf64 (const char *__tagb) throw (); extern _Float64 __nanf64 (const char *__tagb) throw ();
# 217 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern _Float64 j0f64 (_Float64) throw (); extern _Float64 __j0f64 (_Float64) throw ();
extern _Float64 j1f64 (_Float64) throw (); extern _Float64 __j1f64 (_Float64) throw ();
extern _Float64 jnf64 (int, _Float64) throw (); extern _Float64 __jnf64 (int, _Float64) throw ();
extern _Float64 y0f64 (_Float64) throw (); extern _Float64 __y0f64 (_Float64) throw ();
extern _Float64 y1f64 (_Float64) throw (); extern _Float64 __y1f64 (_Float64) throw ();
extern _Float64 ynf64 (int, _Float64) throw (); extern _Float64 __ynf64 (int, _Float64) throw ();





extern _Float64 erff64 (_Float64) throw (); extern _Float64 __erff64 (_Float64) throw ();
extern _Float64 erfcf64 (_Float64) throw (); extern _Float64 __erfcf64 (_Float64) throw ();
extern _Float64 lgammaf64 (_Float64) throw (); extern _Float64 __lgammaf64 (_Float64) throw ();




extern _Float64 tgammaf64 (_Float64) throw (); extern _Float64 __tgammaf64 (_Float64) throw ();
# 249 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern _Float64 lgammaf64_r (_Float64, int *__signgamp) throw (); extern _Float64 __lgammaf64_r (_Float64, int *__signgamp) throw ();






extern _Float64 rintf64 (_Float64 __x) throw (); extern _Float64 __rintf64 (_Float64 __x) throw ();


extern _Float64 nextafterf64 (_Float64 __x, _Float64 __y) throw (); extern _Float64 __nextafterf64 (_Float64 __x, _Float64 __y) throw ();






extern _Float64 nextdownf64 (_Float64 __x) throw (); extern _Float64 __nextdownf64 (_Float64 __x) throw ();

extern _Float64 nextupf64 (_Float64 __x) throw (); extern _Float64 __nextupf64 (_Float64 __x) throw ();



extern _Float64 remainderf64 (_Float64 __x, _Float64 __y) throw (); extern _Float64 __remainderf64 (_Float64 __x, _Float64 __y) throw ();



extern _Float64 scalbnf64 (_Float64 __x, int __n) throw (); extern _Float64 __scalbnf64 (_Float64 __x, int __n) throw ();



extern int ilogbf64 (_Float64 __x) throw (); extern int __ilogbf64 (_Float64 __x) throw ();




extern long int llogbf64 (_Float64 __x) throw (); extern long int __llogbf64 (_Float64 __x) throw ();




extern _Float64 scalblnf64 (_Float64 __x, long int __n) throw (); extern _Float64 __scalblnf64 (_Float64 __x, long int __n) throw ();



extern _Float64 nearbyintf64 (_Float64 __x) throw (); extern _Float64 __nearbyintf64 (_Float64 __x) throw ();



extern _Float64 roundf64 (_Float64 __x) throw () __attribute__ ((__const__)); extern _Float64 __roundf64 (_Float64 __x) throw () __attribute__ ((__const__));



extern _Float64 truncf64 (_Float64 __x) throw () __attribute__ ((__const__)); extern _Float64 __truncf64 (_Float64 __x) throw () __attribute__ ((__const__));




extern _Float64 remquof64 (_Float64 __x, _Float64 __y, int *__quo) throw (); extern _Float64 __remquof64 (_Float64 __x, _Float64 __y, int *__quo) throw ();






extern long int lrintf64 (_Float64 __x) throw (); extern long int __lrintf64 (_Float64 __x) throw ();
__extension__
extern long long int llrintf64 (_Float64 __x) throw (); extern long long int __llrintf64 (_Float64 __x) throw ();



extern long int lroundf64 (_Float64 __x) throw (); extern long int __lroundf64 (_Float64 __x) throw ();
__extension__
extern long long int llroundf64 (_Float64 __x) throw (); extern long long int __llroundf64 (_Float64 __x) throw ();



extern _Float64 fdimf64 (_Float64 __x, _Float64 __y) throw (); extern _Float64 __fdimf64 (_Float64 __x, _Float64 __y) throw ();


extern _Float64 fmaxf64 (_Float64 __x, _Float64 __y) throw () __attribute__ ((__const__)); extern _Float64 __fmaxf64 (_Float64 __x, _Float64 __y) throw () __attribute__ ((__const__));


extern _Float64 fminf64 (_Float64 __x, _Float64 __y) throw () __attribute__ ((__const__)); extern _Float64 __fminf64 (_Float64 __x, _Float64 __y) throw () __attribute__ ((__const__));


extern _Float64 fmaf64 (_Float64 __x, _Float64 __y, _Float64 __z) throw (); extern _Float64 __fmaf64 (_Float64 __x, _Float64 __y, _Float64 __z) throw ();




extern _Float64 roundevenf64 (_Float64 __x) throw () __attribute__ ((__const__)); extern _Float64 __roundevenf64 (_Float64 __x) throw () __attribute__ ((__const__));



extern __intmax_t fromfpf64 (_Float64 __x, int __round, unsigned int __width) throw (); extern __intmax_t __fromfpf64 (_Float64 __x, int __round, unsigned int __width) throw ()
                            ;



extern __uintmax_t ufromfpf64 (_Float64 __x, int __round, unsigned int __width) throw (); extern __uintmax_t __ufromfpf64 (_Float64 __x, int __round, unsigned int __width) throw ()
                              ;




extern __intmax_t fromfpxf64 (_Float64 __x, int __round, unsigned int __width) throw (); extern __intmax_t __fromfpxf64 (_Float64 __x, int __round, unsigned int __width) throw ()
                             ;




extern __uintmax_t ufromfpxf64 (_Float64 __x, int __round, unsigned int __width) throw (); extern __uintmax_t __ufromfpxf64 (_Float64 __x, int __round, unsigned int __width) throw ()
                               ;


extern _Float64 fmaxmagf64 (_Float64 __x, _Float64 __y) throw () __attribute__ ((__const__)); extern _Float64 __fmaxmagf64 (_Float64 __x, _Float64 __y) throw () __attribute__ ((__const__));


extern _Float64 fminmagf64 (_Float64 __x, _Float64 __y) throw () __attribute__ ((__const__)); extern _Float64 __fminmagf64 (_Float64 __x, _Float64 __y) throw () __attribute__ ((__const__));


extern int canonicalizef64 (_Float64 *__cx, const _Float64 *__x) throw ();




extern int totalorderf64 (const _Float64 *__x, const _Float64 *__y) throw ()

     __attribute__ ((__pure__));


extern int totalordermagf64 (const _Float64 *__x, const _Float64 *__y) throw ()

     __attribute__ ((__pure__));


extern _Float64 getpayloadf64 (const _Float64 *__x) throw (); extern _Float64 __getpayloadf64 (const _Float64 *__x) throw ();


extern int setpayloadf64 (_Float64 *__x, _Float64 __payload) throw ();


extern int setpayloadsigf64 (_Float64 *__x, _Float64 __payload) throw ();
# 407 "/usr/include/math.h" 2 3 4
# 420 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h" 1 3 4
# 21 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h" 3 4
extern int __fpclassifyf128 (_Float128 __value) throw ()
     __attribute__ ((__const__));


extern int __signbitf128 (_Float128 __value) throw ()
     __attribute__ ((__const__));



extern int __isinff128 (_Float128 __value) throw () __attribute__ ((__const__));


extern int __finitef128 (_Float128 __value) throw () __attribute__ ((__const__));


extern int __isnanf128 (_Float128 __value) throw () __attribute__ ((__const__));


extern int __iseqsigf128 (_Float128 __x, _Float128 __y) throw ();


extern int __issignalingf128 (_Float128 __value) throw ()
     __attribute__ ((__const__));
# 421 "/usr/include/math.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 1 3 4
# 53 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern _Float128 acosf128 (_Float128 __x) throw (); extern _Float128 __acosf128 (_Float128 __x) throw ();

extern _Float128 asinf128 (_Float128 __x) throw (); extern _Float128 __asinf128 (_Float128 __x) throw ();

extern _Float128 atanf128 (_Float128 __x) throw (); extern _Float128 __atanf128 (_Float128 __x) throw ();

extern _Float128 atan2f128 (_Float128 __y, _Float128 __x) throw (); extern _Float128 __atan2f128 (_Float128 __y, _Float128 __x) throw ();


 extern _Float128 cosf128 (_Float128 __x) throw (); extern _Float128 __cosf128 (_Float128 __x) throw ();

 extern _Float128 sinf128 (_Float128 __x) throw (); extern _Float128 __sinf128 (_Float128 __x) throw ();

extern _Float128 tanf128 (_Float128 __x) throw (); extern _Float128 __tanf128 (_Float128 __x) throw ();




extern _Float128 coshf128 (_Float128 __x) throw (); extern _Float128 __coshf128 (_Float128 __x) throw ();

extern _Float128 sinhf128 (_Float128 __x) throw (); extern _Float128 __sinhf128 (_Float128 __x) throw ();

extern _Float128 tanhf128 (_Float128 __x) throw (); extern _Float128 __tanhf128 (_Float128 __x) throw ();



 extern void sincosf128 (_Float128 __x, _Float128 *__sinx, _Float128 *__cosx) throw (); extern void __sincosf128 (_Float128 __x, _Float128 *__sinx, _Float128 *__cosx) throw ()
                                                        ;




extern _Float128 acoshf128 (_Float128 __x) throw (); extern _Float128 __acoshf128 (_Float128 __x) throw ();

extern _Float128 asinhf128 (_Float128 __x) throw (); extern _Float128 __asinhf128 (_Float128 __x) throw ();

extern _Float128 atanhf128 (_Float128 __x) throw (); extern _Float128 __atanhf128 (_Float128 __x) throw ();





 extern _Float128 expf128 (_Float128 __x) throw (); extern _Float128 __expf128 (_Float128 __x) throw ();


extern _Float128 frexpf128 (_Float128 __x, int *__exponent) throw (); extern _Float128 __frexpf128 (_Float128 __x, int *__exponent) throw ();


extern _Float128 ldexpf128 (_Float128 __x, int __exponent) throw (); extern _Float128 __ldexpf128 (_Float128 __x, int __exponent) throw ();


 extern _Float128 logf128 (_Float128 __x) throw (); extern _Float128 __logf128 (_Float128 __x) throw ();


extern _Float128 log10f128 (_Float128 __x) throw (); extern _Float128 __log10f128 (_Float128 __x) throw ();


extern _Float128 modff128 (_Float128 __x, _Float128 *__iptr) throw (); extern _Float128 __modff128 (_Float128 __x, _Float128 *__iptr) throw () __attribute__ ((__nonnull__ (2)));



extern _Float128 exp10f128 (_Float128 __x) throw (); extern _Float128 __exp10f128 (_Float128 __x) throw ();




extern _Float128 expm1f128 (_Float128 __x) throw (); extern _Float128 __expm1f128 (_Float128 __x) throw ();


extern _Float128 log1pf128 (_Float128 __x) throw (); extern _Float128 __log1pf128 (_Float128 __x) throw ();


extern _Float128 logbf128 (_Float128 __x) throw (); extern _Float128 __logbf128 (_Float128 __x) throw ();




extern _Float128 exp2f128 (_Float128 __x) throw (); extern _Float128 __exp2f128 (_Float128 __x) throw ();


extern _Float128 log2f128 (_Float128 __x) throw (); extern _Float128 __log2f128 (_Float128 __x) throw ();






 extern _Float128 powf128 (_Float128 __x, _Float128 __y) throw (); extern _Float128 __powf128 (_Float128 __x, _Float128 __y) throw ();


extern _Float128 sqrtf128 (_Float128 __x) throw (); extern _Float128 __sqrtf128 (_Float128 __x) throw ();



extern _Float128 hypotf128 (_Float128 __x, _Float128 __y) throw (); extern _Float128 __hypotf128 (_Float128 __x, _Float128 __y) throw ();




extern _Float128 cbrtf128 (_Float128 __x) throw (); extern _Float128 __cbrtf128 (_Float128 __x) throw ();






extern _Float128 ceilf128 (_Float128 __x) throw () __attribute__ ((__const__)); extern _Float128 __ceilf128 (_Float128 __x) throw () __attribute__ ((__const__));


extern _Float128 fabsf128 (_Float128 __x) throw () __attribute__ ((__const__)); extern _Float128 __fabsf128 (_Float128 __x) throw () __attribute__ ((__const__));


extern _Float128 floorf128 (_Float128 __x) throw () __attribute__ ((__const__)); extern _Float128 __floorf128 (_Float128 __x) throw () __attribute__ ((__const__));


extern _Float128 fmodf128 (_Float128 __x, _Float128 __y) throw (); extern _Float128 __fmodf128 (_Float128 __x, _Float128 __y) throw ();
# 196 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern _Float128 copysignf128 (_Float128 __x, _Float128 __y) throw () __attribute__ ((__const__)); extern _Float128 __copysignf128 (_Float128 __x, _Float128 __y) throw () __attribute__ ((__const__));




extern _Float128 nanf128 (const char *__tagb) throw (); extern _Float128 __nanf128 (const char *__tagb) throw ();
# 217 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern _Float128 j0f128 (_Float128) throw (); extern _Float128 __j0f128 (_Float128) throw ();
extern _Float128 j1f128 (_Float128) throw (); extern _Float128 __j1f128 (_Float128) throw ();
extern _Float128 jnf128 (int, _Float128) throw (); extern _Float128 __jnf128 (int, _Float128) throw ();
extern _Float128 y0f128 (_Float128) throw (); extern _Float128 __y0f128 (_Float128) throw ();
extern _Float128 y1f128 (_Float128) throw (); extern _Float128 __y1f128 (_Float128) throw ();
extern _Float128 ynf128 (int, _Float128) throw (); extern _Float128 __ynf128 (int, _Float128) throw ();





extern _Float128 erff128 (_Float128) throw (); extern _Float128 __erff128 (_Float128) throw ();
extern _Float128 erfcf128 (_Float128) throw (); extern _Float128 __erfcf128 (_Float128) throw ();
extern _Float128 lgammaf128 (_Float128) throw (); extern _Float128 __lgammaf128 (_Float128) throw ();




extern _Float128 tgammaf128 (_Float128) throw (); extern _Float128 __tgammaf128 (_Float128) throw ();
# 249 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern _Float128 lgammaf128_r (_Float128, int *__signgamp) throw (); extern _Float128 __lgammaf128_r (_Float128, int *__signgamp) throw ();






extern _Float128 rintf128 (_Float128 __x) throw (); extern _Float128 __rintf128 (_Float128 __x) throw ();


extern _Float128 nextafterf128 (_Float128 __x, _Float128 __y) throw (); extern _Float128 __nextafterf128 (_Float128 __x, _Float128 __y) throw ();






extern _Float128 nextdownf128 (_Float128 __x) throw (); extern _Float128 __nextdownf128 (_Float128 __x) throw ();

extern _Float128 nextupf128 (_Float128 __x) throw (); extern _Float128 __nextupf128 (_Float128 __x) throw ();



extern _Float128 remainderf128 (_Float128 __x, _Float128 __y) throw (); extern _Float128 __remainderf128 (_Float128 __x, _Float128 __y) throw ();



extern _Float128 scalbnf128 (_Float128 __x, int __n) throw (); extern _Float128 __scalbnf128 (_Float128 __x, int __n) throw ();



extern int ilogbf128 (_Float128 __x) throw (); extern int __ilogbf128 (_Float128 __x) throw ();




extern long int llogbf128 (_Float128 __x) throw (); extern long int __llogbf128 (_Float128 __x) throw ();




extern _Float128 scalblnf128 (_Float128 __x, long int __n) throw (); extern _Float128 __scalblnf128 (_Float128 __x, long int __n) throw ();



extern _Float128 nearbyintf128 (_Float128 __x) throw (); extern _Float128 __nearbyintf128 (_Float128 __x) throw ();



extern _Float128 roundf128 (_Float128 __x) throw () __attribute__ ((__const__)); extern _Float128 __roundf128 (_Float128 __x) throw () __attribute__ ((__const__));



extern _Float128 truncf128 (_Float128 __x) throw () __attribute__ ((__const__)); extern _Float128 __truncf128 (_Float128 __x) throw () __attribute__ ((__const__));




extern _Float128 remquof128 (_Float128 __x, _Float128 __y, int *__quo) throw (); extern _Float128 __remquof128 (_Float128 __x, _Float128 __y, int *__quo) throw ();






extern long int lrintf128 (_Float128 __x) throw (); extern long int __lrintf128 (_Float128 __x) throw ();
__extension__
extern long long int llrintf128 (_Float128 __x) throw (); extern long long int __llrintf128 (_Float128 __x) throw ();



extern long int lroundf128 (_Float128 __x) throw (); extern long int __lroundf128 (_Float128 __x) throw ();
__extension__
extern long long int llroundf128 (_Float128 __x) throw (); extern long long int __llroundf128 (_Float128 __x) throw ();



extern _Float128 fdimf128 (_Float128 __x, _Float128 __y) throw (); extern _Float128 __fdimf128 (_Float128 __x, _Float128 __y) throw ();


extern _Float128 fmaxf128 (_Float128 __x, _Float128 __y) throw () __attribute__ ((__const__)); extern _Float128 __fmaxf128 (_Float128 __x, _Float128 __y) throw () __attribute__ ((__const__));


extern _Float128 fminf128 (_Float128 __x, _Float128 __y) throw () __attribute__ ((__const__)); extern _Float128 __fminf128 (_Float128 __x, _Float128 __y) throw () __attribute__ ((__const__));


extern _Float128 fmaf128 (_Float128 __x, _Float128 __y, _Float128 __z) throw (); extern _Float128 __fmaf128 (_Float128 __x, _Float128 __y, _Float128 __z) throw ();




extern _Float128 roundevenf128 (_Float128 __x) throw () __attribute__ ((__const__)); extern _Float128 __roundevenf128 (_Float128 __x) throw () __attribute__ ((__const__));



extern __intmax_t fromfpf128 (_Float128 __x, int __round, unsigned int __width) throw (); extern __intmax_t __fromfpf128 (_Float128 __x, int __round, unsigned int __width) throw ()
                            ;



extern __uintmax_t ufromfpf128 (_Float128 __x, int __round, unsigned int __width) throw (); extern __uintmax_t __ufromfpf128 (_Float128 __x, int __round, unsigned int __width) throw ()
                              ;




extern __intmax_t fromfpxf128 (_Float128 __x, int __round, unsigned int __width) throw (); extern __intmax_t __fromfpxf128 (_Float128 __x, int __round, unsigned int __width) throw ()
                             ;




extern __uintmax_t ufromfpxf128 (_Float128 __x, int __round, unsigned int __width) throw (); extern __uintmax_t __ufromfpxf128 (_Float128 __x, int __round, unsigned int __width) throw ()
                               ;


extern _Float128 fmaxmagf128 (_Float128 __x, _Float128 __y) throw () __attribute__ ((__const__)); extern _Float128 __fmaxmagf128 (_Float128 __x, _Float128 __y) throw () __attribute__ ((__const__));


extern _Float128 fminmagf128 (_Float128 __x, _Float128 __y) throw () __attribute__ ((__const__)); extern _Float128 __fminmagf128 (_Float128 __x, _Float128 __y) throw () __attribute__ ((__const__));


extern int canonicalizef128 (_Float128 *__cx, const _Float128 *__x) throw ();




extern int totalorderf128 (const _Float128 *__x, const _Float128 *__y) throw ()

     __attribute__ ((__pure__));


extern int totalordermagf128 (const _Float128 *__x, const _Float128 *__y) throw ()

     __attribute__ ((__pure__));


extern _Float128 getpayloadf128 (const _Float128 *__x) throw (); extern _Float128 __getpayloadf128 (const _Float128 *__x) throw ();


extern int setpayloadf128 (_Float128 *__x, _Float128 __payload) throw ();


extern int setpayloadsigf128 (_Float128 *__x, _Float128 __payload) throw ();
# 424 "/usr/include/math.h" 2 3 4
# 440 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 1 3 4
# 53 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern _Float32x acosf32x (_Float32x __x) throw (); extern _Float32x __acosf32x (_Float32x __x) throw ();

extern _Float32x asinf32x (_Float32x __x) throw (); extern _Float32x __asinf32x (_Float32x __x) throw ();

extern _Float32x atanf32x (_Float32x __x) throw (); extern _Float32x __atanf32x (_Float32x __x) throw ();

extern _Float32x atan2f32x (_Float32x __y, _Float32x __x) throw (); extern _Float32x __atan2f32x (_Float32x __y, _Float32x __x) throw ();


 extern _Float32x cosf32x (_Float32x __x) throw (); extern _Float32x __cosf32x (_Float32x __x) throw ();

 extern _Float32x sinf32x (_Float32x __x) throw (); extern _Float32x __sinf32x (_Float32x __x) throw ();

extern _Float32x tanf32x (_Float32x __x) throw (); extern _Float32x __tanf32x (_Float32x __x) throw ();




extern _Float32x coshf32x (_Float32x __x) throw (); extern _Float32x __coshf32x (_Float32x __x) throw ();

extern _Float32x sinhf32x (_Float32x __x) throw (); extern _Float32x __sinhf32x (_Float32x __x) throw ();

extern _Float32x tanhf32x (_Float32x __x) throw (); extern _Float32x __tanhf32x (_Float32x __x) throw ();



 extern void sincosf32x (_Float32x __x, _Float32x *__sinx, _Float32x *__cosx) throw (); extern void __sincosf32x (_Float32x __x, _Float32x *__sinx, _Float32x *__cosx) throw ()
                                                        ;




extern _Float32x acoshf32x (_Float32x __x) throw (); extern _Float32x __acoshf32x (_Float32x __x) throw ();

extern _Float32x asinhf32x (_Float32x __x) throw (); extern _Float32x __asinhf32x (_Float32x __x) throw ();

extern _Float32x atanhf32x (_Float32x __x) throw (); extern _Float32x __atanhf32x (_Float32x __x) throw ();





 extern _Float32x expf32x (_Float32x __x) throw (); extern _Float32x __expf32x (_Float32x __x) throw ();


extern _Float32x frexpf32x (_Float32x __x, int *__exponent) throw (); extern _Float32x __frexpf32x (_Float32x __x, int *__exponent) throw ();


extern _Float32x ldexpf32x (_Float32x __x, int __exponent) throw (); extern _Float32x __ldexpf32x (_Float32x __x, int __exponent) throw ();


 extern _Float32x logf32x (_Float32x __x) throw (); extern _Float32x __logf32x (_Float32x __x) throw ();


extern _Float32x log10f32x (_Float32x __x) throw (); extern _Float32x __log10f32x (_Float32x __x) throw ();


extern _Float32x modff32x (_Float32x __x, _Float32x *__iptr) throw (); extern _Float32x __modff32x (_Float32x __x, _Float32x *__iptr) throw () __attribute__ ((__nonnull__ (2)));



extern _Float32x exp10f32x (_Float32x __x) throw (); extern _Float32x __exp10f32x (_Float32x __x) throw ();




extern _Float32x expm1f32x (_Float32x __x) throw (); extern _Float32x __expm1f32x (_Float32x __x) throw ();


extern _Float32x log1pf32x (_Float32x __x) throw (); extern _Float32x __log1pf32x (_Float32x __x) throw ();


extern _Float32x logbf32x (_Float32x __x) throw (); extern _Float32x __logbf32x (_Float32x __x) throw ();




extern _Float32x exp2f32x (_Float32x __x) throw (); extern _Float32x __exp2f32x (_Float32x __x) throw ();


extern _Float32x log2f32x (_Float32x __x) throw (); extern _Float32x __log2f32x (_Float32x __x) throw ();






 extern _Float32x powf32x (_Float32x __x, _Float32x __y) throw (); extern _Float32x __powf32x (_Float32x __x, _Float32x __y) throw ();


extern _Float32x sqrtf32x (_Float32x __x) throw (); extern _Float32x __sqrtf32x (_Float32x __x) throw ();



extern _Float32x hypotf32x (_Float32x __x, _Float32x __y) throw (); extern _Float32x __hypotf32x (_Float32x __x, _Float32x __y) throw ();




extern _Float32x cbrtf32x (_Float32x __x) throw (); extern _Float32x __cbrtf32x (_Float32x __x) throw ();






extern _Float32x ceilf32x (_Float32x __x) throw () __attribute__ ((__const__)); extern _Float32x __ceilf32x (_Float32x __x) throw () __attribute__ ((__const__));


extern _Float32x fabsf32x (_Float32x __x) throw () __attribute__ ((__const__)); extern _Float32x __fabsf32x (_Float32x __x) throw () __attribute__ ((__const__));


extern _Float32x floorf32x (_Float32x __x) throw () __attribute__ ((__const__)); extern _Float32x __floorf32x (_Float32x __x) throw () __attribute__ ((__const__));


extern _Float32x fmodf32x (_Float32x __x, _Float32x __y) throw (); extern _Float32x __fmodf32x (_Float32x __x, _Float32x __y) throw ();
# 196 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern _Float32x copysignf32x (_Float32x __x, _Float32x __y) throw () __attribute__ ((__const__)); extern _Float32x __copysignf32x (_Float32x __x, _Float32x __y) throw () __attribute__ ((__const__));




extern _Float32x nanf32x (const char *__tagb) throw (); extern _Float32x __nanf32x (const char *__tagb) throw ();
# 217 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern _Float32x j0f32x (_Float32x) throw (); extern _Float32x __j0f32x (_Float32x) throw ();
extern _Float32x j1f32x (_Float32x) throw (); extern _Float32x __j1f32x (_Float32x) throw ();
extern _Float32x jnf32x (int, _Float32x) throw (); extern _Float32x __jnf32x (int, _Float32x) throw ();
extern _Float32x y0f32x (_Float32x) throw (); extern _Float32x __y0f32x (_Float32x) throw ();
extern _Float32x y1f32x (_Float32x) throw (); extern _Float32x __y1f32x (_Float32x) throw ();
extern _Float32x ynf32x (int, _Float32x) throw (); extern _Float32x __ynf32x (int, _Float32x) throw ();





extern _Float32x erff32x (_Float32x) throw (); extern _Float32x __erff32x (_Float32x) throw ();
extern _Float32x erfcf32x (_Float32x) throw (); extern _Float32x __erfcf32x (_Float32x) throw ();
extern _Float32x lgammaf32x (_Float32x) throw (); extern _Float32x __lgammaf32x (_Float32x) throw ();




extern _Float32x tgammaf32x (_Float32x) throw (); extern _Float32x __tgammaf32x (_Float32x) throw ();
# 249 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern _Float32x lgammaf32x_r (_Float32x, int *__signgamp) throw (); extern _Float32x __lgammaf32x_r (_Float32x, int *__signgamp) throw ();






extern _Float32x rintf32x (_Float32x __x) throw (); extern _Float32x __rintf32x (_Float32x __x) throw ();


extern _Float32x nextafterf32x (_Float32x __x, _Float32x __y) throw (); extern _Float32x __nextafterf32x (_Float32x __x, _Float32x __y) throw ();






extern _Float32x nextdownf32x (_Float32x __x) throw (); extern _Float32x __nextdownf32x (_Float32x __x) throw ();

extern _Float32x nextupf32x (_Float32x __x) throw (); extern _Float32x __nextupf32x (_Float32x __x) throw ();



extern _Float32x remainderf32x (_Float32x __x, _Float32x __y) throw (); extern _Float32x __remainderf32x (_Float32x __x, _Float32x __y) throw ();



extern _Float32x scalbnf32x (_Float32x __x, int __n) throw (); extern _Float32x __scalbnf32x (_Float32x __x, int __n) throw ();



extern int ilogbf32x (_Float32x __x) throw (); extern int __ilogbf32x (_Float32x __x) throw ();




extern long int llogbf32x (_Float32x __x) throw (); extern long int __llogbf32x (_Float32x __x) throw ();




extern _Float32x scalblnf32x (_Float32x __x, long int __n) throw (); extern _Float32x __scalblnf32x (_Float32x __x, long int __n) throw ();



extern _Float32x nearbyintf32x (_Float32x __x) throw (); extern _Float32x __nearbyintf32x (_Float32x __x) throw ();



extern _Float32x roundf32x (_Float32x __x) throw () __attribute__ ((__const__)); extern _Float32x __roundf32x (_Float32x __x) throw () __attribute__ ((__const__));



extern _Float32x truncf32x (_Float32x __x) throw () __attribute__ ((__const__)); extern _Float32x __truncf32x (_Float32x __x) throw () __attribute__ ((__const__));




extern _Float32x remquof32x (_Float32x __x, _Float32x __y, int *__quo) throw (); extern _Float32x __remquof32x (_Float32x __x, _Float32x __y, int *__quo) throw ();






extern long int lrintf32x (_Float32x __x) throw (); extern long int __lrintf32x (_Float32x __x) throw ();
__extension__
extern long long int llrintf32x (_Float32x __x) throw (); extern long long int __llrintf32x (_Float32x __x) throw ();



extern long int lroundf32x (_Float32x __x) throw (); extern long int __lroundf32x (_Float32x __x) throw ();
__extension__
extern long long int llroundf32x (_Float32x __x) throw (); extern long long int __llroundf32x (_Float32x __x) throw ();



extern _Float32x fdimf32x (_Float32x __x, _Float32x __y) throw (); extern _Float32x __fdimf32x (_Float32x __x, _Float32x __y) throw ();


extern _Float32x fmaxf32x (_Float32x __x, _Float32x __y) throw () __attribute__ ((__const__)); extern _Float32x __fmaxf32x (_Float32x __x, _Float32x __y) throw () __attribute__ ((__const__));


extern _Float32x fminf32x (_Float32x __x, _Float32x __y) throw () __attribute__ ((__const__)); extern _Float32x __fminf32x (_Float32x __x, _Float32x __y) throw () __attribute__ ((__const__));


extern _Float32x fmaf32x (_Float32x __x, _Float32x __y, _Float32x __z) throw (); extern _Float32x __fmaf32x (_Float32x __x, _Float32x __y, _Float32x __z) throw ();




extern _Float32x roundevenf32x (_Float32x __x) throw () __attribute__ ((__const__)); extern _Float32x __roundevenf32x (_Float32x __x) throw () __attribute__ ((__const__));



extern __intmax_t fromfpf32x (_Float32x __x, int __round, unsigned int __width) throw (); extern __intmax_t __fromfpf32x (_Float32x __x, int __round, unsigned int __width) throw ()
                            ;



extern __uintmax_t ufromfpf32x (_Float32x __x, int __round, unsigned int __width) throw (); extern __uintmax_t __ufromfpf32x (_Float32x __x, int __round, unsigned int __width) throw ()
                              ;




extern __intmax_t fromfpxf32x (_Float32x __x, int __round, unsigned int __width) throw (); extern __intmax_t __fromfpxf32x (_Float32x __x, int __round, unsigned int __width) throw ()
                             ;




extern __uintmax_t ufromfpxf32x (_Float32x __x, int __round, unsigned int __width) throw (); extern __uintmax_t __ufromfpxf32x (_Float32x __x, int __round, unsigned int __width) throw ()
                               ;


extern _Float32x fmaxmagf32x (_Float32x __x, _Float32x __y) throw () __attribute__ ((__const__)); extern _Float32x __fmaxmagf32x (_Float32x __x, _Float32x __y) throw () __attribute__ ((__const__));


extern _Float32x fminmagf32x (_Float32x __x, _Float32x __y) throw () __attribute__ ((__const__)); extern _Float32x __fminmagf32x (_Float32x __x, _Float32x __y) throw () __attribute__ ((__const__));


extern int canonicalizef32x (_Float32x *__cx, const _Float32x *__x) throw ();




extern int totalorderf32x (const _Float32x *__x, const _Float32x *__y) throw ()

     __attribute__ ((__pure__));


extern int totalordermagf32x (const _Float32x *__x, const _Float32x *__y) throw ()

     __attribute__ ((__pure__));


extern _Float32x getpayloadf32x (const _Float32x *__x) throw (); extern _Float32x __getpayloadf32x (const _Float32x *__x) throw ();


extern int setpayloadf32x (_Float32x *__x, _Float32x __payload) throw ();


extern int setpayloadsigf32x (_Float32x *__x, _Float32x __payload) throw ();
# 441 "/usr/include/math.h" 2 3 4
# 457 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 1 3 4
# 53 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern _Float64x acosf64x (_Float64x __x) throw (); extern _Float64x __acosf64x (_Float64x __x) throw ();

extern _Float64x asinf64x (_Float64x __x) throw (); extern _Float64x __asinf64x (_Float64x __x) throw ();

extern _Float64x atanf64x (_Float64x __x) throw (); extern _Float64x __atanf64x (_Float64x __x) throw ();

extern _Float64x atan2f64x (_Float64x __y, _Float64x __x) throw (); extern _Float64x __atan2f64x (_Float64x __y, _Float64x __x) throw ();


 extern _Float64x cosf64x (_Float64x __x) throw (); extern _Float64x __cosf64x (_Float64x __x) throw ();

 extern _Float64x sinf64x (_Float64x __x) throw (); extern _Float64x __sinf64x (_Float64x __x) throw ();

extern _Float64x tanf64x (_Float64x __x) throw (); extern _Float64x __tanf64x (_Float64x __x) throw ();




extern _Float64x coshf64x (_Float64x __x) throw (); extern _Float64x __coshf64x (_Float64x __x) throw ();

extern _Float64x sinhf64x (_Float64x __x) throw (); extern _Float64x __sinhf64x (_Float64x __x) throw ();

extern _Float64x tanhf64x (_Float64x __x) throw (); extern _Float64x __tanhf64x (_Float64x __x) throw ();



 extern void sincosf64x (_Float64x __x, _Float64x *__sinx, _Float64x *__cosx) throw (); extern void __sincosf64x (_Float64x __x, _Float64x *__sinx, _Float64x *__cosx) throw ()
                                                        ;




extern _Float64x acoshf64x (_Float64x __x) throw (); extern _Float64x __acoshf64x (_Float64x __x) throw ();

extern _Float64x asinhf64x (_Float64x __x) throw (); extern _Float64x __asinhf64x (_Float64x __x) throw ();

extern _Float64x atanhf64x (_Float64x __x) throw (); extern _Float64x __atanhf64x (_Float64x __x) throw ();





 extern _Float64x expf64x (_Float64x __x) throw (); extern _Float64x __expf64x (_Float64x __x) throw ();


extern _Float64x frexpf64x (_Float64x __x, int *__exponent) throw (); extern _Float64x __frexpf64x (_Float64x __x, int *__exponent) throw ();


extern _Float64x ldexpf64x (_Float64x __x, int __exponent) throw (); extern _Float64x __ldexpf64x (_Float64x __x, int __exponent) throw ();


 extern _Float64x logf64x (_Float64x __x) throw (); extern _Float64x __logf64x (_Float64x __x) throw ();


extern _Float64x log10f64x (_Float64x __x) throw (); extern _Float64x __log10f64x (_Float64x __x) throw ();


extern _Float64x modff64x (_Float64x __x, _Float64x *__iptr) throw (); extern _Float64x __modff64x (_Float64x __x, _Float64x *__iptr) throw () __attribute__ ((__nonnull__ (2)));



extern _Float64x exp10f64x (_Float64x __x) throw (); extern _Float64x __exp10f64x (_Float64x __x) throw ();




extern _Float64x expm1f64x (_Float64x __x) throw (); extern _Float64x __expm1f64x (_Float64x __x) throw ();


extern _Float64x log1pf64x (_Float64x __x) throw (); extern _Float64x __log1pf64x (_Float64x __x) throw ();


extern _Float64x logbf64x (_Float64x __x) throw (); extern _Float64x __logbf64x (_Float64x __x) throw ();




extern _Float64x exp2f64x (_Float64x __x) throw (); extern _Float64x __exp2f64x (_Float64x __x) throw ();


extern _Float64x log2f64x (_Float64x __x) throw (); extern _Float64x __log2f64x (_Float64x __x) throw ();






 extern _Float64x powf64x (_Float64x __x, _Float64x __y) throw (); extern _Float64x __powf64x (_Float64x __x, _Float64x __y) throw ();


extern _Float64x sqrtf64x (_Float64x __x) throw (); extern _Float64x __sqrtf64x (_Float64x __x) throw ();



extern _Float64x hypotf64x (_Float64x __x, _Float64x __y) throw (); extern _Float64x __hypotf64x (_Float64x __x, _Float64x __y) throw ();




extern _Float64x cbrtf64x (_Float64x __x) throw (); extern _Float64x __cbrtf64x (_Float64x __x) throw ();






extern _Float64x ceilf64x (_Float64x __x) throw () __attribute__ ((__const__)); extern _Float64x __ceilf64x (_Float64x __x) throw () __attribute__ ((__const__));


extern _Float64x fabsf64x (_Float64x __x) throw () __attribute__ ((__const__)); extern _Float64x __fabsf64x (_Float64x __x) throw () __attribute__ ((__const__));


extern _Float64x floorf64x (_Float64x __x) throw () __attribute__ ((__const__)); extern _Float64x __floorf64x (_Float64x __x) throw () __attribute__ ((__const__));


extern _Float64x fmodf64x (_Float64x __x, _Float64x __y) throw (); extern _Float64x __fmodf64x (_Float64x __x, _Float64x __y) throw ();
# 196 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern _Float64x copysignf64x (_Float64x __x, _Float64x __y) throw () __attribute__ ((__const__)); extern _Float64x __copysignf64x (_Float64x __x, _Float64x __y) throw () __attribute__ ((__const__));




extern _Float64x nanf64x (const char *__tagb) throw (); extern _Float64x __nanf64x (const char *__tagb) throw ();
# 217 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern _Float64x j0f64x (_Float64x) throw (); extern _Float64x __j0f64x (_Float64x) throw ();
extern _Float64x j1f64x (_Float64x) throw (); extern _Float64x __j1f64x (_Float64x) throw ();
extern _Float64x jnf64x (int, _Float64x) throw (); extern _Float64x __jnf64x (int, _Float64x) throw ();
extern _Float64x y0f64x (_Float64x) throw (); extern _Float64x __y0f64x (_Float64x) throw ();
extern _Float64x y1f64x (_Float64x) throw (); extern _Float64x __y1f64x (_Float64x) throw ();
extern _Float64x ynf64x (int, _Float64x) throw (); extern _Float64x __ynf64x (int, _Float64x) throw ();





extern _Float64x erff64x (_Float64x) throw (); extern _Float64x __erff64x (_Float64x) throw ();
extern _Float64x erfcf64x (_Float64x) throw (); extern _Float64x __erfcf64x (_Float64x) throw ();
extern _Float64x lgammaf64x (_Float64x) throw (); extern _Float64x __lgammaf64x (_Float64x) throw ();




extern _Float64x tgammaf64x (_Float64x) throw (); extern _Float64x __tgammaf64x (_Float64x) throw ();
# 249 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern _Float64x lgammaf64x_r (_Float64x, int *__signgamp) throw (); extern _Float64x __lgammaf64x_r (_Float64x, int *__signgamp) throw ();






extern _Float64x rintf64x (_Float64x __x) throw (); extern _Float64x __rintf64x (_Float64x __x) throw ();


extern _Float64x nextafterf64x (_Float64x __x, _Float64x __y) throw (); extern _Float64x __nextafterf64x (_Float64x __x, _Float64x __y) throw ();






extern _Float64x nextdownf64x (_Float64x __x) throw (); extern _Float64x __nextdownf64x (_Float64x __x) throw ();

extern _Float64x nextupf64x (_Float64x __x) throw (); extern _Float64x __nextupf64x (_Float64x __x) throw ();



extern _Float64x remainderf64x (_Float64x __x, _Float64x __y) throw (); extern _Float64x __remainderf64x (_Float64x __x, _Float64x __y) throw ();



extern _Float64x scalbnf64x (_Float64x __x, int __n) throw (); extern _Float64x __scalbnf64x (_Float64x __x, int __n) throw ();



extern int ilogbf64x (_Float64x __x) throw (); extern int __ilogbf64x (_Float64x __x) throw ();




extern long int llogbf64x (_Float64x __x) throw (); extern long int __llogbf64x (_Float64x __x) throw ();




extern _Float64x scalblnf64x (_Float64x __x, long int __n) throw (); extern _Float64x __scalblnf64x (_Float64x __x, long int __n) throw ();



extern _Float64x nearbyintf64x (_Float64x __x) throw (); extern _Float64x __nearbyintf64x (_Float64x __x) throw ();



extern _Float64x roundf64x (_Float64x __x) throw () __attribute__ ((__const__)); extern _Float64x __roundf64x (_Float64x __x) throw () __attribute__ ((__const__));



extern _Float64x truncf64x (_Float64x __x) throw () __attribute__ ((__const__)); extern _Float64x __truncf64x (_Float64x __x) throw () __attribute__ ((__const__));




extern _Float64x remquof64x (_Float64x __x, _Float64x __y, int *__quo) throw (); extern _Float64x __remquof64x (_Float64x __x, _Float64x __y, int *__quo) throw ();






extern long int lrintf64x (_Float64x __x) throw (); extern long int __lrintf64x (_Float64x __x) throw ();
__extension__
extern long long int llrintf64x (_Float64x __x) throw (); extern long long int __llrintf64x (_Float64x __x) throw ();



extern long int lroundf64x (_Float64x __x) throw (); extern long int __lroundf64x (_Float64x __x) throw ();
__extension__
extern long long int llroundf64x (_Float64x __x) throw (); extern long long int __llroundf64x (_Float64x __x) throw ();



extern _Float64x fdimf64x (_Float64x __x, _Float64x __y) throw (); extern _Float64x __fdimf64x (_Float64x __x, _Float64x __y) throw ();


extern _Float64x fmaxf64x (_Float64x __x, _Float64x __y) throw () __attribute__ ((__const__)); extern _Float64x __fmaxf64x (_Float64x __x, _Float64x __y) throw () __attribute__ ((__const__));


extern _Float64x fminf64x (_Float64x __x, _Float64x __y) throw () __attribute__ ((__const__)); extern _Float64x __fminf64x (_Float64x __x, _Float64x __y) throw () __attribute__ ((__const__));


extern _Float64x fmaf64x (_Float64x __x, _Float64x __y, _Float64x __z) throw (); extern _Float64x __fmaf64x (_Float64x __x, _Float64x __y, _Float64x __z) throw ();




extern _Float64x roundevenf64x (_Float64x __x) throw () __attribute__ ((__const__)); extern _Float64x __roundevenf64x (_Float64x __x) throw () __attribute__ ((__const__));



extern __intmax_t fromfpf64x (_Float64x __x, int __round, unsigned int __width) throw (); extern __intmax_t __fromfpf64x (_Float64x __x, int __round, unsigned int __width) throw ()
                            ;



extern __uintmax_t ufromfpf64x (_Float64x __x, int __round, unsigned int __width) throw (); extern __uintmax_t __ufromfpf64x (_Float64x __x, int __round, unsigned int __width) throw ()
                              ;




extern __intmax_t fromfpxf64x (_Float64x __x, int __round, unsigned int __width) throw (); extern __intmax_t __fromfpxf64x (_Float64x __x, int __round, unsigned int __width) throw ()
                             ;




extern __uintmax_t ufromfpxf64x (_Float64x __x, int __round, unsigned int __width) throw (); extern __uintmax_t __ufromfpxf64x (_Float64x __x, int __round, unsigned int __width) throw ()
                               ;


extern _Float64x fmaxmagf64x (_Float64x __x, _Float64x __y) throw () __attribute__ ((__const__)); extern _Float64x __fmaxmagf64x (_Float64x __x, _Float64x __y) throw () __attribute__ ((__const__));


extern _Float64x fminmagf64x (_Float64x __x, _Float64x __y) throw () __attribute__ ((__const__)); extern _Float64x __fminmagf64x (_Float64x __x, _Float64x __y) throw () __attribute__ ((__const__));


extern int canonicalizef64x (_Float64x *__cx, const _Float64x *__x) throw ();




extern int totalorderf64x (const _Float64x *__x, const _Float64x *__y) throw ()

     __attribute__ ((__pure__));


extern int totalordermagf64x (const _Float64x *__x, const _Float64x *__y) throw ()

     __attribute__ ((__pure__));


extern _Float64x getpayloadf64x (const _Float64x *__x) throw (); extern _Float64x __getpayloadf64x (const _Float64x *__x) throw ();


extern int setpayloadf64x (_Float64x *__x, _Float64x __payload) throw ();


extern int setpayloadsigf64x (_Float64x *__x, _Float64x __payload) throw ();
# 458 "/usr/include/math.h" 2 3 4
# 503 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-narrow.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/mathcalls-narrow.h" 3 4
extern float fadd (double __x, double __y) throw ();


extern float fdiv (double __x, double __y) throw ();


extern float fmul (double __x, double __y) throw ();


extern float fsub (double __x, double __y) throw ();
# 504 "/usr/include/math.h" 2 3 4
# 517 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-narrow.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/mathcalls-narrow.h" 3 4
extern float faddl (long double __x, long double __y) throw ();


extern float fdivl (long double __x, long double __y) throw ();


extern float fmull (long double __x, long double __y) throw ();


extern float fsubl (long double __x, long double __y) throw ();
# 518 "/usr/include/math.h" 2 3 4
# 537 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-narrow.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/mathcalls-narrow.h" 3 4
extern double daddl (long double __x, long double __y) throw ();


extern double ddivl (long double __x, long double __y) throw ();


extern double dmull (long double __x, long double __y) throw ();


extern double dsubl (long double __x, long double __y) throw ();
# 538 "/usr/include/math.h" 2 3 4
# 616 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-narrow.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/mathcalls-narrow.h" 3 4
extern _Float32 f32addf32x (_Float32x __x, _Float32x __y) throw ();


extern _Float32 f32divf32x (_Float32x __x, _Float32x __y) throw ();


extern _Float32 f32mulf32x (_Float32x __x, _Float32x __y) throw ();


extern _Float32 f32subf32x (_Float32x __x, _Float32x __y) throw ();
# 617 "/usr/include/math.h" 2 3 4
# 626 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-narrow.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/mathcalls-narrow.h" 3 4
extern _Float32 f32addf64 (_Float64 __x, _Float64 __y) throw ();


extern _Float32 f32divf64 (_Float64 __x, _Float64 __y) throw ();


extern _Float32 f32mulf64 (_Float64 __x, _Float64 __y) throw ();


extern _Float32 f32subf64 (_Float64 __x, _Float64 __y) throw ();
# 627 "/usr/include/math.h" 2 3 4
# 636 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-narrow.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/mathcalls-narrow.h" 3 4
extern _Float32 f32addf64x (_Float64x __x, _Float64x __y) throw ();


extern _Float32 f32divf64x (_Float64x __x, _Float64x __y) throw ();


extern _Float32 f32mulf64x (_Float64x __x, _Float64x __y) throw ();


extern _Float32 f32subf64x (_Float64x __x, _Float64x __y) throw ();
# 637 "/usr/include/math.h" 2 3 4
# 646 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-narrow.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/mathcalls-narrow.h" 3 4
extern _Float32 f32addf128 (_Float128 __x, _Float128 __y) throw ();


extern _Float32 f32divf128 (_Float128 __x, _Float128 __y) throw ();


extern _Float32 f32mulf128 (_Float128 __x, _Float128 __y) throw ();


extern _Float32 f32subf128 (_Float128 __x, _Float128 __y) throw ();
# 647 "/usr/include/math.h" 2 3 4
# 666 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-narrow.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/mathcalls-narrow.h" 3 4
extern _Float32x f32xaddf64 (_Float64 __x, _Float64 __y) throw ();


extern _Float32x f32xdivf64 (_Float64 __x, _Float64 __y) throw ();


extern _Float32x f32xmulf64 (_Float64 __x, _Float64 __y) throw ();


extern _Float32x f32xsubf64 (_Float64 __x, _Float64 __y) throw ();
# 667 "/usr/include/math.h" 2 3 4
# 676 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-narrow.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/mathcalls-narrow.h" 3 4
extern _Float32x f32xaddf64x (_Float64x __x, _Float64x __y) throw ();


extern _Float32x f32xdivf64x (_Float64x __x, _Float64x __y) throw ();


extern _Float32x f32xmulf64x (_Float64x __x, _Float64x __y) throw ();


extern _Float32x f32xsubf64x (_Float64x __x, _Float64x __y) throw ();
# 677 "/usr/include/math.h" 2 3 4
# 686 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-narrow.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/mathcalls-narrow.h" 3 4
extern _Float32x f32xaddf128 (_Float128 __x, _Float128 __y) throw ();


extern _Float32x f32xdivf128 (_Float128 __x, _Float128 __y) throw ();


extern _Float32x f32xmulf128 (_Float128 __x, _Float128 __y) throw ();


extern _Float32x f32xsubf128 (_Float128 __x, _Float128 __y) throw ();
# 687 "/usr/include/math.h" 2 3 4
# 706 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-narrow.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/mathcalls-narrow.h" 3 4
extern _Float64 f64addf64x (_Float64x __x, _Float64x __y) throw ();


extern _Float64 f64divf64x (_Float64x __x, _Float64x __y) throw ();


extern _Float64 f64mulf64x (_Float64x __x, _Float64x __y) throw ();


extern _Float64 f64subf64x (_Float64x __x, _Float64x __y) throw ();
# 707 "/usr/include/math.h" 2 3 4
# 716 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-narrow.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/mathcalls-narrow.h" 3 4
extern _Float64 f64addf128 (_Float128 __x, _Float128 __y) throw ();


extern _Float64 f64divf128 (_Float128 __x, _Float128 __y) throw ();


extern _Float64 f64mulf128 (_Float128 __x, _Float128 __y) throw ();


extern _Float64 f64subf128 (_Float128 __x, _Float128 __y) throw ();
# 717 "/usr/include/math.h" 2 3 4
# 736 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-narrow.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/mathcalls-narrow.h" 3 4
extern _Float64x f64xaddf128 (_Float128 __x, _Float128 __y) throw ();


extern _Float64x f64xdivf128 (_Float128 __x, _Float128 __y) throw ();


extern _Float64x f64xmulf128 (_Float128 __x, _Float128 __y) throw ();


extern _Float64x f64xsubf128 (_Float128 __x, _Float128 __y) throw ();
# 737 "/usr/include/math.h" 2 3 4
# 773 "/usr/include/math.h" 3 4
extern int signgam;
# 853 "/usr/include/math.h" 3 4
enum
  {
    FP_NAN =

      0,
    FP_INFINITE =

      1,
    FP_ZERO =

      2,
    FP_SUBNORMAL =

      3,
    FP_NORMAL =

      4
  };
# 973 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/iscanonical.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/iscanonical.h" 3 4
extern int __iscanonicall (long double __x)
     throw () __attribute__ ((__const__));
# 46 "/usr/include/x86_64-linux-gnu/bits/iscanonical.h" 3 4
extern "C++" {
inline int iscanonical (float __val) { return ((void) (__typeof (__val)) (__val), 1); }
inline int iscanonical (double __val) { return ((void) (__typeof (__val)) (__val), 1); }
inline int iscanonical (long double __val) { return __iscanonicall (__val); }

inline int iscanonical (_Float128 __val) { return ((void) (__typeof (__val)) (__val), 1); }

}
# 974 "/usr/include/math.h" 2 3 4
# 985 "/usr/include/math.h" 3 4
extern "C++" {
inline int issignaling (float __val) { return __issignalingf (__val); }
inline int issignaling (double __val) { return __issignaling (__val); }
inline int
issignaling (long double __val)
{



  return __issignalingl (__val);

}



inline int issignaling (_Float128 __val) { return __issignalingf128 (__val); }

}
# 1016 "/usr/include/math.h" 3 4
extern "C++" {
# 1047 "/usr/include/math.h" 3 4
template <class __T> inline bool
iszero (__T __val)
{
  return __val == 0;
}

}
# 1278 "/usr/include/math.h" 3 4
extern "C++" {
template<typename> struct __iseqsig_type;

template<> struct __iseqsig_type<float>
{
  static int __call (float __x, float __y) throw ()
  {
    return __iseqsigf (__x, __y);
  }
};

template<> struct __iseqsig_type<double>
{
  static int __call (double __x, double __y) throw ()
  {
    return __iseqsig (__x, __y);
  }
};

template<> struct __iseqsig_type<long double>
{
  static int __call (long double __x, long double __y) throw ()
  {

    return __iseqsigl (__x, __y);



  }
};




template<> struct __iseqsig_type<_Float128>
{
  static int __call (_Float128 __x, _Float128 __y) throw ()
  {
    return __iseqsigf128 (__x, __y);
  }
};


template<typename _T1, typename _T2>
inline int
iseqsig (_T1 __x, _T2 __y) throw ()
{

  typedef decltype (((__x) + (__y) + 0.0f)) _T3;



  return __iseqsig_type<_T3>::__call (__x, __y);
}

}




}
# 46 "/usr/include/c++/9/cmath" 2 3

# 1 "/usr/include/c++/9/bits/std_abs.h" 1 3
# 33 "/usr/include/c++/9/bits/std_abs.h" 3
       
# 34 "/usr/include/c++/9/bits/std_abs.h" 3




# 1 "/usr/include/stdlib.h" 1 3 4
# 25 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h" 1 3 4
# 26 "/usr/include/stdlib.h" 2 3 4





# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h" 1 3 4
# 209 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 32 "/usr/include/stdlib.h" 2 3 4

extern "C" {





# 1 "/usr/include/x86_64-linux-gnu/bits/waitflags.h" 1 3 4
# 52 "/usr/include/x86_64-linux-gnu/bits/waitflags.h" 3 4
typedef enum
{
  P_ALL,
  P_PID,
  P_PGID
} idtype_t;
# 40 "/usr/include/stdlib.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h" 1 3 4
# 41 "/usr/include/stdlib.h" 2 3 4
# 58 "/usr/include/stdlib.h" 3 4
typedef struct
  {
    int quot;
    int rem;
  } div_t;



typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;





__extension__ typedef struct
  {
    long long int quot;
    long long int rem;
  } lldiv_t;
# 97 "/usr/include/stdlib.h" 3 4
extern size_t __ctype_get_mb_cur_max (void) throw () ;



extern double atof (const char *__nptr)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern int atoi (const char *__nptr)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern long int atol (const char *__nptr)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;



__extension__ extern long long int atoll (const char *__nptr)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;



extern double strtod (const char *__restrict __nptr,
        char **__restrict __endptr)
     throw () __attribute__ ((__nonnull__ (1)));



extern float strtof (const char *__restrict __nptr,
       char **__restrict __endptr) throw () __attribute__ ((__nonnull__ (1)));

extern long double strtold (const char *__restrict __nptr,
       char **__restrict __endptr)
     throw () __attribute__ ((__nonnull__ (1)));
# 140 "/usr/include/stdlib.h" 3 4
extern _Float32 strtof32 (const char *__restrict __nptr,
     char **__restrict __endptr)
     throw () __attribute__ ((__nonnull__ (1)));



extern _Float64 strtof64 (const char *__restrict __nptr,
     char **__restrict __endptr)
     throw () __attribute__ ((__nonnull__ (1)));



extern _Float128 strtof128 (const char *__restrict __nptr,
       char **__restrict __endptr)
     throw () __attribute__ ((__nonnull__ (1)));



extern _Float32x strtof32x (const char *__restrict __nptr,
       char **__restrict __endptr)
     throw () __attribute__ ((__nonnull__ (1)));



extern _Float64x strtof64x (const char *__restrict __nptr,
       char **__restrict __endptr)
     throw () __attribute__ ((__nonnull__ (1)));
# 176 "/usr/include/stdlib.h" 3 4
extern long int strtol (const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1)));

extern unsigned long int strtoul (const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1)));



__extension__
extern long long int strtoq (const char *__restrict __nptr,
        char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtouq (const char *__restrict __nptr,
           char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1)));




__extension__
extern long long int strtoll (const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtoull (const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1)));




extern int strfromd (char *__dest, size_t __size, const char *__format,
       double __f)
     throw () __attribute__ ((__nonnull__ (3)));

extern int strfromf (char *__dest, size_t __size, const char *__format,
       float __f)
     throw () __attribute__ ((__nonnull__ (3)));

extern int strfroml (char *__dest, size_t __size, const char *__format,
       long double __f)
     throw () __attribute__ ((__nonnull__ (3)));
# 232 "/usr/include/stdlib.h" 3 4
extern int strfromf32 (char *__dest, size_t __size, const char * __format,
         _Float32 __f)
     throw () __attribute__ ((__nonnull__ (3)));



extern int strfromf64 (char *__dest, size_t __size, const char * __format,
         _Float64 __f)
     throw () __attribute__ ((__nonnull__ (3)));



extern int strfromf128 (char *__dest, size_t __size, const char * __format,
   _Float128 __f)
     throw () __attribute__ ((__nonnull__ (3)));



extern int strfromf32x (char *__dest, size_t __size, const char * __format,
   _Float32x __f)
     throw () __attribute__ ((__nonnull__ (3)));



extern int strfromf64x (char *__dest, size_t __size, const char * __format,
   _Float64x __f)
     throw () __attribute__ ((__nonnull__ (3)));
# 272 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/locale_t.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/types/locale_t.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/__locale_t.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/types/__locale_t.h" 3 4
struct __locale_struct
{

  struct __locale_data *__locales[13];


  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;


  const char *__names[13];
};

typedef struct __locale_struct *__locale_t;
# 23 "/usr/include/x86_64-linux-gnu/bits/types/locale_t.h" 2 3 4

typedef __locale_t locale_t;
# 273 "/usr/include/stdlib.h" 2 3 4

extern long int strtol_l (const char *__restrict __nptr,
     char **__restrict __endptr, int __base,
     locale_t __loc) throw () __attribute__ ((__nonnull__ (1, 4)));

extern unsigned long int strtoul_l (const char *__restrict __nptr,
        char **__restrict __endptr,
        int __base, locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 4)));

__extension__
extern long long int strtoll_l (const char *__restrict __nptr,
    char **__restrict __endptr, int __base,
    locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 4)));

__extension__
extern unsigned long long int strtoull_l (const char *__restrict __nptr,
       char **__restrict __endptr,
       int __base, locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 4)));

extern double strtod_l (const char *__restrict __nptr,
   char **__restrict __endptr, locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 3)));

extern float strtof_l (const char *__restrict __nptr,
         char **__restrict __endptr, locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 3)));

extern long double strtold_l (const char *__restrict __nptr,
         char **__restrict __endptr,
         locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 3)));
# 316 "/usr/include/stdlib.h" 3 4
extern _Float32 strtof32_l (const char *__restrict __nptr,
       char **__restrict __endptr,
       locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 3)));



extern _Float64 strtof64_l (const char *__restrict __nptr,
       char **__restrict __endptr,
       locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 3)));



extern _Float128 strtof128_l (const char *__restrict __nptr,
         char **__restrict __endptr,
         locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 3)));



extern _Float32x strtof32x_l (const char *__restrict __nptr,
         char **__restrict __endptr,
         locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 3)));



extern _Float64x strtof64x_l (const char *__restrict __nptr,
         char **__restrict __endptr,
         locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 3)));
# 385 "/usr/include/stdlib.h" 3 4
extern char *l64a (long int __n) throw () ;


extern long int a64l (const char *__s)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;




# 1 "/usr/include/x86_64-linux-gnu/sys/types.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
extern "C" {





typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;


typedef __loff_t loff_t;




typedef __ino_t ino_t;






typedef __ino64_t ino64_t;




typedef __dev_t dev_t;




typedef __gid_t gid_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __uid_t uid_t;





typedef __off_t off_t;






typedef __off64_t off64_t;




typedef __pid_t pid_t;





typedef __id_t id_t;




typedef __ssize_t ssize_t;





typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;





typedef __key_t key_t;




# 1 "/usr/include/x86_64-linux-gnu/bits/types/clock_t.h" 1 3 4






typedef __clock_t clock_t;
# 127 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/bits/types/clockid_t.h" 1 3 4






typedef __clockid_t clockid_t;
# 129 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/time_t.h" 1 3 4






typedef __time_t time_t;
# 130 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/timer_t.h" 1 3 4






typedef __timer_t timer_t;
# 131 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4



typedef __useconds_t useconds_t;



typedef __suseconds_t suseconds_t;





# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h" 1 3 4
# 145 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4



typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;




# 1 "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h" 3 4
typedef __int8_t int8_t;
typedef __int16_t int16_t;
typedef __int32_t int32_t;
typedef __int64_t int64_t;
# 156 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4


typedef __uint8_t u_int8_t;
typedef __uint16_t u_int16_t;
typedef __uint32_t u_int32_t;
typedef __uint64_t u_int64_t;


typedef int register_t __attribute__ ((__mode__ (__word__)));
# 176 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/include/endian.h" 1 3 4
# 24 "/usr/include/endian.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/endian.h" 1 3 4
# 35 "/usr/include/x86_64-linux-gnu/bits/endian.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/endianness.h" 1 3 4
# 36 "/usr/include/x86_64-linux-gnu/bits/endian.h" 2 3 4
# 25 "/usr/include/endian.h" 2 3 4
# 35 "/usr/include/endian.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 1 3 4
# 33 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
static __inline __uint16_t
__bswap_16 (__uint16_t __bsx)
{

  return __builtin_bswap16 (__bsx);



}






static __inline __uint32_t
__bswap_32 (__uint32_t __bsx)
{

  return __builtin_bswap32 (__bsx);



}
# 69 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
__extension__ static __inline __uint64_t
__bswap_64 (__uint64_t __bsx)
{

  return __builtin_bswap64 (__bsx);



}
# 36 "/usr/include/endian.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/uintn-identity.h" 1 3 4
# 32 "/usr/include/x86_64-linux-gnu/bits/uintn-identity.h" 3 4
static __inline __uint16_t
__uint16_identity (__uint16_t __x)
{
  return __x;
}

static __inline __uint32_t
__uint32_identity (__uint32_t __x)
{
  return __x;
}

static __inline __uint64_t
__uint64_identity (__uint64_t __x)
{
  return __x;
}
# 37 "/usr/include/endian.h" 2 3 4
# 177 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/sys/select.h" 1 3 4
# 30 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/select.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/select.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/select.h" 2 3 4
# 31 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/types/sigset_t.h" 1 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/types/__sigset_t.h" 1 3 4




typedef struct
{
  unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
} __sigset_t;
# 5 "/usr/include/x86_64-linux-gnu/bits/types/sigset_t.h" 2 3 4


typedef __sigset_t sigset_t;
# 34 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h" 1 3 4







struct timeval
{
  __time_t tv_sec;
  __suseconds_t tv_usec;
};
# 38 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h" 3 4
struct timespec
{
  __time_t tv_sec;



  __syscall_slong_t tv_nsec;
# 26 "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h" 3 4
};
# 40 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4
# 49 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
typedef long int __fd_mask;
# 59 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
typedef struct
  {



    __fd_mask fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];





  } fd_set;






typedef __fd_mask fd_mask;
# 91 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern "C" {
# 101 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
# 113 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);
# 126 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
}
# 180 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4





typedef __blksize_t blksize_t;






typedef __blkcnt_t blkcnt_t;



typedef __fsblkcnt_t fsblkcnt_t;



typedef __fsfilcnt_t fsfilcnt_t;
# 219 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef __blkcnt64_t blkcnt64_t;
typedef __fsblkcnt64_t fsblkcnt64_t;
typedef __fsfilcnt64_t fsfilcnt64_t;





# 1 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 1 3 4
# 44 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h" 1 3 4
# 21 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h" 2 3 4
# 45 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 2 3 4




typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;

typedef struct __pthread_internal_slist
{
  struct __pthread_internal_slist *__next;
} __pthread_slist_t;
# 74 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h" 3 4
struct __pthread_mutex_s
{
  int __lock;
  unsigned int __count;
  int __owner;

  unsigned int __nusers;



  int __kind;

  short __spins;
  short __elision;
  __pthread_list_t __list;
# 53 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h" 3 4
};
# 75 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 2 3 4
# 87 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/struct_rwlock.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/struct_rwlock.h" 3 4
struct __pthread_rwlock_arch_t
{
  unsigned int __readers;
  unsigned int __writers;
  unsigned int __wrphase_futex;
  unsigned int __writers_futex;
  unsigned int __pad3;
  unsigned int __pad4;

  int __cur_writer;
  int __shared;
  signed char __rwelision;




  unsigned char __pad1[7];


  unsigned long int __pad2;


  unsigned int __flags;
# 55 "/usr/include/x86_64-linux-gnu/bits/struct_rwlock.h" 3 4
};
# 88 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 2 3 4




struct __pthread_cond_s
{
  __extension__ union
  {
    __extension__ unsigned long long int __wseq;
    struct
    {
      unsigned int __low;
      unsigned int __high;
    } __wseq32;
  };
  __extension__ union
  {
    __extension__ unsigned long long int __g1_start;
    struct
    {
      unsigned int __low;
      unsigned int __high;
    } __g1_start32;
  };
  unsigned int __g_refs[2] ;
  unsigned int __g_size[2];
  unsigned int __g1_orig_size;
  unsigned int __wrefs;
  unsigned int __g_signals[2];
};
# 24 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 2 3 4



typedef unsigned long int pthread_t;




typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;




typedef union
{
  char __size[4];
  int __align;
} pthread_condattr_t;



typedef unsigned int pthread_key_t;



typedef int pthread_once_t;


union pthread_attr_t
{
  char __size[56];
  long int __align;
};

typedef union pthread_attr_t pthread_attr_t;




typedef union
{
  struct __pthread_mutex_s __data;
  char __size[40];
  long int __align;
} pthread_mutex_t;


typedef union
{
  struct __pthread_cond_s __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;





typedef union
{
  struct __pthread_rwlock_arch_t __data;
  char __size[56];
  long int __align;
} pthread_rwlock_t;

typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;





typedef volatile int pthread_spinlock_t;




typedef union
{
  char __size[32];
  long int __align;
} pthread_barrier_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;
# 228 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4


}
# 395 "/usr/include/stdlib.h" 2 3 4






extern long int random (void) throw ();


extern void srandom (unsigned int __seed) throw ();





extern char *initstate (unsigned int __seed, char *__statebuf,
   size_t __statelen) throw () __attribute__ ((__nonnull__ (2)));



extern char *setstate (char *__statebuf) throw () __attribute__ ((__nonnull__ (1)));







struct random_data
  {
    int32_t *fptr;
    int32_t *rptr;
    int32_t *state;
    int rand_type;
    int rand_deg;
    int rand_sep;
    int32_t *end_ptr;
  };

extern int random_r (struct random_data *__restrict __buf,
       int32_t *__restrict __result) throw () __attribute__ ((__nonnull__ (1, 2)));

extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     throw () __attribute__ ((__nonnull__ (2)));

extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
   size_t __statelen,
   struct random_data *__restrict __buf)
     throw () __attribute__ ((__nonnull__ (2, 4)));

extern int setstate_r (char *__restrict __statebuf,
         struct random_data *__restrict __buf)
     throw () __attribute__ ((__nonnull__ (1, 2)));





extern int rand (void) throw ();

extern void srand (unsigned int __seed) throw ();



extern int rand_r (unsigned int *__seed) throw ();







extern double drand48 (void) throw ();
extern double erand48 (unsigned short int __xsubi[3]) throw () __attribute__ ((__nonnull__ (1)));


extern long int lrand48 (void) throw ();
extern long int nrand48 (unsigned short int __xsubi[3])
     throw () __attribute__ ((__nonnull__ (1)));


extern long int mrand48 (void) throw ();
extern long int jrand48 (unsigned short int __xsubi[3])
     throw () __attribute__ ((__nonnull__ (1)));


extern void srand48 (long int __seedval) throw ();
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     throw () __attribute__ ((__nonnull__ (1)));
extern void lcong48 (unsigned short int __param[7]) throw () __attribute__ ((__nonnull__ (1)));





struct drand48_data
  {
    unsigned short int __x[3];
    unsigned short int __old_x[3];
    unsigned short int __c;
    unsigned short int __init;
    __extension__ unsigned long long int __a;

  };


extern int drand48_r (struct drand48_data *__restrict __buffer,
        double *__restrict __result) throw () __attribute__ ((__nonnull__ (1, 2)));
extern int erand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        double *__restrict __result) throw () __attribute__ ((__nonnull__ (1, 2)));


extern int lrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern int nrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int mrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern int jrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     throw () __attribute__ ((__nonnull__ (2)));

extern int seed48_r (unsigned short int __seed16v[3],
       struct drand48_data *__buffer) throw () __attribute__ ((__nonnull__ (1, 2)));

extern int lcong48_r (unsigned short int __param[7],
        struct drand48_data *__buffer)
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern void *malloc (size_t __size) throw () __attribute__ ((__malloc__))
     __attribute__ ((__alloc_size__ (1))) ;

extern void *calloc (size_t __nmemb, size_t __size)
     throw () __attribute__ ((__malloc__)) __attribute__ ((__alloc_size__ (1, 2))) ;






extern void *realloc (void *__ptr, size_t __size)
     throw () __attribute__ ((__warn_unused_result__)) __attribute__ ((__alloc_size__ (2)));







extern void *reallocarray (void *__ptr, size_t __nmemb, size_t __size)
     throw () __attribute__ ((__warn_unused_result__))
     __attribute__ ((__alloc_size__ (2, 3)));



extern void free (void *__ptr) throw ();


# 1 "/usr/include/alloca.h" 1 3 4
# 24 "/usr/include/alloca.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h" 1 3 4
# 25 "/usr/include/alloca.h" 2 3 4

extern "C" {





extern void *alloca (size_t __size) throw ();





}
# 569 "/usr/include/stdlib.h" 2 3 4





extern void *valloc (size_t __size) throw () __attribute__ ((__malloc__))
     __attribute__ ((__alloc_size__ (1))) ;




extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     throw () __attribute__ ((__nonnull__ (1))) ;




extern void *aligned_alloc (size_t __alignment, size_t __size)
     throw () __attribute__ ((__malloc__)) __attribute__ ((__alloc_size__ (2))) ;



extern void abort (void) throw () __attribute__ ((__noreturn__));



extern int atexit (void (*__func) (void)) throw () __attribute__ ((__nonnull__ (1)));




extern "C++" int at_quick_exit (void (*__func) (void))
     throw () __asm ("at_quick_exit") __attribute__ ((__nonnull__ (1)));
# 610 "/usr/include/stdlib.h" 3 4
extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
     throw () __attribute__ ((__nonnull__ (1)));





extern void exit (int __status) throw () __attribute__ ((__noreturn__));





extern void quick_exit (int __status) throw () __attribute__ ((__noreturn__));





extern void _Exit (int __status) throw () __attribute__ ((__noreturn__));




extern char *getenv (const char *__name) throw () __attribute__ ((__nonnull__ (1))) ;




extern char *secure_getenv (const char *__name)
     throw () __attribute__ ((__nonnull__ (1))) ;






extern int putenv (char *__string) throw () __attribute__ ((__nonnull__ (1)));





extern int setenv (const char *__name, const char *__value, int __replace)
     throw () __attribute__ ((__nonnull__ (2)));


extern int unsetenv (const char *__name) throw () __attribute__ ((__nonnull__ (1)));






extern int clearenv (void) throw ();
# 675 "/usr/include/stdlib.h" 3 4
extern char *mktemp (char *__template) throw () __attribute__ ((__nonnull__ (1)));
# 688 "/usr/include/stdlib.h" 3 4
extern int mkstemp (char *__template) __attribute__ ((__nonnull__ (1))) ;
# 698 "/usr/include/stdlib.h" 3 4
extern int mkstemp64 (char *__template) __attribute__ ((__nonnull__ (1))) ;
# 710 "/usr/include/stdlib.h" 3 4
extern int mkstemps (char *__template, int __suffixlen) __attribute__ ((__nonnull__ (1))) ;
# 720 "/usr/include/stdlib.h" 3 4
extern int mkstemps64 (char *__template, int __suffixlen)
     __attribute__ ((__nonnull__ (1))) ;
# 731 "/usr/include/stdlib.h" 3 4
extern char *mkdtemp (char *__template) throw () __attribute__ ((__nonnull__ (1))) ;
# 742 "/usr/include/stdlib.h" 3 4
extern int mkostemp (char *__template, int __flags) __attribute__ ((__nonnull__ (1))) ;
# 752 "/usr/include/stdlib.h" 3 4
extern int mkostemp64 (char *__template, int __flags) __attribute__ ((__nonnull__ (1))) ;
# 762 "/usr/include/stdlib.h" 3 4
extern int mkostemps (char *__template, int __suffixlen, int __flags)
     __attribute__ ((__nonnull__ (1))) ;
# 774 "/usr/include/stdlib.h" 3 4
extern int mkostemps64 (char *__template, int __suffixlen, int __flags)
     __attribute__ ((__nonnull__ (1))) ;
# 784 "/usr/include/stdlib.h" 3 4
extern int system (const char *__command) ;





extern char *canonicalize_file_name (const char *__name)
     throw () __attribute__ ((__nonnull__ (1))) ;
# 800 "/usr/include/stdlib.h" 3 4
extern char *realpath (const char *__restrict __name,
         char *__restrict __resolved) throw () ;






typedef int (*__compar_fn_t) (const void *, const void *);


typedef __compar_fn_t comparison_fn_t;



typedef int (*__compar_d_fn_t) (const void *, const void *, void *);




extern void *bsearch (const void *__key, const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;







extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));

extern void qsort_r (void *__base, size_t __nmemb, size_t __size,
       __compar_d_fn_t __compar, void *__arg)
  __attribute__ ((__nonnull__ (1, 4)));




extern int abs (int __x) throw () __attribute__ ((__const__)) ;
extern long int labs (long int __x) throw () __attribute__ ((__const__)) ;


__extension__ extern long long int llabs (long long int __x)
     throw () __attribute__ ((__const__)) ;






extern div_t div (int __numer, int __denom)
     throw () __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     throw () __attribute__ ((__const__)) ;


__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     throw () __attribute__ ((__const__)) ;
# 872 "/usr/include/stdlib.h" 3 4
extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) throw () __attribute__ ((__nonnull__ (3, 4))) ;




extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) throw () __attribute__ ((__nonnull__ (3, 4))) ;




extern char *gcvt (double __value, int __ndigit, char *__buf)
     throw () __attribute__ ((__nonnull__ (3))) ;




extern char *qecvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     throw () __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qfcvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     throw () __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     throw () __attribute__ ((__nonnull__ (3))) ;




extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) throw () __attribute__ ((__nonnull__ (3, 4, 5)));
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) throw () __attribute__ ((__nonnull__ (3, 4, 5)));

extern int qecvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     throw () __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qfcvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     throw () __attribute__ ((__nonnull__ (3, 4, 5)));





extern int mblen (const char *__s, size_t __n) throw ();


extern int mbtowc (wchar_t *__restrict __pwc,
     const char *__restrict __s, size_t __n) throw ();


extern int wctomb (char *__s, wchar_t __wchar) throw ();



extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   const char *__restrict __s, size_t __n) throw ();

extern size_t wcstombs (char *__restrict __s,
   const wchar_t *__restrict __pwcs, size_t __n)
     throw ();







extern int rpmatch (const char *__response) throw () __attribute__ ((__nonnull__ (1))) ;
# 957 "/usr/include/stdlib.h" 3 4
extern int getsubopt (char **__restrict __optionp,
        char *const *__restrict __tokens,
        char **__restrict __valuep)
     throw () __attribute__ ((__nonnull__ (1, 2, 3))) ;







extern int posix_openpt (int __oflag) ;







extern int grantpt (int __fd) throw ();



extern int unlockpt (int __fd) throw ();




extern char *ptsname (int __fd) throw () ;






extern int ptsname_r (int __fd, char *__buf, size_t __buflen)
     throw () __attribute__ ((__nonnull__ (2)));


extern int getpt (void);






extern int getloadavg (double __loadavg[], int __nelem)
     throw () __attribute__ ((__nonnull__ (1)));
# 1013 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h" 1 3 4
# 1014 "/usr/include/stdlib.h" 2 3 4
# 1023 "/usr/include/stdlib.h" 3 4
}
# 39 "/usr/include/c++/9/bits/std_abs.h" 2 3







extern "C++"
{
namespace std __attribute__ ((__visibility__ ("default")))
{


  using ::abs;


  inline long
  abs(long __i) { return __builtin_labs(__i); }



  inline long long
  abs(long long __x) { return __builtin_llabs (__x); }
# 70 "/usr/include/c++/9/bits/std_abs.h" 3
  inline constexpr double
  abs(double __x)
  { return __builtin_fabs(__x); }

  inline constexpr float
  abs(float __x)
  { return __builtin_fabsf(__x); }

  inline constexpr long double
  abs(long double __x)
  { return __builtin_fabsl(__x); }
# 107 "/usr/include/c++/9/bits/std_abs.h" 3

}
}
# 48 "/usr/include/c++/9/cmath" 2 3
# 77 "/usr/include/c++/9/cmath" 3
extern "C++"
{
namespace std __attribute__ ((__visibility__ ("default")))
{


  using ::acos;


  inline constexpr float
  acos(float __x)
  { return __builtin_acosf(__x); }

  inline constexpr long double
  acos(long double __x)
  { return __builtin_acosl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    acos(_Tp __x)
    { return __builtin_acos(__x); }

  using ::asin;


  inline constexpr float
  asin(float __x)
  { return __builtin_asinf(__x); }

  inline constexpr long double
  asin(long double __x)
  { return __builtin_asinl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    asin(_Tp __x)
    { return __builtin_asin(__x); }

  using ::atan;


  inline constexpr float
  atan(float __x)
  { return __builtin_atanf(__x); }

  inline constexpr long double
  atan(long double __x)
  { return __builtin_atanl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    atan(_Tp __x)
    { return __builtin_atan(__x); }

  using ::atan2;


  inline constexpr float
  atan2(float __y, float __x)
  { return __builtin_atan2f(__y, __x); }

  inline constexpr long double
  atan2(long double __y, long double __x)
  { return __builtin_atan2l(__y, __x); }


  template<typename _Tp, typename _Up>
    inline constexpr
    typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    atan2(_Tp __y, _Up __x)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return atan2(__type(__y), __type(__x));
    }

  using ::ceil;


  inline constexpr float
  ceil(float __x)
  { return __builtin_ceilf(__x); }

  inline constexpr long double
  ceil(long double __x)
  { return __builtin_ceill(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    ceil(_Tp __x)
    { return __builtin_ceil(__x); }

  using ::cos;


  inline constexpr float
  cos(float __x)
  { return __builtin_cosf(__x); }

  inline constexpr long double
  cos(long double __x)
  { return __builtin_cosl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    cos(_Tp __x)
    { return __builtin_cos(__x); }

  using ::cosh;


  inline constexpr float
  cosh(float __x)
  { return __builtin_coshf(__x); }

  inline constexpr long double
  cosh(long double __x)
  { return __builtin_coshl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    cosh(_Tp __x)
    { return __builtin_cosh(__x); }

  using ::exp;


  inline constexpr float
  exp(float __x)
  { return __builtin_expf(__x); }

  inline constexpr long double
  exp(long double __x)
  { return __builtin_expl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    exp(_Tp __x)
    { return __builtin_exp(__x); }

  using ::fabs;


  inline constexpr float
  fabs(float __x)
  { return __builtin_fabsf(__x); }

  inline constexpr long double
  fabs(long double __x)
  { return __builtin_fabsl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    fabs(_Tp __x)
    { return __builtin_fabs(__x); }

  using ::floor;


  inline constexpr float
  floor(float __x)
  { return __builtin_floorf(__x); }

  inline constexpr long double
  floor(long double __x)
  { return __builtin_floorl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    floor(_Tp __x)
    { return __builtin_floor(__x); }

  using ::fmod;


  inline constexpr float
  fmod(float __x, float __y)
  { return __builtin_fmodf(__x, __y); }

  inline constexpr long double
  fmod(long double __x, long double __y)
  { return __builtin_fmodl(__x, __y); }


  template<typename _Tp, typename _Up>
    inline constexpr
    typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    fmod(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return fmod(__type(__x), __type(__y));
    }

  using ::frexp;


  inline float
  frexp(float __x, int* __exp)
  { return __builtin_frexpf(__x, __exp); }

  inline long double
  frexp(long double __x, int* __exp)
  { return __builtin_frexpl(__x, __exp); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    frexp(_Tp __x, int* __exp)
    { return __builtin_frexp(__x, __exp); }

  using ::ldexp;


  inline constexpr float
  ldexp(float __x, int __exp)
  { return __builtin_ldexpf(__x, __exp); }

  inline constexpr long double
  ldexp(long double __x, int __exp)
  { return __builtin_ldexpl(__x, __exp); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    ldexp(_Tp __x, int __exp)
    { return __builtin_ldexp(__x, __exp); }

  using ::log;


  inline constexpr float
  log(float __x)
  { return __builtin_logf(__x); }

  inline constexpr long double
  log(long double __x)
  { return __builtin_logl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    log(_Tp __x)
    { return __builtin_log(__x); }

  using ::log10;


  inline constexpr float
  log10(float __x)
  { return __builtin_log10f(__x); }

  inline constexpr long double
  log10(long double __x)
  { return __builtin_log10l(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    log10(_Tp __x)
    { return __builtin_log10(__x); }

  using ::modf;


  inline float
  modf(float __x, float* __iptr)
  { return __builtin_modff(__x, __iptr); }

  inline long double
  modf(long double __x, long double* __iptr)
  { return __builtin_modfl(__x, __iptr); }


  using ::pow;


  inline constexpr float
  pow(float __x, float __y)
  { return __builtin_powf(__x, __y); }

  inline constexpr long double
  pow(long double __x, long double __y)
  { return __builtin_powl(__x, __y); }
# 412 "/usr/include/c++/9/cmath" 3
  template<typename _Tp, typename _Up>
    inline constexpr
    typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    pow(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return pow(__type(__x), __type(__y));
    }

  using ::sin;


  inline constexpr float
  sin(float __x)
  { return __builtin_sinf(__x); }

  inline constexpr long double
  sin(long double __x)
  { return __builtin_sinl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    sin(_Tp __x)
    { return __builtin_sin(__x); }

  using ::sinh;


  inline constexpr float
  sinh(float __x)
  { return __builtin_sinhf(__x); }

  inline constexpr long double
  sinh(long double __x)
  { return __builtin_sinhl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    sinh(_Tp __x)
    { return __builtin_sinh(__x); }

  using ::sqrt;


  inline constexpr float
  sqrt(float __x)
  { return __builtin_sqrtf(__x); }

  inline constexpr long double
  sqrt(long double __x)
  { return __builtin_sqrtl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    sqrt(_Tp __x)
    { return __builtin_sqrt(__x); }

  using ::tan;


  inline constexpr float
  tan(float __x)
  { return __builtin_tanf(__x); }

  inline constexpr long double
  tan(long double __x)
  { return __builtin_tanl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    tan(_Tp __x)
    { return __builtin_tan(__x); }

  using ::tanh;


  inline constexpr float
  tanh(float __x)
  { return __builtin_tanhf(__x); }

  inline constexpr long double
  tanh(long double __x)
  { return __builtin_tanhl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    tanh(_Tp __x)
    { return __builtin_tanh(__x); }
# 536 "/usr/include/c++/9/cmath" 3
  constexpr int
  fpclassify(float __x)
  { return __builtin_fpclassify(0, 1, 4,
    3, 2, __x); }

  constexpr int
  fpclassify(double __x)
  { return __builtin_fpclassify(0, 1, 4,
    3, 2, __x); }

  constexpr int
  fpclassify(long double __x)
  { return __builtin_fpclassify(0, 1, 4,
    3, 2, __x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              int>::__type
    fpclassify(_Tp __x)
    { return __x != 0 ? 4 : 2; }



  constexpr bool
  isfinite(float __x)
  { return __builtin_isfinite(__x); }

  constexpr bool
  isfinite(double __x)
  { return __builtin_isfinite(__x); }

  constexpr bool
  isfinite(long double __x)
  { return __builtin_isfinite(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              bool>::__type
    isfinite(_Tp __x)
    { return true; }



  constexpr bool
  isinf(float __x)
  { return __builtin_isinf(__x); }





  constexpr bool
  isinf(double __x)
  { return __builtin_isinf(__x); }


  constexpr bool
  isinf(long double __x)
  { return __builtin_isinf(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              bool>::__type
    isinf(_Tp __x)
    { return false; }



  constexpr bool
  isnan(float __x)
  { return __builtin_isnan(__x); }





  constexpr bool
  isnan(double __x)
  { return __builtin_isnan(__x); }


  constexpr bool
  isnan(long double __x)
  { return __builtin_isnan(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              bool>::__type
    isnan(_Tp __x)
    { return false; }



  constexpr bool
  isnormal(float __x)
  { return __builtin_isnormal(__x); }

  constexpr bool
  isnormal(double __x)
  { return __builtin_isnormal(__x); }

  constexpr bool
  isnormal(long double __x)
  { return __builtin_isnormal(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              bool>::__type
    isnormal(_Tp __x)
    { return __x != 0 ? true : false; }




  constexpr bool
  signbit(float __x)
  { return __builtin_signbit(__x); }

  constexpr bool
  signbit(double __x)
  { return __builtin_signbit(__x); }

  constexpr bool
  signbit(long double __x)
  { return __builtin_signbit(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              bool>::__type
    signbit(_Tp __x)
    { return __x < 0 ? true : false; }



  constexpr bool
  isgreater(float __x, float __y)
  { return __builtin_isgreater(__x, __y); }

  constexpr bool
  isgreater(double __x, double __y)
  { return __builtin_isgreater(__x, __y); }

  constexpr bool
  isgreater(long double __x, long double __y)
  { return __builtin_isgreater(__x, __y); }



  template<typename _Tp, typename _Up>
    constexpr typename
    __gnu_cxx::__enable_if<(__is_arithmetic<_Tp>::__value
       && __is_arithmetic<_Up>::__value), bool>::__type
    isgreater(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return __builtin_isgreater(__type(__x), __type(__y));
    }



  constexpr bool
  isgreaterequal(float __x, float __y)
  { return __builtin_isgreaterequal(__x, __y); }

  constexpr bool
  isgreaterequal(double __x, double __y)
  { return __builtin_isgreaterequal(__x, __y); }

  constexpr bool
  isgreaterequal(long double __x, long double __y)
  { return __builtin_isgreaterequal(__x, __y); }



  template<typename _Tp, typename _Up>
    constexpr typename
    __gnu_cxx::__enable_if<(__is_arithmetic<_Tp>::__value
       && __is_arithmetic<_Up>::__value), bool>::__type
    isgreaterequal(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return __builtin_isgreaterequal(__type(__x), __type(__y));
    }



  constexpr bool
  isless(float __x, float __y)
  { return __builtin_isless(__x, __y); }

  constexpr bool
  isless(double __x, double __y)
  { return __builtin_isless(__x, __y); }

  constexpr bool
  isless(long double __x, long double __y)
  { return __builtin_isless(__x, __y); }



  template<typename _Tp, typename _Up>
    constexpr typename
    __gnu_cxx::__enable_if<(__is_arithmetic<_Tp>::__value
       && __is_arithmetic<_Up>::__value), bool>::__type
    isless(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return __builtin_isless(__type(__x), __type(__y));
    }



  constexpr bool
  islessequal(float __x, float __y)
  { return __builtin_islessequal(__x, __y); }

  constexpr bool
  islessequal(double __x, double __y)
  { return __builtin_islessequal(__x, __y); }

  constexpr bool
  islessequal(long double __x, long double __y)
  { return __builtin_islessequal(__x, __y); }



  template<typename _Tp, typename _Up>
    constexpr typename
    __gnu_cxx::__enable_if<(__is_arithmetic<_Tp>::__value
       && __is_arithmetic<_Up>::__value), bool>::__type
    islessequal(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return __builtin_islessequal(__type(__x), __type(__y));
    }



  constexpr bool
  islessgreater(float __x, float __y)
  { return __builtin_islessgreater(__x, __y); }

  constexpr bool
  islessgreater(double __x, double __y)
  { return __builtin_islessgreater(__x, __y); }

  constexpr bool
  islessgreater(long double __x, long double __y)
  { return __builtin_islessgreater(__x, __y); }



  template<typename _Tp, typename _Up>
    constexpr typename
    __gnu_cxx::__enable_if<(__is_arithmetic<_Tp>::__value
       && __is_arithmetic<_Up>::__value), bool>::__type
    islessgreater(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return __builtin_islessgreater(__type(__x), __type(__y));
    }



  constexpr bool
  isunordered(float __x, float __y)
  { return __builtin_isunordered(__x, __y); }

  constexpr bool
  isunordered(double __x, double __y)
  { return __builtin_isunordered(__x, __y); }

  constexpr bool
  isunordered(long double __x, long double __y)
  { return __builtin_isunordered(__x, __y); }



  template<typename _Tp, typename _Up>
    constexpr typename
    __gnu_cxx::__enable_if<(__is_arithmetic<_Tp>::__value
       && __is_arithmetic<_Up>::__value), bool>::__type
    isunordered(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return __builtin_isunordered(__type(__x), __type(__y));
    }
# 1065 "/usr/include/c++/9/cmath" 3
  using ::double_t;
  using ::float_t;


  using ::acosh;
  using ::acoshf;
  using ::acoshl;

  using ::asinh;
  using ::asinhf;
  using ::asinhl;

  using ::atanh;
  using ::atanhf;
  using ::atanhl;

  using ::cbrt;
  using ::cbrtf;
  using ::cbrtl;

  using ::copysign;
  using ::copysignf;
  using ::copysignl;

  using ::erf;
  using ::erff;
  using ::erfl;

  using ::erfc;
  using ::erfcf;
  using ::erfcl;

  using ::exp2;
  using ::exp2f;
  using ::exp2l;

  using ::expm1;
  using ::expm1f;
  using ::expm1l;

  using ::fdim;
  using ::fdimf;
  using ::fdiml;

  using ::fma;
  using ::fmaf;
  using ::fmal;

  using ::fmax;
  using ::fmaxf;
  using ::fmaxl;

  using ::fmin;
  using ::fminf;
  using ::fminl;

  using ::hypot;
  using ::hypotf;
  using ::hypotl;

  using ::ilogb;
  using ::ilogbf;
  using ::ilogbl;

  using ::lgamma;
  using ::lgammaf;
  using ::lgammal;


  using ::llrint;
  using ::llrintf;
  using ::llrintl;

  using ::llround;
  using ::llroundf;
  using ::llroundl;


  using ::log1p;
  using ::log1pf;
  using ::log1pl;

  using ::log2;
  using ::log2f;
  using ::log2l;

  using ::logb;
  using ::logbf;
  using ::logbl;

  using ::lrint;
  using ::lrintf;
  using ::lrintl;

  using ::lround;
  using ::lroundf;
  using ::lroundl;

  using ::nan;
  using ::nanf;
  using ::nanl;

  using ::nearbyint;
  using ::nearbyintf;
  using ::nearbyintl;

  using ::nextafter;
  using ::nextafterf;
  using ::nextafterl;

  using ::nexttoward;
  using ::nexttowardf;
  using ::nexttowardl;

  using ::remainder;
  using ::remainderf;
  using ::remainderl;

  using ::remquo;
  using ::remquof;
  using ::remquol;

  using ::rint;
  using ::rintf;
  using ::rintl;

  using ::round;
  using ::roundf;
  using ::roundl;

  using ::scalbln;
  using ::scalblnf;
  using ::scalblnl;

  using ::scalbn;
  using ::scalbnf;
  using ::scalbnl;

  using ::tgamma;
  using ::tgammaf;
  using ::tgammal;

  using ::trunc;
  using ::truncf;
  using ::truncl;



  constexpr float
  acosh(float __x)
  { return __builtin_acoshf(__x); }

  constexpr long double
  acosh(long double __x)
  { return __builtin_acoshl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    acosh(_Tp __x)
    { return __builtin_acosh(__x); }



  constexpr float
  asinh(float __x)
  { return __builtin_asinhf(__x); }

  constexpr long double
  asinh(long double __x)
  { return __builtin_asinhl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    asinh(_Tp __x)
    { return __builtin_asinh(__x); }



  constexpr float
  atanh(float __x)
  { return __builtin_atanhf(__x); }

  constexpr long double
  atanh(long double __x)
  { return __builtin_atanhl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    atanh(_Tp __x)
    { return __builtin_atanh(__x); }



  constexpr float
  cbrt(float __x)
  { return __builtin_cbrtf(__x); }

  constexpr long double
  cbrt(long double __x)
  { return __builtin_cbrtl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    cbrt(_Tp __x)
    { return __builtin_cbrt(__x); }



  constexpr float
  copysign(float __x, float __y)
  { return __builtin_copysignf(__x, __y); }

  constexpr long double
  copysign(long double __x, long double __y)
  { return __builtin_copysignl(__x, __y); }



  template<typename _Tp, typename _Up>
    constexpr typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    copysign(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return copysign(__type(__x), __type(__y));
    }



  constexpr float
  erf(float __x)
  { return __builtin_erff(__x); }

  constexpr long double
  erf(long double __x)
  { return __builtin_erfl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    erf(_Tp __x)
    { return __builtin_erf(__x); }



  constexpr float
  erfc(float __x)
  { return __builtin_erfcf(__x); }

  constexpr long double
  erfc(long double __x)
  { return __builtin_erfcl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    erfc(_Tp __x)
    { return __builtin_erfc(__x); }



  constexpr float
  exp2(float __x)
  { return __builtin_exp2f(__x); }

  constexpr long double
  exp2(long double __x)
  { return __builtin_exp2l(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    exp2(_Tp __x)
    { return __builtin_exp2(__x); }



  constexpr float
  expm1(float __x)
  { return __builtin_expm1f(__x); }

  constexpr long double
  expm1(long double __x)
  { return __builtin_expm1l(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    expm1(_Tp __x)
    { return __builtin_expm1(__x); }



  constexpr float
  fdim(float __x, float __y)
  { return __builtin_fdimf(__x, __y); }

  constexpr long double
  fdim(long double __x, long double __y)
  { return __builtin_fdiml(__x, __y); }



  template<typename _Tp, typename _Up>
    constexpr typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    fdim(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return fdim(__type(__x), __type(__y));
    }



  constexpr float
  fma(float __x, float __y, float __z)
  { return __builtin_fmaf(__x, __y, __z); }

  constexpr long double
  fma(long double __x, long double __y, long double __z)
  { return __builtin_fmal(__x, __y, __z); }



  template<typename _Tp, typename _Up, typename _Vp>
    constexpr typename __gnu_cxx::__promote_3<_Tp, _Up, _Vp>::__type
    fma(_Tp __x, _Up __y, _Vp __z)
    {
      typedef typename __gnu_cxx::__promote_3<_Tp, _Up, _Vp>::__type __type;
      return fma(__type(__x), __type(__y), __type(__z));
    }



  constexpr float
  fmax(float __x, float __y)
  { return __builtin_fmaxf(__x, __y); }

  constexpr long double
  fmax(long double __x, long double __y)
  { return __builtin_fmaxl(__x, __y); }



  template<typename _Tp, typename _Up>
    constexpr typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    fmax(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return fmax(__type(__x), __type(__y));
    }



  constexpr float
  fmin(float __x, float __y)
  { return __builtin_fminf(__x, __y); }

  constexpr long double
  fmin(long double __x, long double __y)
  { return __builtin_fminl(__x, __y); }



  template<typename _Tp, typename _Up>
    constexpr typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    fmin(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return fmin(__type(__x), __type(__y));
    }



  constexpr float
  hypot(float __x, float __y)
  { return __builtin_hypotf(__x, __y); }

  constexpr long double
  hypot(long double __x, long double __y)
  { return __builtin_hypotl(__x, __y); }



  template<typename _Tp, typename _Up>
    constexpr typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    hypot(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return hypot(__type(__x), __type(__y));
    }



  constexpr int
  ilogb(float __x)
  { return __builtin_ilogbf(__x); }

  constexpr int
  ilogb(long double __x)
  { return __builtin_ilogbl(__x); }



  template<typename _Tp>
    constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    int>::__type
    ilogb(_Tp __x)
    { return __builtin_ilogb(__x); }



  constexpr float
  lgamma(float __x)
  { return __builtin_lgammaf(__x); }

  constexpr long double
  lgamma(long double __x)
  { return __builtin_lgammal(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    lgamma(_Tp __x)
    { return __builtin_lgamma(__x); }



  constexpr long long
  llrint(float __x)
  { return __builtin_llrintf(__x); }

  constexpr long long
  llrint(long double __x)
  { return __builtin_llrintl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              long long>::__type
    llrint(_Tp __x)
    { return __builtin_llrint(__x); }



  constexpr long long
  llround(float __x)
  { return __builtin_llroundf(__x); }

  constexpr long long
  llround(long double __x)
  { return __builtin_llroundl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              long long>::__type
    llround(_Tp __x)
    { return __builtin_llround(__x); }



  constexpr float
  log1p(float __x)
  { return __builtin_log1pf(__x); }

  constexpr long double
  log1p(long double __x)
  { return __builtin_log1pl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    log1p(_Tp __x)
    { return __builtin_log1p(__x); }




  constexpr float
  log2(float __x)
  { return __builtin_log2f(__x); }

  constexpr long double
  log2(long double __x)
  { return __builtin_log2l(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    log2(_Tp __x)
    { return __builtin_log2(__x); }



  constexpr float
  logb(float __x)
  { return __builtin_logbf(__x); }

  constexpr long double
  logb(long double __x)
  { return __builtin_logbl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    logb(_Tp __x)
    { return __builtin_logb(__x); }



  constexpr long
  lrint(float __x)
  { return __builtin_lrintf(__x); }

  constexpr long
  lrint(long double __x)
  { return __builtin_lrintl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              long>::__type
    lrint(_Tp __x)
    { return __builtin_lrint(__x); }



  constexpr long
  lround(float __x)
  { return __builtin_lroundf(__x); }

  constexpr long
  lround(long double __x)
  { return __builtin_lroundl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              long>::__type
    lround(_Tp __x)
    { return __builtin_lround(__x); }



  constexpr float
  nearbyint(float __x)
  { return __builtin_nearbyintf(__x); }

  constexpr long double
  nearbyint(long double __x)
  { return __builtin_nearbyintl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    nearbyint(_Tp __x)
    { return __builtin_nearbyint(__x); }



  constexpr float
  nextafter(float __x, float __y)
  { return __builtin_nextafterf(__x, __y); }

  constexpr long double
  nextafter(long double __x, long double __y)
  { return __builtin_nextafterl(__x, __y); }



  template<typename _Tp, typename _Up>
    constexpr typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    nextafter(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return nextafter(__type(__x), __type(__y));
    }



  constexpr float
  nexttoward(float __x, long double __y)
  { return __builtin_nexttowardf(__x, __y); }

  constexpr long double
  nexttoward(long double __x, long double __y)
  { return __builtin_nexttowardl(__x, __y); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    nexttoward(_Tp __x, long double __y)
    { return __builtin_nexttoward(__x, __y); }



  constexpr float
  remainder(float __x, float __y)
  { return __builtin_remainderf(__x, __y); }

  constexpr long double
  remainder(long double __x, long double __y)
  { return __builtin_remainderl(__x, __y); }



  template<typename _Tp, typename _Up>
    constexpr typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    remainder(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return remainder(__type(__x), __type(__y));
    }



  inline float
  remquo(float __x, float __y, int* __pquo)
  { return __builtin_remquof(__x, __y, __pquo); }

  inline long double
  remquo(long double __x, long double __y, int* __pquo)
  { return __builtin_remquol(__x, __y, __pquo); }



  template<typename _Tp, typename _Up>
    inline typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    remquo(_Tp __x, _Up __y, int* __pquo)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return remquo(__type(__x), __type(__y), __pquo);
    }



  constexpr float
  rint(float __x)
  { return __builtin_rintf(__x); }

  constexpr long double
  rint(long double __x)
  { return __builtin_rintl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    rint(_Tp __x)
    { return __builtin_rint(__x); }



  constexpr float
  round(float __x)
  { return __builtin_roundf(__x); }

  constexpr long double
  round(long double __x)
  { return __builtin_roundl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    round(_Tp __x)
    { return __builtin_round(__x); }



  constexpr float
  scalbln(float __x, long __ex)
  { return __builtin_scalblnf(__x, __ex); }

  constexpr long double
  scalbln(long double __x, long __ex)
  { return __builtin_scalblnl(__x, __ex); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    scalbln(_Tp __x, long __ex)
    { return __builtin_scalbln(__x, __ex); }



  constexpr float
  scalbn(float __x, int __ex)
  { return __builtin_scalbnf(__x, __ex); }

  constexpr long double
  scalbn(long double __x, int __ex)
  { return __builtin_scalbnl(__x, __ex); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    scalbn(_Tp __x, int __ex)
    { return __builtin_scalbn(__x, __ex); }



  constexpr float
  tgamma(float __x)
  { return __builtin_tgammaf(__x); }

  constexpr long double
  tgamma(long double __x)
  { return __builtin_tgammal(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    tgamma(_Tp __x)
    { return __builtin_tgamma(__x); }



  constexpr float
  trunc(float __x)
  { return __builtin_truncf(__x); }

  constexpr long double
  trunc(long double __x)
  { return __builtin_truncl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    trunc(_Tp __x)
    { return __builtin_trunc(__x); }
# 1852 "/usr/include/c++/9/cmath" 3
  template<typename _Tp>
    inline _Tp
    __hypot3(_Tp __x, _Tp __y, _Tp __z)
    {
      __x = std::abs(__x);
      __y = std::abs(__y);
      __z = std::abs(__z);
      if (_Tp __a = __x < __y ? __y < __z ? __z : __y : __x < __z ? __z : __x)
 return __a * std::sqrt((__x / __a) * (__x / __a)
          + (__y / __a) * (__y / __a)
          + (__z / __a) * (__z / __a));
      else
 return {};
    }

  inline float
  hypot(float __x, float __y, float __z)
  { return std::__hypot3<float>(__x, __y, __z); }

  inline double
  hypot(double __x, double __y, double __z)
  { return std::__hypot3<double>(__x, __y, __z); }

  inline long double
  hypot(long double __x, long double __y, long double __z)
  { return std::__hypot3<long double>(__x, __y, __z); }

  template<typename _Tp, typename _Up, typename _Vp>
    typename __gnu_cxx::__promote_3<_Tp, _Up, _Vp>::__type
    hypot(_Tp __x, _Up __y, _Vp __z)
    {
      using __type = typename __gnu_cxx::__promote_3<_Tp, _Up, _Vp>::__type;
      return std::__hypot3<__type>(__x, __y, __z);
    }
# 1923 "/usr/include/c++/9/cmath" 3

}


# 1 "/usr/include/c++/9/bits/specfun.h" 1 3
# 33 "/usr/include/c++/9/bits/specfun.h" 3
#pragma GCC visibility push(default)
# 45 "/usr/include/c++/9/bits/specfun.h" 3
# 1 "/usr/include/c++/9/bits/stl_algobase.h" 1 3
# 60 "/usr/include/c++/9/bits/stl_algobase.h" 3
# 1 "/usr/include/c++/9/bits/functexcept.h" 1 3
# 40 "/usr/include/c++/9/bits/functexcept.h" 3
# 1 "/usr/include/c++/9/bits/exception_defines.h" 1 3
# 41 "/usr/include/c++/9/bits/functexcept.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{



  void
  __throw_bad_exception(void) __attribute__((__noreturn__));


  void
  __throw_bad_alloc(void) __attribute__((__noreturn__));


  void
  __throw_bad_cast(void) __attribute__((__noreturn__));

  void
  __throw_bad_typeid(void) __attribute__((__noreturn__));


  void
  __throw_logic_error(const char*) __attribute__((__noreturn__));

  void
  __throw_domain_error(const char*) __attribute__((__noreturn__));

  void
  __throw_invalid_argument(const char*) __attribute__((__noreturn__));

  void
  __throw_length_error(const char*) __attribute__((__noreturn__));

  void
  __throw_out_of_range(const char*) __attribute__((__noreturn__));

  void
  __throw_out_of_range_fmt(const char*, ...) __attribute__((__noreturn__))
    __attribute__((__format__(__gnu_printf__, 1, 2)));

  void
  __throw_runtime_error(const char*) __attribute__((__noreturn__));

  void
  __throw_range_error(const char*) __attribute__((__noreturn__));

  void
  __throw_overflow_error(const char*) __attribute__((__noreturn__));

  void
  __throw_underflow_error(const char*) __attribute__((__noreturn__));


  void
  __throw_ios_failure(const char*) __attribute__((__noreturn__));

  void
  __throw_ios_failure(const char*, int) __attribute__((__noreturn__));


  void
  __throw_system_error(int) __attribute__((__noreturn__));


  void
  __throw_future_error(int) __attribute__((__noreturn__));


  void
  __throw_bad_function_call() __attribute__((__noreturn__));


}
# 61 "/usr/include/c++/9/bits/stl_algobase.h" 2 3


# 1 "/usr/include/c++/9/ext/numeric_traits.h" 1 3
# 32 "/usr/include/c++/9/ext/numeric_traits.h" 3
       
# 33 "/usr/include/c++/9/ext/numeric_traits.h" 3




namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{

# 50 "/usr/include/c++/9/ext/numeric_traits.h" 3
  template<typename _Tp>
    struct __is_integer_nonstrict
    : public std::__is_integer<_Tp>
    {
      using std::__is_integer<_Tp>::__value;


      enum { __width = __value ? sizeof(_Tp) * 8 : 0 };
    };

  template<typename _Value>
    struct __numeric_traits_integer
    {

      static_assert(__is_integer_nonstrict<_Value>::__value,
      "invalid specialization");




      static const bool __is_signed = (_Value)(-1) < 0;
      static const int __digits
 = __is_integer_nonstrict<_Value>::__width - __is_signed;


      static const _Value __max = __is_signed
 ? (((((_Value)1 << (__digits - 1)) - 1) << 1) + 1)
 : ~(_Value)0;
      static const _Value __min = __is_signed ? -__max - 1 : (_Value)0;
    };

  template<typename _Value>
    const _Value __numeric_traits_integer<_Value>::__min;

  template<typename _Value>
    const _Value __numeric_traits_integer<_Value>::__max;

  template<typename _Value>
    const bool __numeric_traits_integer<_Value>::__is_signed;

  template<typename _Value>
    const int __numeric_traits_integer<_Value>::__digits;
# 128 "/usr/include/c++/9/ext/numeric_traits.h" 3
  template<> struct __is_integer_nonstrict<__int128> { enum { __value = 1 }; typedef std::__true_type __type; enum { __width = 128 }; }; template<> struct __is_integer_nonstrict<unsigned __int128> { enum { __value = 1 }; typedef std::__true_type __type; enum { __width = 128 }; };






  template<typename _Tp>
    using __int_traits = __numeric_traits_integer<_Tp>;
# 155 "/usr/include/c++/9/ext/numeric_traits.h" 3
  template<typename _Value>
    struct __numeric_traits_floating
    {

      static const int __max_digits10 = (2 + (std::__are_same<_Value, float>::__value ? 24 : std::__are_same<_Value, double>::__value ? 53 : 64) * 643L / 2136);


      static const bool __is_signed = true;
      static const int __digits10 = (std::__are_same<_Value, float>::__value ? 6 : std::__are_same<_Value, double>::__value ? 15 : 18);
      static const int __max_exponent10 = (std::__are_same<_Value, float>::__value ? 38 : std::__are_same<_Value, double>::__value ? 308 : 4932);
    };

  template<typename _Value>
    const int __numeric_traits_floating<_Value>::__max_digits10;

  template<typename _Value>
    const bool __numeric_traits_floating<_Value>::__is_signed;

  template<typename _Value>
    const int __numeric_traits_floating<_Value>::__digits10;

  template<typename _Value>
    const int __numeric_traits_floating<_Value>::__max_exponent10;

  template<typename _Value>
    struct __numeric_traits
    : public __conditional_type<std::__is_integer<_Value>::__value,
    __numeric_traits_integer<_Value>,
    __numeric_traits_floating<_Value> >::__type
    { };


}
# 64 "/usr/include/c++/9/bits/stl_algobase.h" 2 3
# 1 "/usr/include/c++/9/bits/stl_pair.h" 1 3
# 59 "/usr/include/c++/9/bits/stl_pair.h" 3
# 1 "/usr/include/c++/9/bits/move.h" 1 3
# 34 "/usr/include/c++/9/bits/move.h" 3
# 1 "/usr/include/c++/9/bits/concept_check.h" 1 3
# 33 "/usr/include/c++/9/bits/concept_check.h" 3
       
# 34 "/usr/include/c++/9/bits/concept_check.h" 3
# 35 "/usr/include/c++/9/bits/move.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{







  template<typename _Tp>
    inline constexpr _Tp*
    __addressof(_Tp& __r) noexcept
    { return __builtin_addressof(__r); }




}

# 1 "/usr/include/c++/9/type_traits" 1 3
# 32 "/usr/include/c++/9/type_traits" 3
       
# 33 "/usr/include/c++/9/type_traits" 3







namespace std __attribute__ ((__visibility__ ("default")))
{

# 56 "/usr/include/c++/9/type_traits" 3
  template<typename _Tp, _Tp __v>
    struct integral_constant
    {
      static constexpr _Tp value = __v;
      typedef _Tp value_type;
      typedef integral_constant<_Tp, __v> type;
      constexpr operator value_type() const noexcept { return value; }




      constexpr value_type operator()() const noexcept { return value; }

    };

  template<typename _Tp, _Tp __v>
    constexpr _Tp integral_constant<_Tp, __v>::value;


  typedef integral_constant<bool, true> true_type;


  typedef integral_constant<bool, false> false_type;

  template<bool __v>
    using __bool_constant = integral_constant<bool, __v>;



  template<bool __v>
    using bool_constant = integral_constant<bool, __v>;




  template<bool, typename, typename>
    struct conditional;

  template<typename...>
    struct __or_;

  template<>
    struct __or_<>
    : public false_type
    { };

  template<typename _B1>
    struct __or_<_B1>
    : public _B1
    { };

  template<typename _B1, typename _B2>
    struct __or_<_B1, _B2>
    : public conditional<_B1::value, _B1, _B2>::type
    { };

  template<typename _B1, typename _B2, typename _B3, typename... _Bn>
    struct __or_<_B1, _B2, _B3, _Bn...>
    : public conditional<_B1::value, _B1, __or_<_B2, _B3, _Bn...>>::type
    { };

  template<typename...>
    struct __and_;

  template<>
    struct __and_<>
    : public true_type
    { };

  template<typename _B1>
    struct __and_<_B1>
    : public _B1
    { };

  template<typename _B1, typename _B2>
    struct __and_<_B1, _B2>
    : public conditional<_B1::value, _B2, _B1>::type
    { };

  template<typename _B1, typename _B2, typename _B3, typename... _Bn>
    struct __and_<_B1, _B2, _B3, _Bn...>
    : public conditional<_B1::value, __and_<_B2, _B3, _Bn...>, _B1>::type
    { };

  template<typename _Pp>
    struct __not_
    : public __bool_constant<!bool(_Pp::value)>
    { };



  template<typename... _Bn>
    inline constexpr bool __or_v = __or_<_Bn...>::value;
  template<typename... _Bn>
    inline constexpr bool __and_v = __and_<_Bn...>::value;



  template<typename... _Bn>
    struct conjunction
    : __and_<_Bn...>
    { };

  template<typename... _Bn>
    struct disjunction
    : __or_<_Bn...>
    { };

  template<typename _Pp>
    struct negation
    : __not_<_Pp>
    { };

  template<typename... _Bn>
    inline constexpr bool conjunction_v = conjunction<_Bn...>::value;

  template<typename... _Bn>
    inline constexpr bool disjunction_v = disjunction<_Bn...>::value;

  template<typename _Pp>
    inline constexpr bool negation_v = negation<_Pp>::value;
# 185 "/usr/include/c++/9/type_traits" 3
  template<typename _Tp>
    struct __success_type
    { typedef _Tp type; };

  struct __failure_type
  { };



  template<typename>
    struct remove_cv;

  template<typename>
    struct __is_void_helper
    : public false_type { };

  template<>
    struct __is_void_helper<void>
    : public true_type { };


  template<typename _Tp>
    struct is_void
    : public __is_void_helper<typename remove_cv<_Tp>::type>::type
    { };

  template<typename>
    struct __is_integral_helper
    : public false_type { };

  template<>
    struct __is_integral_helper<bool>
    : public true_type { };

  template<>
    struct __is_integral_helper<char>
    : public true_type { };

  template<>
    struct __is_integral_helper<signed char>
    : public true_type { };

  template<>
    struct __is_integral_helper<unsigned char>
    : public true_type { };


  template<>
    struct __is_integral_helper<wchar_t>
    : public true_type { };
# 243 "/usr/include/c++/9/type_traits" 3
  template<>
    struct __is_integral_helper<char16_t>
    : public true_type { };

  template<>
    struct __is_integral_helper<char32_t>
    : public true_type { };

  template<>
    struct __is_integral_helper<short>
    : public true_type { };

  template<>
    struct __is_integral_helper<unsigned short>
    : public true_type { };

  template<>
    struct __is_integral_helper<int>
    : public true_type { };

  template<>
    struct __is_integral_helper<unsigned int>
    : public true_type { };

  template<>
    struct __is_integral_helper<long>
    : public true_type { };

  template<>
    struct __is_integral_helper<unsigned long>
    : public true_type { };

  template<>
    struct __is_integral_helper<long long>
    : public true_type { };

  template<>
    struct __is_integral_helper<unsigned long long>
    : public true_type { };
# 323 "/usr/include/c++/9/type_traits" 3
  template<typename _Tp>
    struct is_integral
    : public __is_integral_helper<typename remove_cv<_Tp>::type>::type
    { };

  template<typename>
    struct __is_floating_point_helper
    : public false_type { };

  template<>
    struct __is_floating_point_helper<float>
    : public true_type { };

  template<>
    struct __is_floating_point_helper<double>
    : public true_type { };

  template<>
    struct __is_floating_point_helper<long double>
    : public true_type { };
# 351 "/usr/include/c++/9/type_traits" 3
  template<typename _Tp>
    struct is_floating_point
    : public __is_floating_point_helper<typename remove_cv<_Tp>::type>::type
    { };


  template<typename>
    struct is_array
    : public false_type { };

  template<typename _Tp, std::size_t _Size>
    struct is_array<_Tp[_Size]>
    : public true_type { };

  template<typename _Tp>
    struct is_array<_Tp[]>
    : public true_type { };

  template<typename>
    struct __is_pointer_helper
    : public false_type { };

  template<typename _Tp>
    struct __is_pointer_helper<_Tp*>
    : public true_type { };


  template<typename _Tp>
    struct is_pointer
    : public __is_pointer_helper<typename remove_cv<_Tp>::type>::type
    { };


  template<typename>
    struct is_lvalue_reference
    : public false_type { };

  template<typename _Tp>
    struct is_lvalue_reference<_Tp&>
    : public true_type { };


  template<typename>
    struct is_rvalue_reference
    : public false_type { };

  template<typename _Tp>
    struct is_rvalue_reference<_Tp&&>
    : public true_type { };

  template<typename>
    struct is_function;

  template<typename>
    struct __is_member_object_pointer_helper
    : public false_type { };

  template<typename _Tp, typename _Cp>
    struct __is_member_object_pointer_helper<_Tp _Cp::*>
    : public __not_<is_function<_Tp>>::type { };


  template<typename _Tp>
    struct is_member_object_pointer
    : public __is_member_object_pointer_helper<
    typename remove_cv<_Tp>::type>::type
    { };

  template<typename>
    struct __is_member_function_pointer_helper
    : public false_type { };

  template<typename _Tp, typename _Cp>
    struct __is_member_function_pointer_helper<_Tp _Cp::*>
    : public is_function<_Tp>::type { };


  template<typename _Tp>
    struct is_member_function_pointer
    : public __is_member_function_pointer_helper<
    typename remove_cv<_Tp>::type>::type
    { };


  template<typename _Tp>
    struct is_enum
    : public integral_constant<bool, __is_enum(_Tp)>
    { };


  template<typename _Tp>
    struct is_union
    : public integral_constant<bool, __is_union(_Tp)>
    { };


  template<typename _Tp>
    struct is_class
    : public integral_constant<bool, __is_class(_Tp)>
    { };


  template<typename>
    struct is_function
    : public false_type { };

  template<typename _Res, typename... _ArgTypes , bool _NE>
    struct is_function<_Res(_ArgTypes...) noexcept (_NE)>
    : public true_type { };

  template<typename _Res, typename... _ArgTypes , bool _NE>
    struct is_function<_Res(_ArgTypes...) & noexcept (_NE)>
    : public true_type { };

  template<typename _Res, typename... _ArgTypes , bool _NE>
    struct is_function<_Res(_ArgTypes...) && noexcept (_NE)>
    : public true_type { };

  template<typename _Res, typename... _ArgTypes , bool _NE>
    struct is_function<_Res(_ArgTypes......) noexcept (_NE)>
    : public true_type { };

  template<typename _Res, typename... _ArgTypes , bool _NE>
    struct is_function<_Res(_ArgTypes......) & noexcept (_NE)>
    : public true_type { };

  template<typename _Res, typename... _ArgTypes , bool _NE>
    struct is_function<_Res(_ArgTypes......) && noexcept (_NE)>
    : public true_type { };

  template<typename _Res, typename... _ArgTypes , bool _NE>
    struct is_function<_Res(_ArgTypes...) const noexcept (_NE)>
    : public true_type { };

  template<typename _Res, typename... _ArgTypes , bool _NE>
    struct is_function<_Res(_ArgTypes...) const & noexcept (_NE)>
    : public true_type { };

  template<typename _Res, typename... _ArgTypes , bool _NE>
    struct is_function<_Res(_ArgTypes...) const && noexcept (_NE)>
    : public true_type { };

  template<typename _Res, typename... _ArgTypes , bool _NE>
    struct is_function<_Res(_ArgTypes......) const noexcept (_NE)>
    : public true_type { };

  template<typename _Res, typename... _ArgTypes , bool _NE>
    struct is_function<_Res(_ArgTypes......) const & noexcept (_NE)>
    : public true_type { };

  template<typename _Res, typename... _ArgTypes , bool _NE>
    struct is_function<_Res(_ArgTypes......) const && noexcept (_NE)>
    : public true_type { };

  template<typename _Res, typename... _ArgTypes , bool _NE>
    struct is_function<_Res(_ArgTypes...) volatile noexcept (_NE)>
    : public true_type { };

  template<typename _Res, typename... _ArgTypes , bool _NE>
    struct is_function<_Res(_ArgTypes...) volatile & noexcept (_NE)>
    : public true_type { };

  template<typename _Res, typename... _ArgTypes , bool _NE>
    struct is_function<_Res(_ArgTypes...) volatile && noexcept (_NE)>
    : public true_type { };

  template<typename _Res, typename... _ArgTypes , bool _NE>
    struct is_function<_Res(_ArgTypes......) volatile noexcept (_NE)>
    : public true_type { };

  template<typename _Res, typename... _ArgTypes , bool _NE>
    struct is_function<_Res(_ArgTypes......) volatile & noexcept (_NE)>
    : public true_type { };

  template<typename _Res, typename... _ArgTypes , bool _NE>
    struct is_function<_Res(_ArgTypes......) volatile && noexcept (_NE)>
    : public true_type { };

  template<typename _Res, typename... _ArgTypes , bool _NE>
    struct is_function<_Res(_ArgTypes...) const volatile noexcept (_NE)>
    : public true_type { };

  template<typename _Res, typename... _ArgTypes , bool _NE>
    struct is_function<_Res(_ArgTypes...) const volatile & noexcept (_NE)>
    : public true_type { };

  template<typename _Res, typename... _ArgTypes , bool _NE>
    struct is_function<_Res(_ArgTypes...) const volatile && noexcept (_NE)>
    : public true_type { };

  template<typename _Res, typename... _ArgTypes , bool _NE>
    struct is_function<_Res(_ArgTypes......) const volatile noexcept (_NE)>
    : public true_type { };

  template<typename _Res, typename... _ArgTypes , bool _NE>
    struct is_function<_Res(_ArgTypes......) const volatile & noexcept (_NE)>
    : public true_type { };

  template<typename _Res, typename... _ArgTypes , bool _NE>
    struct is_function<_Res(_ArgTypes......) const volatile && noexcept (_NE)>
    : public true_type { };



  template<typename>
    struct __is_null_pointer_helper
    : public false_type { };

  template<>
    struct __is_null_pointer_helper<std::nullptr_t>
    : public true_type { };


  template<typename _Tp>
    struct is_null_pointer
    : public __is_null_pointer_helper<typename remove_cv<_Tp>::type>::type
    { };


  template<typename _Tp>
    struct __is_nullptr_t
    : public is_null_pointer<_Tp>
    { };




  template<typename _Tp>
    struct is_reference
    : public __or_<is_lvalue_reference<_Tp>,
                   is_rvalue_reference<_Tp>>::type
    { };


  template<typename _Tp>
    struct is_arithmetic
    : public __or_<is_integral<_Tp>, is_floating_point<_Tp>>::type
    { };


  template<typename _Tp>
    struct is_fundamental
    : public __or_<is_arithmetic<_Tp>, is_void<_Tp>,
     is_null_pointer<_Tp>>::type
    { };


  template<typename _Tp>
    struct is_object
    : public __not_<__or_<is_function<_Tp>, is_reference<_Tp>,
                          is_void<_Tp>>>::type
    { };

  template<typename>
    struct is_member_pointer;


  template<typename _Tp>
    struct is_scalar
    : public __or_<is_arithmetic<_Tp>, is_enum<_Tp>, is_pointer<_Tp>,
                   is_member_pointer<_Tp>, is_null_pointer<_Tp>>::type
    { };


  template<typename _Tp>
    struct is_compound
    : public __not_<is_fundamental<_Tp>>::type { };

  template<typename _Tp>
    struct __is_member_pointer_helper
    : public false_type { };

  template<typename _Tp, typename _Cp>
    struct __is_member_pointer_helper<_Tp _Cp::*>
    : public true_type { };


  template<typename _Tp>
    struct is_member_pointer
    : public __is_member_pointer_helper<typename remove_cv<_Tp>::type>::type
    { };



  template<typename _Tp>
    struct __is_referenceable
    : public __or_<is_object<_Tp>, is_reference<_Tp>>::type
    { };

  template<typename _Res, typename... _Args , bool _NE>
    struct __is_referenceable<_Res(_Args...) noexcept (_NE)>
    : public true_type
    { };

  template<typename _Res, typename... _Args , bool _NE>
    struct __is_referenceable<_Res(_Args......) noexcept (_NE)>
    : public true_type
    { };




  template<typename>
    struct is_const
    : public false_type { };

  template<typename _Tp>
    struct is_const<_Tp const>
    : public true_type { };


  template<typename>
    struct is_volatile
    : public false_type { };

  template<typename _Tp>
    struct is_volatile<_Tp volatile>
    : public true_type { };


  template<typename _Tp>
    struct is_trivial
    : public integral_constant<bool, __is_trivial(_Tp)>
    { };


  template<typename _Tp>
    struct is_trivially_copyable
    : public integral_constant<bool, __is_trivially_copyable(_Tp)>
    { };


  template<typename _Tp>
    struct is_standard_layout
    : public integral_constant<bool, __is_standard_layout(_Tp)>
    { };



  template<typename _Tp>
    struct is_pod
    : public integral_constant<bool, __is_pod(_Tp)>
    { };


  template<typename _Tp>
    struct is_literal_type
    : public integral_constant<bool, __is_literal_type(_Tp)>
    { };


  template<typename _Tp>
    struct is_empty
    : public integral_constant<bool, __is_empty(_Tp)>
    { };


  template<typename _Tp>
    struct is_polymorphic
    : public integral_constant<bool, __is_polymorphic(_Tp)>
    { };




  template<typename _Tp>
    struct is_final
    : public integral_constant<bool, __is_final(_Tp)>
    { };



  template<typename _Tp>
    struct is_abstract
    : public integral_constant<bool, __is_abstract(_Tp)>
    { };

  template<typename _Tp,
    bool = is_arithmetic<_Tp>::value>
    struct __is_signed_helper
    : public false_type { };

  template<typename _Tp>
    struct __is_signed_helper<_Tp, true>
    : public integral_constant<bool, _Tp(-1) < _Tp(0)>
    { };


  template<typename _Tp>
    struct is_signed
    : public __is_signed_helper<_Tp>::type
    { };


  template<typename _Tp>
    struct is_unsigned
    : public __and_<is_arithmetic<_Tp>, __not_<is_signed<_Tp>>>
    { };
# 758 "/usr/include/c++/9/type_traits" 3
  template<typename _Tp, typename _Up = _Tp&&>
    _Up
    __declval(int);

  template<typename _Tp>
    _Tp
    __declval(long);

  template<typename _Tp>
    auto declval() noexcept -> decltype(__declval<_Tp>(0));

  template<typename, unsigned = 0>
    struct extent;

  template<typename>
    struct remove_all_extents;

  template<typename _Tp>
    struct __is_array_known_bounds
    : public integral_constant<bool, (extent<_Tp>::value > 0)>
    { };

  template<typename _Tp>
    struct __is_array_unknown_bounds
    : public __and_<is_array<_Tp>, __not_<extent<_Tp>>>
    { };






  struct __do_is_destructible_impl
  {
    template<typename _Tp, typename = decltype(declval<_Tp&>().~_Tp())>
      static true_type __test(int);

    template<typename>
      static false_type __test(...);
  };

  template<typename _Tp>
    struct __is_destructible_impl
    : public __do_is_destructible_impl
    {
      typedef decltype(__test<_Tp>(0)) type;
    };

  template<typename _Tp,
           bool = __or_<is_void<_Tp>,
                        __is_array_unknown_bounds<_Tp>,
                        is_function<_Tp>>::value,
           bool = __or_<is_reference<_Tp>, is_scalar<_Tp>>::value>
    struct __is_destructible_safe;

  template<typename _Tp>
    struct __is_destructible_safe<_Tp, false, false>
    : public __is_destructible_impl<typename
               remove_all_extents<_Tp>::type>::type
    { };

  template<typename _Tp>
    struct __is_destructible_safe<_Tp, true, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_destructible_safe<_Tp, false, true>
    : public true_type { };


  template<typename _Tp>
    struct is_destructible
    : public __is_destructible_safe<_Tp>::type
    { };





  struct __do_is_nt_destructible_impl
  {
    template<typename _Tp>
      static __bool_constant<noexcept(declval<_Tp&>().~_Tp())>
      __test(int);

    template<typename>
      static false_type __test(...);
  };

  template<typename _Tp>
    struct __is_nt_destructible_impl
    : public __do_is_nt_destructible_impl
    {
      typedef decltype(__test<_Tp>(0)) type;
    };

  template<typename _Tp,
           bool = __or_<is_void<_Tp>,
                        __is_array_unknown_bounds<_Tp>,
                        is_function<_Tp>>::value,
           bool = __or_<is_reference<_Tp>, is_scalar<_Tp>>::value>
    struct __is_nt_destructible_safe;

  template<typename _Tp>
    struct __is_nt_destructible_safe<_Tp, false, false>
    : public __is_nt_destructible_impl<typename
               remove_all_extents<_Tp>::type>::type
    { };

  template<typename _Tp>
    struct __is_nt_destructible_safe<_Tp, true, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_nt_destructible_safe<_Tp, false, true>
    : public true_type { };


  template<typename _Tp>
    struct is_nothrow_destructible
    : public __is_nt_destructible_safe<_Tp>::type
    { };


  template<typename _Tp, typename... _Args>
    struct is_constructible
      : public __bool_constant<__is_constructible(_Tp, _Args...)>
    { };


  template<typename _Tp>
    struct is_default_constructible
    : public is_constructible<_Tp>::type
    { };

  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_copy_constructible_impl;

  template<typename _Tp>
    struct __is_copy_constructible_impl<_Tp, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_copy_constructible_impl<_Tp, true>
    : public is_constructible<_Tp, const _Tp&>
    { };


  template<typename _Tp>
    struct is_copy_constructible
    : public __is_copy_constructible_impl<_Tp>
    { };

  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_move_constructible_impl;

  template<typename _Tp>
    struct __is_move_constructible_impl<_Tp, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_move_constructible_impl<_Tp, true>
    : public is_constructible<_Tp, _Tp&&>
    { };


  template<typename _Tp>
    struct is_move_constructible
    : public __is_move_constructible_impl<_Tp>
    { };

  template<bool, typename _Tp, typename... _Args>
    struct __is_nt_constructible_impl
    : public false_type
    { };

  template<typename _Tp, typename... _Args>
    struct __is_nt_constructible_impl<true, _Tp, _Args...>
    : public __bool_constant<noexcept(_Tp(std::declval<_Args>()...))>
    { };

  template<typename _Tp, typename _Arg>
    struct __is_nt_constructible_impl<true, _Tp, _Arg>
    : public __bool_constant<noexcept(static_cast<_Tp>(std::declval<_Arg>()))>
    { };

  template<typename _Tp>
    struct __is_nt_constructible_impl<true, _Tp>
    : public __bool_constant<noexcept(_Tp())>
    { };

  template<typename _Tp, size_t _Num>
    struct __is_nt_constructible_impl<true, _Tp[_Num]>
    : public __bool_constant<noexcept(typename remove_all_extents<_Tp>::type())>
    { };

  template<typename _Tp, typename... _Args>
    using __is_nothrow_constructible_impl
      = __is_nt_constructible_impl<__is_constructible(_Tp, _Args...),
       _Tp, _Args...>;


  template<typename _Tp, typename... _Args>
    struct is_nothrow_constructible
    : public __is_nothrow_constructible_impl<_Tp, _Args...>::type
    { };


  template<typename _Tp>
    struct is_nothrow_default_constructible
    : public __is_nothrow_constructible_impl<_Tp>::type
    { };


  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_nothrow_copy_constructible_impl;

  template<typename _Tp>
    struct __is_nothrow_copy_constructible_impl<_Tp, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_nothrow_copy_constructible_impl<_Tp, true>
    : public is_nothrow_constructible<_Tp, const _Tp&>
    { };


  template<typename _Tp>
    struct is_nothrow_copy_constructible
    : public __is_nothrow_copy_constructible_impl<_Tp>
    { };

  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_nothrow_move_constructible_impl;

  template<typename _Tp>
    struct __is_nothrow_move_constructible_impl<_Tp, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_nothrow_move_constructible_impl<_Tp, true>
    : public is_nothrow_constructible<_Tp, _Tp&&>
    { };


  template<typename _Tp>
    struct is_nothrow_move_constructible
    : public __is_nothrow_move_constructible_impl<_Tp>
    { };


  template<typename _Tp, typename _Up>
    struct is_assignable
      : public __bool_constant<__is_assignable(_Tp, _Up)>
    { };

  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_copy_assignable_impl;

  template<typename _Tp>
    struct __is_copy_assignable_impl<_Tp, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_copy_assignable_impl<_Tp, true>
    : public is_assignable<_Tp&, const _Tp&>
    { };


  template<typename _Tp>
    struct is_copy_assignable
    : public __is_copy_assignable_impl<_Tp>
    { };

  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_move_assignable_impl;

  template<typename _Tp>
    struct __is_move_assignable_impl<_Tp, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_move_assignable_impl<_Tp, true>
    : public is_assignable<_Tp&, _Tp&&>
    { };


  template<typename _Tp>
    struct is_move_assignable
    : public __is_move_assignable_impl<_Tp>
    { };

  template<typename _Tp, typename _Up>
    struct __is_nt_assignable_impl
    : public integral_constant<bool, noexcept(declval<_Tp>() = declval<_Up>())>
    { };


  template<typename _Tp, typename _Up>
    struct is_nothrow_assignable
    : public __and_<is_assignable<_Tp, _Up>,
      __is_nt_assignable_impl<_Tp, _Up>>
    { };

  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_nt_copy_assignable_impl;

  template<typename _Tp>
    struct __is_nt_copy_assignable_impl<_Tp, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_nt_copy_assignable_impl<_Tp, true>
    : public is_nothrow_assignable<_Tp&, const _Tp&>
    { };


  template<typename _Tp>
    struct is_nothrow_copy_assignable
    : public __is_nt_copy_assignable_impl<_Tp>
    { };

  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_nt_move_assignable_impl;

  template<typename _Tp>
    struct __is_nt_move_assignable_impl<_Tp, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_nt_move_assignable_impl<_Tp, true>
    : public is_nothrow_assignable<_Tp&, _Tp&&>
    { };


  template<typename _Tp>
    struct is_nothrow_move_assignable
    : public __is_nt_move_assignable_impl<_Tp>
    { };


  template<typename _Tp, typename... _Args>
    struct is_trivially_constructible
    : public __bool_constant<__is_trivially_constructible(_Tp, _Args...)>
    { };


  template<typename _Tp>
    struct is_trivially_default_constructible
    : public is_trivially_constructible<_Tp>::type
    { };

  struct __do_is_implicitly_default_constructible_impl
  {
    template <typename _Tp>
    static void __helper(const _Tp&);

    template <typename _Tp>
    static true_type __test(const _Tp&,
                            decltype(__helper<const _Tp&>({}))* = 0);

    static false_type __test(...);
  };

  template<typename _Tp>
    struct __is_implicitly_default_constructible_impl
    : public __do_is_implicitly_default_constructible_impl
    {
      typedef decltype(__test(declval<_Tp>())) type;
    };

  template<typename _Tp>
    struct __is_implicitly_default_constructible_safe
    : public __is_implicitly_default_constructible_impl<_Tp>::type
    { };

  template <typename _Tp>
    struct __is_implicitly_default_constructible
    : public __and_<is_default_constructible<_Tp>,
      __is_implicitly_default_constructible_safe<_Tp>>
    { };



  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_trivially_copy_constructible_impl;

  template<typename _Tp>
    struct __is_trivially_copy_constructible_impl<_Tp, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_trivially_copy_constructible_impl<_Tp, true>
    : public __and_<is_copy_constructible<_Tp>,
      integral_constant<bool,
   __is_trivially_constructible(_Tp, const _Tp&)>>
    { };

  template<typename _Tp>
    struct is_trivially_copy_constructible
    : public __is_trivially_copy_constructible_impl<_Tp>
    { };



  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_trivially_move_constructible_impl;

  template<typename _Tp>
    struct __is_trivially_move_constructible_impl<_Tp, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_trivially_move_constructible_impl<_Tp, true>
    : public __and_<is_move_constructible<_Tp>,
      integral_constant<bool,
   __is_trivially_constructible(_Tp, _Tp&&)>>
    { };

  template<typename _Tp>
    struct is_trivially_move_constructible
    : public __is_trivially_move_constructible_impl<_Tp>
    { };


  template<typename _Tp, typename _Up>
    struct is_trivially_assignable
    : public __bool_constant<__is_trivially_assignable(_Tp, _Up)>
    { };



  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_trivially_copy_assignable_impl;

  template<typename _Tp>
    struct __is_trivially_copy_assignable_impl<_Tp, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_trivially_copy_assignable_impl<_Tp, true>
    : public __bool_constant<__is_trivially_assignable(_Tp&, const _Tp&)>
    { };

  template<typename _Tp>
    struct is_trivially_copy_assignable
    : public __is_trivially_copy_assignable_impl<_Tp>
    { };



  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __is_trivially_move_assignable_impl;

  template<typename _Tp>
    struct __is_trivially_move_assignable_impl<_Tp, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_trivially_move_assignable_impl<_Tp, true>
    : public __bool_constant<__is_trivially_assignable(_Tp&, _Tp&&)>
    { };

  template<typename _Tp>
    struct is_trivially_move_assignable
    : public __is_trivially_move_assignable_impl<_Tp>
    { };


  template<typename _Tp>
    struct is_trivially_destructible
    : public __and_<is_destructible<_Tp>,
      __bool_constant<__has_trivial_destructor(_Tp)>>
    { };



  template<typename _Tp>
    struct has_virtual_destructor
    : public integral_constant<bool, __has_virtual_destructor(_Tp)>
    { };





  template<typename _Tp>
    struct alignment_of
    : public integral_constant<std::size_t, alignof(_Tp)> { };


  template<typename>
    struct rank
    : public integral_constant<std::size_t, 0> { };

  template<typename _Tp, std::size_t _Size>
    struct rank<_Tp[_Size]>
    : public integral_constant<std::size_t, 1 + rank<_Tp>::value> { };

  template<typename _Tp>
    struct rank<_Tp[]>
    : public integral_constant<std::size_t, 1 + rank<_Tp>::value> { };


  template<typename, unsigned _Uint>
    struct extent
    : public integral_constant<std::size_t, 0> { };

  template<typename _Tp, unsigned _Uint, std::size_t _Size>
    struct extent<_Tp[_Size], _Uint>
    : public integral_constant<std::size_t,
          _Uint == 0 ? _Size : extent<_Tp,
          _Uint - 1>::value>
    { };

  template<typename _Tp, unsigned _Uint>
    struct extent<_Tp[], _Uint>
    : public integral_constant<std::size_t,
          _Uint == 0 ? 0 : extent<_Tp,
             _Uint - 1>::value>
    { };





  template<typename, typename>
    struct is_same
    : public false_type { };

  template<typename _Tp>
    struct is_same<_Tp, _Tp>
    : public true_type { };


  template<typename _Base, typename _Derived>
    struct is_base_of
    : public integral_constant<bool, __is_base_of(_Base, _Derived)>
    { };

  template<typename _From, typename _To,
           bool = __or_<is_void<_From>, is_function<_To>,
                        is_array<_To>>::value>
    struct __is_convertible_helper
    {
      typedef typename is_void<_To>::type type;
    };

  template<typename _From, typename _To>
    class __is_convertible_helper<_From, _To, false>
    {
      template<typename _To1>
 static void __test_aux(_To1) noexcept;

      template<typename _From1, typename _To1,
        typename = decltype(__test_aux<_To1>(std::declval<_From1>()))>
 static true_type
 __test(int);

      template<typename, typename>
 static false_type
 __test(...);

    public:
      typedef decltype(__test<_From, _To>(0)) type;
    };



  template<typename _From, typename _To>
    struct is_convertible
    : public __is_convertible_helper<_From, _To>::type
    { };
# 1374 "/usr/include/c++/9/type_traits" 3
  template<typename _Tp>
    struct remove_const
    { typedef _Tp type; };

  template<typename _Tp>
    struct remove_const<_Tp const>
    { typedef _Tp type; };


  template<typename _Tp>
    struct remove_volatile
    { typedef _Tp type; };

  template<typename _Tp>
    struct remove_volatile<_Tp volatile>
    { typedef _Tp type; };


  template<typename _Tp>
    struct remove_cv
    {
      typedef typename
      remove_const<typename remove_volatile<_Tp>::type>::type type;
    };


  template<typename _Tp>
    struct add_const
    { typedef _Tp const type; };


  template<typename _Tp>
    struct add_volatile
    { typedef _Tp volatile type; };


  template<typename _Tp>
    struct add_cv
    {
      typedef typename
      add_const<typename add_volatile<_Tp>::type>::type type;
    };






  template<typename _Tp>
    using remove_const_t = typename remove_const<_Tp>::type;


  template<typename _Tp>
    using remove_volatile_t = typename remove_volatile<_Tp>::type;


  template<typename _Tp>
    using remove_cv_t = typename remove_cv<_Tp>::type;


  template<typename _Tp>
    using add_const_t = typename add_const<_Tp>::type;


  template<typename _Tp>
    using add_volatile_t = typename add_volatile<_Tp>::type;


  template<typename _Tp>
    using add_cv_t = typename add_cv<_Tp>::type;





  template<typename _Tp>
    struct remove_reference
    { typedef _Tp type; };

  template<typename _Tp>
    struct remove_reference<_Tp&>
    { typedef _Tp type; };

  template<typename _Tp>
    struct remove_reference<_Tp&&>
    { typedef _Tp type; };

  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __add_lvalue_reference_helper
    { typedef _Tp type; };

  template<typename _Tp>
    struct __add_lvalue_reference_helper<_Tp, true>
    { typedef _Tp& type; };


  template<typename _Tp>
    struct add_lvalue_reference
    : public __add_lvalue_reference_helper<_Tp>
    { };

  template<typename _Tp, bool = __is_referenceable<_Tp>::value>
    struct __add_rvalue_reference_helper
    { typedef _Tp type; };

  template<typename _Tp>
    struct __add_rvalue_reference_helper<_Tp, true>
    { typedef _Tp&& type; };


  template<typename _Tp>
    struct add_rvalue_reference
    : public __add_rvalue_reference_helper<_Tp>
    { };



  template<typename _Tp>
    using remove_reference_t = typename remove_reference<_Tp>::type;


  template<typename _Tp>
    using add_lvalue_reference_t = typename add_lvalue_reference<_Tp>::type;


  template<typename _Tp>
    using add_rvalue_reference_t = typename add_rvalue_reference<_Tp>::type;





  template<typename _Unqualified, bool _IsConst, bool _IsVol>
    struct __cv_selector;

  template<typename _Unqualified>
    struct __cv_selector<_Unqualified, false, false>
    { typedef _Unqualified __type; };

  template<typename _Unqualified>
    struct __cv_selector<_Unqualified, false, true>
    { typedef volatile _Unqualified __type; };

  template<typename _Unqualified>
    struct __cv_selector<_Unqualified, true, false>
    { typedef const _Unqualified __type; };

  template<typename _Unqualified>
    struct __cv_selector<_Unqualified, true, true>
    { typedef const volatile _Unqualified __type; };

  template<typename _Qualified, typename _Unqualified,
    bool _IsConst = is_const<_Qualified>::value,
    bool _IsVol = is_volatile<_Qualified>::value>
    class __match_cv_qualifiers
    {
      typedef __cv_selector<_Unqualified, _IsConst, _IsVol> __match;

    public:
      typedef typename __match::__type __type;
    };


  template<typename _Tp>
    struct __make_unsigned
    { typedef _Tp __type; };

  template<>
    struct __make_unsigned<char>
    { typedef unsigned char __type; };

  template<>
    struct __make_unsigned<signed char>
    { typedef unsigned char __type; };

  template<>
    struct __make_unsigned<short>
    { typedef unsigned short __type; };

  template<>
    struct __make_unsigned<int>
    { typedef unsigned int __type; };

  template<>
    struct __make_unsigned<long>
    { typedef unsigned long __type; };

  template<>
    struct __make_unsigned<long long>
    { typedef unsigned long long __type; };
# 1587 "/usr/include/c++/9/type_traits" 3
  template<typename _Tp,
    bool _IsInt = is_integral<_Tp>::value,
    bool _IsEnum = is_enum<_Tp>::value>
    class __make_unsigned_selector;

  template<typename _Tp>
    class __make_unsigned_selector<_Tp, true, false>
    {
      using __unsigned_type
 = typename __make_unsigned<typename remove_cv<_Tp>::type>::__type;

    public:
      using __type
 = typename __match_cv_qualifiers<_Tp, __unsigned_type>::__type;
    };

  class __make_unsigned_selector_base
  {
  protected:
    template<typename...> struct _List { };

    template<typename _Tp, typename... _Up>
      struct _List<_Tp, _Up...> : _List<_Up...>
      { static constexpr size_t __size = sizeof(_Tp); };

    template<size_t _Sz, typename _Tp, bool = (_Sz <= _Tp::__size)>
      struct __select;

    template<size_t _Sz, typename _Uint, typename... _UInts>
      struct __select<_Sz, _List<_Uint, _UInts...>, true>
      { using __type = _Uint; };

    template<size_t _Sz, typename _Uint, typename... _UInts>
      struct __select<_Sz, _List<_Uint, _UInts...>, false>
      : __select<_Sz, _List<_UInts...>>
      { };
  };


  template<typename _Tp>
    class __make_unsigned_selector<_Tp, false, true>
    : __make_unsigned_selector_base
    {

      using _UInts = _List<unsigned char, unsigned short, unsigned int,
      unsigned long, unsigned long long>;

      using __unsigned_type = typename __select<sizeof(_Tp), _UInts>::__type;

    public:
      using __type
 = typename __match_cv_qualifiers<_Tp, __unsigned_type>::__type;
    };






  template<>
    struct __make_unsigned<wchar_t>
    {
      using __type
 = typename __make_unsigned_selector<wchar_t, false, true>::__type;
    };
# 1663 "/usr/include/c++/9/type_traits" 3
  template<>
    struct __make_unsigned<char16_t>
    {
      using __type
 = typename __make_unsigned_selector<char16_t, false, true>::__type;
    };

  template<>
    struct __make_unsigned<char32_t>
    {
      using __type
 = typename __make_unsigned_selector<char32_t, false, true>::__type;
    };





  template<typename _Tp>
    struct make_unsigned
    { typedef typename __make_unsigned_selector<_Tp>::__type type; };


  template<>
    struct make_unsigned<bool>;



  template<typename _Tp>
    struct __make_signed
    { typedef _Tp __type; };

  template<>
    struct __make_signed<char>
    { typedef signed char __type; };

  template<>
    struct __make_signed<unsigned char>
    { typedef signed char __type; };

  template<>
    struct __make_signed<unsigned short>
    { typedef signed short __type; };

  template<>
    struct __make_signed<unsigned int>
    { typedef signed int __type; };

  template<>
    struct __make_signed<unsigned long>
    { typedef signed long __type; };

  template<>
    struct __make_signed<unsigned long long>
    { typedef signed long long __type; };
# 1741 "/usr/include/c++/9/type_traits" 3
  template<typename _Tp,
    bool _IsInt = is_integral<_Tp>::value,
    bool _IsEnum = is_enum<_Tp>::value>
    class __make_signed_selector;

  template<typename _Tp>
    class __make_signed_selector<_Tp, true, false>
    {
      using __signed_type
 = typename __make_signed<typename remove_cv<_Tp>::type>::__type;

    public:
      using __type
 = typename __match_cv_qualifiers<_Tp, __signed_type>::__type;
    };


  template<typename _Tp>
    class __make_signed_selector<_Tp, false, true>
    {
      typedef typename __make_unsigned_selector<_Tp>::__type __unsigned_type;

    public:
      typedef typename __make_signed_selector<__unsigned_type>::__type __type;
    };






  template<>
    struct __make_signed<wchar_t>
    {
      using __type
 = typename __make_signed_selector<wchar_t, false, true>::__type;
    };
# 1789 "/usr/include/c++/9/type_traits" 3
  template<>
    struct __make_signed<char16_t>
    {
      using __type
 = typename __make_signed_selector<char16_t, false, true>::__type;
    };

  template<>
    struct __make_signed<char32_t>
    {
      using __type
 = typename __make_signed_selector<char32_t, false, true>::__type;
    };





  template<typename _Tp>
    struct make_signed
    { typedef typename __make_signed_selector<_Tp>::__type type; };


  template<>
    struct make_signed<bool>;



  template<typename _Tp>
    using make_signed_t = typename make_signed<_Tp>::type;


  template<typename _Tp>
    using make_unsigned_t = typename make_unsigned<_Tp>::type;





  template<typename _Tp>
    struct remove_extent
    { typedef _Tp type; };

  template<typename _Tp, std::size_t _Size>
    struct remove_extent<_Tp[_Size]>
    { typedef _Tp type; };

  template<typename _Tp>
    struct remove_extent<_Tp[]>
    { typedef _Tp type; };


  template<typename _Tp>
    struct remove_all_extents
    { typedef _Tp type; };

  template<typename _Tp, std::size_t _Size>
    struct remove_all_extents<_Tp[_Size]>
    { typedef typename remove_all_extents<_Tp>::type type; };

  template<typename _Tp>
    struct remove_all_extents<_Tp[]>
    { typedef typename remove_all_extents<_Tp>::type type; };



  template<typename _Tp>
    using remove_extent_t = typename remove_extent<_Tp>::type;


  template<typename _Tp>
    using remove_all_extents_t = typename remove_all_extents<_Tp>::type;




  template<typename _Tp, typename>
    struct __remove_pointer_helper
    { typedef _Tp type; };

  template<typename _Tp, typename _Up>
    struct __remove_pointer_helper<_Tp, _Up*>
    { typedef _Up type; };


  template<typename _Tp>
    struct remove_pointer
    : public __remove_pointer_helper<_Tp, typename remove_cv<_Tp>::type>
    { };


  template<typename _Tp, bool = __or_<__is_referenceable<_Tp>,
          is_void<_Tp>>::value>
    struct __add_pointer_helper
    { typedef _Tp type; };

  template<typename _Tp>
    struct __add_pointer_helper<_Tp, true>
    { typedef typename remove_reference<_Tp>::type* type; };

  template<typename _Tp>
    struct add_pointer
    : public __add_pointer_helper<_Tp>
    { };



  template<typename _Tp>
    using remove_pointer_t = typename remove_pointer<_Tp>::type;


  template<typename _Tp>
    using add_pointer_t = typename add_pointer<_Tp>::type;


  template<std::size_t _Len>
    struct __aligned_storage_msa
    {
      union __type
      {
 unsigned char __data[_Len];
 struct __attribute__((__aligned__)) { } __align;
      };
    };
# 1924 "/usr/include/c++/9/type_traits" 3
  template<std::size_t _Len, std::size_t _Align =
    __alignof__(typename __aligned_storage_msa<_Len>::__type)>
    struct aligned_storage
    {
      union type
      {
 unsigned char __data[_Len];
 struct __attribute__((__aligned__((_Align)))) { } __align;
      };
    };

  template <typename... _Types>
    struct __strictest_alignment
    {
      static const size_t _S_alignment = 0;
      static const size_t _S_size = 0;
    };

  template <typename _Tp, typename... _Types>
    struct __strictest_alignment<_Tp, _Types...>
    {
      static const size_t _S_alignment =
        alignof(_Tp) > __strictest_alignment<_Types...>::_S_alignment
 ? alignof(_Tp) : __strictest_alignment<_Types...>::_S_alignment;
      static const size_t _S_size =
        sizeof(_Tp) > __strictest_alignment<_Types...>::_S_size
 ? sizeof(_Tp) : __strictest_alignment<_Types...>::_S_size;
    };
# 1963 "/usr/include/c++/9/type_traits" 3
  template <size_t _Len, typename... _Types>
    struct aligned_union
    {
    private:
      static_assert(sizeof...(_Types) != 0, "At least one type is required");

      using __strictest = __strictest_alignment<_Types...>;
      static const size_t _S_len = _Len > __strictest::_S_size
 ? _Len : __strictest::_S_size;
    public:

      static const size_t alignment_value = __strictest::_S_alignment;

      typedef typename aligned_storage<_S_len, alignment_value>::type type;
    };

  template <size_t _Len, typename... _Types>
    const size_t aligned_union<_Len, _Types...>::alignment_value;



  template<typename _Up,
    bool _IsArray = is_array<_Up>::value,
    bool _IsFunction = is_function<_Up>::value>
    struct __decay_selector;


  template<typename _Up>
    struct __decay_selector<_Up, false, false>
    { typedef typename remove_cv<_Up>::type __type; };

  template<typename _Up>
    struct __decay_selector<_Up, true, false>
    { typedef typename remove_extent<_Up>::type* __type; };

  template<typename _Up>
    struct __decay_selector<_Up, false, true>
    { typedef typename add_pointer<_Up>::type __type; };


  template<typename _Tp>
    class decay
    {
      typedef typename remove_reference<_Tp>::type __remove_type;

    public:
      typedef typename __decay_selector<__remove_type>::__type type;
    };

  template<typename _Tp>
    class reference_wrapper;


  template<typename _Tp>
    struct __strip_reference_wrapper
    {
      typedef _Tp __type;
    };

  template<typename _Tp>
    struct __strip_reference_wrapper<reference_wrapper<_Tp> >
    {
      typedef _Tp& __type;
    };

  template<typename _Tp>
    struct __decay_and_strip
    {
      typedef typename __strip_reference_wrapper<
 typename decay<_Tp>::type>::__type __type;
    };




  template<bool, typename _Tp = void>
    struct enable_if
    { };


  template<typename _Tp>
    struct enable_if<true, _Tp>
    { typedef _Tp type; };

  template<typename... _Cond>
    using _Require = typename enable_if<__and_<_Cond...>::value>::type;



  template<bool _Cond, typename _Iftrue, typename _Iffalse>
    struct conditional
    { typedef _Iftrue type; };


  template<typename _Iftrue, typename _Iffalse>
    struct conditional<false, _Iftrue, _Iffalse>
    { typedef _Iffalse type; };


  template<typename... _Tp>
    struct common_type;



  struct __do_common_type_impl
  {
    template<typename _Tp, typename _Up>
      static __success_type<typename decay<decltype
       (true ? std::declval<_Tp>()
        : std::declval<_Up>())>::type> _S_test(int);

    template<typename, typename>
      static __failure_type _S_test(...);
  };

  template<typename _Tp, typename _Up>
    struct __common_type_impl
    : private __do_common_type_impl
    {
      typedef decltype(_S_test<_Tp, _Up>(0)) type;
    };

  struct __do_member_type_wrapper
  {
    template<typename _Tp>
      static __success_type<typename _Tp::type> _S_test(int);

    template<typename>
      static __failure_type _S_test(...);
  };

  template<typename _Tp>
    struct __member_type_wrapper
    : private __do_member_type_wrapper
    {
      typedef decltype(_S_test<_Tp>(0)) type;
    };

  template<typename _CTp, typename... _Args>
    struct __expanded_common_type_wrapper
    {
      typedef common_type<typename _CTp::type, _Args...> type;
    };

  template<typename... _Args>
    struct __expanded_common_type_wrapper<__failure_type, _Args...>
    { typedef __failure_type type; };

  template<>
    struct common_type<>
    { };

  template<typename _Tp>
    struct common_type<_Tp>
    : common_type<_Tp, _Tp>
    { };

  template<typename _Tp, typename _Up>
    struct common_type<_Tp, _Up>
    : public __common_type_impl<_Tp, _Up>::type
    { };

  template<typename _Tp, typename _Up, typename... _Vp>
    struct common_type<_Tp, _Up, _Vp...>
    : public __expanded_common_type_wrapper<typename __member_type_wrapper<
               common_type<_Tp, _Up>>::type, _Vp...>::type
    { };

  template<typename _Tp, bool = is_enum<_Tp>::value>
    struct __underlying_type_impl
    {
      using type = __underlying_type(_Tp);
    };

  template<typename _Tp>
    struct __underlying_type_impl<_Tp, false>
    { };


  template<typename _Tp>
    struct underlying_type
    : public __underlying_type_impl<_Tp>
    { };

  template<typename _Tp>
    struct __declval_protector
    {
      static const bool __stop = false;
    };

  template<typename _Tp>
    auto declval() noexcept -> decltype(__declval<_Tp>(0))
    {
      static_assert(__declval_protector<_Tp>::__stop,
      "declval() must not be used!");
      return __declval<_Tp>(0);
    }


  template<typename _Tp>
    using __remove_cvref_t
     = typename remove_cv<typename remove_reference<_Tp>::type>::type;


  template<typename _Signature>
    class result_of;





  struct __invoke_memfun_ref { };
  struct __invoke_memfun_deref { };
  struct __invoke_memobj_ref { };
  struct __invoke_memobj_deref { };
  struct __invoke_other { };


  template<typename _Tp, typename _Tag>
    struct __result_of_success : __success_type<_Tp>
    { using __invoke_type = _Tag; };


  struct __result_of_memfun_ref_impl
  {
    template<typename _Fp, typename _Tp1, typename... _Args>
      static __result_of_success<decltype(
      (std::declval<_Tp1>().*std::declval<_Fp>())(std::declval<_Args>()...)
      ), __invoke_memfun_ref> _S_test(int);

    template<typename...>
      static __failure_type _S_test(...);
  };

  template<typename _MemPtr, typename _Arg, typename... _Args>
    struct __result_of_memfun_ref
    : private __result_of_memfun_ref_impl
    {
      typedef decltype(_S_test<_MemPtr, _Arg, _Args...>(0)) type;
    };


  struct __result_of_memfun_deref_impl
  {
    template<typename _Fp, typename _Tp1, typename... _Args>
      static __result_of_success<decltype(
      ((*std::declval<_Tp1>()).*std::declval<_Fp>())(std::declval<_Args>()...)
      ), __invoke_memfun_deref> _S_test(int);

    template<typename...>
      static __failure_type _S_test(...);
  };

  template<typename _MemPtr, typename _Arg, typename... _Args>
    struct __result_of_memfun_deref
    : private __result_of_memfun_deref_impl
    {
      typedef decltype(_S_test<_MemPtr, _Arg, _Args...>(0)) type;
    };


  struct __result_of_memobj_ref_impl
  {
    template<typename _Fp, typename _Tp1>
      static __result_of_success<decltype(
      std::declval<_Tp1>().*std::declval<_Fp>()
      ), __invoke_memobj_ref> _S_test(int);

    template<typename, typename>
      static __failure_type _S_test(...);
  };

  template<typename _MemPtr, typename _Arg>
    struct __result_of_memobj_ref
    : private __result_of_memobj_ref_impl
    {
      typedef decltype(_S_test<_MemPtr, _Arg>(0)) type;
    };


  struct __result_of_memobj_deref_impl
  {
    template<typename _Fp, typename _Tp1>
      static __result_of_success<decltype(
      (*std::declval<_Tp1>()).*std::declval<_Fp>()
      ), __invoke_memobj_deref> _S_test(int);

    template<typename, typename>
      static __failure_type _S_test(...);
  };

  template<typename _MemPtr, typename _Arg>
    struct __result_of_memobj_deref
    : private __result_of_memobj_deref_impl
    {
      typedef decltype(_S_test<_MemPtr, _Arg>(0)) type;
    };

  template<typename _MemPtr, typename _Arg>
    struct __result_of_memobj;

  template<typename _Res, typename _Class, typename _Arg>
    struct __result_of_memobj<_Res _Class::*, _Arg>
    {
      typedef __remove_cvref_t<_Arg> _Argval;
      typedef _Res _Class::* _MemPtr;
      typedef typename conditional<__or_<is_same<_Argval, _Class>,
        is_base_of<_Class, _Argval>>::value,
        __result_of_memobj_ref<_MemPtr, _Arg>,
        __result_of_memobj_deref<_MemPtr, _Arg>
      >::type::type type;
    };

  template<typename _MemPtr, typename _Arg, typename... _Args>
    struct __result_of_memfun;

  template<typename _Res, typename _Class, typename _Arg, typename... _Args>
    struct __result_of_memfun<_Res _Class::*, _Arg, _Args...>
    {
      typedef typename remove_reference<_Arg>::type _Argval;
      typedef _Res _Class::* _MemPtr;
      typedef typename conditional<is_base_of<_Class, _Argval>::value,
        __result_of_memfun_ref<_MemPtr, _Arg, _Args...>,
        __result_of_memfun_deref<_MemPtr, _Arg, _Args...>
      >::type::type type;
    };






  template<typename _Tp, typename _Up = __remove_cvref_t<_Tp>>
    struct __inv_unwrap
    {
      using type = _Tp;
    };

  template<typename _Tp, typename _Up>
    struct __inv_unwrap<_Tp, reference_wrapper<_Up>>
    {
      using type = _Up&;
    };

  template<bool, bool, typename _Functor, typename... _ArgTypes>
    struct __result_of_impl
    {
      typedef __failure_type type;
    };

  template<typename _MemPtr, typename _Arg>
    struct __result_of_impl<true, false, _MemPtr, _Arg>
    : public __result_of_memobj<typename decay<_MemPtr>::type,
    typename __inv_unwrap<_Arg>::type>
    { };

  template<typename _MemPtr, typename _Arg, typename... _Args>
    struct __result_of_impl<false, true, _MemPtr, _Arg, _Args...>
    : public __result_of_memfun<typename decay<_MemPtr>::type,
    typename __inv_unwrap<_Arg>::type, _Args...>
    { };


  struct __result_of_other_impl
  {
    template<typename _Fn, typename... _Args>
      static __result_of_success<decltype(
      std::declval<_Fn>()(std::declval<_Args>()...)
      ), __invoke_other> _S_test(int);

    template<typename...>
      static __failure_type _S_test(...);
  };

  template<typename _Functor, typename... _ArgTypes>
    struct __result_of_impl<false, false, _Functor, _ArgTypes...>
    : private __result_of_other_impl
    {
      typedef decltype(_S_test<_Functor, _ArgTypes...>(0)) type;
    };


  template<typename _Functor, typename... _ArgTypes>
    struct __invoke_result
    : public __result_of_impl<
        is_member_object_pointer<
          typename remove_reference<_Functor>::type
        >::value,
        is_member_function_pointer<
          typename remove_reference<_Functor>::type
        >::value,
 _Functor, _ArgTypes...
      >::type
    { };

  template<typename _Functor, typename... _ArgTypes>
    struct result_of<_Functor(_ArgTypes...)>
    : public __invoke_result<_Functor, _ArgTypes...>
    { };



  template<size_t _Len, size_t _Align =
     __alignof__(typename __aligned_storage_msa<_Len>::__type)>
    using aligned_storage_t = typename aligned_storage<_Len, _Align>::type;

  template <size_t _Len, typename... _Types>
    using aligned_union_t = typename aligned_union<_Len, _Types...>::type;


  template<typename _Tp>
    using decay_t = typename decay<_Tp>::type;


  template<bool _Cond, typename _Tp = void>
    using enable_if_t = typename enable_if<_Cond, _Tp>::type;


  template<bool _Cond, typename _Iftrue, typename _Iffalse>
    using conditional_t = typename conditional<_Cond, _Iftrue, _Iffalse>::type;


  template<typename... _Tp>
    using common_type_t = typename common_type<_Tp...>::type;


  template<typename _Tp>
    using underlying_type_t = typename underlying_type<_Tp>::type;


  template<typename _Tp>
    using result_of_t = typename result_of<_Tp>::type;



  template<bool _Cond, typename _Tp = void>
    using __enable_if_t = typename enable_if<_Cond, _Tp>::type;


  template<typename...> using __void_t = void;




  template<typename...> using void_t = void;



  template<typename _Default, typename _AlwaysVoid,
    template<typename...> class _Op, typename... _Args>
    struct __detector
    {
      using value_t = false_type;
      using type = _Default;
    };


  template<typename _Default, template<typename...> class _Op,
     typename... _Args>
    struct __detector<_Default, __void_t<_Op<_Args...>>, _Op, _Args...>
    {
      using value_t = true_type;
      using type = _Op<_Args...>;
    };


  template<typename _Default, template<typename...> class _Op,
    typename... _Args>
    using __detected_or = __detector<_Default, void, _Op, _Args...>;


  template<typename _Default, template<typename...> class _Op,
    typename... _Args>
    using __detected_or_t
      = typename __detected_or<_Default, _Op, _Args...>::type;
# 2455 "/usr/include/c++/9/type_traits" 3
  template <typename _Tp>
    struct __is_swappable;

  template <typename _Tp>
    struct __is_nothrow_swappable;

  template<typename... _Elements>
    class tuple;

  template<typename>
    struct __is_tuple_like_impl : false_type
    { };

  template<typename... _Tps>
    struct __is_tuple_like_impl<tuple<_Tps...>> : true_type
    { };


  template<typename _Tp>
    struct __is_tuple_like
    : public __is_tuple_like_impl<__remove_cvref_t<_Tp>>::type
    { };

  template<typename _Tp>
    inline
    typename enable_if<__and_<__not_<__is_tuple_like<_Tp>>,
         is_move_constructible<_Tp>,
         is_move_assignable<_Tp>>::value>::type
    swap(_Tp&, _Tp&)
    noexcept(__and_<is_nothrow_move_constructible<_Tp>,
             is_nothrow_move_assignable<_Tp>>::value);

  template<typename _Tp, size_t _Nm>
    inline
    typename enable_if<__is_swappable<_Tp>::value>::type
    swap(_Tp (&__a)[_Nm], _Tp (&__b)[_Nm])
    noexcept(__is_nothrow_swappable<_Tp>::value);

  namespace __swappable_details {
    using std::swap;

    struct __do_is_swappable_impl
    {
      template<typename _Tp, typename
               = decltype(swap(std::declval<_Tp&>(), std::declval<_Tp&>()))>
        static true_type __test(int);

      template<typename>
        static false_type __test(...);
    };

    struct __do_is_nothrow_swappable_impl
    {
      template<typename _Tp>
        static __bool_constant<
          noexcept(swap(std::declval<_Tp&>(), std::declval<_Tp&>()))
        > __test(int);

      template<typename>
        static false_type __test(...);
    };

  }

  template<typename _Tp>
    struct __is_swappable_impl
    : public __swappable_details::__do_is_swappable_impl
    {
      typedef decltype(__test<_Tp>(0)) type;
    };

  template<typename _Tp>
    struct __is_nothrow_swappable_impl
    : public __swappable_details::__do_is_nothrow_swappable_impl
    {
      typedef decltype(__test<_Tp>(0)) type;
    };

  template<typename _Tp>
    struct __is_swappable
    : public __is_swappable_impl<_Tp>::type
    { };

  template<typename _Tp>
    struct __is_nothrow_swappable
    : public __is_nothrow_swappable_impl<_Tp>::type
    { };






  template<typename _Tp>
    struct is_swappable
    : public __is_swappable_impl<_Tp>::type
    { };


  template<typename _Tp>
    struct is_nothrow_swappable
    : public __is_nothrow_swappable_impl<_Tp>::type
    { };



  template<typename _Tp>
    inline constexpr bool is_swappable_v =
      is_swappable<_Tp>::value;


  template<typename _Tp>
    inline constexpr bool is_nothrow_swappable_v =
      is_nothrow_swappable<_Tp>::value;


  namespace __swappable_with_details {
    using std::swap;

    struct __do_is_swappable_with_impl
    {
      template<typename _Tp, typename _Up, typename
               = decltype(swap(std::declval<_Tp>(), std::declval<_Up>())),
               typename
               = decltype(swap(std::declval<_Up>(), std::declval<_Tp>()))>
        static true_type __test(int);

      template<typename, typename>
        static false_type __test(...);
    };

    struct __do_is_nothrow_swappable_with_impl
    {
      template<typename _Tp, typename _Up>
        static __bool_constant<
          noexcept(swap(std::declval<_Tp>(), std::declval<_Up>()))
          &&
          noexcept(swap(std::declval<_Up>(), std::declval<_Tp>()))
        > __test(int);

      template<typename, typename>
        static false_type __test(...);
    };

  }

  template<typename _Tp, typename _Up>
    struct __is_swappable_with_impl
    : public __swappable_with_details::__do_is_swappable_with_impl
    {
      typedef decltype(__test<_Tp, _Up>(0)) type;
    };


  template<typename _Tp>
    struct __is_swappable_with_impl<_Tp&, _Tp&>
    : public __swappable_details::__do_is_swappable_impl
    {
      typedef decltype(__test<_Tp&>(0)) type;
    };

  template<typename _Tp, typename _Up>
    struct __is_nothrow_swappable_with_impl
    : public __swappable_with_details::__do_is_nothrow_swappable_with_impl
    {
      typedef decltype(__test<_Tp, _Up>(0)) type;
    };


  template<typename _Tp>
    struct __is_nothrow_swappable_with_impl<_Tp&, _Tp&>
    : public __swappable_details::__do_is_nothrow_swappable_impl
    {
      typedef decltype(__test<_Tp&>(0)) type;
    };


  template<typename _Tp, typename _Up>
    struct is_swappable_with
    : public __is_swappable_with_impl<_Tp, _Up>::type
    { };


  template<typename _Tp, typename _Up>
    struct is_nothrow_swappable_with
    : public __is_nothrow_swappable_with_impl<_Tp, _Up>::type
    { };



  template<typename _Tp, typename _Up>
    inline constexpr bool is_swappable_with_v =
      is_swappable_with<_Tp, _Up>::value;


  template<typename _Tp, typename _Up>
    inline constexpr bool is_nothrow_swappable_with_v =
      is_nothrow_swappable_with<_Tp, _Up>::value;







  template<typename _Result, typename _Ret,
    bool = is_void<_Ret>::value, typename = void>
    struct __is_invocable_impl : false_type { };


  template<typename _Result, typename _Ret>
    struct __is_invocable_impl<_Result, _Ret,
                                true,
          __void_t<typename _Result::type>>
    : true_type
    { };

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wctor-dtor-privacy"

  template<typename _Result, typename _Ret>
    struct __is_invocable_impl<_Result, _Ret,
                                false,
          __void_t<typename _Result::type>>
    {
    private:


      static typename _Result::type _S_get();

      template<typename _Tp>
 static void _S_conv(_Tp);


      template<typename _Tp, typename = decltype(_S_conv<_Tp>(_S_get()))>
 static true_type
 _S_test(int);

      template<typename _Tp>
 static false_type
 _S_test(...);

    public:
      using type = decltype(_S_test<_Ret>(1));
    };
#pragma GCC diagnostic pop

  template<typename _Fn, typename... _ArgTypes>
    struct __is_invocable
    : __is_invocable_impl<__invoke_result<_Fn, _ArgTypes...>, void>::type
    { };

  template<typename _Fn, typename _Tp, typename... _Args>
    constexpr bool __call_is_nt(__invoke_memfun_ref)
    {
      using _Up = typename __inv_unwrap<_Tp>::type;
      return noexcept((std::declval<_Up>().*std::declval<_Fn>())(
     std::declval<_Args>()...));
    }

  template<typename _Fn, typename _Tp, typename... _Args>
    constexpr bool __call_is_nt(__invoke_memfun_deref)
    {
      return noexcept(((*std::declval<_Tp>()).*std::declval<_Fn>())(
     std::declval<_Args>()...));
    }

  template<typename _Fn, typename _Tp>
    constexpr bool __call_is_nt(__invoke_memobj_ref)
    {
      using _Up = typename __inv_unwrap<_Tp>::type;
      return noexcept(std::declval<_Up>().*std::declval<_Fn>());
    }

  template<typename _Fn, typename _Tp>
    constexpr bool __call_is_nt(__invoke_memobj_deref)
    {
      return noexcept((*std::declval<_Tp>()).*std::declval<_Fn>());
    }

  template<typename _Fn, typename... _Args>
    constexpr bool __call_is_nt(__invoke_other)
    {
      return noexcept(std::declval<_Fn>()(std::declval<_Args>()...));
    }

  template<typename _Result, typename _Fn, typename... _Args>
    struct __call_is_nothrow
    : __bool_constant<
 std::__call_is_nt<_Fn, _Args...>(typename _Result::__invoke_type{})
      >
    { };

  template<typename _Fn, typename... _Args>
    using __call_is_nothrow_
      = __call_is_nothrow<__invoke_result<_Fn, _Args...>, _Fn, _Args...>;


  template<typename _Fn, typename... _Args>
    struct __is_nothrow_invocable
    : __and_<__is_invocable<_Fn, _Args...>,
             __call_is_nothrow_<_Fn, _Args...>>::type
    { };

  struct __nonesuch {
    __nonesuch() = delete;
    ~__nonesuch() = delete;
    __nonesuch(__nonesuch const&) = delete;
    void operator=(__nonesuch const&) = delete;
  };





  template<typename _Functor, typename... _ArgTypes>
    struct invoke_result
    : public __invoke_result<_Functor, _ArgTypes...>
    { };


  template<typename _Fn, typename... _Args>
    using invoke_result_t = typename invoke_result<_Fn, _Args...>::type;


  template<typename _Fn, typename... _ArgTypes>
    struct is_invocable
    : __is_invocable_impl<__invoke_result<_Fn, _ArgTypes...>, void>::type
    { };


  template<typename _Ret, typename _Fn, typename... _ArgTypes>
    struct is_invocable_r
    : __is_invocable_impl<__invoke_result<_Fn, _ArgTypes...>, _Ret>::type
    { };


  template<typename _Fn, typename... _ArgTypes>
    struct is_nothrow_invocable
    : __and_<__is_invocable_impl<__invoke_result<_Fn, _ArgTypes...>, void>,
             __call_is_nothrow_<_Fn, _ArgTypes...>>::type
    { };

  template<typename _Result, typename _Ret, typename = void>
    struct __is_nt_invocable_impl : false_type { };

  template<typename _Result, typename _Ret>
    struct __is_nt_invocable_impl<_Result, _Ret,
      __void_t<typename _Result::type>>
    : __or_<is_void<_Ret>,
     __and_<is_convertible<typename _Result::type, _Ret>,
     is_nothrow_constructible<_Ret, typename _Result::type>>>
    { };


  template<typename _Ret, typename _Fn, typename... _ArgTypes>
    struct is_nothrow_invocable_r
    : __and_<__is_nt_invocable_impl<__invoke_result<_Fn, _ArgTypes...>, _Ret>,
             __call_is_nothrow_<_Fn, _ArgTypes...>>::type
    { };


  template<typename _Fn, typename... _Args>
    inline constexpr bool is_invocable_v = is_invocable<_Fn, _Args...>::value;


  template<typename _Fn, typename... _Args>
    inline constexpr bool is_nothrow_invocable_v
      = is_nothrow_invocable<_Fn, _Args...>::value;


  template<typename _Fn, typename... _Args>
    inline constexpr bool is_invocable_r_v
      = is_invocable_r<_Fn, _Args...>::value;


  template<typename _Fn, typename... _Args>
    inline constexpr bool is_nothrow_invocable_r_v
      = is_nothrow_invocable_r<_Fn, _Args...>::value;




template <typename _Tp>
  inline constexpr bool is_void_v = is_void<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_null_pointer_v = is_null_pointer<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_integral_v = is_integral<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_floating_point_v = is_floating_point<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_array_v = is_array<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_pointer_v = is_pointer<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_lvalue_reference_v =
    is_lvalue_reference<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_rvalue_reference_v =
    is_rvalue_reference<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_member_object_pointer_v =
    is_member_object_pointer<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_member_function_pointer_v =
    is_member_function_pointer<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_enum_v = is_enum<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_union_v = is_union<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_class_v = is_class<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_function_v = is_function<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_reference_v = is_reference<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_arithmetic_v = is_arithmetic<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_fundamental_v = is_fundamental<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_object_v = is_object<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_scalar_v = is_scalar<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_compound_v = is_compound<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_member_pointer_v = is_member_pointer<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_const_v = is_const<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_volatile_v = is_volatile<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_trivial_v = is_trivial<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_trivially_copyable_v =
    is_trivially_copyable<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_standard_layout_v = is_standard_layout<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_pod_v = is_pod<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_literal_type_v = is_literal_type<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_empty_v = is_empty<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_polymorphic_v = is_polymorphic<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_abstract_v = is_abstract<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_final_v = is_final<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_signed_v = is_signed<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_unsigned_v = is_unsigned<_Tp>::value;
template <typename _Tp, typename... _Args>
  inline constexpr bool is_constructible_v =
    is_constructible<_Tp, _Args...>::value;
template <typename _Tp>
  inline constexpr bool is_default_constructible_v =
    is_default_constructible<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_copy_constructible_v =
    is_copy_constructible<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_move_constructible_v =
    is_move_constructible<_Tp>::value;
template <typename _Tp, typename _Up>
  inline constexpr bool is_assignable_v = is_assignable<_Tp, _Up>::value;
template <typename _Tp>
  inline constexpr bool is_copy_assignable_v = is_copy_assignable<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_move_assignable_v = is_move_assignable<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_destructible_v = is_destructible<_Tp>::value;
template <typename _Tp, typename... _Args>
  inline constexpr bool is_trivially_constructible_v =
    is_trivially_constructible<_Tp, _Args...>::value;
template <typename _Tp>
  inline constexpr bool is_trivially_default_constructible_v =
    is_trivially_default_constructible<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_trivially_copy_constructible_v =
    is_trivially_copy_constructible<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_trivially_move_constructible_v =
    is_trivially_move_constructible<_Tp>::value;
template <typename _Tp, typename _Up>
  inline constexpr bool is_trivially_assignable_v =
    is_trivially_assignable<_Tp, _Up>::value;
template <typename _Tp>
  inline constexpr bool is_trivially_copy_assignable_v =
    is_trivially_copy_assignable<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_trivially_move_assignable_v =
    is_trivially_move_assignable<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_trivially_destructible_v =
    is_trivially_destructible<_Tp>::value;
template <typename _Tp, typename... _Args>
  inline constexpr bool is_nothrow_constructible_v =
    is_nothrow_constructible<_Tp, _Args...>::value;
template <typename _Tp>
  inline constexpr bool is_nothrow_default_constructible_v =
    is_nothrow_default_constructible<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_nothrow_copy_constructible_v =
    is_nothrow_copy_constructible<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_nothrow_move_constructible_v =
    is_nothrow_move_constructible<_Tp>::value;
template <typename _Tp, typename _Up>
  inline constexpr bool is_nothrow_assignable_v =
    is_nothrow_assignable<_Tp, _Up>::value;
template <typename _Tp>
  inline constexpr bool is_nothrow_copy_assignable_v =
    is_nothrow_copy_assignable<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_nothrow_move_assignable_v =
    is_nothrow_move_assignable<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_nothrow_destructible_v =
    is_nothrow_destructible<_Tp>::value;
template <typename _Tp>
  inline constexpr bool has_virtual_destructor_v =
    has_virtual_destructor<_Tp>::value;
template <typename _Tp>
  inline constexpr size_t alignment_of_v = alignment_of<_Tp>::value;
template <typename _Tp>
  inline constexpr size_t rank_v = rank<_Tp>::value;
template <typename _Tp, unsigned _Idx = 0>
  inline constexpr size_t extent_v = extent<_Tp, _Idx>::value;
template <typename _Tp, typename _Up>
  inline constexpr bool is_same_v = is_same<_Tp, _Up>::value;
template <typename _Base, typename _Derived>
  inline constexpr bool is_base_of_v = is_base_of<_Base, _Derived>::value;
template <typename _From, typename _To>
  inline constexpr bool is_convertible_v = is_convertible<_From, _To>::value;




  template<typename _Tp>
    struct has_unique_object_representations
    : bool_constant<__has_unique_object_representations(
      remove_cv_t<remove_all_extents_t<_Tp>>
      )>
    { };

  template<typename _Tp>
    inline constexpr bool has_unique_object_representations_v
      = has_unique_object_representations<_Tp>::value;





  template<typename _Tp>
    struct is_aggregate
    : bool_constant<__is_aggregate(remove_cv_t<_Tp>)> { };


  template<typename _Tp>
    inline constexpr bool is_aggregate_v = is_aggregate<_Tp>::value;
# 3096 "/usr/include/c++/9/type_traits" 3

}
# 56 "/usr/include/c++/9/bits/move.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{

# 72 "/usr/include/c++/9/bits/move.h" 3
  template<typename _Tp>
    constexpr _Tp&&
    forward(typename std::remove_reference<_Tp>::type& __t) noexcept
    { return static_cast<_Tp&&>(__t); }







  template<typename _Tp>
    constexpr _Tp&&
    forward(typename std::remove_reference<_Tp>::type&& __t) noexcept
    {
      static_assert(!std::is_lvalue_reference<_Tp>::value, "template argument"
      " substituting _Tp is an lvalue reference type");
      return static_cast<_Tp&&>(__t);
    }






  template<typename _Tp>
    constexpr typename std::remove_reference<_Tp>::type&&
    move(_Tp&& __t) noexcept
    { return static_cast<typename std::remove_reference<_Tp>::type&&>(__t); }


  template<typename _Tp>
    struct __move_if_noexcept_cond
    : public __and_<__not_<is_nothrow_move_constructible<_Tp>>,
                    is_copy_constructible<_Tp>>::type { };
# 116 "/usr/include/c++/9/bits/move.h" 3
  template<typename _Tp>
    constexpr typename
    conditional<__move_if_noexcept_cond<_Tp>::value, const _Tp&, _Tp&&>::type
    move_if_noexcept(_Tp& __x) noexcept
    { return std::move(__x); }
# 136 "/usr/include/c++/9/bits/move.h" 3
  template<typename _Tp>
    inline constexpr _Tp*
    addressof(_Tp& __r) noexcept
    { return std::__addressof(__r); }



  template<typename _Tp>
    const _Tp* addressof(const _Tp&&) = delete;


  template <typename _Tp, typename _Up = _Tp>
    inline _Tp
    __exchange(_Tp& __obj, _Up&& __new_val)
    {
      _Tp __old_val = std::move(__obj);
      __obj = std::forward<_Up>(__new_val);
      return __old_val;
    }
# 176 "/usr/include/c++/9/bits/move.h" 3
  template<typename _Tp>
    inline

    typename enable_if<__and_<__not_<__is_tuple_like<_Tp>>,
         is_move_constructible<_Tp>,
         is_move_assignable<_Tp>>::value>::type
    swap(_Tp& __a, _Tp& __b)
    noexcept(__and_<is_nothrow_move_constructible<_Tp>,
             is_nothrow_move_assignable<_Tp>>::value)




    {

     

      _Tp __tmp = std::move(__a);
      __a = std::move(__b);
      __b = std::move(__tmp);
    }




  template<typename _Tp, size_t _Nm>
    inline

    typename enable_if<__is_swappable<_Tp>::value>::type
    swap(_Tp (&__a)[_Nm], _Tp (&__b)[_Nm])
    noexcept(__is_nothrow_swappable<_Tp>::value)




    {
      for (size_t __n = 0; __n < _Nm; ++__n)
 swap(__a[__n], __b[__n]);
    }



}
# 60 "/usr/include/c++/9/bits/stl_pair.h" 2 3





namespace std __attribute__ ((__visibility__ ("default")))
{

# 76 "/usr/include/c++/9/bits/stl_pair.h" 3
  struct piecewise_construct_t { explicit piecewise_construct_t() = default; };


  inline constexpr piecewise_construct_t piecewise_construct =
    piecewise_construct_t();


  template<typename...>
    class tuple;

  template<std::size_t...>
    struct _Index_tuple;






  template <bool, typename _T1, typename _T2>
    struct _PCC
    {
      template <typename _U1, typename _U2>
      static constexpr bool _ConstructiblePair()
      {
 return __and_<is_constructible<_T1, const _U1&>,
        is_constructible<_T2, const _U2&>>::value;
      }

      template <typename _U1, typename _U2>
      static constexpr bool _ImplicitlyConvertiblePair()
      {
 return __and_<is_convertible<const _U1&, _T1>,
        is_convertible<const _U2&, _T2>>::value;
      }

      template <typename _U1, typename _U2>
      static constexpr bool _MoveConstructiblePair()
      {
 return __and_<is_constructible<_T1, _U1&&>,
        is_constructible<_T2, _U2&&>>::value;
      }

      template <typename _U1, typename _U2>
      static constexpr bool _ImplicitlyMoveConvertiblePair()
      {
 return __and_<is_convertible<_U1&&, _T1>,
        is_convertible<_U2&&, _T2>>::value;
      }

      template <bool __implicit, typename _U1, typename _U2>
      static constexpr bool _CopyMovePair()
      {
 using __do_converts = __and_<is_convertible<const _U1&, _T1>,
      is_convertible<_U2&&, _T2>>;
 using __converts = typename conditional<__implicit,
           __do_converts,
           __not_<__do_converts>>::type;
 return __and_<is_constructible<_T1, const _U1&>,
        is_constructible<_T2, _U2&&>,
        __converts
        >::value;
      }

      template <bool __implicit, typename _U1, typename _U2>
      static constexpr bool _MoveCopyPair()
      {
 using __do_converts = __and_<is_convertible<_U1&&, _T1>,
      is_convertible<const _U2&, _T2>>;
 using __converts = typename conditional<__implicit,
           __do_converts,
           __not_<__do_converts>>::type;
 return __and_<is_constructible<_T1, _U1&&>,
        is_constructible<_T2, const _U2&&>,
        __converts
        >::value;
      }
  };

  template <typename _T1, typename _T2>
    struct _PCC<false, _T1, _T2>
    {
      template <typename _U1, typename _U2>
      static constexpr bool _ConstructiblePair()
      {
 return false;
      }

      template <typename _U1, typename _U2>
      static constexpr bool _ImplicitlyConvertiblePair()
      {
 return false;
      }

      template <typename _U1, typename _U2>
      static constexpr bool _MoveConstructiblePair()
      {
 return false;
      }

      template <typename _U1, typename _U2>
      static constexpr bool _ImplicitlyMoveConvertiblePair()
      {
 return false;
      }
  };




  struct __nonesuch_no_braces : std::__nonesuch {
    explicit __nonesuch_no_braces(const __nonesuch&) = delete;
  };


  template<typename _U1, typename _U2> class __pair_base
  {

    template<typename _T1, typename _T2> friend struct pair;
    __pair_base() = default;
    ~__pair_base() = default;
    __pair_base(const __pair_base&) = default;
    __pair_base& operator=(const __pair_base&) = delete;

  };







  template<typename _T1, typename _T2>
    struct pair
    : private __pair_base<_T1, _T2>
    {
      typedef _T1 first_type;
      typedef _T2 second_type;

      _T1 first;
      _T2 second;






      template <typename _U1 = _T1,
                typename _U2 = _T2,
                typename enable_if<__and_<
                                     __is_implicitly_default_constructible<_U1>,
                                     __is_implicitly_default_constructible<_U2>>
                                   ::value, bool>::type = true>

      constexpr pair()
      : first(), second() { }


      template <typename _U1 = _T1,
                typename _U2 = _T2,
                typename enable_if<__and_<
                       is_default_constructible<_U1>,
                       is_default_constructible<_U2>,
                       __not_<
                         __and_<__is_implicitly_default_constructible<_U1>,
                                __is_implicitly_default_constructible<_U2>>>>
                                   ::value, bool>::type = false>
      explicit constexpr pair()
      : first(), second() { }
# 252 "/usr/include/c++/9/bits/stl_pair.h" 3
      using _PCCP = _PCC<true, _T1, _T2>;

      template<typename _U1 = _T1, typename _U2=_T2, typename
        enable_if<_PCCP::template
      _ConstructiblePair<_U1, _U2>()
                  && _PCCP::template
      _ImplicitlyConvertiblePair<_U1, _U2>(),
                         bool>::type=true>
      constexpr pair(const _T1& __a, const _T2& __b)
      : first(__a), second(__b) { }

       template<typename _U1 = _T1, typename _U2=_T2, typename
  enable_if<_PCCP::template
       _ConstructiblePair<_U1, _U2>()
                   && !_PCCP::template
       _ImplicitlyConvertiblePair<_U1, _U2>(),
                         bool>::type=false>
      explicit constexpr pair(const _T1& __a, const _T2& __b)
      : first(__a), second(__b) { }
# 280 "/usr/include/c++/9/bits/stl_pair.h" 3
      template <typename _U1, typename _U2>
        using _PCCFP = _PCC<!is_same<_T1, _U1>::value
       || !is_same<_T2, _U2>::value,
       _T1, _T2>;

      template<typename _U1, typename _U2, typename
        enable_if<_PCCFP<_U1, _U2>::template
      _ConstructiblePair<_U1, _U2>()
                  && _PCCFP<_U1, _U2>::template
      _ImplicitlyConvertiblePair<_U1, _U2>(),
     bool>::type=true>
        constexpr pair(const pair<_U1, _U2>& __p)
        : first(__p.first), second(__p.second) { }

      template<typename _U1, typename _U2, typename
        enable_if<_PCCFP<_U1, _U2>::template
      _ConstructiblePair<_U1, _U2>()
    && !_PCCFP<_U1, _U2>::template
      _ImplicitlyConvertiblePair<_U1, _U2>(),
                         bool>::type=false>
 explicit constexpr pair(const pair<_U1, _U2>& __p)
 : first(__p.first), second(__p.second) { }

      constexpr pair(const pair&) = default;
      constexpr pair(pair&&) = default;


      template<typename _U1, typename
        enable_if<_PCCP::template
      _MoveCopyPair<true, _U1, _T2>(),
                         bool>::type=true>
       constexpr pair(_U1&& __x, const _T2& __y)
       : first(std::forward<_U1>(__x)), second(__y) { }

      template<typename _U1, typename
        enable_if<_PCCP::template
      _MoveCopyPair<false, _U1, _T2>(),
                         bool>::type=false>
       explicit constexpr pair(_U1&& __x, const _T2& __y)
       : first(std::forward<_U1>(__x)), second(__y) { }

      template<typename _U2, typename
        enable_if<_PCCP::template
      _CopyMovePair<true, _T1, _U2>(),
                         bool>::type=true>
       constexpr pair(const _T1& __x, _U2&& __y)
       : first(__x), second(std::forward<_U2>(__y)) { }

      template<typename _U2, typename
        enable_if<_PCCP::template
      _CopyMovePair<false, _T1, _U2>(),
                         bool>::type=false>
       explicit pair(const _T1& __x, _U2&& __y)
       : first(__x), second(std::forward<_U2>(__y)) { }

      template<typename _U1, typename _U2, typename
        enable_if<_PCCP::template
      _MoveConstructiblePair<_U1, _U2>()
     && _PCCP::template
      _ImplicitlyMoveConvertiblePair<_U1, _U2>(),
                         bool>::type=true>
 constexpr pair(_U1&& __x, _U2&& __y)
 : first(std::forward<_U1>(__x)), second(std::forward<_U2>(__y)) { }

      template<typename _U1, typename _U2, typename
        enable_if<_PCCP::template
      _MoveConstructiblePair<_U1, _U2>()
     && !_PCCP::template
      _ImplicitlyMoveConvertiblePair<_U1, _U2>(),
                         bool>::type=false>
 explicit constexpr pair(_U1&& __x, _U2&& __y)
 : first(std::forward<_U1>(__x)), second(std::forward<_U2>(__y)) { }


      template<typename _U1, typename _U2, typename
        enable_if<_PCCFP<_U1, _U2>::template
      _MoveConstructiblePair<_U1, _U2>()
     && _PCCFP<_U1, _U2>::template
      _ImplicitlyMoveConvertiblePair<_U1, _U2>(),
                         bool>::type=true>
 constexpr pair(pair<_U1, _U2>&& __p)
 : first(std::forward<_U1>(__p.first)),
   second(std::forward<_U2>(__p.second)) { }

      template<typename _U1, typename _U2, typename
        enable_if<_PCCFP<_U1, _U2>::template
      _MoveConstructiblePair<_U1, _U2>()
     && !_PCCFP<_U1, _U2>::template
      _ImplicitlyMoveConvertiblePair<_U1, _U2>(),
                         bool>::type=false>
 explicit constexpr pair(pair<_U1, _U2>&& __p)
 : first(std::forward<_U1>(__p.first)),
   second(std::forward<_U2>(__p.second)) { }

      template<typename... _Args1, typename... _Args2>
        pair(piecewise_construct_t, tuple<_Args1...>, tuple<_Args2...>);

      pair&
      operator=(typename conditional<
  __and_<is_copy_assignable<_T1>,
         is_copy_assignable<_T2>>::value,
  const pair&, const __nonesuch_no_braces&>::type __p)
      {
 first = __p.first;
 second = __p.second;
 return *this;
      }

      pair&
      operator=(typename conditional<
  __and_<is_move_assignable<_T1>,
         is_move_assignable<_T2>>::value,
  pair&&, __nonesuch_no_braces&&>::type __p)
      noexcept(__and_<is_nothrow_move_assignable<_T1>,
        is_nothrow_move_assignable<_T2>>::value)
      {
 first = std::forward<first_type>(__p.first);
 second = std::forward<second_type>(__p.second);
 return *this;
      }

      template<typename _U1, typename _U2>
      typename enable_if<__and_<is_assignable<_T1&, const _U1&>,
    is_assignable<_T2&, const _U2&>>::value,
    pair&>::type
 operator=(const pair<_U1, _U2>& __p)
 {
   first = __p.first;
   second = __p.second;
   return *this;
 }

      template<typename _U1, typename _U2>
      typename enable_if<__and_<is_assignable<_T1&, _U1&&>,
    is_assignable<_T2&, _U2&&>>::value,
    pair&>::type
 operator=(pair<_U1, _U2>&& __p)
 {
   first = std::forward<_U1>(__p.first);
   second = std::forward<_U2>(__p.second);
   return *this;
 }

      void
      swap(pair& __p)
      noexcept(__and_<__is_nothrow_swappable<_T1>,
                      __is_nothrow_swappable<_T2>>::value)
      {
 using std::swap;
 swap(first, __p.first);
 swap(second, __p.second);
      }

    private:
      template<typename... _Args1, std::size_t... _Indexes1,
               typename... _Args2, std::size_t... _Indexes2>
        pair(tuple<_Args1...>&, tuple<_Args2...>&,
             _Index_tuple<_Indexes1...>, _Index_tuple<_Indexes2...>);

    };


  template<typename _T1, typename _T2> pair(_T1, _T2) -> pair<_T1, _T2>;



  template<typename _T1, typename _T2>
    inline constexpr bool
    operator==(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return __x.first == __y.first && __x.second == __y.second; }


  template<typename _T1, typename _T2>
    inline constexpr bool
    operator<(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return __x.first < __y.first
      || (!(__y.first < __x.first) && __x.second < __y.second); }


  template<typename _T1, typename _T2>
    inline constexpr bool
    operator!=(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return !(__x == __y); }


  template<typename _T1, typename _T2>
    inline constexpr bool
    operator>(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return __y < __x; }


  template<typename _T1, typename _T2>
    inline constexpr bool
    operator<=(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return !(__y < __x); }


  template<typename _T1, typename _T2>
    inline constexpr bool
    operator>=(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return !(__x < __y); }





  template<typename _T1, typename _T2>
    inline


    typename enable_if<__and_<__is_swappable<_T1>,
                              __is_swappable<_T2>>::value>::type



    swap(pair<_T1, _T2>& __x, pair<_T1, _T2>& __y)
    noexcept(noexcept(__x.swap(__y)))
    { __x.swap(__y); }


  template<typename _T1, typename _T2>
    typename enable_if<!__and_<__is_swappable<_T1>,
          __is_swappable<_T2>>::value>::type
    swap(pair<_T1, _T2>&, pair<_T1, _T2>&) = delete;
# 521 "/usr/include/c++/9/bits/stl_pair.h" 3
  template<typename _T1, typename _T2>
    constexpr pair<typename __decay_and_strip<_T1>::__type,
                   typename __decay_and_strip<_T2>::__type>
    make_pair(_T1&& __x, _T2&& __y)
    {
      typedef typename __decay_and_strip<_T1>::__type __ds_type1;
      typedef typename __decay_and_strip<_T2>::__type __ds_type2;
      typedef pair<__ds_type1, __ds_type2> __pair_type;
      return __pair_type(std::forward<_T1>(__x), std::forward<_T2>(__y));
    }
# 540 "/usr/include/c++/9/bits/stl_pair.h" 3

}
# 65 "/usr/include/c++/9/bits/stl_algobase.h" 2 3
# 1 "/usr/include/c++/9/bits/stl_iterator_base_types.h" 1 3
# 62 "/usr/include/c++/9/bits/stl_iterator_base_types.h" 3
       
# 63 "/usr/include/c++/9/bits/stl_iterator_base_types.h" 3







namespace std __attribute__ ((__visibility__ ("default")))
{

# 89 "/usr/include/c++/9/bits/stl_iterator_base_types.h" 3
  struct input_iterator_tag { };


  struct output_iterator_tag { };


  struct forward_iterator_tag : public input_iterator_tag { };



  struct bidirectional_iterator_tag : public forward_iterator_tag { };



  struct random_access_iterator_tag : public bidirectional_iterator_tag { };
# 116 "/usr/include/c++/9/bits/stl_iterator_base_types.h" 3
  template<typename _Category, typename _Tp, typename _Distance = ptrdiff_t,
           typename _Pointer = _Tp*, typename _Reference = _Tp&>
    struct iterator
    {

      typedef _Category iterator_category;

      typedef _Tp value_type;

      typedef _Distance difference_type;

      typedef _Pointer pointer;

      typedef _Reference reference;
    };
# 143 "/usr/include/c++/9/bits/stl_iterator_base_types.h" 3
  template<typename _Iterator, typename = __void_t<>>
    struct __iterator_traits { };

  template<typename _Iterator>
    struct __iterator_traits<_Iterator,
        __void_t<typename _Iterator::iterator_category,
          typename _Iterator::value_type,
          typename _Iterator::difference_type,
          typename _Iterator::pointer,
          typename _Iterator::reference>>
    {
      typedef typename _Iterator::iterator_category iterator_category;
      typedef typename _Iterator::value_type value_type;
      typedef typename _Iterator::difference_type difference_type;
      typedef typename _Iterator::pointer pointer;
      typedef typename _Iterator::reference reference;
    };

  template<typename _Iterator>
    struct iterator_traits
    : public __iterator_traits<_Iterator> { };
# 177 "/usr/include/c++/9/bits/stl_iterator_base_types.h" 3
  template<typename _Tp>
    struct iterator_traits<_Tp*>
    {
      typedef random_access_iterator_tag iterator_category;
      typedef _Tp value_type;
      typedef ptrdiff_t difference_type;
      typedef _Tp* pointer;
      typedef _Tp& reference;
    };


  template<typename _Tp>
    struct iterator_traits<const _Tp*>
    {
      typedef random_access_iterator_tag iterator_category;
      typedef _Tp value_type;
      typedef ptrdiff_t difference_type;
      typedef const _Tp* pointer;
      typedef const _Tp& reference;
    };





  template<typename _Iter>
    inline constexpr
    typename iterator_traits<_Iter>::iterator_category
    __iterator_category(const _Iter&)
    { return typename iterator_traits<_Iter>::iterator_category(); }
# 231 "/usr/include/c++/9/bits/stl_iterator_base_types.h" 3
  template<typename _InIter>
    using _RequireInputIter = typename
      enable_if<is_convertible<typename
  iterator_traits<_InIter>::iterator_category,
          input_iterator_tag>::value>::type;



}
# 66 "/usr/include/c++/9/bits/stl_algobase.h" 2 3
# 1 "/usr/include/c++/9/bits/stl_iterator_base_funcs.h" 1 3
# 62 "/usr/include/c++/9/bits/stl_iterator_base_funcs.h" 3
       
# 63 "/usr/include/c++/9/bits/stl_iterator_base_funcs.h" 3


# 1 "/usr/include/c++/9/debug/assertions.h" 1 3
# 66 "/usr/include/c++/9/bits/stl_iterator_base_funcs.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{




  template <typename> struct _List_iterator;
  template <typename> struct _List_const_iterator;


  template<typename _InputIterator>
    inline constexpr
    typename iterator_traits<_InputIterator>::difference_type
    __distance(_InputIterator __first, _InputIterator __last,
               input_iterator_tag)
    {

     

      typename iterator_traits<_InputIterator>::difference_type __n = 0;
      while (__first != __last)
 {
   ++__first;
   ++__n;
 }
      return __n;
    }

  template<typename _RandomAccessIterator>
    inline constexpr
    typename iterator_traits<_RandomAccessIterator>::difference_type
    __distance(_RandomAccessIterator __first, _RandomAccessIterator __last,
               random_access_iterator_tag)
    {

     

      return __last - __first;
    }



  template<typename _Tp>
    ptrdiff_t
    __distance(std::_List_iterator<_Tp>,
        std::_List_iterator<_Tp>,
        input_iterator_tag);

  template<typename _Tp>
    ptrdiff_t
    __distance(std::_List_const_iterator<_Tp>,
        std::_List_const_iterator<_Tp>,
        input_iterator_tag);
# 135 "/usr/include/c++/9/bits/stl_iterator_base_funcs.h" 3
  template<typename _InputIterator>
    inline constexpr
    typename iterator_traits<_InputIterator>::difference_type
    distance(_InputIterator __first, _InputIterator __last)
    {

      return std::__distance(__first, __last,
        std::__iterator_category(__first));
    }

  template<typename _InputIterator, typename _Distance>
    inline constexpr void
    __advance(_InputIterator& __i, _Distance __n, input_iterator_tag)
    {

     
      ;
      while (__n--)
 ++__i;
    }

  template<typename _BidirectionalIterator, typename _Distance>
    inline constexpr void
    __advance(_BidirectionalIterator& __i, _Distance __n,
       bidirectional_iterator_tag)
    {

     

      if (__n > 0)
        while (__n--)
   ++__i;
      else
        while (__n++)
   --__i;
    }

  template<typename _RandomAccessIterator, typename _Distance>
    inline constexpr void
    __advance(_RandomAccessIterator& __i, _Distance __n,
              random_access_iterator_tag)
    {

     

      if (__builtin_constant_p(__n) && __n == 1)
 ++__i;
      else if (__builtin_constant_p(__n) && __n == -1)
 --__i;
      else
 __i += __n;
    }
# 200 "/usr/include/c++/9/bits/stl_iterator_base_funcs.h" 3
  template<typename _InputIterator, typename _Distance>
    inline constexpr void
    advance(_InputIterator& __i, _Distance __n)
    {

      typename iterator_traits<_InputIterator>::difference_type __d = __n;
      std::__advance(__i, __d, std::__iterator_category(__i));
    }



  template<typename _InputIterator>
    inline constexpr _InputIterator
    next(_InputIterator __x, typename
  iterator_traits<_InputIterator>::difference_type __n = 1)
    {

     
      std::advance(__x, __n);
      return __x;
    }

  template<typename _BidirectionalIterator>
    inline constexpr _BidirectionalIterator
    prev(_BidirectionalIterator __x, typename
  iterator_traits<_BidirectionalIterator>::difference_type __n = 1)
    {

     

      std::advance(__x, -__n);
      return __x;
    }




}
# 67 "/usr/include/c++/9/bits/stl_algobase.h" 2 3
# 1 "/usr/include/c++/9/bits/stl_iterator.h" 1 3
# 66 "/usr/include/c++/9/bits/stl_iterator.h" 3
# 1 "/usr/include/c++/9/bits/ptr_traits.h" 1 3
# 42 "/usr/include/c++/9/bits/ptr_traits.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{


  class __undefined;


  template<typename _Tp>
    struct __get_first_arg
    { using type = __undefined; };

  template<template<typename, typename...> class _Template, typename _Tp,
           typename... _Types>
    struct __get_first_arg<_Template<_Tp, _Types...>>
    { using type = _Tp; };

  template<typename _Tp>
    using __get_first_arg_t = typename __get_first_arg<_Tp>::type;


  template<typename _Tp, typename _Up>
    struct __replace_first_arg
    { };

  template<template<typename, typename...> class _Template, typename _Up,
           typename _Tp, typename... _Types>
    struct __replace_first_arg<_Template<_Tp, _Types...>, _Up>
    { using type = _Template<_Up, _Types...>; };

  template<typename _Tp, typename _Up>
    using __replace_first_arg_t = typename __replace_first_arg<_Tp, _Up>::type;

  template<typename _Tp>
    using __make_not_void
      = typename conditional<is_void<_Tp>::value, __undefined, _Tp>::type;





  template<typename _Ptr>
    struct pointer_traits
    {
    private:
      template<typename _Tp>
 using __element_type = typename _Tp::element_type;

      template<typename _Tp>
 using __difference_type = typename _Tp::difference_type;

      template<typename _Tp, typename _Up, typename = void>
 struct __rebind : __replace_first_arg<_Tp, _Up> { };

      template<typename _Tp, typename _Up>
 struct __rebind<_Tp, _Up, __void_t<typename _Tp::template rebind<_Up>>>
 { using type = typename _Tp::template rebind<_Up>; };

    public:

      using pointer = _Ptr;


      using element_type
 = __detected_or_t<__get_first_arg_t<_Ptr>, __element_type, _Ptr>;


      using difference_type
 = __detected_or_t<ptrdiff_t, __difference_type, _Ptr>;


      template<typename _Up>
        using rebind = typename __rebind<_Ptr, _Up>::type;

      static _Ptr
      pointer_to(__make_not_void<element_type>& __e)
      { return _Ptr::pointer_to(__e); }

      static_assert(!is_same<element_type, __undefined>::value,
   "pointer type defines element_type or is like SomePointer<T, Args>");
    };





  template<typename _Tp>
    struct pointer_traits<_Tp*>
    {

      typedef _Tp* pointer;

      typedef _Tp element_type;

      typedef ptrdiff_t difference_type;

      template<typename _Up>
        using rebind = _Up*;






      static pointer
      pointer_to(__make_not_void<element_type>& __r) noexcept
      { return std::addressof(__r); }
    };


  template<typename _Ptr, typename _Tp>
    using __ptr_rebind = typename pointer_traits<_Ptr>::template rebind<_Tp>;

  template<typename _Tp>
    constexpr _Tp*
    __to_address(_Tp* __ptr) noexcept
    {
      static_assert(!std::is_function<_Tp>::value, "not a function pointer");
      return __ptr;
    }


  template<typename _Ptr>
    constexpr typename std::pointer_traits<_Ptr>::element_type*
    __to_address(const _Ptr& __ptr)
    { return std::__to_address(__ptr.operator->()); }
# 210 "/usr/include/c++/9/bits/ptr_traits.h" 3

}
# 67 "/usr/include/c++/9/bits/stl_iterator.h" 2 3
# 76 "/usr/include/c++/9/bits/stl_iterator.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{

# 104 "/usr/include/c++/9/bits/stl_iterator.h" 3
  template<typename _Iterator>
    class reverse_iterator
    : public iterator<typename iterator_traits<_Iterator>::iterator_category,
        typename iterator_traits<_Iterator>::value_type,
        typename iterator_traits<_Iterator>::difference_type,
        typename iterator_traits<_Iterator>::pointer,
                      typename iterator_traits<_Iterator>::reference>
    {
    protected:
      _Iterator current;

      typedef iterator_traits<_Iterator> __traits_type;

    public:
      typedef _Iterator iterator_type;
      typedef typename __traits_type::difference_type difference_type;
      typedef typename __traits_type::pointer pointer;
      typedef typename __traits_type::reference reference;
# 130 "/usr/include/c++/9/bits/stl_iterator.h" 3
      constexpr
      reverse_iterator() : current() { }




      explicit constexpr
      reverse_iterator(iterator_type __x) : current(__x) { }




      constexpr
      reverse_iterator(const reverse_iterator& __x)
      : current(__x.current) { }


      reverse_iterator& operator=(const reverse_iterator&) = default;






      template<typename _Iter>
 constexpr
        reverse_iterator(const reverse_iterator<_Iter>& __x)
 : current(__x.base()) { }




      constexpr iterator_type
      base() const
      { return current; }
# 176 "/usr/include/c++/9/bits/stl_iterator.h" 3
      constexpr reference
      operator*() const
      {
 _Iterator __tmp = current;
 return *--__tmp;
      }






      constexpr pointer
      operator->() const
      {


 _Iterator __tmp = current;
 --__tmp;
 return _S_to_pointer(__tmp);
      }






      constexpr reverse_iterator&
      operator++()
      {
 --current;
 return *this;
      }






      constexpr reverse_iterator
      operator++(int)
      {
 reverse_iterator __tmp = *this;
 --current;
 return __tmp;
      }






      constexpr reverse_iterator&
      operator--()
      {
 ++current;
 return *this;
      }






      constexpr reverse_iterator
      operator--(int)
      {
 reverse_iterator __tmp = *this;
 ++current;
 return __tmp;
      }






      constexpr reverse_iterator
      operator+(difference_type __n) const
      { return reverse_iterator(current - __n); }







      constexpr reverse_iterator&
      operator+=(difference_type __n)
      {
 current -= __n;
 return *this;
      }






      constexpr reverse_iterator
      operator-(difference_type __n) const
      { return reverse_iterator(current + __n); }







      constexpr reverse_iterator&
      operator-=(difference_type __n)
      {
 current += __n;
 return *this;
      }






      constexpr reference
      operator[](difference_type __n) const
      { return *(*this + __n); }

    private:
      template<typename _Tp>
 static constexpr _Tp*
 _S_to_pointer(_Tp* __p)
        { return __p; }

      template<typename _Tp>
 static constexpr pointer
 _S_to_pointer(_Tp __t)
        { return __t.operator->(); }
    };
# 323 "/usr/include/c++/9/bits/stl_iterator.h" 3
  template<typename _Iterator>
    inline constexpr bool
    operator==(const reverse_iterator<_Iterator>& __x,
        const reverse_iterator<_Iterator>& __y)
    { return __x.base() == __y.base(); }

  template<typename _Iterator>
    inline constexpr bool
    operator<(const reverse_iterator<_Iterator>& __x,
       const reverse_iterator<_Iterator>& __y)
    { return __y.base() < __x.base(); }

  template<typename _Iterator>
    inline constexpr bool
    operator!=(const reverse_iterator<_Iterator>& __x,
        const reverse_iterator<_Iterator>& __y)
    { return !(__x == __y); }

  template<typename _Iterator>
    inline constexpr bool
    operator>(const reverse_iterator<_Iterator>& __x,
       const reverse_iterator<_Iterator>& __y)
    { return __y < __x; }

  template<typename _Iterator>
    inline constexpr bool
    operator<=(const reverse_iterator<_Iterator>& __x,
        const reverse_iterator<_Iterator>& __y)
    { return !(__y < __x); }

  template<typename _Iterator>
    inline constexpr bool
    operator>=(const reverse_iterator<_Iterator>& __x,
        const reverse_iterator<_Iterator>& __y)
    { return !(__x < __y); }



  template<typename _IteratorL, typename _IteratorR>
    inline constexpr bool
    operator==(const reverse_iterator<_IteratorL>& __x,
        const reverse_iterator<_IteratorR>& __y)
    { return __x.base() == __y.base(); }

  template<typename _IteratorL, typename _IteratorR>
    inline constexpr bool
    operator<(const reverse_iterator<_IteratorL>& __x,
       const reverse_iterator<_IteratorR>& __y)
    { return __y.base() < __x.base(); }

  template<typename _IteratorL, typename _IteratorR>
    inline constexpr bool
    operator!=(const reverse_iterator<_IteratorL>& __x,
        const reverse_iterator<_IteratorR>& __y)
    { return !(__x == __y); }

  template<typename _IteratorL, typename _IteratorR>
    inline constexpr bool
    operator>(const reverse_iterator<_IteratorL>& __x,
       const reverse_iterator<_IteratorR>& __y)
    { return __y < __x; }

  template<typename _IteratorL, typename _IteratorR>
    inline constexpr bool
    operator<=(const reverse_iterator<_IteratorL>& __x,
        const reverse_iterator<_IteratorR>& __y)
    { return !(__y < __x); }

  template<typename _IteratorL, typename _IteratorR>
    inline constexpr bool
    operator>=(const reverse_iterator<_IteratorL>& __x,
        const reverse_iterator<_IteratorR>& __y)
    { return !(__x < __y); }
# 413 "/usr/include/c++/9/bits/stl_iterator.h" 3
  template<typename _IteratorL, typename _IteratorR>
    inline constexpr auto
    operator-(const reverse_iterator<_IteratorL>& __x,
       const reverse_iterator<_IteratorR>& __y)
    -> decltype(__y.base() - __x.base())
    { return __y.base() - __x.base(); }


  template<typename _Iterator>
    inline constexpr reverse_iterator<_Iterator>
    operator+(typename reverse_iterator<_Iterator>::difference_type __n,
       const reverse_iterator<_Iterator>& __x)
    { return reverse_iterator<_Iterator>(__x.base() - __n); }



  template<typename _Iterator>
    inline constexpr reverse_iterator<_Iterator>
    __make_reverse_iterator(_Iterator __i)
    { return reverse_iterator<_Iterator>(__i); }







  template<typename _Iterator>
    inline constexpr reverse_iterator<_Iterator>
    make_reverse_iterator(_Iterator __i)
    { return reverse_iterator<_Iterator>(__i); }




  template<typename _Iterator>
    auto
    __niter_base(reverse_iterator<_Iterator> __it)
    -> decltype(__make_reverse_iterator(__niter_base(__it.base())))
    { return __make_reverse_iterator(__niter_base(__it.base())); }

  template<typename _Iterator>
    struct __is_move_iterator<reverse_iterator<_Iterator> >
      : __is_move_iterator<_Iterator>
    { };

  template<typename _Iterator>
    auto
    __miter_base(reverse_iterator<_Iterator> __it)
    -> decltype(__make_reverse_iterator(__miter_base(__it.base())))
    { return __make_reverse_iterator(__miter_base(__it.base())); }
# 477 "/usr/include/c++/9/bits/stl_iterator.h" 3
  template<typename _Container>
    class back_insert_iterator
    : public iterator<output_iterator_tag, void, void, void, void>
    {
    protected:
      _Container* container;

    public:

      typedef _Container container_type;


      explicit
      back_insert_iterator(_Container& __x)
      : container(std::__addressof(__x)) { }
# 512 "/usr/include/c++/9/bits/stl_iterator.h" 3
      back_insert_iterator&
      operator=(const typename _Container::value_type& __value)
      {
 container->push_back(__value);
 return *this;
      }

      back_insert_iterator&
      operator=(typename _Container::value_type&& __value)
      {
 container->push_back(std::move(__value));
 return *this;
      }



      back_insert_iterator&
      operator*()
      { return *this; }


      back_insert_iterator&
      operator++()
      { return *this; }


      back_insert_iterator
      operator++(int)
      { return *this; }
    };
# 554 "/usr/include/c++/9/bits/stl_iterator.h" 3
  template<typename _Container>
    inline back_insert_iterator<_Container>
    back_inserter(_Container& __x)
    { return back_insert_iterator<_Container>(__x); }
# 569 "/usr/include/c++/9/bits/stl_iterator.h" 3
  template<typename _Container>
    class front_insert_iterator
    : public iterator<output_iterator_tag, void, void, void, void>
    {
    protected:
      _Container* container;

    public:

      typedef _Container container_type;


      explicit front_insert_iterator(_Container& __x)
      : container(std::__addressof(__x)) { }
# 603 "/usr/include/c++/9/bits/stl_iterator.h" 3
      front_insert_iterator&
      operator=(const typename _Container::value_type& __value)
      {
 container->push_front(__value);
 return *this;
      }

      front_insert_iterator&
      operator=(typename _Container::value_type&& __value)
      {
 container->push_front(std::move(__value));
 return *this;
      }



      front_insert_iterator&
      operator*()
      { return *this; }


      front_insert_iterator&
      operator++()
      { return *this; }


      front_insert_iterator
      operator++(int)
      { return *this; }
    };
# 645 "/usr/include/c++/9/bits/stl_iterator.h" 3
  template<typename _Container>
    inline front_insert_iterator<_Container>
    front_inserter(_Container& __x)
    { return front_insert_iterator<_Container>(__x); }
# 664 "/usr/include/c++/9/bits/stl_iterator.h" 3
  template<typename _Container>
    class insert_iterator
    : public iterator<output_iterator_tag, void, void, void, void>
    {
    protected:
      _Container* container;
      typename _Container::iterator iter;

    public:

      typedef _Container container_type;





      insert_iterator(_Container& __x, typename _Container::iterator __i)
      : container(std::__addressof(__x)), iter(__i) {}
# 715 "/usr/include/c++/9/bits/stl_iterator.h" 3
      insert_iterator&
      operator=(const typename _Container::value_type& __value)
      {
 iter = container->insert(iter, __value);
 ++iter;
 return *this;
      }

      insert_iterator&
      operator=(typename _Container::value_type&& __value)
      {
 iter = container->insert(iter, std::move(__value));
 ++iter;
 return *this;
      }



      insert_iterator&
      operator*()
      { return *this; }


      insert_iterator&
      operator++()
      { return *this; }


      insert_iterator&
      operator++(int)
      { return *this; }
    };
# 760 "/usr/include/c++/9/bits/stl_iterator.h" 3
  template<typename _Container>
    inline insert_iterator<_Container>
    inserter(_Container& __x, typename _Container::iterator __i)
    { return insert_iterator<_Container>(__x, __i); }




}

namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{

# 781 "/usr/include/c++/9/bits/stl_iterator.h" 3
  using std::iterator_traits;
  using std::iterator;
  template<typename _Iterator, typename _Container>
    class __normal_iterator
    {
    protected:
      _Iterator _M_current;

      typedef iterator_traits<_Iterator> __traits_type;

    public:
      typedef _Iterator iterator_type;
      typedef typename __traits_type::iterator_category iterator_category;
      typedef typename __traits_type::value_type value_type;
      typedef typename __traits_type::difference_type difference_type;
      typedef typename __traits_type::reference reference;
      typedef typename __traits_type::pointer pointer;

      constexpr __normal_iterator() noexcept
      : _M_current(_Iterator()) { }

      explicit
      __normal_iterator(const _Iterator& __i) noexcept
      : _M_current(__i) { }


      template<typename _Iter>
        __normal_iterator(const __normal_iterator<_Iter,
     typename __enable_if<
              (std::__are_same<_Iter, typename _Container::pointer>::__value),
        _Container>::__type>& __i) noexcept
        : _M_current(__i.base()) { }


      reference
      operator*() const noexcept
      { return *_M_current; }

      pointer
      operator->() const noexcept
      { return _M_current; }

      __normal_iterator&
      operator++() noexcept
      {
 ++_M_current;
 return *this;
      }

      __normal_iterator
      operator++(int) noexcept
      { return __normal_iterator(_M_current++); }


      __normal_iterator&
      operator--() noexcept
      {
 --_M_current;
 return *this;
      }

      __normal_iterator
      operator--(int) noexcept
      { return __normal_iterator(_M_current--); }


      reference
      operator[](difference_type __n) const noexcept
      { return _M_current[__n]; }

      __normal_iterator&
      operator+=(difference_type __n) noexcept
      { _M_current += __n; return *this; }

      __normal_iterator
      operator+(difference_type __n) const noexcept
      { return __normal_iterator(_M_current + __n); }

      __normal_iterator&
      operator-=(difference_type __n) noexcept
      { _M_current -= __n; return *this; }

      __normal_iterator
      operator-(difference_type __n) const noexcept
      { return __normal_iterator(_M_current - __n); }

      const _Iterator&
      base() const noexcept
      { return _M_current; }
    };
# 881 "/usr/include/c++/9/bits/stl_iterator.h" 3
  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator==(const __normal_iterator<_IteratorL, _Container>& __lhs,
        const __normal_iterator<_IteratorR, _Container>& __rhs)
    noexcept
    { return __lhs.base() == __rhs.base(); }

  template<typename _Iterator, typename _Container>
    inline bool
    operator==(const __normal_iterator<_Iterator, _Container>& __lhs,
        const __normal_iterator<_Iterator, _Container>& __rhs)
    noexcept
    { return __lhs.base() == __rhs.base(); }

  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator!=(const __normal_iterator<_IteratorL, _Container>& __lhs,
        const __normal_iterator<_IteratorR, _Container>& __rhs)
    noexcept
    { return __lhs.base() != __rhs.base(); }

  template<typename _Iterator, typename _Container>
    inline bool
    operator!=(const __normal_iterator<_Iterator, _Container>& __lhs,
        const __normal_iterator<_Iterator, _Container>& __rhs)
    noexcept
    { return __lhs.base() != __rhs.base(); }


  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator<(const __normal_iterator<_IteratorL, _Container>& __lhs,
       const __normal_iterator<_IteratorR, _Container>& __rhs)
    noexcept
    { return __lhs.base() < __rhs.base(); }

  template<typename _Iterator, typename _Container>
    inline bool
    operator<(const __normal_iterator<_Iterator, _Container>& __lhs,
       const __normal_iterator<_Iterator, _Container>& __rhs)
    noexcept
    { return __lhs.base() < __rhs.base(); }

  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator>(const __normal_iterator<_IteratorL, _Container>& __lhs,
       const __normal_iterator<_IteratorR, _Container>& __rhs)
    noexcept
    { return __lhs.base() > __rhs.base(); }

  template<typename _Iterator, typename _Container>
    inline bool
    operator>(const __normal_iterator<_Iterator, _Container>& __lhs,
       const __normal_iterator<_Iterator, _Container>& __rhs)
    noexcept
    { return __lhs.base() > __rhs.base(); }

  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator<=(const __normal_iterator<_IteratorL, _Container>& __lhs,
        const __normal_iterator<_IteratorR, _Container>& __rhs)
    noexcept
    { return __lhs.base() <= __rhs.base(); }

  template<typename _Iterator, typename _Container>
    inline bool
    operator<=(const __normal_iterator<_Iterator, _Container>& __lhs,
        const __normal_iterator<_Iterator, _Container>& __rhs)
    noexcept
    { return __lhs.base() <= __rhs.base(); }

  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator>=(const __normal_iterator<_IteratorL, _Container>& __lhs,
        const __normal_iterator<_IteratorR, _Container>& __rhs)
    noexcept
    { return __lhs.base() >= __rhs.base(); }

  template<typename _Iterator, typename _Container>
    inline bool
    operator>=(const __normal_iterator<_Iterator, _Container>& __lhs,
        const __normal_iterator<_Iterator, _Container>& __rhs)
    noexcept
    { return __lhs.base() >= __rhs.base(); }





  template<typename _IteratorL, typename _IteratorR, typename _Container>


    inline auto
    operator-(const __normal_iterator<_IteratorL, _Container>& __lhs,
       const __normal_iterator<_IteratorR, _Container>& __rhs) noexcept
    -> decltype(__lhs.base() - __rhs.base())





    { return __lhs.base() - __rhs.base(); }

  template<typename _Iterator, typename _Container>
    inline typename __normal_iterator<_Iterator, _Container>::difference_type
    operator-(const __normal_iterator<_Iterator, _Container>& __lhs,
       const __normal_iterator<_Iterator, _Container>& __rhs)
    noexcept
    { return __lhs.base() - __rhs.base(); }

  template<typename _Iterator, typename _Container>
    inline __normal_iterator<_Iterator, _Container>
    operator+(typename __normal_iterator<_Iterator, _Container>::difference_type
       __n, const __normal_iterator<_Iterator, _Container>& __i)
    noexcept
    { return __normal_iterator<_Iterator, _Container>(__i.base() + __n); }


}

namespace std __attribute__ ((__visibility__ ("default")))
{


  template<typename _Iterator, typename _Container>
    _Iterator
    __niter_base(__gnu_cxx::__normal_iterator<_Iterator, _Container> __it)
    noexcept(std::is_nothrow_copy_constructible<_Iterator>::value)
    { return __it.base(); }
# 1027 "/usr/include/c++/9/bits/stl_iterator.h" 3
  template<typename _Iterator>
    class move_iterator
    {
    protected:
      _Iterator _M_current;

      typedef iterator_traits<_Iterator> __traits_type;
      typedef typename __traits_type::reference __base_ref;

    public:
      typedef _Iterator iterator_type;
      typedef typename __traits_type::iterator_category iterator_category;
      typedef typename __traits_type::value_type value_type;
      typedef typename __traits_type::difference_type difference_type;

      typedef _Iterator pointer;


      typedef typename conditional<is_reference<__base_ref>::value,
    typename remove_reference<__base_ref>::type&&,
    __base_ref>::type reference;

      constexpr
      move_iterator()
      : _M_current() { }

      explicit constexpr
      move_iterator(iterator_type __i)
      : _M_current(__i) { }

      template<typename _Iter>
 constexpr
 move_iterator(const move_iterator<_Iter>& __i)
 : _M_current(__i.base()) { }

      constexpr iterator_type
      base() const
      { return _M_current; }

      constexpr reference
      operator*() const
      { return static_cast<reference>(*_M_current); }

      constexpr pointer
      operator->() const
      { return _M_current; }

      constexpr move_iterator&
      operator++()
      {
 ++_M_current;
 return *this;
      }

      constexpr move_iterator
      operator++(int)
      {
 move_iterator __tmp = *this;
 ++_M_current;
 return __tmp;
      }

      constexpr move_iterator&
      operator--()
      {
 --_M_current;
 return *this;
      }

      constexpr move_iterator
      operator--(int)
      {
 move_iterator __tmp = *this;
 --_M_current;
 return __tmp;
      }

      constexpr move_iterator
      operator+(difference_type __n) const
      { return move_iterator(_M_current + __n); }

      constexpr move_iterator&
      operator+=(difference_type __n)
      {
 _M_current += __n;
 return *this;
      }

      constexpr move_iterator
      operator-(difference_type __n) const
      { return move_iterator(_M_current - __n); }

      constexpr move_iterator&
      operator-=(difference_type __n)
      {
 _M_current -= __n;
 return *this;
      }

      constexpr reference
      operator[](difference_type __n) const
      { return std::move(_M_current[__n]); }
    };




  template<typename _IteratorL, typename _IteratorR>
    inline constexpr bool
    operator==(const move_iterator<_IteratorL>& __x,
        const move_iterator<_IteratorR>& __y)
    { return __x.base() == __y.base(); }

  template<typename _Iterator>
    inline constexpr bool
    operator==(const move_iterator<_Iterator>& __x,
        const move_iterator<_Iterator>& __y)
    { return __x.base() == __y.base(); }

  template<typename _IteratorL, typename _IteratorR>
    inline constexpr bool
    operator!=(const move_iterator<_IteratorL>& __x,
        const move_iterator<_IteratorR>& __y)
    { return !(__x == __y); }

  template<typename _Iterator>
    inline constexpr bool
    operator!=(const move_iterator<_Iterator>& __x,
        const move_iterator<_Iterator>& __y)
    { return !(__x == __y); }

  template<typename _IteratorL, typename _IteratorR>
    inline constexpr bool
    operator<(const move_iterator<_IteratorL>& __x,
       const move_iterator<_IteratorR>& __y)
    { return __x.base() < __y.base(); }

  template<typename _Iterator>
    inline constexpr bool
    operator<(const move_iterator<_Iterator>& __x,
       const move_iterator<_Iterator>& __y)
    { return __x.base() < __y.base(); }

  template<typename _IteratorL, typename _IteratorR>
    inline constexpr bool
    operator<=(const move_iterator<_IteratorL>& __x,
        const move_iterator<_IteratorR>& __y)
    { return !(__y < __x); }

  template<typename _Iterator>
    inline constexpr bool
    operator<=(const move_iterator<_Iterator>& __x,
        const move_iterator<_Iterator>& __y)
    { return !(__y < __x); }

  template<typename _IteratorL, typename _IteratorR>
    inline constexpr bool
    operator>(const move_iterator<_IteratorL>& __x,
       const move_iterator<_IteratorR>& __y)
    { return __y < __x; }

  template<typename _Iterator>
    inline constexpr bool
    operator>(const move_iterator<_Iterator>& __x,
       const move_iterator<_Iterator>& __y)
    { return __y < __x; }

  template<typename _IteratorL, typename _IteratorR>
    inline constexpr bool
    operator>=(const move_iterator<_IteratorL>& __x,
        const move_iterator<_IteratorR>& __y)
    { return !(__x < __y); }

  template<typename _Iterator>
    inline constexpr bool
    operator>=(const move_iterator<_Iterator>& __x,
        const move_iterator<_Iterator>& __y)
    { return !(__x < __y); }


  template<typename _IteratorL, typename _IteratorR>
    inline constexpr auto
    operator-(const move_iterator<_IteratorL>& __x,
       const move_iterator<_IteratorR>& __y)
    -> decltype(__x.base() - __y.base())
    { return __x.base() - __y.base(); }

  template<typename _Iterator>
    inline constexpr move_iterator<_Iterator>
    operator+(typename move_iterator<_Iterator>::difference_type __n,
       const move_iterator<_Iterator>& __x)
    { return __x + __n; }

  template<typename _Iterator>
    inline constexpr move_iterator<_Iterator>
    make_move_iterator(_Iterator __i)
    { return move_iterator<_Iterator>(__i); }

  template<typename _Iterator, typename _ReturnType
    = typename conditional<__move_if_noexcept_cond
      <typename iterator_traits<_Iterator>::value_type>::value,
                _Iterator, move_iterator<_Iterator>>::type>
    inline constexpr _ReturnType
    __make_move_if_noexcept_iterator(_Iterator __i)
    { return _ReturnType(__i); }



  template<typename _Tp, typename _ReturnType
    = typename conditional<__move_if_noexcept_cond<_Tp>::value,
      const _Tp*, move_iterator<_Tp*>>::type>
    inline constexpr _ReturnType
    __make_move_if_noexcept_iterator(_Tp* __i)
    { return _ReturnType(__i); }



  template<typename _Iterator>
    auto
    __niter_base(move_iterator<_Iterator> __it)
    -> decltype(make_move_iterator(__niter_base(__it.base())))
    { return make_move_iterator(__niter_base(__it.base())); }

  template<typename _Iterator>
    struct __is_move_iterator<move_iterator<_Iterator> >
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<typename _Iterator>
    auto
    __miter_base(move_iterator<_Iterator> __it)
    -> decltype(__miter_base(__it.base()))
    { return __miter_base(__it.base()); }
# 1274 "/usr/include/c++/9/bits/stl_iterator.h" 3
  template<typename _InputIterator>
    using __iter_key_t = remove_const_t<
    typename iterator_traits<_InputIterator>::value_type::first_type>;

  template<typename _InputIterator>
    using __iter_val_t =
    typename iterator_traits<_InputIterator>::value_type::second_type;

  template<typename _T1, typename _T2>
    struct pair;

  template<typename _InputIterator>
    using __iter_to_alloc_t =
    pair<add_const_t<__iter_key_t<_InputIterator>>,
  __iter_val_t<_InputIterator>>;




}
# 68 "/usr/include/c++/9/bits/stl_algobase.h" 2 3

# 1 "/usr/include/c++/9/debug/debug.h" 1 3
# 48 "/usr/include/c++/9/debug/debug.h" 3
namespace std
{
  namespace __debug { }
}




namespace __gnu_debug
{
  using namespace std::__debug;
}
# 70 "/usr/include/c++/9/bits/stl_algobase.h" 2 3

# 1 "/usr/include/c++/9/bits/predefined_ops.h" 1 3
# 33 "/usr/include/c++/9/bits/predefined_ops.h" 3
namespace __gnu_cxx
{
namespace __ops
{
  struct _Iter_less_iter
  {
    template<typename _Iterator1, typename _Iterator2>
      constexpr
      bool
      operator()(_Iterator1 __it1, _Iterator2 __it2) const
      { return *__it1 < *__it2; }
  };

  constexpr
  inline _Iter_less_iter
  __iter_less_iter()
  { return _Iter_less_iter(); }

  struct _Iter_less_val
  {

    constexpr _Iter_less_val() = default;




    explicit
    _Iter_less_val(_Iter_less_iter) { }

    template<typename _Iterator, typename _Value>
      bool
      operator()(_Iterator __it, _Value& __val) const
      { return *__it < __val; }
  };

  inline _Iter_less_val
  __iter_less_val()
  { return _Iter_less_val(); }

  inline _Iter_less_val
  __iter_comp_val(_Iter_less_iter)
  { return _Iter_less_val(); }

  struct _Val_less_iter
  {

    constexpr _Val_less_iter() = default;




    explicit
    _Val_less_iter(_Iter_less_iter) { }

    template<typename _Value, typename _Iterator>
      bool
      operator()(_Value& __val, _Iterator __it) const
      { return __val < *__it; }
  };

  inline _Val_less_iter
  __val_less_iter()
  { return _Val_less_iter(); }

  inline _Val_less_iter
  __val_comp_iter(_Iter_less_iter)
  { return _Val_less_iter(); }

  struct _Iter_equal_to_iter
  {
    template<typename _Iterator1, typename _Iterator2>
      bool
      operator()(_Iterator1 __it1, _Iterator2 __it2) const
      { return *__it1 == *__it2; }
  };

  inline _Iter_equal_to_iter
  __iter_equal_to_iter()
  { return _Iter_equal_to_iter(); }

  struct _Iter_equal_to_val
  {
    template<typename _Iterator, typename _Value>
      bool
      operator()(_Iterator __it, _Value& __val) const
      { return *__it == __val; }
  };

  inline _Iter_equal_to_val
  __iter_equal_to_val()
  { return _Iter_equal_to_val(); }

  inline _Iter_equal_to_val
  __iter_comp_val(_Iter_equal_to_iter)
  { return _Iter_equal_to_val(); }

  template<typename _Compare>
    struct _Iter_comp_iter
    {
      _Compare _M_comp;

      explicit constexpr
      _Iter_comp_iter(_Compare __comp)
 : _M_comp(std::move(__comp))
      { }

      template<typename _Iterator1, typename _Iterator2>
        constexpr
        bool
        operator()(_Iterator1 __it1, _Iterator2 __it2)
        { return bool(_M_comp(*__it1, *__it2)); }
    };

  template<typename _Compare>
    constexpr
    inline _Iter_comp_iter<_Compare>
    __iter_comp_iter(_Compare __comp)
    { return _Iter_comp_iter<_Compare>(std::move(__comp)); }

  template<typename _Compare>
    struct _Iter_comp_val
    {
      _Compare _M_comp;

      explicit
      _Iter_comp_val(_Compare __comp)
 : _M_comp(std::move(__comp))
      { }

      explicit
      _Iter_comp_val(const _Iter_comp_iter<_Compare>& __comp)
 : _M_comp(__comp._M_comp)
      { }


      explicit
      _Iter_comp_val(_Iter_comp_iter<_Compare>&& __comp)
 : _M_comp(std::move(__comp._M_comp))
      { }


      template<typename _Iterator, typename _Value>
 bool
 operator()(_Iterator __it, _Value& __val)
 { return bool(_M_comp(*__it, __val)); }
    };

  template<typename _Compare>
   inline _Iter_comp_val<_Compare>
    __iter_comp_val(_Compare __comp)
    { return _Iter_comp_val<_Compare>(std::move(__comp)); }

  template<typename _Compare>
    inline _Iter_comp_val<_Compare>
    __iter_comp_val(_Iter_comp_iter<_Compare> __comp)
    { return _Iter_comp_val<_Compare>(std::move(__comp)); }

  template<typename _Compare>
    struct _Val_comp_iter
    {
      _Compare _M_comp;

      explicit
      _Val_comp_iter(_Compare __comp)
 : _M_comp(std::move(__comp))
      { }

      explicit
      _Val_comp_iter(const _Iter_comp_iter<_Compare>& __comp)
 : _M_comp(__comp._M_comp)
      { }


      explicit
      _Val_comp_iter(_Iter_comp_iter<_Compare>&& __comp)
 : _M_comp(std::move(__comp._M_comp))
      { }


      template<typename _Value, typename _Iterator>
 bool
 operator()(_Value& __val, _Iterator __it)
 { return bool(_M_comp(__val, *__it)); }
    };

  template<typename _Compare>
    inline _Val_comp_iter<_Compare>
    __val_comp_iter(_Compare __comp)
    { return _Val_comp_iter<_Compare>(std::move(__comp)); }

  template<typename _Compare>
    inline _Val_comp_iter<_Compare>
    __val_comp_iter(_Iter_comp_iter<_Compare> __comp)
    { return _Val_comp_iter<_Compare>(std::move(__comp)); }

  template<typename _Value>
    struct _Iter_equals_val
    {
      _Value& _M_value;

      explicit
      _Iter_equals_val(_Value& __value)
 : _M_value(__value)
      { }

      template<typename _Iterator>
 bool
 operator()(_Iterator __it)
 { return *__it == _M_value; }
    };

  template<typename _Value>
    inline _Iter_equals_val<_Value>
    __iter_equals_val(_Value& __val)
    { return _Iter_equals_val<_Value>(__val); }

  template<typename _Iterator1>
    struct _Iter_equals_iter
    {
      _Iterator1 _M_it1;

      explicit
      _Iter_equals_iter(_Iterator1 __it1)
 : _M_it1(__it1)
      { }

      template<typename _Iterator2>
 bool
 operator()(_Iterator2 __it2)
 { return *__it2 == *_M_it1; }
    };

  template<typename _Iterator>
    inline _Iter_equals_iter<_Iterator>
    __iter_comp_iter(_Iter_equal_to_iter, _Iterator __it)
    { return _Iter_equals_iter<_Iterator>(__it); }

  template<typename _Predicate>
    struct _Iter_pred
    {
      _Predicate _M_pred;

      explicit
      _Iter_pred(_Predicate __pred)
 : _M_pred(std::move(__pred))
      { }

      template<typename _Iterator>
 bool
 operator()(_Iterator __it)
 { return bool(_M_pred(*__it)); }
    };

  template<typename _Predicate>
    inline _Iter_pred<_Predicate>
    __pred_iter(_Predicate __pred)
    { return _Iter_pred<_Predicate>(std::move(__pred)); }

  template<typename _Compare, typename _Value>
    struct _Iter_comp_to_val
    {
      _Compare _M_comp;
      _Value& _M_value;

      _Iter_comp_to_val(_Compare __comp, _Value& __value)
 : _M_comp(std::move(__comp)), _M_value(__value)
      { }

      template<typename _Iterator>
 bool
 operator()(_Iterator __it)
 { return bool(_M_comp(*__it, _M_value)); }
    };

  template<typename _Compare, typename _Value>
    _Iter_comp_to_val<_Compare, _Value>
    __iter_comp_val(_Compare __comp, _Value &__val)
    {
      return _Iter_comp_to_val<_Compare, _Value>(std::move(__comp), __val);
    }

  template<typename _Compare, typename _Iterator1>
    struct _Iter_comp_to_iter
    {
      _Compare _M_comp;
      _Iterator1 _M_it1;

      _Iter_comp_to_iter(_Compare __comp, _Iterator1 __it1)
 : _M_comp(std::move(__comp)), _M_it1(__it1)
      { }

      template<typename _Iterator2>
 bool
 operator()(_Iterator2 __it2)
 { return bool(_M_comp(*__it2, *_M_it1)); }
    };

  template<typename _Compare, typename _Iterator>
    inline _Iter_comp_to_iter<_Compare, _Iterator>
    __iter_comp_iter(_Iter_comp_iter<_Compare> __comp, _Iterator __it)
    {
      return _Iter_comp_to_iter<_Compare, _Iterator>(
   std::move(__comp._M_comp), __it);
    }

  template<typename _Predicate>
    struct _Iter_negate
    {
      _Predicate _M_pred;

      explicit
      _Iter_negate(_Predicate __pred)
 : _M_pred(std::move(__pred))
      { }

      template<typename _Iterator>
 bool
 operator()(_Iterator __it)
 { return !bool(_M_pred(*__it)); }
    };

  template<typename _Predicate>
    inline _Iter_negate<_Predicate>
    __negate(_Iter_pred<_Predicate> __pred)
    { return _Iter_negate<_Predicate>(std::move(__pred._M_pred)); }

}
}
# 72 "/usr/include/c++/9/bits/stl_algobase.h" 2 3




namespace std __attribute__ ((__visibility__ ("default")))
{

# 121 "/usr/include/c++/9/bits/stl_algobase.h" 3
  template<typename _ForwardIterator1, typename _ForwardIterator2>
    inline void
    iter_swap(_ForwardIterator1 __a, _ForwardIterator2 __b)
    {

     

     
# 151 "/usr/include/c++/9/bits/stl_algobase.h" 3
      swap(*__a, *__b);

    }
# 167 "/usr/include/c++/9/bits/stl_algobase.h" 3
  template<typename _ForwardIterator1, typename _ForwardIterator2>
    _ForwardIterator2
    swap_ranges(_ForwardIterator1 __first1, _ForwardIterator1 __last1,
  _ForwardIterator2 __first2)
    {

     

     

      ;

      for (; __first1 != __last1; ++__first1, (void)++__first2)
 std::iter_swap(__first1, __first2);
      return __first2;
    }
# 195 "/usr/include/c++/9/bits/stl_algobase.h" 3
  template<typename _Tp>
    constexpr
    inline const _Tp&
    min(const _Tp& __a, const _Tp& __b)
    {

     

      if (__b < __a)
 return __b;
      return __a;
    }
# 219 "/usr/include/c++/9/bits/stl_algobase.h" 3
  template<typename _Tp>
    constexpr
    inline const _Tp&
    max(const _Tp& __a, const _Tp& __b)
    {

     

      if (__a < __b)
 return __b;
      return __a;
    }
# 243 "/usr/include/c++/9/bits/stl_algobase.h" 3
  template<typename _Tp, typename _Compare>
    constexpr
    inline const _Tp&
    min(const _Tp& __a, const _Tp& __b, _Compare __comp)
    {

      if (__comp(__b, __a))
 return __b;
      return __a;
    }
# 265 "/usr/include/c++/9/bits/stl_algobase.h" 3
  template<typename _Tp, typename _Compare>
    constexpr
    inline const _Tp&
    max(const _Tp& __a, const _Tp& __b, _Compare __comp)
    {

      if (__comp(__a, __b))
 return __b;
      return __a;
    }



  template<typename _Iterator>
    inline _Iterator
    __niter_base(_Iterator __it)
    noexcept(std::is_nothrow_copy_constructible<_Iterator>::value)
    { return __it; }




  template<typename _From, typename _To>
    inline _From
    __niter_wrap(_From __from, _To __res)
    { return __from + (__res - std::__niter_base(__from)); }


  template<typename _Iterator>
    inline _Iterator
    __niter_wrap(const _Iterator&, _Iterator __res)
    { return __res; }







  template<bool _IsMove, bool _IsSimple, typename _Category>
    struct __copy_move
    {
      template<typename _II, typename _OI>
 static _OI
 __copy_m(_II __first, _II __last, _OI __result)
 {
   for (; __first != __last; ++__result, (void)++__first)
     *__result = *__first;
   return __result;
 }
    };


  template<typename _Category>
    struct __copy_move<true, false, _Category>
    {
      template<typename _II, typename _OI>
 static _OI
 __copy_m(_II __first, _II __last, _OI __result)
 {
   for (; __first != __last; ++__result, (void)++__first)
     *__result = std::move(*__first);
   return __result;
 }
    };


  template<>
    struct __copy_move<false, false, random_access_iterator_tag>
    {
      template<typename _II, typename _OI>
 static _OI
 __copy_m(_II __first, _II __last, _OI __result)
 {
   typedef typename iterator_traits<_II>::difference_type _Distance;
   for(_Distance __n = __last - __first; __n > 0; --__n)
     {
       *__result = *__first;
       ++__first;
       ++__result;
     }
   return __result;
 }
    };


  template<>
    struct __copy_move<true, false, random_access_iterator_tag>
    {
      template<typename _II, typename _OI>
 static _OI
 __copy_m(_II __first, _II __last, _OI __result)
 {
   typedef typename iterator_traits<_II>::difference_type _Distance;
   for(_Distance __n = __last - __first; __n > 0; --__n)
     {
       *__result = std::move(*__first);
       ++__first;
       ++__result;
     }
   return __result;
 }
    };


  template<bool _IsMove>
    struct __copy_move<_IsMove, true, random_access_iterator_tag>
    {
      template<typename _Tp>
 static _Tp*
 __copy_m(const _Tp* __first, const _Tp* __last, _Tp* __result)
 {

   using __assignable = conditional<_IsMove,
        is_move_assignable<_Tp>,
        is_copy_assignable<_Tp>>;

   static_assert( __assignable::type::value, "type is not assignable" );

   const ptrdiff_t _Num = __last - __first;
   if (_Num)
     __builtin_memmove(__result, __first, sizeof(_Tp) * _Num);
   return __result + _Num;
 }
    };

  template<bool _IsMove, typename _II, typename _OI>
    inline _OI
    __copy_move_a(_II __first, _II __last, _OI __result)
    {
      typedef typename iterator_traits<_II>::value_type _ValueTypeI;
      typedef typename iterator_traits<_OI>::value_type _ValueTypeO;
      typedef typename iterator_traits<_II>::iterator_category _Category;
      const bool __simple = (__is_trivially_copyable(_ValueTypeI)
        && __is_pointer<_II>::__value
        && __is_pointer<_OI>::__value
        && __are_same<_ValueTypeI, _ValueTypeO>::__value);

      return std::__copy_move<_IsMove, __simple,
         _Category>::__copy_m(__first, __last, __result);
    }



  template<typename _CharT>
    struct char_traits;

  template<typename _CharT, typename _Traits>
    class istreambuf_iterator;

  template<typename _CharT, typename _Traits>
    class ostreambuf_iterator;

  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
      ostreambuf_iterator<_CharT, char_traits<_CharT> > >::__type
    __copy_move_a2(_CharT*, _CharT*,
     ostreambuf_iterator<_CharT, char_traits<_CharT> >);

  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
      ostreambuf_iterator<_CharT, char_traits<_CharT> > >::__type
    __copy_move_a2(const _CharT*, const _CharT*,
     ostreambuf_iterator<_CharT, char_traits<_CharT> >);

  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
        _CharT*>::__type
    __copy_move_a2(istreambuf_iterator<_CharT, char_traits<_CharT> >,
     istreambuf_iterator<_CharT, char_traits<_CharT> >, _CharT*);

  template<bool _IsMove, typename _II, typename _OI>
    inline _OI
    __copy_move_a2(_II __first, _II __last, _OI __result)
    {
      return std::__niter_wrap(__result,
  std::__copy_move_a<_IsMove>(std::__niter_base(__first),
         std::__niter_base(__last),
         std::__niter_base(__result)));
    }
# 463 "/usr/include/c++/9/bits/stl_algobase.h" 3
  template<typename _II, typename _OI>
    inline _OI
    copy(_II __first, _II __last, _OI __result)
    {

     
     

      ;

      return std::__copy_move_a2<__is_move_iterator<_II>::__value>
      (std::__miter_base(__first), std::__miter_base(__last), __result);
    }
# 495 "/usr/include/c++/9/bits/stl_algobase.h" 3
  template<typename _II, typename _OI>
    inline _OI
    move(_II __first, _II __last, _OI __result)
    {

     
     

      ;

      return std::__copy_move_a2<true>(std::__miter_base(__first),
           std::__miter_base(__last), __result);
    }






  template<bool, bool, typename>
    struct __copy_move_backward
    {
      template<typename _BI1, typename _BI2>
 static _BI2
 __copy_move_b(_BI1 __first, _BI1 __last, _BI2 __result)
 {
   while (__first != __last)
     *--__result = *--__last;
   return __result;
 }
    };


  template<typename _Category>
    struct __copy_move_backward<true, false, _Category>
    {
      template<typename _BI1, typename _BI2>
 static _BI2
 __copy_move_b(_BI1 __first, _BI1 __last, _BI2 __result)
 {
   while (__first != __last)
     *--__result = std::move(*--__last);
   return __result;
 }
    };


  template<>
    struct __copy_move_backward<false, false, random_access_iterator_tag>
    {
      template<typename _BI1, typename _BI2>
 static _BI2
 __copy_move_b(_BI1 __first, _BI1 __last, _BI2 __result)
 {
   typename iterator_traits<_BI1>::difference_type __n;
   for (__n = __last - __first; __n > 0; --__n)
     *--__result = *--__last;
   return __result;
 }
    };


  template<>
    struct __copy_move_backward<true, false, random_access_iterator_tag>
    {
      template<typename _BI1, typename _BI2>
 static _BI2
 __copy_move_b(_BI1 __first, _BI1 __last, _BI2 __result)
 {
   typename iterator_traits<_BI1>::difference_type __n;
   for (__n = __last - __first; __n > 0; --__n)
     *--__result = std::move(*--__last);
   return __result;
 }
    };


  template<bool _IsMove>
    struct __copy_move_backward<_IsMove, true, random_access_iterator_tag>
    {
      template<typename _Tp>
 static _Tp*
 __copy_move_b(const _Tp* __first, const _Tp* __last, _Tp* __result)
 {

   using __assignable = conditional<_IsMove,
        is_move_assignable<_Tp>,
        is_copy_assignable<_Tp>>;

   static_assert( __assignable::type::value, "type is not assignable" );

   const ptrdiff_t _Num = __last - __first;
   if (_Num)
     __builtin_memmove(__result - _Num, __first, sizeof(_Tp) * _Num);
   return __result - _Num;
 }
    };

  template<bool _IsMove, typename _BI1, typename _BI2>
    inline _BI2
    __copy_move_backward_a(_BI1 __first, _BI1 __last, _BI2 __result)
    {
      typedef typename iterator_traits<_BI1>::value_type _ValueType1;
      typedef typename iterator_traits<_BI2>::value_type _ValueType2;
      typedef typename iterator_traits<_BI1>::iterator_category _Category;
      const bool __simple = (__is_trivially_copyable(_ValueType1)
        && __is_pointer<_BI1>::__value
        && __is_pointer<_BI2>::__value
        && __are_same<_ValueType1, _ValueType2>::__value);

      return std::__copy_move_backward<_IsMove, __simple,
           _Category>::__copy_move_b(__first,
         __last,
         __result);
    }

  template<bool _IsMove, typename _BI1, typename _BI2>
    inline _BI2
    __copy_move_backward_a2(_BI1 __first, _BI1 __last, _BI2 __result)
    {
      return std::__niter_wrap(__result,
  std::__copy_move_backward_a<_IsMove>
    (std::__niter_base(__first), std::__niter_base(__last),
     std::__niter_base(__result)));
    }
# 639 "/usr/include/c++/9/bits/stl_algobase.h" 3
  template<typename _BI1, typename _BI2>
    inline _BI2
    copy_backward(_BI1 __first, _BI1 __last, _BI2 __result)
    {

     
     
     


      ;

      return std::__copy_move_backward_a2<__is_move_iterator<_BI1>::__value>
      (std::__miter_base(__first), std::__miter_base(__last), __result);
    }
# 674 "/usr/include/c++/9/bits/stl_algobase.h" 3
  template<typename _BI1, typename _BI2>
    inline _BI2
    move_backward(_BI1 __first, _BI1 __last, _BI2 __result)
    {

     
     
     


      ;

      return std::__copy_move_backward_a2<true>(std::__miter_base(__first),
      std::__miter_base(__last),
      __result);
    }






  template<typename _ForwardIterator, typename _Tp>
    inline typename
    __gnu_cxx::__enable_if<!__is_scalar<_Tp>::__value, void>::__type
    __fill_a(_ForwardIterator __first, _ForwardIterator __last,
       const _Tp& __value)
    {
      for (; __first != __last; ++__first)
 *__first = __value;
    }

  template<typename _ForwardIterator, typename _Tp>
    inline typename
    __gnu_cxx::__enable_if<__is_scalar<_Tp>::__value, void>::__type
    __fill_a(_ForwardIterator __first, _ForwardIterator __last,
      const _Tp& __value)
    {
      const _Tp __tmp = __value;
      for (; __first != __last; ++__first)
 *__first = __tmp;
    }


  template<typename _Tp>
    inline typename
    __gnu_cxx::__enable_if<__is_byte<_Tp>::__value, void>::__type
    __fill_a(_Tp* __first, _Tp* __last, const _Tp& __c)
    {
      const _Tp __tmp = __c;
      if (const size_t __len = __last - __first)
 __builtin_memset(__first, static_cast<unsigned char>(__tmp), __len);
    }
# 740 "/usr/include/c++/9/bits/stl_algobase.h" 3
  template<typename _ForwardIterator, typename _Tp>
    inline void
    fill(_ForwardIterator __first, _ForwardIterator __last, const _Tp& __value)
    {

     

      ;

      std::__fill_a(std::__niter_base(__first), std::__niter_base(__last),
      __value);
    }

  template<typename _OutputIterator, typename _Size, typename _Tp>
    inline typename
    __gnu_cxx::__enable_if<!__is_scalar<_Tp>::__value, _OutputIterator>::__type
    __fill_n_a(_OutputIterator __first, _Size __n, const _Tp& __value)
    {
      for (__decltype(__n + 0) __niter = __n;
    __niter > 0; --__niter, (void) ++__first)
 *__first = __value;
      return __first;
    }

  template<typename _OutputIterator, typename _Size, typename _Tp>
    inline typename
    __gnu_cxx::__enable_if<__is_scalar<_Tp>::__value, _OutputIterator>::__type
    __fill_n_a(_OutputIterator __first, _Size __n, const _Tp& __value)
    {
      const _Tp __tmp = __value;
      for (__decltype(__n + 0) __niter = __n;
    __niter > 0; --__niter, (void) ++__first)
 *__first = __tmp;
      return __first;
    }

  template<typename _Size, typename _Tp>
    inline typename
    __gnu_cxx::__enable_if<__is_byte<_Tp>::__value, _Tp*>::__type
    __fill_n_a(_Tp* __first, _Size __n, const _Tp& __c)
    {
      std::__fill_a(__first, __first + __n, __c);
      return __first + __n;
    }
# 800 "/usr/include/c++/9/bits/stl_algobase.h" 3
  template<typename _OI, typename _Size, typename _Tp>
    inline _OI
    fill_n(_OI __first, _Size __n, const _Tp& __value)
    {

     
      ;

      return std::__niter_wrap(__first,
  std::__fill_n_a(std::__niter_base(__first), __n, __value));
    }

  template<bool _BoolType>
    struct __equal
    {
      template<typename _II1, typename _II2>
 static bool
 equal(_II1 __first1, _II1 __last1, _II2 __first2)
 {
   for (; __first1 != __last1; ++__first1, (void) ++__first2)
     if (!(*__first1 == *__first2))
       return false;
   return true;
 }
    };

  template<>
    struct __equal<true>
    {
      template<typename _Tp>
 static bool
 equal(const _Tp* __first1, const _Tp* __last1, const _Tp* __first2)
 {
   if (const size_t __len = (__last1 - __first1))
     return !__builtin_memcmp(__first1, __first2, sizeof(_Tp) * __len);
   return true;
 }
    };

  template<typename _II1, typename _II2>
    inline bool
    __equal_aux(_II1 __first1, _II1 __last1, _II2 __first2)
    {
      typedef typename iterator_traits<_II1>::value_type _ValueType1;
      typedef typename iterator_traits<_II2>::value_type _ValueType2;
      const bool __simple = ((__is_integer<_ValueType1>::__value
         || __is_pointer<_ValueType1>::__value)
        && __is_pointer<_II1>::__value
        && __is_pointer<_II2>::__value
        && __are_same<_ValueType1, _ValueType2>::__value);

      return std::__equal<__simple>::equal(__first1, __last1, __first2);
    }

  template<typename, typename>
    struct __lc_rai
    {
      template<typename _II1, typename _II2>
 static _II1
 __newlast1(_II1, _II1 __last1, _II2, _II2)
 { return __last1; }

      template<typename _II>
 static bool
 __cnd2(_II __first, _II __last)
 { return __first != __last; }
    };

  template<>
    struct __lc_rai<random_access_iterator_tag, random_access_iterator_tag>
    {
      template<typename _RAI1, typename _RAI2>
 static _RAI1
 __newlast1(_RAI1 __first1, _RAI1 __last1,
     _RAI2 __first2, _RAI2 __last2)
 {
   const typename iterator_traits<_RAI1>::difference_type
     __diff1 = __last1 - __first1;
   const typename iterator_traits<_RAI2>::difference_type
     __diff2 = __last2 - __first2;
   return __diff2 < __diff1 ? __first1 + __diff2 : __last1;
 }

      template<typename _RAI>
 static bool
 __cnd2(_RAI, _RAI)
 { return true; }
    };

  template<typename _II1, typename _II2, typename _Compare>
    bool
    __lexicographical_compare_impl(_II1 __first1, _II1 __last1,
       _II2 __first2, _II2 __last2,
       _Compare __comp)
    {
      typedef typename iterator_traits<_II1>::iterator_category _Category1;
      typedef typename iterator_traits<_II2>::iterator_category _Category2;
      typedef std::__lc_rai<_Category1, _Category2> __rai_type;

      __last1 = __rai_type::__newlast1(__first1, __last1, __first2, __last2);
      for (; __first1 != __last1 && __rai_type::__cnd2(__first2, __last2);
    ++__first1, (void)++__first2)
 {
   if (__comp(__first1, __first2))
     return true;
   if (__comp(__first2, __first1))
     return false;
 }
      return __first1 == __last1 && __first2 != __last2;
    }

  template<bool _BoolType>
    struct __lexicographical_compare
    {
      template<typename _II1, typename _II2>
 static bool __lc(_II1, _II1, _II2, _II2);
    };

  template<bool _BoolType>
    template<typename _II1, typename _II2>
      bool
      __lexicographical_compare<_BoolType>::
      __lc(_II1 __first1, _II1 __last1, _II2 __first2, _II2 __last2)
      {
 return std::__lexicographical_compare_impl(__first1, __last1,
         __first2, __last2,
     __gnu_cxx::__ops::__iter_less_iter());
      }

  template<>
    struct __lexicographical_compare<true>
    {
      template<typename _Tp, typename _Up>
 static bool
 __lc(const _Tp* __first1, const _Tp* __last1,
      const _Up* __first2, const _Up* __last2)
 {
   const size_t __len1 = __last1 - __first1;
   const size_t __len2 = __last2 - __first2;
   if (const size_t __len = std::min(__len1, __len2))
     if (int __result = __builtin_memcmp(__first1, __first2, __len))
       return __result < 0;
   return __len1 < __len2;
 }
    };

  template<typename _II1, typename _II2>
    inline bool
    __lexicographical_compare_aux(_II1 __first1, _II1 __last1,
      _II2 __first2, _II2 __last2)
    {
      typedef typename iterator_traits<_II1>::value_type _ValueType1;
      typedef typename iterator_traits<_II2>::value_type _ValueType2;
      const bool __simple =
 (__is_byte<_ValueType1>::__value && __is_byte<_ValueType2>::__value
  && !__gnu_cxx::__numeric_traits<_ValueType1>::__is_signed
  && !__gnu_cxx::__numeric_traits<_ValueType2>::__is_signed
  && __is_pointer<_II1>::__value
  && __is_pointer<_II2>::__value);

      return std::__lexicographical_compare<__simple>::__lc(__first1, __last1,
           __first2, __last2);
    }

  template<typename _ForwardIterator, typename _Tp, typename _Compare>
    _ForwardIterator
    __lower_bound(_ForwardIterator __first, _ForwardIterator __last,
    const _Tp& __val, _Compare __comp)
    {
      typedef typename iterator_traits<_ForwardIterator>::difference_type
 _DistanceType;

      _DistanceType __len = std::distance(__first, __last);

      while (__len > 0)
 {
   _DistanceType __half = __len >> 1;
   _ForwardIterator __middle = __first;
   std::advance(__middle, __half);
   if (__comp(__middle, __val))
     {
       __first = __middle;
       ++__first;
       __len = __len - __half - 1;
     }
   else
     __len = __half;
 }
      return __first;
    }
# 1002 "/usr/include/c++/9/bits/stl_algobase.h" 3
  template<typename _ForwardIterator, typename _Tp>
    inline _ForwardIterator
    lower_bound(_ForwardIterator __first, _ForwardIterator __last,
  const _Tp& __val)
    {

     
     

      ;

      return std::__lower_bound(__first, __last, __val,
    __gnu_cxx::__ops::__iter_less_val());
    }



  inline constexpr int
  __lg(int __n)
  { return (int)sizeof(int) * 8 - 1 - __builtin_clz(__n); }

  inline constexpr unsigned
  __lg(unsigned __n)
  { return (int)sizeof(int) * 8 - 1 - __builtin_clz(__n); }

  inline constexpr long
  __lg(long __n)
  { return (int)sizeof(long) * 8 - 1 - __builtin_clzl(__n); }

  inline constexpr unsigned long
  __lg(unsigned long __n)
  { return (int)sizeof(long) * 8 - 1 - __builtin_clzl(__n); }

  inline constexpr long long
  __lg(long long __n)
  { return (int)sizeof(long long) * 8 - 1 - __builtin_clzll(__n); }

  inline constexpr unsigned long long
  __lg(unsigned long long __n)
  { return (int)sizeof(long long) * 8 - 1 - __builtin_clzll(__n); }


# 1057 "/usr/include/c++/9/bits/stl_algobase.h" 3
  template<typename _II1, typename _II2>
    inline bool
    equal(_II1 __first1, _II1 __last1, _II2 __first2)
    {

     
     
     


      ;

      return std::__equal_aux(std::__niter_base(__first1),
         std::__niter_base(__last1),
         std::__niter_base(__first2));
    }
# 1089 "/usr/include/c++/9/bits/stl_algobase.h" 3
  template<typename _IIter1, typename _IIter2, typename _BinaryPredicate>
    inline bool
    equal(_IIter1 __first1, _IIter1 __last1,
   _IIter2 __first2, _BinaryPredicate __binary_pred)
    {

     
     
      ;

      for (; __first1 != __last1; ++__first1, (void)++__first2)
 if (!bool(__binary_pred(*__first1, *__first2)))
   return false;
      return true;
    }



  template<typename _II1, typename _II2>
    inline bool
    __equal4(_II1 __first1, _II1 __last1, _II2 __first2, _II2 __last2)
    {
      using _RATag = random_access_iterator_tag;
      using _Cat1 = typename iterator_traits<_II1>::iterator_category;
      using _Cat2 = typename iterator_traits<_II2>::iterator_category;
      using _RAIters = __and_<is_same<_Cat1, _RATag>, is_same<_Cat2, _RATag>>;
      if (_RAIters())
 {
   auto __d1 = std::distance(__first1, __last1);
   auto __d2 = std::distance(__first2, __last2);
   if (__d1 != __d2)
     return false;
   return std::equal(__first1, __last1, __first2);
 }

      for (; __first1 != __last1 && __first2 != __last2;
   ++__first1, (void)++__first2)
 if (!(*__first1 == *__first2))
   return false;
      return __first1 == __last1 && __first2 == __last2;
    }


  template<typename _II1, typename _II2, typename _BinaryPredicate>
    inline bool
    __equal4(_II1 __first1, _II1 __last1, _II2 __first2, _II2 __last2,
      _BinaryPredicate __binary_pred)
    {
      using _RATag = random_access_iterator_tag;
      using _Cat1 = typename iterator_traits<_II1>::iterator_category;
      using _Cat2 = typename iterator_traits<_II2>::iterator_category;
      using _RAIters = __and_<is_same<_Cat1, _RATag>, is_same<_Cat2, _RATag>>;
      if (_RAIters())
 {
   auto __d1 = std::distance(__first1, __last1);
   auto __d2 = std::distance(__first2, __last2);
   if (__d1 != __d2)
     return false;
   return std::equal(__first1, __last1, __first2,
           __binary_pred);
 }

      for (; __first1 != __last1 && __first2 != __last2;
   ++__first1, (void)++__first2)
 if (!bool(__binary_pred(*__first1, *__first2)))
   return false;
      return __first1 == __last1 && __first2 == __last2;
    }
# 1176 "/usr/include/c++/9/bits/stl_algobase.h" 3
  template<typename _II1, typename _II2>
    inline bool
    equal(_II1 __first1, _II1 __last1, _II2 __first2, _II2 __last2)
    {

     
     
     


      ;
      ;

      return std::__equal4(__first1, __last1, __first2, __last2);
    }
# 1208 "/usr/include/c++/9/bits/stl_algobase.h" 3
  template<typename _IIter1, typename _IIter2, typename _BinaryPredicate>
    inline bool
    equal(_IIter1 __first1, _IIter1 __last1,
   _IIter2 __first2, _IIter2 __last2, _BinaryPredicate __binary_pred)
    {

     
     
      ;
      ;

      return std::__equal4(__first1, __last1, __first2, __last2,
          __binary_pred);
    }
# 1239 "/usr/include/c++/9/bits/stl_algobase.h" 3
  template<typename _II1, typename _II2>
    inline bool
    lexicographical_compare(_II1 __first1, _II1 __last1,
       _II2 __first2, _II2 __last2)
    {





     
     
     
     
      ;
      ;

      return std::__lexicographical_compare_aux(std::__niter_base(__first1),
      std::__niter_base(__last1),
      std::__niter_base(__first2),
      std::__niter_base(__last2));
    }
# 1275 "/usr/include/c++/9/bits/stl_algobase.h" 3
  template<typename _II1, typename _II2, typename _Compare>
    inline bool
    lexicographical_compare(_II1 __first1, _II1 __last1,
       _II2 __first2, _II2 __last2, _Compare __comp)
    {

     
     
      ;
      ;

      return std::__lexicographical_compare_impl
 (__first1, __last1, __first2, __last2,
  __gnu_cxx::__ops::__iter_comp_iter(__comp));
    }

  template<typename _InputIterator1, typename _InputIterator2,
    typename _BinaryPredicate>
    pair<_InputIterator1, _InputIterator2>
    __mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
        _InputIterator2 __first2, _BinaryPredicate __binary_pred)
    {
      while (__first1 != __last1 && __binary_pred(__first1, __first2))
 {
   ++__first1;
   ++__first2;
 }
      return pair<_InputIterator1, _InputIterator2>(__first1, __first2);
    }
# 1318 "/usr/include/c++/9/bits/stl_algobase.h" 3
  template<typename _InputIterator1, typename _InputIterator2>
    inline pair<_InputIterator1, _InputIterator2>
    mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
      _InputIterator2 __first2)
    {

     
     
     


      ;

      return std::__mismatch(__first1, __last1, __first2,
        __gnu_cxx::__ops::__iter_equal_to_iter());
    }
# 1351 "/usr/include/c++/9/bits/stl_algobase.h" 3
  template<typename _InputIterator1, typename _InputIterator2,
    typename _BinaryPredicate>
    inline pair<_InputIterator1, _InputIterator2>
    mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
      _InputIterator2 __first2, _BinaryPredicate __binary_pred)
    {

     
     
      ;

      return std::__mismatch(__first1, __last1, __first2,
 __gnu_cxx::__ops::__iter_comp_iter(__binary_pred));
    }



  template<typename _InputIterator1, typename _InputIterator2,
    typename _BinaryPredicate>
    pair<_InputIterator1, _InputIterator2>
    __mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
        _InputIterator2 __first2, _InputIterator2 __last2,
        _BinaryPredicate __binary_pred)
    {
      while (__first1 != __last1 && __first2 != __last2
      && __binary_pred(__first1, __first2))
 {
   ++__first1;
   ++__first2;
 }
      return pair<_InputIterator1, _InputIterator2>(__first1, __first2);
    }
# 1398 "/usr/include/c++/9/bits/stl_algobase.h" 3
  template<typename _InputIterator1, typename _InputIterator2>
    inline pair<_InputIterator1, _InputIterator2>
    mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
      _InputIterator2 __first2, _InputIterator2 __last2)
    {

     
     
     


      ;
      ;

      return std::__mismatch(__first1, __last1, __first2, __last2,
        __gnu_cxx::__ops::__iter_equal_to_iter());
    }
# 1433 "/usr/include/c++/9/bits/stl_algobase.h" 3
  template<typename _InputIterator1, typename _InputIterator2,
    typename _BinaryPredicate>
    inline pair<_InputIterator1, _InputIterator2>
    mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
      _InputIterator2 __first2, _InputIterator2 __last2,
      _BinaryPredicate __binary_pred)
    {

     
     
      ;
      ;

      return std::__mismatch(__first1, __last1, __first2, __last2,
        __gnu_cxx::__ops::__iter_comp_iter(__binary_pred));
    }




}
# 46 "/usr/include/c++/9/bits/specfun.h" 2 3
# 1 "/usr/include/c++/9/limits" 1 3
# 40 "/usr/include/c++/9/limits" 3
       
# 41 "/usr/include/c++/9/limits" 3
# 158 "/usr/include/c++/9/limits" 3
namespace std __attribute__ ((__visibility__ ("default")))
{







  enum float_round_style
  {
    round_indeterminate = -1,
    round_toward_zero = 0,
    round_to_nearest = 1,
    round_toward_infinity = 2,
    round_toward_neg_infinity = 3
  };







  enum float_denorm_style
  {

    denorm_indeterminate = -1,

    denorm_absent = 0,

    denorm_present = 1
  };
# 202 "/usr/include/c++/9/limits" 3
  struct __numeric_limits_base
  {


    static constexpr bool is_specialized = false;




    static constexpr int digits = 0;


    static constexpr int digits10 = 0;




    static constexpr int max_digits10 = 0;



    static constexpr bool is_signed = false;


    static constexpr bool is_integer = false;




    static constexpr bool is_exact = false;



    static constexpr int radix = 0;



    static constexpr int min_exponent = 0;



    static constexpr int min_exponent10 = 0;




    static constexpr int max_exponent = 0;



    static constexpr int max_exponent10 = 0;


    static constexpr bool has_infinity = false;



    static constexpr bool has_quiet_NaN = false;



    static constexpr bool has_signaling_NaN = false;


    static constexpr float_denorm_style has_denorm = denorm_absent;



    static constexpr bool has_denorm_loss = false;



    static constexpr bool is_iec559 = false;




    static constexpr bool is_bounded = false;
# 288 "/usr/include/c++/9/limits" 3
    static constexpr bool is_modulo = false;


    static constexpr bool traps = false;


    static constexpr bool tinyness_before = false;




    static constexpr float_round_style round_style =
          round_toward_zero;
  };
# 311 "/usr/include/c++/9/limits" 3
  template<typename _Tp>
    struct numeric_limits : public __numeric_limits_base
    {


      static constexpr _Tp
      min() noexcept { return _Tp(); }


      static constexpr _Tp
      max() noexcept { return _Tp(); }




      static constexpr _Tp
      lowest() noexcept { return _Tp(); }




      static constexpr _Tp
      epsilon() noexcept { return _Tp(); }


      static constexpr _Tp
      round_error() noexcept { return _Tp(); }


      static constexpr _Tp
      infinity() noexcept { return _Tp(); }



      static constexpr _Tp
      quiet_NaN() noexcept { return _Tp(); }



      static constexpr _Tp
      signaling_NaN() noexcept { return _Tp(); }




      static constexpr _Tp
      denorm_min() noexcept { return _Tp(); }
    };




  template<typename _Tp>
    struct numeric_limits<const _Tp>
    : public numeric_limits<_Tp> { };

  template<typename _Tp>
    struct numeric_limits<volatile _Tp>
    : public numeric_limits<_Tp> { };

  template<typename _Tp>
    struct numeric_limits<const volatile _Tp>
    : public numeric_limits<_Tp> { };
# 383 "/usr/include/c++/9/limits" 3
  template<>
    struct numeric_limits<bool>
    {
      static constexpr bool is_specialized = true;

      static constexpr bool
      min() noexcept { return false; }

      static constexpr bool
      max() noexcept { return true; }


      static constexpr bool
      lowest() noexcept { return min(); }

      static constexpr int digits = 1;
      static constexpr int digits10 = 0;

      static constexpr int max_digits10 = 0;

      static constexpr bool is_signed = false;
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr bool
      epsilon() noexcept { return false; }

      static constexpr bool
      round_error() noexcept { return false; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
       = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr bool
      infinity() noexcept { return false; }

      static constexpr bool
      quiet_NaN() noexcept { return false; }

      static constexpr bool
      signaling_NaN() noexcept { return false; }

      static constexpr bool
      denorm_min() noexcept { return false; }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = false;




      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<char>
    {
      static constexpr bool is_specialized = true;

      static constexpr char
      min() noexcept { return (((char)(-1) < 0) ? -(((char)(-1) < 0) ? (((((char)1 << ((sizeof(char) * 8 - ((char)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(char)0) - 1 : (char)0); }

      static constexpr char
      max() noexcept { return (((char)(-1) < 0) ? (((((char)1 << ((sizeof(char) * 8 - ((char)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(char)0); }


      static constexpr char
      lowest() noexcept { return min(); }


      static constexpr int digits = (sizeof(char) * 8 - ((char)(-1) < 0));
      static constexpr int digits10 = ((sizeof(char) * 8 - ((char)(-1) < 0)) * 643L / 2136);

      static constexpr int max_digits10 = 0;

      static constexpr bool is_signed = ((char)(-1) < 0);
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr char
      epsilon() noexcept { return 0; }

      static constexpr char
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
       = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr
      char infinity() noexcept { return char(); }

      static constexpr char
      quiet_NaN() noexcept { return char(); }

      static constexpr char
      signaling_NaN() noexcept { return char(); }

      static constexpr char
      denorm_min() noexcept { return static_cast<char>(0); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = !is_signed;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<signed char>
    {
      static constexpr bool is_specialized = true;

      static constexpr signed char
      min() noexcept { return -0x7f - 1; }

      static constexpr signed char
      max() noexcept { return 0x7f; }


      static constexpr signed char
      lowest() noexcept { return min(); }


      static constexpr int digits = (sizeof(signed char) * 8 - ((signed char)(-1) < 0));
      static constexpr int digits10
       = ((sizeof(signed char) * 8 - ((signed char)(-1) < 0)) * 643L / 2136);

      static constexpr int max_digits10 = 0;

      static constexpr bool is_signed = true;
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr signed char
      epsilon() noexcept { return 0; }

      static constexpr signed char
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
       = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr signed char
      infinity() noexcept { return static_cast<signed char>(0); }

      static constexpr signed char
      quiet_NaN() noexcept { return static_cast<signed char>(0); }

      static constexpr signed char
      signaling_NaN() noexcept
      { return static_cast<signed char>(0); }

      static constexpr signed char
      denorm_min() noexcept
      { return static_cast<signed char>(0); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = false;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<unsigned char>
    {
      static constexpr bool is_specialized = true;

      static constexpr unsigned char
      min() noexcept { return 0; }

      static constexpr unsigned char
      max() noexcept { return 0x7f * 2U + 1; }


      static constexpr unsigned char
      lowest() noexcept { return min(); }


      static constexpr int digits
       = (sizeof(unsigned char) * 8 - ((unsigned char)(-1) < 0));
      static constexpr int digits10
       = ((sizeof(unsigned char) * 8 - ((unsigned char)(-1) < 0)) * 643L / 2136);

      static constexpr int max_digits10 = 0;

      static constexpr bool is_signed = false;
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr unsigned char
      epsilon() noexcept { return 0; }

      static constexpr unsigned char
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
       = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr unsigned char
      infinity() noexcept
      { return static_cast<unsigned char>(0); }

      static constexpr unsigned char
      quiet_NaN() noexcept
      { return static_cast<unsigned char>(0); }

      static constexpr unsigned char
      signaling_NaN() noexcept
      { return static_cast<unsigned char>(0); }

      static constexpr unsigned char
      denorm_min() noexcept
      { return static_cast<unsigned char>(0); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = true;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<wchar_t>
    {
      static constexpr bool is_specialized = true;

      static constexpr wchar_t
      min() noexcept { return (((wchar_t)(-1) < 0) ? -(((wchar_t)(-1) < 0) ? (((((wchar_t)1 << ((sizeof(wchar_t) * 8 - ((wchar_t)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(wchar_t)0) - 1 : (wchar_t)0); }

      static constexpr wchar_t
      max() noexcept { return (((wchar_t)(-1) < 0) ? (((((wchar_t)1 << ((sizeof(wchar_t) * 8 - ((wchar_t)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(wchar_t)0); }


      static constexpr wchar_t
      lowest() noexcept { return min(); }


      static constexpr int digits = (sizeof(wchar_t) * 8 - ((wchar_t)(-1) < 0));
      static constexpr int digits10
       = ((sizeof(wchar_t) * 8 - ((wchar_t)(-1) < 0)) * 643L / 2136);

      static constexpr int max_digits10 = 0;

      static constexpr bool is_signed = ((wchar_t)(-1) < 0);
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr wchar_t
      epsilon() noexcept { return 0; }

      static constexpr wchar_t
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
       = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr wchar_t
      infinity() noexcept { return wchar_t(); }

      static constexpr wchar_t
      quiet_NaN() noexcept { return wchar_t(); }

      static constexpr wchar_t
      signaling_NaN() noexcept { return wchar_t(); }

      static constexpr wchar_t
      denorm_min() noexcept { return wchar_t(); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = !is_signed;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
       = round_toward_zero;
    };
# 796 "/usr/include/c++/9/limits" 3
  template<>
    struct numeric_limits<char16_t>
    {
      static constexpr bool is_specialized = true;

      static constexpr char16_t
      min() noexcept { return (((char16_t)(-1) < 0) ? -(((char16_t)(-1) < 0) ? (((((char16_t)1 << ((sizeof(char16_t) * 8 - ((char16_t)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(char16_t)0) - 1 : (char16_t)0); }

      static constexpr char16_t
      max() noexcept { return (((char16_t)(-1) < 0) ? (((((char16_t)1 << ((sizeof(char16_t) * 8 - ((char16_t)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(char16_t)0); }

      static constexpr char16_t
      lowest() noexcept { return min(); }

      static constexpr int digits = (sizeof(char16_t) * 8 - ((char16_t)(-1) < 0));
      static constexpr int digits10 = ((sizeof(char16_t) * 8 - ((char16_t)(-1) < 0)) * 643L / 2136);
      static constexpr int max_digits10 = 0;
      static constexpr bool is_signed = ((char16_t)(-1) < 0);
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr char16_t
      epsilon() noexcept { return 0; }

      static constexpr char16_t
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr char16_t
      infinity() noexcept { return char16_t(); }

      static constexpr char16_t
      quiet_NaN() noexcept { return char16_t(); }

      static constexpr char16_t
      signaling_NaN() noexcept { return char16_t(); }

      static constexpr char16_t
      denorm_min() noexcept { return char16_t(); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = !is_signed;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style = round_toward_zero;
    };


  template<>
    struct numeric_limits<char32_t>
    {
      static constexpr bool is_specialized = true;

      static constexpr char32_t
      min() noexcept { return (((char32_t)(-1) < 0) ? -(((char32_t)(-1) < 0) ? (((((char32_t)1 << ((sizeof(char32_t) * 8 - ((char32_t)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(char32_t)0) - 1 : (char32_t)0); }

      static constexpr char32_t
      max() noexcept { return (((char32_t)(-1) < 0) ? (((((char32_t)1 << ((sizeof(char32_t) * 8 - ((char32_t)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(char32_t)0); }

      static constexpr char32_t
      lowest() noexcept { return min(); }

      static constexpr int digits = (sizeof(char32_t) * 8 - ((char32_t)(-1) < 0));
      static constexpr int digits10 = ((sizeof(char32_t) * 8 - ((char32_t)(-1) < 0)) * 643L / 2136);
      static constexpr int max_digits10 = 0;
      static constexpr bool is_signed = ((char32_t)(-1) < 0);
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr char32_t
      epsilon() noexcept { return 0; }

      static constexpr char32_t
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr char32_t
      infinity() noexcept { return char32_t(); }

      static constexpr char32_t
      quiet_NaN() noexcept { return char32_t(); }

      static constexpr char32_t
      signaling_NaN() noexcept { return char32_t(); }

      static constexpr char32_t
      denorm_min() noexcept { return char32_t(); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = !is_signed;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style = round_toward_zero;
    };



  template<>
    struct numeric_limits<short>
    {
      static constexpr bool is_specialized = true;

      static constexpr short
      min() noexcept { return -0x7fff - 1; }

      static constexpr short
      max() noexcept { return 0x7fff; }


      static constexpr short
      lowest() noexcept { return min(); }


      static constexpr int digits = (sizeof(short) * 8 - ((short)(-1) < 0));
      static constexpr int digits10 = ((sizeof(short) * 8 - ((short)(-1) < 0)) * 643L / 2136);

      static constexpr int max_digits10 = 0;

      static constexpr bool is_signed = true;
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr short
      epsilon() noexcept { return 0; }

      static constexpr short
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
       = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr short
      infinity() noexcept { return short(); }

      static constexpr short
      quiet_NaN() noexcept { return short(); }

      static constexpr short
      signaling_NaN() noexcept { return short(); }

      static constexpr short
      denorm_min() noexcept { return short(); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = false;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<unsigned short>
    {
      static constexpr bool is_specialized = true;

      static constexpr unsigned short
      min() noexcept { return 0; }

      static constexpr unsigned short
      max() noexcept { return 0x7fff * 2U + 1; }


      static constexpr unsigned short
      lowest() noexcept { return min(); }


      static constexpr int digits
       = (sizeof(unsigned short) * 8 - ((unsigned short)(-1) < 0));
      static constexpr int digits10
       = ((sizeof(unsigned short) * 8 - ((unsigned short)(-1) < 0)) * 643L / 2136);

      static constexpr int max_digits10 = 0;

      static constexpr bool is_signed = false;
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr unsigned short
      epsilon() noexcept { return 0; }

      static constexpr unsigned short
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
       = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr unsigned short
      infinity() noexcept
      { return static_cast<unsigned short>(0); }

      static constexpr unsigned short
      quiet_NaN() noexcept
      { return static_cast<unsigned short>(0); }

      static constexpr unsigned short
      signaling_NaN() noexcept
      { return static_cast<unsigned short>(0); }

      static constexpr unsigned short
      denorm_min() noexcept
      { return static_cast<unsigned short>(0); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = true;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<int>
    {
      static constexpr bool is_specialized = true;

      static constexpr int
      min() noexcept { return -0x7fffffff - 1; }

      static constexpr int
      max() noexcept { return 0x7fffffff; }


      static constexpr int
      lowest() noexcept { return min(); }


      static constexpr int digits = (sizeof(int) * 8 - ((int)(-1) < 0));
      static constexpr int digits10 = ((sizeof(int) * 8 - ((int)(-1) < 0)) * 643L / 2136);

      static constexpr int max_digits10 = 0;

      static constexpr bool is_signed = true;
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr int
      epsilon() noexcept { return 0; }

      static constexpr int
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
       = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr int
      infinity() noexcept { return static_cast<int>(0); }

      static constexpr int
      quiet_NaN() noexcept { return static_cast<int>(0); }

      static constexpr int
      signaling_NaN() noexcept { return static_cast<int>(0); }

      static constexpr int
      denorm_min() noexcept { return static_cast<int>(0); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = false;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<unsigned int>
    {
      static constexpr bool is_specialized = true;

      static constexpr unsigned int
      min() noexcept { return 0; }

      static constexpr unsigned int
      max() noexcept { return 0x7fffffff * 2U + 1; }


      static constexpr unsigned int
      lowest() noexcept { return min(); }


      static constexpr int digits
       = (sizeof(unsigned int) * 8 - ((unsigned int)(-1) < 0));
      static constexpr int digits10
       = ((sizeof(unsigned int) * 8 - ((unsigned int)(-1) < 0)) * 643L / 2136);

      static constexpr int max_digits10 = 0;

      static constexpr bool is_signed = false;
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr unsigned int
      epsilon() noexcept { return 0; }

      static constexpr unsigned int
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
       = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr unsigned int
      infinity() noexcept { return static_cast<unsigned int>(0); }

      static constexpr unsigned int
      quiet_NaN() noexcept
      { return static_cast<unsigned int>(0); }

      static constexpr unsigned int
      signaling_NaN() noexcept
      { return static_cast<unsigned int>(0); }

      static constexpr unsigned int
      denorm_min() noexcept
      { return static_cast<unsigned int>(0); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = true;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<long>
    {
      static constexpr bool is_specialized = true;

      static constexpr long
      min() noexcept { return -0x7fffffffffffffffL - 1; }

      static constexpr long
      max() noexcept { return 0x7fffffffffffffffL; }


      static constexpr long
      lowest() noexcept { return min(); }


      static constexpr int digits = (sizeof(long) * 8 - ((long)(-1) < 0));
      static constexpr int digits10 = ((sizeof(long) * 8 - ((long)(-1) < 0)) * 643L / 2136);

      static constexpr int max_digits10 = 0;

      static constexpr bool is_signed = true;
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr long
      epsilon() noexcept { return 0; }

      static constexpr long
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
       = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr long
      infinity() noexcept { return static_cast<long>(0); }

      static constexpr long
      quiet_NaN() noexcept { return static_cast<long>(0); }

      static constexpr long
      signaling_NaN() noexcept { return static_cast<long>(0); }

      static constexpr long
      denorm_min() noexcept { return static_cast<long>(0); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = false;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<unsigned long>
    {
      static constexpr bool is_specialized = true;

      static constexpr unsigned long
      min() noexcept { return 0; }

      static constexpr unsigned long
      max() noexcept { return 0x7fffffffffffffffL * 2UL + 1; }


      static constexpr unsigned long
      lowest() noexcept { return min(); }


      static constexpr int digits
       = (sizeof(unsigned long) * 8 - ((unsigned long)(-1) < 0));
      static constexpr int digits10
       = ((sizeof(unsigned long) * 8 - ((unsigned long)(-1) < 0)) * 643L / 2136);

      static constexpr int max_digits10 = 0;

      static constexpr bool is_signed = false;
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr unsigned long
      epsilon() noexcept { return 0; }

      static constexpr unsigned long
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
       = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr unsigned long
      infinity() noexcept
      { return static_cast<unsigned long>(0); }

      static constexpr unsigned long
      quiet_NaN() noexcept
      { return static_cast<unsigned long>(0); }

      static constexpr unsigned long
      signaling_NaN() noexcept
      { return static_cast<unsigned long>(0); }

      static constexpr unsigned long
      denorm_min() noexcept
      { return static_cast<unsigned long>(0); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = true;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<long long>
    {
      static constexpr bool is_specialized = true;

      static constexpr long long
      min() noexcept { return -0x7fffffffffffffffLL - 1; }

      static constexpr long long
      max() noexcept { return 0x7fffffffffffffffLL; }


      static constexpr long long
      lowest() noexcept { return min(); }


      static constexpr int digits
       = (sizeof(long long) * 8 - ((long long)(-1) < 0));
      static constexpr int digits10
       = ((sizeof(long long) * 8 - ((long long)(-1) < 0)) * 643L / 2136);

      static constexpr int max_digits10 = 0;

      static constexpr bool is_signed = true;
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr long long
      epsilon() noexcept { return 0; }

      static constexpr long long
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
       = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr long long
      infinity() noexcept { return static_cast<long long>(0); }

      static constexpr long long
      quiet_NaN() noexcept { return static_cast<long long>(0); }

      static constexpr long long
      signaling_NaN() noexcept
      { return static_cast<long long>(0); }

      static constexpr long long
      denorm_min() noexcept { return static_cast<long long>(0); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = false;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<unsigned long long>
    {
      static constexpr bool is_specialized = true;

      static constexpr unsigned long long
      min() noexcept { return 0; }

      static constexpr unsigned long long
      max() noexcept { return 0x7fffffffffffffffLL * 2ULL + 1; }


      static constexpr unsigned long long
      lowest() noexcept { return min(); }


      static constexpr int digits
       = (sizeof(unsigned long long) * 8 - ((unsigned long long)(-1) < 0));
      static constexpr int digits10
       = ((sizeof(unsigned long long) * 8 - ((unsigned long long)(-1) < 0)) * 643L / 2136);

      static constexpr int max_digits10 = 0;

      static constexpr bool is_signed = false;
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr unsigned long long
      epsilon() noexcept { return 0; }

      static constexpr unsigned long long
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
       = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr unsigned long long
      infinity() noexcept
      { return static_cast<unsigned long long>(0); }

      static constexpr unsigned long long
      quiet_NaN() noexcept
      { return static_cast<unsigned long long>(0); }

      static constexpr unsigned long long
      signaling_NaN() noexcept
      { return static_cast<unsigned long long>(0); }

      static constexpr unsigned long long
      denorm_min() noexcept
      { return static_cast<unsigned long long>(0); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = true;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
       = round_toward_zero;
    };
# 1659 "/usr/include/c++/9/limits" 3
  template<>
    struct numeric_limits<float>
    {
      static constexpr bool is_specialized = true;

      static constexpr float
      min() noexcept { return 1.17549435082228750796873653722224568e-38F; }

      static constexpr float
      max() noexcept { return 3.40282346638528859811704183484516925e+38F; }


      static constexpr float
      lowest() noexcept { return -3.40282346638528859811704183484516925e+38F; }


      static constexpr int digits = 24;
      static constexpr int digits10 = 6;

      static constexpr int max_digits10
  = (2 + (24) * 643L / 2136);

      static constexpr bool is_signed = true;
      static constexpr bool is_integer = false;
      static constexpr bool is_exact = false;
      static constexpr int radix = 2;

      static constexpr float
      epsilon() noexcept { return 1.19209289550781250000000000000000000e-7F; }

      static constexpr float
      round_error() noexcept { return 0.5F; }

      static constexpr int min_exponent = (-125);
      static constexpr int min_exponent10 = (-37);
      static constexpr int max_exponent = 128;
      static constexpr int max_exponent10 = 38;

      static constexpr bool has_infinity = 1;
      static constexpr bool has_quiet_NaN = 1;
      static constexpr bool has_signaling_NaN = has_quiet_NaN;
      static constexpr float_denorm_style has_denorm
 = bool(1) ? denorm_present : denorm_absent;
      static constexpr bool has_denorm_loss
       = false;

      static constexpr float
      infinity() noexcept { return __builtin_huge_valf(); }

      static constexpr float
      quiet_NaN() noexcept { return __builtin_nanf(""); }

      static constexpr float
      signaling_NaN() noexcept { return __builtin_nansf(""); }

      static constexpr float
      denorm_min() noexcept { return 1.40129846432481707092372958328991613e-45F; }

      static constexpr bool is_iec559
 = has_infinity && has_quiet_NaN && has_denorm == denorm_present;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = false;

      static constexpr bool traps = false;
      static constexpr bool tinyness_before
       = false;
      static constexpr float_round_style round_style
       = round_to_nearest;
    };






  template<>
    struct numeric_limits<double>
    {
      static constexpr bool is_specialized = true;

      static constexpr double
      min() noexcept { return double(2.22507385850720138309023271733240406e-308L); }

      static constexpr double
      max() noexcept { return double(1.79769313486231570814527423731704357e+308L); }


      static constexpr double
      lowest() noexcept { return -double(1.79769313486231570814527423731704357e+308L); }


      static constexpr int digits = 53;
      static constexpr int digits10 = 15;

      static constexpr int max_digits10
  = (2 + (53) * 643L / 2136);

      static constexpr bool is_signed = true;
      static constexpr bool is_integer = false;
      static constexpr bool is_exact = false;
      static constexpr int radix = 2;

      static constexpr double
      epsilon() noexcept { return double(2.22044604925031308084726333618164062e-16L); }

      static constexpr double
      round_error() noexcept { return 0.5; }

      static constexpr int min_exponent = (-1021);
      static constexpr int min_exponent10 = (-307);
      static constexpr int max_exponent = 1024;
      static constexpr int max_exponent10 = 308;

      static constexpr bool has_infinity = 1;
      static constexpr bool has_quiet_NaN = 1;
      static constexpr bool has_signaling_NaN = has_quiet_NaN;
      static constexpr float_denorm_style has_denorm
 = bool(1) ? denorm_present : denorm_absent;
      static constexpr bool has_denorm_loss
        = false;

      static constexpr double
      infinity() noexcept { return __builtin_huge_val(); }

      static constexpr double
      quiet_NaN() noexcept { return __builtin_nan(""); }

      static constexpr double
      signaling_NaN() noexcept { return __builtin_nans(""); }

      static constexpr double
      denorm_min() noexcept { return double(4.94065645841246544176568792868221372e-324L); }

      static constexpr bool is_iec559
 = has_infinity && has_quiet_NaN && has_denorm == denorm_present;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = false;

      static constexpr bool traps = false;
      static constexpr bool tinyness_before
       = false;
      static constexpr float_round_style round_style
       = round_to_nearest;
    };






  template<>
    struct numeric_limits<long double>
    {
      static constexpr bool is_specialized = true;

      static constexpr long double
      min() noexcept { return 3.36210314311209350626267781732175260e-4932L; }

      static constexpr long double
      max() noexcept { return 1.18973149535723176502126385303097021e+4932L; }


      static constexpr long double
      lowest() noexcept { return -1.18973149535723176502126385303097021e+4932L; }


      static constexpr int digits = 64;
      static constexpr int digits10 = 18;

      static constexpr int max_digits10
  = (2 + (64) * 643L / 2136);

      static constexpr bool is_signed = true;
      static constexpr bool is_integer = false;
      static constexpr bool is_exact = false;
      static constexpr int radix = 2;

      static constexpr long double
      epsilon() noexcept { return 1.08420217248550443400745280086994171e-19L; }

      static constexpr long double
      round_error() noexcept { return 0.5L; }

      static constexpr int min_exponent = (-16381);
      static constexpr int min_exponent10 = (-4931);
      static constexpr int max_exponent = 16384;
      static constexpr int max_exponent10 = 4932;

      static constexpr bool has_infinity = 1;
      static constexpr bool has_quiet_NaN = 1;
      static constexpr bool has_signaling_NaN = has_quiet_NaN;
      static constexpr float_denorm_style has_denorm
 = bool(1) ? denorm_present : denorm_absent;
      static constexpr bool has_denorm_loss
 = false;

      static constexpr long double
      infinity() noexcept { return __builtin_huge_vall(); }

      static constexpr long double
      quiet_NaN() noexcept { return __builtin_nanl(""); }

      static constexpr long double
      signaling_NaN() noexcept { return __builtin_nansl(""); }

      static constexpr long double
      denorm_min() noexcept { return 3.64519953188247460252840593361941982e-4951L; }

      static constexpr bool is_iec559
 = has_infinity && has_quiet_NaN && has_denorm == denorm_present;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = false;

      static constexpr bool traps = false;
      static constexpr bool tinyness_before =
      false;
      static constexpr float_round_style round_style =
            round_to_nearest;
    };






}
# 47 "/usr/include/c++/9/bits/specfun.h" 2 3


# 1 "/usr/include/c++/9/tr1/gamma.tcc" 1 3
# 49 "/usr/include/c++/9/tr1/gamma.tcc" 3
# 1 "/usr/include/c++/9/tr1/special_function_util.h" 1 3
# 39 "/usr/include/c++/9/tr1/special_function_util.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{

# 50 "/usr/include/c++/9/tr1/special_function_util.h" 3
  namespace __detail
  {



    template<typename _Tp>
    struct __floating_point_constant
    {
      static const _Tp __value;
    };



    template<typename _Tp>
      struct __numeric_constants
      {

        static _Tp __pi() throw()
        { return static_cast<_Tp>(3.1415926535897932384626433832795029L); }

        static _Tp __pi_2() throw()
        { return static_cast<_Tp>(1.5707963267948966192313216916397514L); }

        static _Tp __pi_3() throw()
        { return static_cast<_Tp>(1.0471975511965977461542144610931676L); }

        static _Tp __pi_4() throw()
        { return static_cast<_Tp>(0.7853981633974483096156608458198757L); }

        static _Tp __1_pi() throw()
        { return static_cast<_Tp>(0.3183098861837906715377675267450287L); }

        static _Tp __2_sqrtpi() throw()
        { return static_cast<_Tp>(1.1283791670955125738961589031215452L); }

        static _Tp __sqrt2() throw()
        { return static_cast<_Tp>(1.4142135623730950488016887242096981L); }

        static _Tp __sqrt3() throw()
        { return static_cast<_Tp>(1.7320508075688772935274463415058723L); }

        static _Tp __sqrtpio2() throw()
        { return static_cast<_Tp>(1.2533141373155002512078826424055226L); }

        static _Tp __sqrt1_2() throw()
        { return static_cast<_Tp>(0.7071067811865475244008443621048490L); }

        static _Tp __lnpi() throw()
        { return static_cast<_Tp>(1.1447298858494001741434273513530587L); }

        static _Tp __gamma_e() throw()
        { return static_cast<_Tp>(0.5772156649015328606065120900824024L); }

        static _Tp __euler() throw()
        { return static_cast<_Tp>(2.7182818284590452353602874713526625L); }
      };
# 114 "/usr/include/c++/9/tr1/special_function_util.h" 3
    template<typename _Tp>
    inline bool __isnan(_Tp __x)
    { return std::isnan(__x); }
# 133 "/usr/include/c++/9/tr1/special_function_util.h" 3
  }





}
# 50 "/usr/include/c++/9/tr1/gamma.tcc" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{

# 65 "/usr/include/c++/9/tr1/gamma.tcc" 3
  namespace __detail
  {
# 76 "/usr/include/c++/9/tr1/gamma.tcc" 3
    template <typename _Tp>
    _Tp
    __bernoulli_series(unsigned int __n)
    {

      static const _Tp __num[28] = {
        _Tp(1UL), -_Tp(1UL) / _Tp(2UL),
        _Tp(1UL) / _Tp(6UL), _Tp(0UL),
        -_Tp(1UL) / _Tp(30UL), _Tp(0UL),
        _Tp(1UL) / _Tp(42UL), _Tp(0UL),
        -_Tp(1UL) / _Tp(30UL), _Tp(0UL),
        _Tp(5UL) / _Tp(66UL), _Tp(0UL),
        -_Tp(691UL) / _Tp(2730UL), _Tp(0UL),
        _Tp(7UL) / _Tp(6UL), _Tp(0UL),
        -_Tp(3617UL) / _Tp(510UL), _Tp(0UL),
        _Tp(43867UL) / _Tp(798UL), _Tp(0UL),
        -_Tp(174611) / _Tp(330UL), _Tp(0UL),
        _Tp(854513UL) / _Tp(138UL), _Tp(0UL),
        -_Tp(236364091UL) / _Tp(2730UL), _Tp(0UL),
        _Tp(8553103UL) / _Tp(6UL), _Tp(0UL)
      };

      if (__n == 0)
        return _Tp(1);

      if (__n == 1)
        return -_Tp(1) / _Tp(2);


      if (__n % 2 == 1)
        return _Tp(0);


      if (__n < 28)
        return __num[__n];


      _Tp __fact = _Tp(1);
      if ((__n / 2) % 2 == 0)
        __fact *= _Tp(-1);
      for (unsigned int __k = 1; __k <= __n; ++__k)
        __fact *= __k / (_Tp(2) * __numeric_constants<_Tp>::__pi());
      __fact *= _Tp(2);

      _Tp __sum = _Tp(0);
      for (unsigned int __i = 1; __i < 1000; ++__i)
        {
          _Tp __term = std::pow(_Tp(__i), -_Tp(__n));
          if (__term < std::numeric_limits<_Tp>::epsilon())
            break;
          __sum += __term;
        }

      return __fact * __sum;
    }
# 139 "/usr/include/c++/9/tr1/gamma.tcc" 3
    template<typename _Tp>
    inline _Tp
    __bernoulli(int __n)
    { return __bernoulli_series<_Tp>(__n); }
# 153 "/usr/include/c++/9/tr1/gamma.tcc" 3
    template<typename _Tp>
    _Tp
    __log_gamma_bernoulli(_Tp __x)
    {
      _Tp __lg = (__x - _Tp(0.5L)) * std::log(__x) - __x
               + _Tp(0.5L) * std::log(_Tp(2)
               * __numeric_constants<_Tp>::__pi());

      const _Tp __xx = __x * __x;
      _Tp __help = _Tp(1) / __x;
      for ( unsigned int __i = 1; __i < 20; ++__i )
        {
          const _Tp __2i = _Tp(2 * __i);
          __help /= __2i * (__2i - _Tp(1)) * __xx;
          __lg += __bernoulli<_Tp>(2 * __i) * __help;
        }

      return __lg;
    }
# 181 "/usr/include/c++/9/tr1/gamma.tcc" 3
    template<typename _Tp>
    _Tp
    __log_gamma_lanczos(_Tp __x)
    {
      const _Tp __xm1 = __x - _Tp(1);

      static const _Tp __lanczos_cheb_7[9] = {
       _Tp( 0.99999999999980993227684700473478L),
       _Tp( 676.520368121885098567009190444019L),
       _Tp(-1259.13921672240287047156078755283L),
       _Tp( 771.3234287776530788486528258894L),
       _Tp(-176.61502916214059906584551354L),
       _Tp( 12.507343278686904814458936853L),
       _Tp(-0.13857109526572011689554707L),
       _Tp( 9.984369578019570859563e-6L),
       _Tp( 1.50563273514931155834e-7L)
      };

      static const _Tp __LOGROOT2PI
          = _Tp(0.9189385332046727417803297364056176L);

      _Tp __sum = __lanczos_cheb_7[0];
      for(unsigned int __k = 1; __k < 9; ++__k)
        __sum += __lanczos_cheb_7[__k] / (__xm1 + __k);

      const _Tp __term1 = (__xm1 + _Tp(0.5L))
                        * std::log((__xm1 + _Tp(7.5L))
                       / __numeric_constants<_Tp>::__euler());
      const _Tp __term2 = __LOGROOT2PI + std::log(__sum);
      const _Tp __result = __term1 + (__term2 - _Tp(7));

      return __result;
    }
# 225 "/usr/include/c++/9/tr1/gamma.tcc" 3
    template<typename _Tp>
    _Tp
    __log_gamma(_Tp __x)
    {
      if (__x > _Tp(0.5L))
        return __log_gamma_lanczos(__x);
      else
        {
          const _Tp __sin_fact
                 = std::abs(std::sin(__numeric_constants<_Tp>::__pi() * __x));
          if (__sin_fact == _Tp(0))
            std::__throw_domain_error(("Argument is nonpositive integer " "in __log_gamma")
                                                           );
          return __numeric_constants<_Tp>::__lnpi()
                     - std::log(__sin_fact)
                     - __log_gamma_lanczos(_Tp(1) - __x);
        }
    }
# 252 "/usr/include/c++/9/tr1/gamma.tcc" 3
    template<typename _Tp>
    _Tp
    __log_gamma_sign(_Tp __x)
    {
      if (__x > _Tp(0))
        return _Tp(1);
      else
        {
          const _Tp __sin_fact
                  = std::sin(__numeric_constants<_Tp>::__pi() * __x);
          if (__sin_fact > _Tp(0))
            return (1);
          else if (__sin_fact < _Tp(0))
            return -_Tp(1);
          else
            return _Tp(0);
        }
    }
# 283 "/usr/include/c++/9/tr1/gamma.tcc" 3
    template<typename _Tp>
    _Tp
    __log_bincoef(unsigned int __n, unsigned int __k)
    {

      static const _Tp __max_bincoeff
                      = std::numeric_limits<_Tp>::max_exponent10
                      * std::log(_Tp(10)) - _Tp(1);

      _Tp __coeff = ::std::lgamma(_Tp(1 + __n))
                  - ::std::lgamma(_Tp(1 + __k))
                  - ::std::lgamma(_Tp(1 + __n - __k));





    }
# 314 "/usr/include/c++/9/tr1/gamma.tcc" 3
    template<typename _Tp>
    _Tp
    __bincoef(unsigned int __n, unsigned int __k)
    {

      static const _Tp __max_bincoeff
                      = std::numeric_limits<_Tp>::max_exponent10
                      * std::log(_Tp(10)) - _Tp(1);

      const _Tp __log_coeff = __log_bincoef<_Tp>(__n, __k);
      if (__log_coeff > __max_bincoeff)
        return std::numeric_limits<_Tp>::quiet_NaN();
      else
        return std::exp(__log_coeff);
    }
# 337 "/usr/include/c++/9/tr1/gamma.tcc" 3
    template<typename _Tp>
    inline _Tp
    __gamma(_Tp __x)
    { return std::exp(__log_gamma(__x)); }
# 356 "/usr/include/c++/9/tr1/gamma.tcc" 3
    template<typename _Tp>
    _Tp
    __psi_series(_Tp __x)
    {
      _Tp __sum = -__numeric_constants<_Tp>::__gamma_e() - _Tp(1) / __x;
      const unsigned int __max_iter = 100000;
      for (unsigned int __k = 1; __k < __max_iter; ++__k)
        {
          const _Tp __term = __x / (__k * (__k + __x));
          __sum += __term;
          if (std::abs(__term / __sum) < std::numeric_limits<_Tp>::epsilon())
            break;
        }
      return __sum;
    }
# 386 "/usr/include/c++/9/tr1/gamma.tcc" 3
    template<typename _Tp>
    _Tp
    __psi_asymp(_Tp __x)
    {
      _Tp __sum = std::log(__x) - _Tp(0.5L) / __x;
      const _Tp __xx = __x * __x;
      _Tp __xp = __xx;
      const unsigned int __max_iter = 100;
      for (unsigned int __k = 1; __k < __max_iter; ++__k)
        {
          const _Tp __term = __bernoulli<_Tp>(2 * __k) / (2 * __k * __xp);
          __sum -= __term;
          if (std::abs(__term / __sum) < std::numeric_limits<_Tp>::epsilon())
            break;
          __xp *= __xx;
        }
      return __sum;
    }
# 417 "/usr/include/c++/9/tr1/gamma.tcc" 3
    template<typename _Tp>
    _Tp
    __psi(_Tp __x)
    {
      const int __n = static_cast<int>(__x + 0.5L);
      const _Tp __eps = _Tp(4) * std::numeric_limits<_Tp>::epsilon();
      if (__n <= 0 && std::abs(__x - _Tp(__n)) < __eps)
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__x < _Tp(0))
        {
          const _Tp __pi = __numeric_constants<_Tp>::__pi();
          return __psi(_Tp(1) - __x)
               - __pi * std::cos(__pi * __x) / std::sin(__pi * __x);
        }
      else if (__x > _Tp(100))
        return __psi_asymp(__x);
      else
        return __psi_series(__x);
    }
# 446 "/usr/include/c++/9/tr1/gamma.tcc" 3
    template<typename _Tp>
    _Tp
    __psi(unsigned int __n, _Tp __x)
    {
      if (__x <= _Tp(0))
        std::__throw_domain_error(("Argument out of range " "in __psi")
                                                 );
      else if (__n == 0)
        return __psi(__x);
      else
        {
          const _Tp __hzeta = __hurwitz_zeta(_Tp(__n + 1), __x);

          const _Tp __ln_nfact = ::std::lgamma(_Tp(__n + 1));



          _Tp __result = std::exp(__ln_nfact) * __hzeta;
          if (__n % 2 == 1)
            __result = -__result;
          return __result;
        }
    }
  }






}
# 50 "/usr/include/c++/9/bits/specfun.h" 2 3
# 1 "/usr/include/c++/9/tr1/bessel_function.tcc" 1 3
# 55 "/usr/include/c++/9/tr1/bessel_function.tcc" 3
namespace std __attribute__ ((__visibility__ ("default")))
{

# 71 "/usr/include/c++/9/tr1/bessel_function.tcc" 3
  namespace __detail
  {
# 98 "/usr/include/c++/9/tr1/bessel_function.tcc" 3
    template <typename _Tp>
    void
    __gamma_temme(_Tp __mu,
                  _Tp & __gam1, _Tp & __gam2, _Tp & __gampl, _Tp & __gammi)
    {

      __gampl = _Tp(1) / ::std::tgamma(_Tp(1) + __mu);
      __gammi = _Tp(1) / ::std::tgamma(_Tp(1) - __mu);





      if (std::abs(__mu) < std::numeric_limits<_Tp>::epsilon())
        __gam1 = -_Tp(__numeric_constants<_Tp>::__gamma_e());
      else
        __gam1 = (__gammi - __gampl) / (_Tp(2) * __mu);

      __gam2 = (__gammi + __gampl) / (_Tp(2));

      return;
    }
# 136 "/usr/include/c++/9/tr1/bessel_function.tcc" 3
    template <typename _Tp>
    void
    __bessel_jn(_Tp __nu, _Tp __x,
                _Tp & __Jnu, _Tp & __Nnu, _Tp & __Jpnu, _Tp & __Npnu)
    {
      if (__x == _Tp(0))
        {
          if (__nu == _Tp(0))
            {
              __Jnu = _Tp(1);
              __Jpnu = _Tp(0);
            }
          else if (__nu == _Tp(1))
            {
              __Jnu = _Tp(0);
              __Jpnu = _Tp(0.5L);
            }
          else
            {
              __Jnu = _Tp(0);
              __Jpnu = _Tp(0);
            }
          __Nnu = -std::numeric_limits<_Tp>::infinity();
          __Npnu = std::numeric_limits<_Tp>::infinity();
          return;
        }

      const _Tp __eps = std::numeric_limits<_Tp>::epsilon();




      const _Tp __fp_min = std::sqrt(std::numeric_limits<_Tp>::min());
      const int __max_iter = 15000;
      const _Tp __x_min = _Tp(2);

      const int __nl = (__x < __x_min
                    ? static_cast<int>(__nu + _Tp(0.5L))
                    : std::max(0, static_cast<int>(__nu - __x + _Tp(1.5L))));

      const _Tp __mu = __nu - __nl;
      const _Tp __mu2 = __mu * __mu;
      const _Tp __xi = _Tp(1) / __x;
      const _Tp __xi2 = _Tp(2) * __xi;
      _Tp __w = __xi2 / __numeric_constants<_Tp>::__pi();
      int __isign = 1;
      _Tp __h = __nu * __xi;
      if (__h < __fp_min)
        __h = __fp_min;
      _Tp __b = __xi2 * __nu;
      _Tp __d = _Tp(0);
      _Tp __c = __h;
      int __i;
      for (__i = 1; __i <= __max_iter; ++__i)
        {
          __b += __xi2;
          __d = __b - __d;
          if (std::abs(__d) < __fp_min)
            __d = __fp_min;
          __c = __b - _Tp(1) / __c;
          if (std::abs(__c) < __fp_min)
            __c = __fp_min;
          __d = _Tp(1) / __d;
          const _Tp __del = __c * __d;
          __h *= __del;
          if (__d < _Tp(0))
            __isign = -__isign;
          if (std::abs(__del - _Tp(1)) < __eps)
            break;
        }
      if (__i > __max_iter)
        std::__throw_runtime_error(("Argument x too large in __bessel_jn; " "try asymptotic expansion.")
                                                                   );
      _Tp __Jnul = __isign * __fp_min;
      _Tp __Jpnul = __h * __Jnul;
      _Tp __Jnul1 = __Jnul;
      _Tp __Jpnu1 = __Jpnul;
      _Tp __fact = __nu * __xi;
      for ( int __l = __nl; __l >= 1; --__l )
        {
          const _Tp __Jnutemp = __fact * __Jnul + __Jpnul;
          __fact -= __xi;
          __Jpnul = __fact * __Jnutemp - __Jnul;
          __Jnul = __Jnutemp;
        }
      if (__Jnul == _Tp(0))
        __Jnul = __eps;
      _Tp __f= __Jpnul / __Jnul;
      _Tp __Nmu, __Nnu1, __Npmu, __Jmu;
      if (__x < __x_min)
        {
          const _Tp __x2 = __x / _Tp(2);
          const _Tp __pimu = __numeric_constants<_Tp>::__pi() * __mu;
          _Tp __fact = (std::abs(__pimu) < __eps
                      ? _Tp(1) : __pimu / std::sin(__pimu));
          _Tp __d = -std::log(__x2);
          _Tp __e = __mu * __d;
          _Tp __fact2 = (std::abs(__e) < __eps
                       ? _Tp(1) : std::sinh(__e) / __e);
          _Tp __gam1, __gam2, __gampl, __gammi;
          __gamma_temme(__mu, __gam1, __gam2, __gampl, __gammi);
          _Tp __ff = (_Tp(2) / __numeric_constants<_Tp>::__pi())
                   * __fact * (__gam1 * std::cosh(__e) + __gam2 * __fact2 * __d);
          __e = std::exp(__e);
          _Tp __p = __e / (__numeric_constants<_Tp>::__pi() * __gampl);
          _Tp __q = _Tp(1) / (__e * __numeric_constants<_Tp>::__pi() * __gammi);
          const _Tp __pimu2 = __pimu / _Tp(2);
          _Tp __fact3 = (std::abs(__pimu2) < __eps
                       ? _Tp(1) : std::sin(__pimu2) / __pimu2 );
          _Tp __r = __numeric_constants<_Tp>::__pi() * __pimu2 * __fact3 * __fact3;
          _Tp __c = _Tp(1);
          __d = -__x2 * __x2;
          _Tp __sum = __ff + __r * __q;
          _Tp __sum1 = __p;
          for (__i = 1; __i <= __max_iter; ++__i)
            {
              __ff = (__i * __ff + __p + __q) / (__i * __i - __mu2);
              __c *= __d / _Tp(__i);
              __p /= _Tp(__i) - __mu;
              __q /= _Tp(__i) + __mu;
              const _Tp __del = __c * (__ff + __r * __q);
              __sum += __del;
              const _Tp __del1 = __c * __p - __i * __del;
              __sum1 += __del1;
              if ( std::abs(__del) < __eps * (_Tp(1) + std::abs(__sum)) )
                break;
            }
          if ( __i > __max_iter )
            std::__throw_runtime_error(("Bessel y series failed to converge " "in __bessel_jn.")
                                                             );
          __Nmu = -__sum;
          __Nnu1 = -__sum1 * __xi2;
          __Npmu = __mu * __xi * __Nmu - __Nnu1;
          __Jmu = __w / (__Npmu - __f * __Nmu);
        }
      else
        {
          _Tp __a = _Tp(0.25L) - __mu2;
          _Tp __q = _Tp(1);
          _Tp __p = -__xi / _Tp(2);
          _Tp __br = _Tp(2) * __x;
          _Tp __bi = _Tp(2);
          _Tp __fact = __a * __xi / (__p * __p + __q * __q);
          _Tp __cr = __br + __q * __fact;
          _Tp __ci = __bi + __p * __fact;
          _Tp __den = __br * __br + __bi * __bi;
          _Tp __dr = __br / __den;
          _Tp __di = -__bi / __den;
          _Tp __dlr = __cr * __dr - __ci * __di;
          _Tp __dli = __cr * __di + __ci * __dr;
          _Tp __temp = __p * __dlr - __q * __dli;
          __q = __p * __dli + __q * __dlr;
          __p = __temp;
          int __i;
          for (__i = 2; __i <= __max_iter; ++__i)
            {
              __a += _Tp(2 * (__i - 1));
              __bi += _Tp(2);
              __dr = __a * __dr + __br;
              __di = __a * __di + __bi;
              if (std::abs(__dr) + std::abs(__di) < __fp_min)
                __dr = __fp_min;
              __fact = __a / (__cr * __cr + __ci * __ci);
              __cr = __br + __cr * __fact;
              __ci = __bi - __ci * __fact;
              if (std::abs(__cr) + std::abs(__ci) < __fp_min)
                __cr = __fp_min;
              __den = __dr * __dr + __di * __di;
              __dr /= __den;
              __di /= -__den;
              __dlr = __cr * __dr - __ci * __di;
              __dli = __cr * __di + __ci * __dr;
              __temp = __p * __dlr - __q * __dli;
              __q = __p * __dli + __q * __dlr;
              __p = __temp;
              if (std::abs(__dlr - _Tp(1)) + std::abs(__dli) < __eps)
                break;
          }
          if (__i > __max_iter)
            std::__throw_runtime_error(("Lentz's method failed " "in __bessel_jn.")
                                                             );
          const _Tp __gam = (__p - __f) / __q;
          __Jmu = std::sqrt(__w / ((__p - __f) * __gam + __q));

          __Jmu = ::std::copysign(__Jmu, __Jnul);




          __Nmu = __gam * __Jmu;
          __Npmu = (__p + __q / __gam) * __Nmu;
          __Nnu1 = __mu * __xi * __Nmu - __Npmu;
      }
      __fact = __Jmu / __Jnul;
      __Jnu = __fact * __Jnul1;
      __Jpnu = __fact * __Jpnu1;
      for (__i = 1; __i <= __nl; ++__i)
        {
          const _Tp __Nnutemp = (__mu + __i) * __xi2 * __Nnu1 - __Nmu;
          __Nmu = __Nnu1;
          __Nnu1 = __Nnutemp;
        }
      __Nnu = __Nmu;
      __Npnu = __nu * __xi * __Nmu - __Nnu1;

      return;
    }
# 361 "/usr/include/c++/9/tr1/bessel_function.tcc" 3
    template <typename _Tp>
    void
    __cyl_bessel_jn_asymp(_Tp __nu, _Tp __x, _Tp & __Jnu, _Tp & __Nnu)
    {
      const _Tp __mu = _Tp(4) * __nu * __nu;
      const _Tp __8x = _Tp(8) * __x;

      _Tp __P = _Tp(0);
      _Tp __Q = _Tp(0);

      _Tp __k = _Tp(0);
      _Tp __term = _Tp(1);

      int __epsP = 0;
      int __epsQ = 0;

      _Tp __eps = std::numeric_limits<_Tp>::epsilon();

      do
        {
          __term *= (__k == 0
                     ? _Tp(1)
                     : -(__mu - (2 * __k - 1) * (2 * __k - 1)) / (__k * __8x));

          __epsP = std::abs(__term) < __eps * std::abs(__P);
          __P += __term;

          __k++;

          __term *= (__mu - (2 * __k - 1) * (2 * __k - 1)) / (__k * __8x);
          __epsQ = std::abs(__term) < __eps * std::abs(__Q);
          __Q += __term;

          if (__epsP && __epsQ && __k > (__nu / 2.))
            break;

          __k++;
        }
      while (__k < 1000);

      const _Tp __chi = __x - (__nu + _Tp(0.5L))
                             * __numeric_constants<_Tp>::__pi_2();

      const _Tp __c = std::cos(__chi);
      const _Tp __s = std::sin(__chi);

      const _Tp __coef = std::sqrt(_Tp(2)
                             / (__numeric_constants<_Tp>::__pi() * __x));

      __Jnu = __coef * (__c * __P - __s * __Q);
      __Nnu = __coef * (__s * __P + __c * __Q);

      return;
    }
# 444 "/usr/include/c++/9/tr1/bessel_function.tcc" 3
    template <typename _Tp>
    _Tp
    __cyl_bessel_ij_series(_Tp __nu, _Tp __x, _Tp __sgn,
                           unsigned int __max_iter)
    {
      if (__x == _Tp(0))
 return __nu == _Tp(0) ? _Tp(1) : _Tp(0);

      const _Tp __x2 = __x / _Tp(2);
      _Tp __fact = __nu * std::log(__x2);

      __fact -= ::std::lgamma(__nu + _Tp(1));



      __fact = std::exp(__fact);
      const _Tp __xx4 = __sgn * __x2 * __x2;
      _Tp __Jn = _Tp(1);
      _Tp __term = _Tp(1);

      for (unsigned int __i = 1; __i < __max_iter; ++__i)
        {
          __term *= __xx4 / (_Tp(__i) * (__nu + _Tp(__i)));
          __Jn += __term;
          if (std::abs(__term / __Jn) < std::numeric_limits<_Tp>::epsilon())
            break;
        }

      return __fact * __Jn;
    }
# 490 "/usr/include/c++/9/tr1/bessel_function.tcc" 3
    template<typename _Tp>
    _Tp
    __cyl_bessel_j(_Tp __nu, _Tp __x)
    {
      if (__nu < _Tp(0) || __x < _Tp(0))
        std::__throw_domain_error(("Bad argument " "in __cyl_bessel_j.")
                                                           );
      else if (__isnan(__nu) || __isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__x * __x < _Tp(10) * (__nu + _Tp(1)))
        return __cyl_bessel_ij_series(__nu, __x, -_Tp(1), 200);
      else if (__x > _Tp(1000))
        {
          _Tp __J_nu, __N_nu;
          __cyl_bessel_jn_asymp(__nu, __x, __J_nu, __N_nu);
          return __J_nu;
        }
      else
        {
          _Tp __J_nu, __N_nu, __Jp_nu, __Np_nu;
          __bessel_jn(__nu, __x, __J_nu, __N_nu, __Jp_nu, __Np_nu);
          return __J_nu;
        }
    }
# 532 "/usr/include/c++/9/tr1/bessel_function.tcc" 3
    template<typename _Tp>
    _Tp
    __cyl_neumann_n(_Tp __nu, _Tp __x)
    {
      if (__nu < _Tp(0) || __x < _Tp(0))
        std::__throw_domain_error(("Bad argument " "in __cyl_neumann_n.")
                                                            );
      else if (__isnan(__nu) || __isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__x > _Tp(1000))
        {
          _Tp __J_nu, __N_nu;
          __cyl_bessel_jn_asymp(__nu, __x, __J_nu, __N_nu);
          return __N_nu;
        }
      else
        {
          _Tp __J_nu, __N_nu, __Jp_nu, __Np_nu;
          __bessel_jn(__nu, __x, __J_nu, __N_nu, __Jp_nu, __Np_nu);
          return __N_nu;
        }
    }
# 569 "/usr/include/c++/9/tr1/bessel_function.tcc" 3
    template <typename _Tp>
    void
    __sph_bessel_jn(unsigned int __n, _Tp __x,
                    _Tp & __j_n, _Tp & __n_n, _Tp & __jp_n, _Tp & __np_n)
    {
      const _Tp __nu = _Tp(__n) + _Tp(0.5L);

      _Tp __J_nu, __N_nu, __Jp_nu, __Np_nu;
      __bessel_jn(__nu, __x, __J_nu, __N_nu, __Jp_nu, __Np_nu);

      const _Tp __factor = __numeric_constants<_Tp>::__sqrtpio2()
                         / std::sqrt(__x);

      __j_n = __factor * __J_nu;
      __n_n = __factor * __N_nu;
      __jp_n = __factor * __Jp_nu - __j_n / (_Tp(2) * __x);
      __np_n = __factor * __Np_nu - __n_n / (_Tp(2) * __x);

      return;
    }
# 604 "/usr/include/c++/9/tr1/bessel_function.tcc" 3
    template <typename _Tp>
    _Tp
    __sph_bessel(unsigned int __n, _Tp __x)
    {
      if (__x < _Tp(0))
        std::__throw_domain_error(("Bad argument " "in __sph_bessel.")
                                                         );
      else if (__isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__x == _Tp(0))
        {
          if (__n == 0)
            return _Tp(1);
          else
            return _Tp(0);
        }
      else
        {
          _Tp __j_n, __n_n, __jp_n, __np_n;
          __sph_bessel_jn(__n, __x, __j_n, __n_n, __jp_n, __np_n);
          return __j_n;
        }
    }
# 642 "/usr/include/c++/9/tr1/bessel_function.tcc" 3
    template <typename _Tp>
    _Tp
    __sph_neumann(unsigned int __n, _Tp __x)
    {
      if (__x < _Tp(0))
        std::__throw_domain_error(("Bad argument " "in __sph_neumann.")
                                                          );
      else if (__isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__x == _Tp(0))
        return -std::numeric_limits<_Tp>::infinity();
      else
        {
          _Tp __j_n, __n_n, __jp_n, __np_n;
          __sph_bessel_jn(__n, __x, __j_n, __n_n, __jp_n, __np_n);
          return __n_n;
        }
    }
  }






}
# 51 "/usr/include/c++/9/bits/specfun.h" 2 3
# 1 "/usr/include/c++/9/tr1/beta_function.tcc" 1 3
# 49 "/usr/include/c++/9/tr1/beta_function.tcc" 3
namespace std __attribute__ ((__visibility__ ("default")))
{

# 65 "/usr/include/c++/9/tr1/beta_function.tcc" 3
  namespace __detail
  {
# 79 "/usr/include/c++/9/tr1/beta_function.tcc" 3
    template<typename _Tp>
    _Tp
    __beta_gamma(_Tp __x, _Tp __y)
    {

      _Tp __bet;

      if (__x > __y)
        {
          __bet = ::std::tgamma(__x)
                / ::std::tgamma(__x + __y);
          __bet *= ::std::tgamma(__y);
        }
      else
        {
          __bet = ::std::tgamma(__y)
                / ::std::tgamma(__x + __y);
          __bet *= ::std::tgamma(__x);
        }
# 111 "/usr/include/c++/9/tr1/beta_function.tcc" 3
      return __bet;
    }
# 127 "/usr/include/c++/9/tr1/beta_function.tcc" 3
    template<typename _Tp>
    _Tp
    __beta_lgamma(_Tp __x, _Tp __y)
    {

      _Tp __bet = ::std::lgamma(__x)
                + ::std::lgamma(__y)
                - ::std::lgamma(__x + __y);





      __bet = std::exp(__bet);
      return __bet;
    }
# 158 "/usr/include/c++/9/tr1/beta_function.tcc" 3
    template<typename _Tp>
    _Tp
    __beta_product(_Tp __x, _Tp __y)
    {

      _Tp __bet = (__x + __y) / (__x * __y);

      unsigned int __max_iter = 1000000;
      for (unsigned int __k = 1; __k < __max_iter; ++__k)
        {
          _Tp __term = (_Tp(1) + (__x + __y) / __k)
                     / ((_Tp(1) + __x / __k) * (_Tp(1) + __y / __k));
          __bet *= __term;
        }

      return __bet;
    }
# 189 "/usr/include/c++/9/tr1/beta_function.tcc" 3
    template<typename _Tp>
    inline _Tp
    __beta(_Tp __x, _Tp __y)
    {
      if (__isnan(__x) || __isnan(__y))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else
        return __beta_lgamma(__x, __y);
    }
  }






}
# 52 "/usr/include/c++/9/bits/specfun.h" 2 3
# 1 "/usr/include/c++/9/tr1/ell_integral.tcc" 1 3
# 45 "/usr/include/c++/9/tr1/ell_integral.tcc" 3
namespace std __attribute__ ((__visibility__ ("default")))
{

# 59 "/usr/include/c++/9/tr1/ell_integral.tcc" 3
  namespace __detail
  {
# 76 "/usr/include/c++/9/tr1/ell_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __ellint_rf(_Tp __x, _Tp __y, _Tp __z)
    {
      const _Tp __min = std::numeric_limits<_Tp>::min();
      const _Tp __max = std::numeric_limits<_Tp>::max();
      const _Tp __lolim = _Tp(5) * __min;
      const _Tp __uplim = __max / _Tp(5);

      if (__x < _Tp(0) || __y < _Tp(0) || __z < _Tp(0))
        std::__throw_domain_error(("Argument less than zero " "in __ellint_rf.")
                                                        );
      else if (__x + __y < __lolim || __x + __z < __lolim
            || __y + __z < __lolim)
        std::__throw_domain_error(("Argument too small in __ellint_rf"));
      else
        {
          const _Tp __c0 = _Tp(1) / _Tp(4);
          const _Tp __c1 = _Tp(1) / _Tp(24);
          const _Tp __c2 = _Tp(1) / _Tp(10);
          const _Tp __c3 = _Tp(3) / _Tp(44);
          const _Tp __c4 = _Tp(1) / _Tp(14);

          _Tp __xn = __x;
          _Tp __yn = __y;
          _Tp __zn = __z;

          const _Tp __eps = std::numeric_limits<_Tp>::epsilon();
          const _Tp __errtol = std::pow(__eps, _Tp(1) / _Tp(6));
          _Tp __mu;
          _Tp __xndev, __yndev, __zndev;

          const unsigned int __max_iter = 100;
          for (unsigned int __iter = 0; __iter < __max_iter; ++__iter)
            {
              __mu = (__xn + __yn + __zn) / _Tp(3);
              __xndev = 2 - (__mu + __xn) / __mu;
              __yndev = 2 - (__mu + __yn) / __mu;
              __zndev = 2 - (__mu + __zn) / __mu;
              _Tp __epsilon = std::max(std::abs(__xndev), std::abs(__yndev));
              __epsilon = std::max(__epsilon, std::abs(__zndev));
              if (__epsilon < __errtol)
                break;
              const _Tp __xnroot = std::sqrt(__xn);
              const _Tp __ynroot = std::sqrt(__yn);
              const _Tp __znroot = std::sqrt(__zn);
              const _Tp __lambda = __xnroot * (__ynroot + __znroot)
                                 + __ynroot * __znroot;
              __xn = __c0 * (__xn + __lambda);
              __yn = __c0 * (__yn + __lambda);
              __zn = __c0 * (__zn + __lambda);
            }

          const _Tp __e2 = __xndev * __yndev - __zndev * __zndev;
          const _Tp __e3 = __xndev * __yndev * __zndev;
          const _Tp __s = _Tp(1) + (__c1 * __e2 - __c2 - __c3 * __e3) * __e2
                   + __c4 * __e3;

          return __s / std::sqrt(__mu);
        }
    }
# 155 "/usr/include/c++/9/tr1/ell_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __comp_ellint_1_series(_Tp __k)
    {

      const _Tp __kk = __k * __k;

      _Tp __term = __kk / _Tp(4);
      _Tp __sum = _Tp(1) + __term;

      const unsigned int __max_iter = 1000;
      for (unsigned int __i = 2; __i < __max_iter; ++__i)
        {
          __term *= (2 * __i - 1) * __kk / (2 * __i);
          if (__term < std::numeric_limits<_Tp>::epsilon())
            break;
          __sum += __term;
        }

      return __numeric_constants<_Tp>::__pi_2() * __sum;
    }
# 193 "/usr/include/c++/9/tr1/ell_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __comp_ellint_1(_Tp __k)
    {

      if (__isnan(__k))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (std::abs(__k) >= _Tp(1))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else
        return __ellint_rf(_Tp(0), _Tp(1) - __k * __k, _Tp(1));
    }
# 221 "/usr/include/c++/9/tr1/ell_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __ellint_1(_Tp __k, _Tp __phi)
    {

      if (__isnan(__k) || __isnan(__phi))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (std::abs(__k) > _Tp(1))
        std::__throw_domain_error(("Bad argument in __ellint_1."));
      else
        {

          const int __n = std::floor(__phi / __numeric_constants<_Tp>::__pi()
                                   + _Tp(0.5L));
          const _Tp __phi_red = __phi
                              - __n * __numeric_constants<_Tp>::__pi();

          const _Tp __s = std::sin(__phi_red);
          const _Tp __c = std::cos(__phi_red);

          const _Tp __F = __s
                        * __ellint_rf(__c * __c,
                                _Tp(1) - __k * __k * __s * __s, _Tp(1));

          if (__n == 0)
            return __F;
          else
            return __F + _Tp(2) * __n * __comp_ellint_1(__k);
        }
    }
# 268 "/usr/include/c++/9/tr1/ell_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __comp_ellint_2_series(_Tp __k)
    {

      const _Tp __kk = __k * __k;

      _Tp __term = __kk;
      _Tp __sum = __term;

      const unsigned int __max_iter = 1000;
      for (unsigned int __i = 2; __i < __max_iter; ++__i)
        {
          const _Tp __i2m = 2 * __i - 1;
          const _Tp __i2 = 2 * __i;
          __term *= __i2m * __i2m * __kk / (__i2 * __i2);
          if (__term < std::numeric_limits<_Tp>::epsilon())
            break;
          __sum += __term / __i2m;
        }

      return __numeric_constants<_Tp>::__pi_2() * (_Tp(1) - __sum);
    }
# 316 "/usr/include/c++/9/tr1/ell_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __ellint_rd(_Tp __x, _Tp __y, _Tp __z)
    {
      const _Tp __eps = std::numeric_limits<_Tp>::epsilon();
      const _Tp __errtol = std::pow(__eps / _Tp(8), _Tp(1) / _Tp(6));
      const _Tp __min = std::numeric_limits<_Tp>::min();
      const _Tp __max = std::numeric_limits<_Tp>::max();
      const _Tp __lolim = _Tp(2) / std::pow(__max, _Tp(2) / _Tp(3));
      const _Tp __uplim = std::pow(_Tp(0.1L) * __errtol / __min, _Tp(2) / _Tp(3));

      if (__x < _Tp(0) || __y < _Tp(0))
        std::__throw_domain_error(("Argument less than zero " "in __ellint_rd.")
                                                        );
      else if (__x + __y < __lolim || __z < __lolim)
        std::__throw_domain_error(("Argument too small " "in __ellint_rd.")
                                                        );
      else
        {
          const _Tp __c0 = _Tp(1) / _Tp(4);
          const _Tp __c1 = _Tp(3) / _Tp(14);
          const _Tp __c2 = _Tp(1) / _Tp(6);
          const _Tp __c3 = _Tp(9) / _Tp(22);
          const _Tp __c4 = _Tp(3) / _Tp(26);

          _Tp __xn = __x;
          _Tp __yn = __y;
          _Tp __zn = __z;
          _Tp __sigma = _Tp(0);
          _Tp __power4 = _Tp(1);

          _Tp __mu;
          _Tp __xndev, __yndev, __zndev;

          const unsigned int __max_iter = 100;
          for (unsigned int __iter = 0; __iter < __max_iter; ++__iter)
            {
              __mu = (__xn + __yn + _Tp(3) * __zn) / _Tp(5);
              __xndev = (__mu - __xn) / __mu;
              __yndev = (__mu - __yn) / __mu;
              __zndev = (__mu - __zn) / __mu;
              _Tp __epsilon = std::max(std::abs(__xndev), std::abs(__yndev));
              __epsilon = std::max(__epsilon, std::abs(__zndev));
              if (__epsilon < __errtol)
                break;
              _Tp __xnroot = std::sqrt(__xn);
              _Tp __ynroot = std::sqrt(__yn);
              _Tp __znroot = std::sqrt(__zn);
              _Tp __lambda = __xnroot * (__ynroot + __znroot)
                           + __ynroot * __znroot;
              __sigma += __power4 / (__znroot * (__zn + __lambda));
              __power4 *= __c0;
              __xn = __c0 * (__xn + __lambda);
              __yn = __c0 * (__yn + __lambda);
              __zn = __c0 * (__zn + __lambda);
            }


          _Tp __eaa = __xndev * __yndev;
          _Tp __eb = __zndev * __zndev;
          _Tp __ec = __eaa - __eb;
          _Tp __ed = __eaa - _Tp(6) * __eb;
          _Tp __ef = __ed + __ec + __ec;
          _Tp __s1 = __ed * (-__c1 + __c3 * __ed
                                   / _Tp(3) - _Tp(3) * __c4 * __zndev * __ef
                                   / _Tp(2));
          _Tp __s2 = __zndev
                   * (__c2 * __ef
                    + __zndev * (-__c3 * __ec - __zndev * __c4 - __eaa));

          return _Tp(3) * __sigma + __power4 * (_Tp(1) + __s1 + __s2)
                                        / (__mu * std::sqrt(__mu));
        }
    }
# 404 "/usr/include/c++/9/tr1/ell_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __comp_ellint_2(_Tp __k)
    {

      if (__isnan(__k))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (std::abs(__k) == 1)
        return _Tp(1);
      else if (std::abs(__k) > _Tp(1))
        std::__throw_domain_error(("Bad argument in __comp_ellint_2."));
      else
        {
          const _Tp __kk = __k * __k;

          return __ellint_rf(_Tp(0), _Tp(1) - __kk, _Tp(1))
               - __kk * __ellint_rd(_Tp(0), _Tp(1) - __kk, _Tp(1)) / _Tp(3);
        }
    }
# 438 "/usr/include/c++/9/tr1/ell_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __ellint_2(_Tp __k, _Tp __phi)
    {

      if (__isnan(__k) || __isnan(__phi))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (std::abs(__k) > _Tp(1))
        std::__throw_domain_error(("Bad argument in __ellint_2."));
      else
        {

          const int __n = std::floor(__phi / __numeric_constants<_Tp>::__pi()
                                   + _Tp(0.5L));
          const _Tp __phi_red = __phi
                              - __n * __numeric_constants<_Tp>::__pi();

          const _Tp __kk = __k * __k;
          const _Tp __s = std::sin(__phi_red);
          const _Tp __ss = __s * __s;
          const _Tp __sss = __ss * __s;
          const _Tp __c = std::cos(__phi_red);
          const _Tp __cc = __c * __c;

          const _Tp __E = __s
                        * __ellint_rf(__cc, _Tp(1) - __kk * __ss, _Tp(1))
                        - __kk * __sss
                        * __ellint_rd(__cc, _Tp(1) - __kk * __ss, _Tp(1))
                        / _Tp(3);

          if (__n == 0)
            return __E;
          else
            return __E + _Tp(2) * __n * __comp_ellint_2(__k);
        }
    }
# 497 "/usr/include/c++/9/tr1/ell_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __ellint_rc(_Tp __x, _Tp __y)
    {
      const _Tp __min = std::numeric_limits<_Tp>::min();
      const _Tp __max = std::numeric_limits<_Tp>::max();
      const _Tp __lolim = _Tp(5) * __min;
      const _Tp __uplim = __max / _Tp(5);

      if (__x < _Tp(0) || __y < _Tp(0) || __x + __y < __lolim)
        std::__throw_domain_error(("Argument less than zero " "in __ellint_rc.")
                                                        );
      else
        {
          const _Tp __c0 = _Tp(1) / _Tp(4);
          const _Tp __c1 = _Tp(1) / _Tp(7);
          const _Tp __c2 = _Tp(9) / _Tp(22);
          const _Tp __c3 = _Tp(3) / _Tp(10);
          const _Tp __c4 = _Tp(3) / _Tp(8);

          _Tp __xn = __x;
          _Tp __yn = __y;

          const _Tp __eps = std::numeric_limits<_Tp>::epsilon();
          const _Tp __errtol = std::pow(__eps / _Tp(30), _Tp(1) / _Tp(6));
          _Tp __mu;
          _Tp __sn;

          const unsigned int __max_iter = 100;
          for (unsigned int __iter = 0; __iter < __max_iter; ++__iter)
            {
              __mu = (__xn + _Tp(2) * __yn) / _Tp(3);
              __sn = (__yn + __mu) / __mu - _Tp(2);
              if (std::abs(__sn) < __errtol)
                break;
              const _Tp __lambda = _Tp(2) * std::sqrt(__xn) * std::sqrt(__yn)
                             + __yn;
              __xn = __c0 * (__xn + __lambda);
              __yn = __c0 * (__yn + __lambda);
            }

          _Tp __s = __sn * __sn
                  * (__c3 + __sn*(__c1 + __sn * (__c4 + __sn * __c2)));

          return (_Tp(1) + __s) / std::sqrt(__mu);
        }
    }
# 568 "/usr/include/c++/9/tr1/ell_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __ellint_rj(_Tp __x, _Tp __y, _Tp __z, _Tp __p)
    {
      const _Tp __min = std::numeric_limits<_Tp>::min();
      const _Tp __max = std::numeric_limits<_Tp>::max();
      const _Tp __lolim = std::pow(_Tp(5) * __min, _Tp(1)/_Tp(3));
      const _Tp __uplim = _Tp(0.3L)
                        * std::pow(_Tp(0.2L) * __max, _Tp(1)/_Tp(3));

      if (__x < _Tp(0) || __y < _Tp(0) || __z < _Tp(0))
        std::__throw_domain_error(("Argument less than zero " "in __ellint_rj.")
                                                        );
      else if (__x + __y < __lolim || __x + __z < __lolim
            || __y + __z < __lolim || __p < __lolim)
        std::__throw_domain_error(("Argument too small " "in __ellint_rj")
                                                       );
      else
        {
          const _Tp __c0 = _Tp(1) / _Tp(4);
          const _Tp __c1 = _Tp(3) / _Tp(14);
          const _Tp __c2 = _Tp(1) / _Tp(3);
          const _Tp __c3 = _Tp(3) / _Tp(22);
          const _Tp __c4 = _Tp(3) / _Tp(26);

          _Tp __xn = __x;
          _Tp __yn = __y;
          _Tp __zn = __z;
          _Tp __pn = __p;
          _Tp __sigma = _Tp(0);
          _Tp __power4 = _Tp(1);

          const _Tp __eps = std::numeric_limits<_Tp>::epsilon();
          const _Tp __errtol = std::pow(__eps / _Tp(8), _Tp(1) / _Tp(6));

          _Tp __lambda, __mu;
          _Tp __xndev, __yndev, __zndev, __pndev;

          const unsigned int __max_iter = 100;
          for (unsigned int __iter = 0; __iter < __max_iter; ++__iter)
            {
              __mu = (__xn + __yn + __zn + _Tp(2) * __pn) / _Tp(5);
              __xndev = (__mu - __xn) / __mu;
              __yndev = (__mu - __yn) / __mu;
              __zndev = (__mu - __zn) / __mu;
              __pndev = (__mu - __pn) / __mu;
              _Tp __epsilon = std::max(std::abs(__xndev), std::abs(__yndev));
              __epsilon = std::max(__epsilon, std::abs(__zndev));
              __epsilon = std::max(__epsilon, std::abs(__pndev));
              if (__epsilon < __errtol)
                break;
              const _Tp __xnroot = std::sqrt(__xn);
              const _Tp __ynroot = std::sqrt(__yn);
              const _Tp __znroot = std::sqrt(__zn);
              const _Tp __lambda = __xnroot * (__ynroot + __znroot)
                                 + __ynroot * __znroot;
              const _Tp __alpha1 = __pn * (__xnroot + __ynroot + __znroot)
                                + __xnroot * __ynroot * __znroot;
              const _Tp __alpha2 = __alpha1 * __alpha1;
              const _Tp __beta = __pn * (__pn + __lambda)
                                      * (__pn + __lambda);
              __sigma += __power4 * __ellint_rc(__alpha2, __beta);
              __power4 *= __c0;
              __xn = __c0 * (__xn + __lambda);
              __yn = __c0 * (__yn + __lambda);
              __zn = __c0 * (__zn + __lambda);
              __pn = __c0 * (__pn + __lambda);
            }


          _Tp __eaa = __xndev * (__yndev + __zndev) + __yndev * __zndev;
          _Tp __eb = __xndev * __yndev * __zndev;
          _Tp __ec = __pndev * __pndev;
          _Tp __e2 = __eaa - _Tp(3) * __ec;
          _Tp __e3 = __eb + _Tp(2) * __pndev * (__eaa - __ec);
          _Tp __s1 = _Tp(1) + __e2 * (-__c1 + _Tp(3) * __c3 * __e2 / _Tp(4)
                            - _Tp(3) * __c4 * __e3 / _Tp(2));
          _Tp __s2 = __eb * (__c2 / _Tp(2)
                   + __pndev * (-__c3 - __c3 + __pndev * __c4));
          _Tp __s3 = __pndev * __eaa * (__c2 - __pndev * __c3)
                   - __c2 * __pndev * __ec;

          return _Tp(3) * __sigma + __power4 * (__s1 + __s2 + __s3)
                                             / (__mu * std::sqrt(__mu));
        }
    }
# 672 "/usr/include/c++/9/tr1/ell_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __comp_ellint_3(_Tp __k, _Tp __nu)
    {

      if (__isnan(__k) || __isnan(__nu))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__nu == _Tp(1))
        return std::numeric_limits<_Tp>::infinity();
      else if (std::abs(__k) > _Tp(1))
        std::__throw_domain_error(("Bad argument in __comp_ellint_3."));
      else
        {
          const _Tp __kk = __k * __k;

          return __ellint_rf(_Tp(0), _Tp(1) - __kk, _Tp(1))
               + __nu
               * __ellint_rj(_Tp(0), _Tp(1) - __kk, _Tp(1), _Tp(1) - __nu)
               / _Tp(3);
        }
    }
# 712 "/usr/include/c++/9/tr1/ell_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __ellint_3(_Tp __k, _Tp __nu, _Tp __phi)
    {

      if (__isnan(__k) || __isnan(__nu) || __isnan(__phi))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (std::abs(__k) > _Tp(1))
        std::__throw_domain_error(("Bad argument in __ellint_3."));
      else
        {

          const int __n = std::floor(__phi / __numeric_constants<_Tp>::__pi()
                                   + _Tp(0.5L));
          const _Tp __phi_red = __phi
                              - __n * __numeric_constants<_Tp>::__pi();

          const _Tp __kk = __k * __k;
          const _Tp __s = std::sin(__phi_red);
          const _Tp __ss = __s * __s;
          const _Tp __sss = __ss * __s;
          const _Tp __c = std::cos(__phi_red);
          const _Tp __cc = __c * __c;

          const _Tp __Pi = __s
                         * __ellint_rf(__cc, _Tp(1) - __kk * __ss, _Tp(1))
                         + __nu * __sss
                         * __ellint_rj(__cc, _Tp(1) - __kk * __ss, _Tp(1),
                                       _Tp(1) - __nu * __ss) / _Tp(3);

          if (__n == 0)
            return __Pi;
          else
            return __Pi + _Tp(2) * __n * __comp_ellint_3(__k, __nu);
        }
    }
  }





}
# 53 "/usr/include/c++/9/bits/specfun.h" 2 3
# 1 "/usr/include/c++/9/tr1/exp_integral.tcc" 1 3
# 50 "/usr/include/c++/9/tr1/exp_integral.tcc" 3
namespace std __attribute__ ((__visibility__ ("default")))
{

# 64 "/usr/include/c++/9/tr1/exp_integral.tcc" 3
  namespace __detail
  {
    template<typename _Tp> _Tp __expint_E1(_Tp);
# 81 "/usr/include/c++/9/tr1/exp_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __expint_E1_series(_Tp __x)
    {
      const _Tp __eps = std::numeric_limits<_Tp>::epsilon();
      _Tp __term = _Tp(1);
      _Tp __esum = _Tp(0);
      _Tp __osum = _Tp(0);
      const unsigned int __max_iter = 1000;
      for (unsigned int __i = 1; __i < __max_iter; ++__i)
        {
          __term *= - __x / __i;
          if (std::abs(__term) < __eps)
            break;
          if (__term >= _Tp(0))
            __esum += __term / __i;
          else
            __osum += __term / __i;
        }

      return - __esum - __osum
             - __numeric_constants<_Tp>::__gamma_e() - std::log(__x);
    }
# 118 "/usr/include/c++/9/tr1/exp_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __expint_E1_asymp(_Tp __x)
    {
      _Tp __term = _Tp(1);
      _Tp __esum = _Tp(1);
      _Tp __osum = _Tp(0);
      const unsigned int __max_iter = 1000;
      for (unsigned int __i = 1; __i < __max_iter; ++__i)
        {
          _Tp __prev = __term;
          __term *= - __i / __x;
          if (std::abs(__term) > std::abs(__prev))
            break;
          if (__term >= _Tp(0))
            __esum += __term;
          else
            __osum += __term;
        }

      return std::exp(- __x) * (__esum + __osum) / __x;
    }
# 155 "/usr/include/c++/9/tr1/exp_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __expint_En_series(unsigned int __n, _Tp __x)
    {
      const unsigned int __max_iter = 1000;
      const _Tp __eps = std::numeric_limits<_Tp>::epsilon();
      const int __nm1 = __n - 1;
      _Tp __ans = (__nm1 != 0
                ? _Tp(1) / __nm1 : -std::log(__x)
                                   - __numeric_constants<_Tp>::__gamma_e());
      _Tp __fact = _Tp(1);
      for (int __i = 1; __i <= __max_iter; ++__i)
        {
          __fact *= -__x / _Tp(__i);
          _Tp __del;
          if ( __i != __nm1 )
            __del = -__fact / _Tp(__i - __nm1);
          else
            {
              _Tp __psi = -__numeric_constants<_Tp>::gamma_e();
              for (int __ii = 1; __ii <= __nm1; ++__ii)
                __psi += _Tp(1) / _Tp(__ii);
              __del = __fact * (__psi - std::log(__x));
            }
          __ans += __del;
          if (std::abs(__del) < __eps * std::abs(__ans))
            return __ans;
        }
      std::__throw_runtime_error(("Series summation failed " "in __expint_En_series.")
                                                              );
    }
# 201 "/usr/include/c++/9/tr1/exp_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __expint_En_cont_frac(unsigned int __n, _Tp __x)
    {
      const unsigned int __max_iter = 1000;
      const _Tp __eps = std::numeric_limits<_Tp>::epsilon();
      const _Tp __fp_min = std::numeric_limits<_Tp>::min();
      const int __nm1 = __n - 1;
      _Tp __b = __x + _Tp(__n);
      _Tp __c = _Tp(1) / __fp_min;
      _Tp __d = _Tp(1) / __b;
      _Tp __h = __d;
      for ( unsigned int __i = 1; __i <= __max_iter; ++__i )
        {
          _Tp __a = -_Tp(__i * (__nm1 + __i));
          __b += _Tp(2);
          __d = _Tp(1) / (__a * __d + __b);
          __c = __b + __a / __c;
          const _Tp __del = __c * __d;
          __h *= __del;
          if (std::abs(__del - _Tp(1)) < __eps)
            {
              const _Tp __ans = __h * std::exp(-__x);
              return __ans;
            }
        }
      std::__throw_runtime_error(("Continued fraction failed " "in __expint_En_cont_frac.")
                                                                 );
    }
# 246 "/usr/include/c++/9/tr1/exp_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __expint_En_recursion(unsigned int __n, _Tp __x)
    {
      _Tp __En;
      _Tp __E1 = __expint_E1(__x);
      if (__x < _Tp(__n))
        {

          __En = __E1;
          for (unsigned int __j = 2; __j < __n; ++__j)
            __En = (std::exp(-__x) - __x * __En) / _Tp(__j - 1);
        }
      else
        {

          __En = _Tp(1);
          const int __N = __n + 20;
          _Tp __save = _Tp(0);
          for (int __j = __N; __j > 0; --__j)
            {
              __En = (std::exp(-__x) - __j * __En) / __x;
              if (__j == __n)
                __save = __En;
            }
            _Tp __norm = __En / __E1;
            __En /= __norm;
        }

      return __En;
    }
# 290 "/usr/include/c++/9/tr1/exp_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __expint_Ei_series(_Tp __x)
    {
      _Tp __term = _Tp(1);
      _Tp __sum = _Tp(0);
      const unsigned int __max_iter = 1000;
      for (unsigned int __i = 1; __i < __max_iter; ++__i)
        {
          __term *= __x / __i;
          __sum += __term / __i;
          if (__term < std::numeric_limits<_Tp>::epsilon() * __sum)
            break;
        }

      return __numeric_constants<_Tp>::__gamma_e() + __sum + std::log(__x);
    }
# 321 "/usr/include/c++/9/tr1/exp_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __expint_Ei_asymp(_Tp __x)
    {
      _Tp __term = _Tp(1);
      _Tp __sum = _Tp(1);
      const unsigned int __max_iter = 1000;
      for (unsigned int __i = 1; __i < __max_iter; ++__i)
        {
          _Tp __prev = __term;
          __term *= __i / __x;
          if (__term < std::numeric_limits<_Tp>::epsilon())
            break;
          if (__term >= __prev)
            break;
          __sum += __term;
        }

      return std::exp(__x) * __sum / __x;
    }
# 354 "/usr/include/c++/9/tr1/exp_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __expint_Ei(_Tp __x)
    {
      if (__x < _Tp(0))
        return -__expint_E1(-__x);
      else if (__x < -std::log(std::numeric_limits<_Tp>::epsilon()))
        return __expint_Ei_series(__x);
      else
        return __expint_Ei_asymp(__x);
    }
# 378 "/usr/include/c++/9/tr1/exp_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __expint_E1(_Tp __x)
    {
      if (__x < _Tp(0))
        return -__expint_Ei(-__x);
      else if (__x < _Tp(1))
        return __expint_E1_series(__x);
      else if (__x < _Tp(100))
        return __expint_En_cont_frac(1, __x);
      else
        return __expint_E1_asymp(__x);
    }
# 408 "/usr/include/c++/9/tr1/exp_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __expint_asymp(unsigned int __n, _Tp __x)
    {
      _Tp __term = _Tp(1);
      _Tp __sum = _Tp(1);
      for (unsigned int __i = 1; __i <= __n; ++__i)
        {
          _Tp __prev = __term;
          __term *= -(__n - __i + 1) / __x;
          if (std::abs(__term) > std::abs(__prev))
            break;
          __sum += __term;
        }

      return std::exp(-__x) * __sum / __x;
    }
# 442 "/usr/include/c++/9/tr1/exp_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __expint_large_n(unsigned int __n, _Tp __x)
    {
      const _Tp __xpn = __x + __n;
      const _Tp __xpn2 = __xpn * __xpn;
      _Tp __term = _Tp(1);
      _Tp __sum = _Tp(1);
      for (unsigned int __i = 1; __i <= __n; ++__i)
        {
          _Tp __prev = __term;
          __term *= (__n - 2 * (__i - 1) * __x) / __xpn2;
          if (std::abs(__term) < std::numeric_limits<_Tp>::epsilon())
            break;
          __sum += __term;
        }

      return std::exp(-__x) * __sum / __xpn;
    }
# 476 "/usr/include/c++/9/tr1/exp_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __expint(unsigned int __n, _Tp __x)
    {

      if (__isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__n <= 1 && __x == _Tp(0))
        return std::numeric_limits<_Tp>::infinity();
      else
        {
          _Tp __E0 = std::exp(__x) / __x;
          if (__n == 0)
            return __E0;

          _Tp __E1 = __expint_E1(__x);
          if (__n == 1)
            return __E1;

          if (__x == _Tp(0))
            return _Tp(1) / static_cast<_Tp>(__n - 1);

          _Tp __En = __expint_En_recursion(__n, __x);

          return __En;
        }
    }
# 516 "/usr/include/c++/9/tr1/exp_integral.tcc" 3
    template<typename _Tp>
    inline _Tp
    __expint(_Tp __x)
    {
      if (__isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else
        return __expint_Ei(__x);
    }
  }





}
# 54 "/usr/include/c++/9/bits/specfun.h" 2 3
# 1 "/usr/include/c++/9/tr1/hypergeometric.tcc" 1 3
# 44 "/usr/include/c++/9/tr1/hypergeometric.tcc" 3
namespace std __attribute__ ((__visibility__ ("default")))
{

# 60 "/usr/include/c++/9/tr1/hypergeometric.tcc" 3
  namespace __detail
  {
# 83 "/usr/include/c++/9/tr1/hypergeometric.tcc" 3
    template<typename _Tp>
    _Tp
    __conf_hyperg_series(_Tp __a, _Tp __c, _Tp __x)
    {
      const _Tp __eps = std::numeric_limits<_Tp>::epsilon();

      _Tp __term = _Tp(1);
      _Tp __Fac = _Tp(1);
      const unsigned int __max_iter = 100000;
      unsigned int __i;
      for (__i = 0; __i < __max_iter; ++__i)
        {
          __term *= (__a + _Tp(__i)) * __x
                  / ((__c + _Tp(__i)) * _Tp(1 + __i));
          if (std::abs(__term) < __eps)
            {
              break;
            }
          __Fac += __term;
        }
      if (__i == __max_iter)
        std::__throw_runtime_error(("Series failed to converge " "in __conf_hyperg_series.")
                                                                  );

      return __Fac;
    }
# 120 "/usr/include/c++/9/tr1/hypergeometric.tcc" 3
    template<typename _Tp>
    _Tp
    __conf_hyperg_luke(_Tp __a, _Tp __c, _Tp __xin)
    {
      const _Tp __big = std::pow(std::numeric_limits<_Tp>::max(), _Tp(0.16L));
      const int __nmax = 20000;
      const _Tp __eps = std::numeric_limits<_Tp>::epsilon();
      const _Tp __x = -__xin;
      const _Tp __x3 = __x * __x * __x;
      const _Tp __t0 = __a / __c;
      const _Tp __t1 = (__a + _Tp(1)) / (_Tp(2) * __c);
      const _Tp __t2 = (__a + _Tp(2)) / (_Tp(2) * (__c + _Tp(1)));
      _Tp __F = _Tp(1);
      _Tp __prec;

      _Tp __Bnm3 = _Tp(1);
      _Tp __Bnm2 = _Tp(1) + __t1 * __x;
      _Tp __Bnm1 = _Tp(1) + __t2 * __x * (_Tp(1) + __t1 / _Tp(3) * __x);

      _Tp __Anm3 = _Tp(1);
      _Tp __Anm2 = __Bnm2 - __t0 * __x;
      _Tp __Anm1 = __Bnm1 - __t0 * (_Tp(1) + __t2 * __x) * __x
                 + __t0 * __t1 * (__c / (__c + _Tp(1))) * __x * __x;

      int __n = 3;
      while(1)
        {
          _Tp __npam1 = _Tp(__n - 1) + __a;
          _Tp __npcm1 = _Tp(__n - 1) + __c;
          _Tp __npam2 = _Tp(__n - 2) + __a;
          _Tp __npcm2 = _Tp(__n - 2) + __c;
          _Tp __tnm1 = _Tp(2 * __n - 1);
          _Tp __tnm3 = _Tp(2 * __n - 3);
          _Tp __tnm5 = _Tp(2 * __n - 5);
          _Tp __F1 = (_Tp(__n - 2) - __a) / (_Tp(2) * __tnm3 * __npcm1);
          _Tp __F2 = (_Tp(__n) + __a) * __npam1
                   / (_Tp(4) * __tnm1 * __tnm3 * __npcm2 * __npcm1);
          _Tp __F3 = -__npam2 * __npam1 * (_Tp(__n - 2) - __a)
                   / (_Tp(8) * __tnm3 * __tnm3 * __tnm5
                   * (_Tp(__n - 3) + __c) * __npcm2 * __npcm1);
          _Tp __E = -__npam1 * (_Tp(__n - 1) - __c)
                   / (_Tp(2) * __tnm3 * __npcm2 * __npcm1);

          _Tp __An = (_Tp(1) + __F1 * __x) * __Anm1
                   + (__E + __F2 * __x) * __x * __Anm2 + __F3 * __x3 * __Anm3;
          _Tp __Bn = (_Tp(1) + __F1 * __x) * __Bnm1
                   + (__E + __F2 * __x) * __x * __Bnm2 + __F3 * __x3 * __Bnm3;
          _Tp __r = __An / __Bn;

          __prec = std::abs((__F - __r) / __F);
          __F = __r;

          if (__prec < __eps || __n > __nmax)
            break;

          if (std::abs(__An) > __big || std::abs(__Bn) > __big)
            {
              __An /= __big;
              __Bn /= __big;
              __Anm1 /= __big;
              __Bnm1 /= __big;
              __Anm2 /= __big;
              __Bnm2 /= __big;
              __Anm3 /= __big;
              __Bnm3 /= __big;
            }
          else if (std::abs(__An) < _Tp(1) / __big
                || std::abs(__Bn) < _Tp(1) / __big)
            {
              __An *= __big;
              __Bn *= __big;
              __Anm1 *= __big;
              __Bnm1 *= __big;
              __Anm2 *= __big;
              __Bnm2 *= __big;
              __Anm3 *= __big;
              __Bnm3 *= __big;
            }

          ++__n;
          __Bnm3 = __Bnm2;
          __Bnm2 = __Bnm1;
          __Bnm1 = __Bn;
          __Anm3 = __Anm2;
          __Anm2 = __Anm1;
          __Anm1 = __An;
        }

      if (__n >= __nmax)
        std::__throw_runtime_error(("Iteration failed to converge " "in __conf_hyperg_luke.")
                                                                );

      return __F;
    }
# 227 "/usr/include/c++/9/tr1/hypergeometric.tcc" 3
    template<typename _Tp>
    _Tp
    __conf_hyperg(_Tp __a, _Tp __c, _Tp __x)
    {

      const _Tp __c_nint = ::std::nearbyint(__c);



      if (__isnan(__a) || __isnan(__c) || __isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__c_nint == __c && __c_nint <= 0)
        return std::numeric_limits<_Tp>::infinity();
      else if (__a == _Tp(0))
        return _Tp(1);
      else if (__c == __a)
        return std::exp(__x);
      else if (__x < _Tp(0))
        return __conf_hyperg_luke(__a, __c, __x);
      else
        return __conf_hyperg_series(__a, __c, __x);
    }
# 271 "/usr/include/c++/9/tr1/hypergeometric.tcc" 3
    template<typename _Tp>
    _Tp
    __hyperg_series(_Tp __a, _Tp __b, _Tp __c, _Tp __x)
    {
      const _Tp __eps = std::numeric_limits<_Tp>::epsilon();

      _Tp __term = _Tp(1);
      _Tp __Fabc = _Tp(1);
      const unsigned int __max_iter = 100000;
      unsigned int __i;
      for (__i = 0; __i < __max_iter; ++__i)
        {
          __term *= (__a + _Tp(__i)) * (__b + _Tp(__i)) * __x
                  / ((__c + _Tp(__i)) * _Tp(1 + __i));
          if (std::abs(__term) < __eps)
            {
              break;
            }
          __Fabc += __term;
        }
      if (__i == __max_iter)
        std::__throw_runtime_error(("Series failed to converge " "in __hyperg_series.")
                                                             );

      return __Fabc;
    }







    template<typename _Tp>
    _Tp
    __hyperg_luke(_Tp __a, _Tp __b, _Tp __c, _Tp __xin)
    {
      const _Tp __big = std::pow(std::numeric_limits<_Tp>::max(), _Tp(0.16L));
      const int __nmax = 20000;
      const _Tp __eps = std::numeric_limits<_Tp>::epsilon();
      const _Tp __x = -__xin;
      const _Tp __x3 = __x * __x * __x;
      const _Tp __t0 = __a * __b / __c;
      const _Tp __t1 = (__a + _Tp(1)) * (__b + _Tp(1)) / (_Tp(2) * __c);
      const _Tp __t2 = (__a + _Tp(2)) * (__b + _Tp(2))
                     / (_Tp(2) * (__c + _Tp(1)));

      _Tp __F = _Tp(1);

      _Tp __Bnm3 = _Tp(1);
      _Tp __Bnm2 = _Tp(1) + __t1 * __x;
      _Tp __Bnm1 = _Tp(1) + __t2 * __x * (_Tp(1) + __t1 / _Tp(3) * __x);

      _Tp __Anm3 = _Tp(1);
      _Tp __Anm2 = __Bnm2 - __t0 * __x;
      _Tp __Anm1 = __Bnm1 - __t0 * (_Tp(1) + __t2 * __x) * __x
                 + __t0 * __t1 * (__c / (__c + _Tp(1))) * __x * __x;

      int __n = 3;
      while (1)
        {
          const _Tp __npam1 = _Tp(__n - 1) + __a;
          const _Tp __npbm1 = _Tp(__n - 1) + __b;
          const _Tp __npcm1 = _Tp(__n - 1) + __c;
          const _Tp __npam2 = _Tp(__n - 2) + __a;
          const _Tp __npbm2 = _Tp(__n - 2) + __b;
          const _Tp __npcm2 = _Tp(__n - 2) + __c;
          const _Tp __tnm1 = _Tp(2 * __n - 1);
          const _Tp __tnm3 = _Tp(2 * __n - 3);
          const _Tp __tnm5 = _Tp(2 * __n - 5);
          const _Tp __n2 = __n * __n;
          const _Tp __F1 = (_Tp(3) * __n2 + (__a + __b - _Tp(6)) * __n
                         + _Tp(2) - __a * __b - _Tp(2) * (__a + __b))
                         / (_Tp(2) * __tnm3 * __npcm1);
          const _Tp __F2 = -(_Tp(3) * __n2 - (__a + __b + _Tp(6)) * __n
                         + _Tp(2) - __a * __b) * __npam1 * __npbm1
                         / (_Tp(4) * __tnm1 * __tnm3 * __npcm2 * __npcm1);
          const _Tp __F3 = (__npam2 * __npam1 * __npbm2 * __npbm1
                         * (_Tp(__n - 2) - __a) * (_Tp(__n - 2) - __b))
                         / (_Tp(8) * __tnm3 * __tnm3 * __tnm5
                         * (_Tp(__n - 3) + __c) * __npcm2 * __npcm1);
          const _Tp __E = -__npam1 * __npbm1 * (_Tp(__n - 1) - __c)
                         / (_Tp(2) * __tnm3 * __npcm2 * __npcm1);

          _Tp __An = (_Tp(1) + __F1 * __x) * __Anm1
                   + (__E + __F2 * __x) * __x * __Anm2 + __F3 * __x3 * __Anm3;
          _Tp __Bn = (_Tp(1) + __F1 * __x) * __Bnm1
                   + (__E + __F2 * __x) * __x * __Bnm2 + __F3 * __x3 * __Bnm3;
          const _Tp __r = __An / __Bn;

          const _Tp __prec = std::abs((__F - __r) / __F);
          __F = __r;

          if (__prec < __eps || __n > __nmax)
            break;

          if (std::abs(__An) > __big || std::abs(__Bn) > __big)
            {
              __An /= __big;
              __Bn /= __big;
              __Anm1 /= __big;
              __Bnm1 /= __big;
              __Anm2 /= __big;
              __Bnm2 /= __big;
              __Anm3 /= __big;
              __Bnm3 /= __big;
            }
          else if (std::abs(__An) < _Tp(1) / __big
                || std::abs(__Bn) < _Tp(1) / __big)
            {
              __An *= __big;
              __Bn *= __big;
              __Anm1 *= __big;
              __Bnm1 *= __big;
              __Anm2 *= __big;
              __Bnm2 *= __big;
              __Anm3 *= __big;
              __Bnm3 *= __big;
            }

          ++__n;
          __Bnm3 = __Bnm2;
          __Bnm2 = __Bnm1;
          __Bnm1 = __Bn;
          __Anm3 = __Anm2;
          __Anm2 = __Anm1;
          __Anm1 = __An;
        }

      if (__n >= __nmax)
        std::__throw_runtime_error(("Iteration failed to converge " "in __hyperg_luke.")
                                                           );

      return __F;
    }
# 438 "/usr/include/c++/9/tr1/hypergeometric.tcc" 3
    template<typename _Tp>
    _Tp
    __hyperg_reflect(_Tp __a, _Tp __b, _Tp __c, _Tp __x)
    {
      const _Tp __d = __c - __a - __b;
      const int __intd = std::floor(__d + _Tp(0.5L));
      const _Tp __eps = std::numeric_limits<_Tp>::epsilon();
      const _Tp __toler = _Tp(1000) * __eps;
      const _Tp __log_max = std::log(std::numeric_limits<_Tp>::max());
      const bool __d_integer = (std::abs(__d - __intd) < __toler);

      if (__d_integer)
        {
          const _Tp __ln_omx = std::log(_Tp(1) - __x);
          const _Tp __ad = std::abs(__d);
          _Tp __F1, __F2;

          _Tp __d1, __d2;
          if (__d >= _Tp(0))
            {
              __d1 = __d;
              __d2 = _Tp(0);
            }
          else
            {
              __d1 = _Tp(0);
              __d2 = __d;
            }

          const _Tp __lng_c = __log_gamma(__c);


          if (__ad < __eps)
            {

              __F1 = _Tp(0);
            }
          else
            {

              bool __ok_d1 = true;
              _Tp __lng_ad, __lng_ad1, __lng_bd1;
              try
                {
                  __lng_ad = __log_gamma(__ad);
                  __lng_ad1 = __log_gamma(__a + __d1);
                  __lng_bd1 = __log_gamma(__b + __d1);
                }
              catch(...)
                {
                  __ok_d1 = false;
                }

              if (__ok_d1)
                {



                  _Tp __sum1 = _Tp(1);
                  _Tp __term = _Tp(1);
                  _Tp __ln_pre1 = __lng_ad + __lng_c + __d2 * __ln_omx
                                - __lng_ad1 - __lng_bd1;



                  for (int __i = 1; __i < __ad; ++__i)
                    {
                      const int __j = __i - 1;
                      __term *= (__a + __d2 + __j) * (__b + __d2 + __j)
                              / (_Tp(1) + __d2 + __j) / __i * (_Tp(1) - __x);
                      __sum1 += __term;
                    }

                  if (__ln_pre1 > __log_max)
                    std::__throw_runtime_error(("Overflow of gamma functions" " in __hyperg_luke.")
                                                                        );
                  else
                    __F1 = std::exp(__ln_pre1) * __sum1;
                }
              else
                {


                  __F1 = _Tp(0);
                }
            }


          bool __ok_d2 = true;
          _Tp __lng_ad2, __lng_bd2;
          try
            {
              __lng_ad2 = __log_gamma(__a + __d2);
              __lng_bd2 = __log_gamma(__b + __d2);
            }
          catch(...)
            {
              __ok_d2 = false;
            }

          if (__ok_d2)
            {


              const int __maxiter = 2000;
              const _Tp __psi_1 = -__numeric_constants<_Tp>::__gamma_e();
              const _Tp __psi_1pd = __psi(_Tp(1) + __ad);
              const _Tp __psi_apd1 = __psi(__a + __d1);
              const _Tp __psi_bpd1 = __psi(__b + __d1);

              _Tp __psi_term = __psi_1 + __psi_1pd - __psi_apd1
                             - __psi_bpd1 - __ln_omx;
              _Tp __fact = _Tp(1);
              _Tp __sum2 = __psi_term;
              _Tp __ln_pre2 = __lng_c + __d1 * __ln_omx
                            - __lng_ad2 - __lng_bd2;


              int __j;
              for (__j = 1; __j < __maxiter; ++__j)
                {


                  const _Tp __term1 = _Tp(1) / _Tp(__j)
                                    + _Tp(1) / (__ad + __j);
                  const _Tp __term2 = _Tp(1) / (__a + __d1 + _Tp(__j - 1))
                                    + _Tp(1) / (__b + __d1 + _Tp(__j - 1));
                  __psi_term += __term1 - __term2;
                  __fact *= (__a + __d1 + _Tp(__j - 1))
                          * (__b + __d1 + _Tp(__j - 1))
                          / ((__ad + __j) * __j) * (_Tp(1) - __x);
                  const _Tp __delta = __fact * __psi_term;
                  __sum2 += __delta;
                  if (std::abs(__delta) < __eps * std::abs(__sum2))
                    break;
                }
              if (__j == __maxiter)
                std::__throw_runtime_error(("Sum F2 failed to converge " "in __hyperg_reflect")
                                                                     );

              if (__sum2 == _Tp(0))
                __F2 = _Tp(0);
              else
                __F2 = std::exp(__ln_pre2) * __sum2;
            }
          else
            {


              __F2 = _Tp(0);
            }

          const _Tp __sgn_2 = (__intd % 2 == 1 ? -_Tp(1) : _Tp(1));
          const _Tp __F = __F1 + __sgn_2 * __F2;

          return __F;
        }
      else
        {




          bool __ok1 = true;
          _Tp __sgn_g1ca = _Tp(0), __ln_g1ca = _Tp(0);
          _Tp __sgn_g1cb = _Tp(0), __ln_g1cb = _Tp(0);
          try
            {
              __sgn_g1ca = __log_gamma_sign(__c - __a);
              __ln_g1ca = __log_gamma(__c - __a);
              __sgn_g1cb = __log_gamma_sign(__c - __b);
              __ln_g1cb = __log_gamma(__c - __b);
            }
          catch(...)
            {
              __ok1 = false;
            }

          bool __ok2 = true;
          _Tp __sgn_g2a = _Tp(0), __ln_g2a = _Tp(0);
          _Tp __sgn_g2b = _Tp(0), __ln_g2b = _Tp(0);
          try
            {
              __sgn_g2a = __log_gamma_sign(__a);
              __ln_g2a = __log_gamma(__a);
              __sgn_g2b = __log_gamma_sign(__b);
              __ln_g2b = __log_gamma(__b);
            }
          catch(...)
            {
              __ok2 = false;
            }

          const _Tp __sgn_gc = __log_gamma_sign(__c);
          const _Tp __ln_gc = __log_gamma(__c);
          const _Tp __sgn_gd = __log_gamma_sign(__d);
          const _Tp __ln_gd = __log_gamma(__d);
          const _Tp __sgn_gmd = __log_gamma_sign(-__d);
          const _Tp __ln_gmd = __log_gamma(-__d);

          const _Tp __sgn1 = __sgn_gc * __sgn_gd * __sgn_g1ca * __sgn_g1cb;
          const _Tp __sgn2 = __sgn_gc * __sgn_gmd * __sgn_g2a * __sgn_g2b;

          _Tp __pre1, __pre2;
          if (__ok1 && __ok2)
            {
              _Tp __ln_pre1 = __ln_gc + __ln_gd - __ln_g1ca - __ln_g1cb;
              _Tp __ln_pre2 = __ln_gc + __ln_gmd - __ln_g2a - __ln_g2b
                            + __d * std::log(_Tp(1) - __x);
              if (__ln_pre1 < __log_max && __ln_pre2 < __log_max)
                {
                  __pre1 = std::exp(__ln_pre1);
                  __pre2 = std::exp(__ln_pre2);
                  __pre1 *= __sgn1;
                  __pre2 *= __sgn2;
                }
              else
                {
                  std::__throw_runtime_error(("Overflow of gamma functions " "in __hyperg_reflect")
                                                                       );
                }
            }
          else if (__ok1 && !__ok2)
            {
              _Tp __ln_pre1 = __ln_gc + __ln_gd - __ln_g1ca - __ln_g1cb;
              if (__ln_pre1 < __log_max)
                {
                  __pre1 = std::exp(__ln_pre1);
                  __pre1 *= __sgn1;
                  __pre2 = _Tp(0);
                }
              else
                {
                  std::__throw_runtime_error(("Overflow of gamma functions " "in __hyperg_reflect")
                                                                       );
                }
            }
          else if (!__ok1 && __ok2)
            {
              _Tp __ln_pre2 = __ln_gc + __ln_gmd - __ln_g2a - __ln_g2b
                            + __d * std::log(_Tp(1) - __x);
              if (__ln_pre2 < __log_max)
                {
                  __pre1 = _Tp(0);
                  __pre2 = std::exp(__ln_pre2);
                  __pre2 *= __sgn2;
                }
              else
                {
                  std::__throw_runtime_error(("Overflow of gamma functions " "in __hyperg_reflect")
                                                                       );
                }
            }
          else
            {
              __pre1 = _Tp(0);
              __pre2 = _Tp(0);
              std::__throw_runtime_error(("Underflow of gamma functions " "in __hyperg_reflect")
                                                                   );
            }

          const _Tp __F1 = __hyperg_series(__a, __b, _Tp(1) - __d,
                                           _Tp(1) - __x);
          const _Tp __F2 = __hyperg_series(__c - __a, __c - __b, _Tp(1) + __d,
                                           _Tp(1) - __x);

          const _Tp __F = __pre1 * __F1 + __pre2 * __F2;

          return __F;
        }
    }
# 728 "/usr/include/c++/9/tr1/hypergeometric.tcc" 3
    template<typename _Tp>
    _Tp
    __hyperg(_Tp __a, _Tp __b, _Tp __c, _Tp __x)
    {

      const _Tp __a_nint = ::std::nearbyint(__a);
      const _Tp __b_nint = ::std::nearbyint(__b);
      const _Tp __c_nint = ::std::nearbyint(__c);





      const _Tp __toler = _Tp(1000) * std::numeric_limits<_Tp>::epsilon();
      if (std::abs(__x) >= _Tp(1))
        std::__throw_domain_error(("Argument outside unit circle " "in __hyperg.")
                                                     );
      else if (__isnan(__a) || __isnan(__b)
            || __isnan(__c) || __isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__c_nint == __c && __c_nint <= _Tp(0))
        return std::numeric_limits<_Tp>::infinity();
      else if (std::abs(__c - __b) < __toler || std::abs(__c - __a) < __toler)
        return std::pow(_Tp(1) - __x, __c - __a - __b);
      else if (__a >= _Tp(0) && __b >= _Tp(0) && __c >= _Tp(0)
            && __x >= _Tp(0) && __x < _Tp(0.995L))
        return __hyperg_series(__a, __b, __c, __x);
      else if (std::abs(__a) < _Tp(10) && std::abs(__b) < _Tp(10))
        {


          if (__a < _Tp(0) && std::abs(__a - __a_nint) < __toler)
            return __hyperg_series(__a_nint, __b, __c, __x);
          else if (__b < _Tp(0) && std::abs(__b - __b_nint) < __toler)
            return __hyperg_series(__a, __b_nint, __c, __x);
          else if (__x < -_Tp(0.25L))
            return __hyperg_luke(__a, __b, __c, __x);
          else if (__x < _Tp(0.5L))
            return __hyperg_series(__a, __b, __c, __x);
          else
            if (std::abs(__c) > _Tp(10))
              return __hyperg_series(__a, __b, __c, __x);
            else
              return __hyperg_reflect(__a, __b, __c, __x);
        }
      else
        return __hyperg_luke(__a, __b, __c, __x);
    }
  }






}
# 55 "/usr/include/c++/9/bits/specfun.h" 2 3
# 1 "/usr/include/c++/9/tr1/legendre_function.tcc" 1 3
# 49 "/usr/include/c++/9/tr1/legendre_function.tcc" 3
namespace std __attribute__ ((__visibility__ ("default")))
{

# 65 "/usr/include/c++/9/tr1/legendre_function.tcc" 3
  namespace __detail
  {
# 80 "/usr/include/c++/9/tr1/legendre_function.tcc" 3
    template<typename _Tp>
    _Tp
    __poly_legendre_p(unsigned int __l, _Tp __x)
    {

      if (__isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__x == +_Tp(1))
        return +_Tp(1);
      else if (__x == -_Tp(1))
        return (__l % 2 == 1 ? -_Tp(1) : +_Tp(1));
      else
        {
          _Tp __p_lm2 = _Tp(1);
          if (__l == 0)
            return __p_lm2;

          _Tp __p_lm1 = __x;
          if (__l == 1)
            return __p_lm1;

          _Tp __p_l = 0;
          for (unsigned int __ll = 2; __ll <= __l; ++__ll)
            {


              __p_l = _Tp(2) * __x * __p_lm1 - __p_lm2
                    - (__x * __p_lm1 - __p_lm2) / _Tp(__ll);
              __p_lm2 = __p_lm1;
              __p_lm1 = __p_l;
            }

          return __p_l;
        }
    }
# 136 "/usr/include/c++/9/tr1/legendre_function.tcc" 3
    template<typename _Tp>
    _Tp
    __assoc_legendre_p(unsigned int __l, unsigned int __m, _Tp __x,
         _Tp __phase = _Tp(+1))
    {

      if (__m > __l)
        return _Tp(0);
      else if (__isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__m == 0)
        return __poly_legendre_p(__l, __x);
      else
        {
          _Tp __p_mm = _Tp(1);
          if (__m > 0)
            {


              _Tp __root = std::sqrt(_Tp(1) - __x) * std::sqrt(_Tp(1) + __x);
              _Tp __fact = _Tp(1);
              for (unsigned int __i = 1; __i <= __m; ++__i)
                {
                  __p_mm *= __phase * __fact * __root;
                  __fact += _Tp(2);
                }
            }
          if (__l == __m)
            return __p_mm;

          _Tp __p_mp1m = _Tp(2 * __m + 1) * __x * __p_mm;
          if (__l == __m + 1)
            return __p_mp1m;

          _Tp __p_lm2m = __p_mm;
          _Tp __P_lm1m = __p_mp1m;
          _Tp __p_lm = _Tp(0);
          for (unsigned int __j = __m + 2; __j <= __l; ++__j)
            {
              __p_lm = (_Tp(2 * __j - 1) * __x * __P_lm1m
                      - _Tp(__j + __m - 1) * __p_lm2m) / _Tp(__j - __m);
              __p_lm2m = __P_lm1m;
              __P_lm1m = __p_lm;
            }

          return __p_lm;
        }
    }
# 214 "/usr/include/c++/9/tr1/legendre_function.tcc" 3
    template <typename _Tp>
    _Tp
    __sph_legendre(unsigned int __l, unsigned int __m, _Tp __theta)
    {
      if (__isnan(__theta))
        return std::numeric_limits<_Tp>::quiet_NaN();

      const _Tp __x = std::cos(__theta);

      if (__m > __l)
        return _Tp(0);
      else if (__m == 0)
        {
          _Tp __P = __poly_legendre_p(__l, __x);
          _Tp __fact = std::sqrt(_Tp(2 * __l + 1)
                     / (_Tp(4) * __numeric_constants<_Tp>::__pi()));
          __P *= __fact;
          return __P;
        }
      else if (__x == _Tp(1) || __x == -_Tp(1))
        {

          return _Tp(0);
        }
      else
        {





          const _Tp __sgn = ( __m % 2 == 1 ? -_Tp(1) : _Tp(1));
          const _Tp __y_mp1m_factor = __x * std::sqrt(_Tp(2 * __m + 3));

          const _Tp __lncirc = ::std::log1p(-__x * __x);





          const _Tp __lnpoch = ::std::lgamma(_Tp(__m + _Tp(0.5L)))
                             - ::std::lgamma(_Tp(__m));




          const _Tp __lnpre_val =
                    -_Tp(0.25L) * __numeric_constants<_Tp>::__lnpi()
                    + _Tp(0.5L) * (__lnpoch + __m * __lncirc);
          const _Tp __sr = std::sqrt((_Tp(2) + _Tp(1) / __m)
                         / (_Tp(4) * __numeric_constants<_Tp>::__pi()));
          _Tp __y_mm = __sgn * __sr * std::exp(__lnpre_val);
          _Tp __y_mp1m = __y_mp1m_factor * __y_mm;

          if (__l == __m)
            return __y_mm;
          else if (__l == __m + 1)
            return __y_mp1m;
          else
            {
              _Tp __y_lm = _Tp(0);


              for (int __ll = __m + 2; __ll <= __l; ++__ll)
                {
                  const _Tp __rat1 = _Tp(__ll - __m) / _Tp(__ll + __m);
                  const _Tp __rat2 = _Tp(__ll - __m - 1) / _Tp(__ll + __m - 1);
                  const _Tp __fact1 = std::sqrt(__rat1 * _Tp(2 * __ll + 1)
                                                       * _Tp(2 * __ll - 1));
                  const _Tp __fact2 = std::sqrt(__rat1 * __rat2 * _Tp(2 * __ll + 1)
                                                                / _Tp(2 * __ll - 3));
                  __y_lm = (__x * __y_mp1m * __fact1
                         - (__ll + __m - 1) * __y_mm * __fact2) / _Tp(__ll - __m);
                  __y_mm = __y_mp1m;
                  __y_mp1m = __y_lm;
                }

              return __y_lm;
            }
        }
    }
  }






}
# 56 "/usr/include/c++/9/bits/specfun.h" 2 3
# 1 "/usr/include/c++/9/tr1/modified_bessel_func.tcc" 1 3
# 51 "/usr/include/c++/9/tr1/modified_bessel_func.tcc" 3
namespace std __attribute__ ((__visibility__ ("default")))
{

# 65 "/usr/include/c++/9/tr1/modified_bessel_func.tcc" 3
  namespace __detail
  {
# 83 "/usr/include/c++/9/tr1/modified_bessel_func.tcc" 3
    template <typename _Tp>
    void
    __bessel_ik(_Tp __nu, _Tp __x,
                _Tp & __Inu, _Tp & __Knu, _Tp & __Ipnu, _Tp & __Kpnu)
    {
      if (__x == _Tp(0))
        {
          if (__nu == _Tp(0))
            {
              __Inu = _Tp(1);
              __Ipnu = _Tp(0);
            }
          else if (__nu == _Tp(1))
            {
              __Inu = _Tp(0);
              __Ipnu = _Tp(0.5L);
            }
          else
            {
              __Inu = _Tp(0);
              __Ipnu = _Tp(0);
            }
          __Knu = std::numeric_limits<_Tp>::infinity();
          __Kpnu = -std::numeric_limits<_Tp>::infinity();
          return;
        }

      const _Tp __eps = std::numeric_limits<_Tp>::epsilon();
      const _Tp __fp_min = _Tp(10) * std::numeric_limits<_Tp>::epsilon();
      const int __max_iter = 15000;
      const _Tp __x_min = _Tp(2);

      const int __nl = static_cast<int>(__nu + _Tp(0.5L));

      const _Tp __mu = __nu - __nl;
      const _Tp __mu2 = __mu * __mu;
      const _Tp __xi = _Tp(1) / __x;
      const _Tp __xi2 = _Tp(2) * __xi;
      _Tp __h = __nu * __xi;
      if ( __h < __fp_min )
        __h = __fp_min;
      _Tp __b = __xi2 * __nu;
      _Tp __d = _Tp(0);
      _Tp __c = __h;
      int __i;
      for ( __i = 1; __i <= __max_iter; ++__i )
        {
          __b += __xi2;
          __d = _Tp(1) / (__b + __d);
          __c = __b + _Tp(1) / __c;
          const _Tp __del = __c * __d;
          __h *= __del;
          if (std::abs(__del - _Tp(1)) < __eps)
            break;
        }
      if (__i > __max_iter)
        std::__throw_runtime_error(("Argument x too large " "in __bessel_ik; " "try asymptotic expansion.")

                                                                   );
      _Tp __Inul = __fp_min;
      _Tp __Ipnul = __h * __Inul;
      _Tp __Inul1 = __Inul;
      _Tp __Ipnu1 = __Ipnul;
      _Tp __fact = __nu * __xi;
      for (int __l = __nl; __l >= 1; --__l)
        {
          const _Tp __Inutemp = __fact * __Inul + __Ipnul;
          __fact -= __xi;
          __Ipnul = __fact * __Inutemp + __Inul;
          __Inul = __Inutemp;
        }
      _Tp __f = __Ipnul / __Inul;
      _Tp __Kmu, __Knu1;
      if (__x < __x_min)
        {
          const _Tp __x2 = __x / _Tp(2);
          const _Tp __pimu = __numeric_constants<_Tp>::__pi() * __mu;
          const _Tp __fact = (std::abs(__pimu) < __eps
                            ? _Tp(1) : __pimu / std::sin(__pimu));
          _Tp __d = -std::log(__x2);
          _Tp __e = __mu * __d;
          const _Tp __fact2 = (std::abs(__e) < __eps
                            ? _Tp(1) : std::sinh(__e) / __e);
          _Tp __gam1, __gam2, __gampl, __gammi;
          __gamma_temme(__mu, __gam1, __gam2, __gampl, __gammi);
          _Tp __ff = __fact
                   * (__gam1 * std::cosh(__e) + __gam2 * __fact2 * __d);
          _Tp __sum = __ff;
          __e = std::exp(__e);
          _Tp __p = __e / (_Tp(2) * __gampl);
          _Tp __q = _Tp(1) / (_Tp(2) * __e * __gammi);
          _Tp __c = _Tp(1);
          __d = __x2 * __x2;
          _Tp __sum1 = __p;
          int __i;
          for (__i = 1; __i <= __max_iter; ++__i)
            {
              __ff = (__i * __ff + __p + __q) / (__i * __i - __mu2);
              __c *= __d / __i;
              __p /= __i - __mu;
              __q /= __i + __mu;
              const _Tp __del = __c * __ff;
              __sum += __del;
              const _Tp __del1 = __c * (__p - __i * __ff);
              __sum1 += __del1;
              if (std::abs(__del) < __eps * std::abs(__sum))
                break;
            }
          if (__i > __max_iter)
            std::__throw_runtime_error(("Bessel k series failed to converge " "in __bessel_ik.")
                                                             );
          __Kmu = __sum;
          __Knu1 = __sum1 * __xi2;
        }
      else
        {
          _Tp __b = _Tp(2) * (_Tp(1) + __x);
          _Tp __d = _Tp(1) / __b;
          _Tp __delh = __d;
          _Tp __h = __delh;
          _Tp __q1 = _Tp(0);
          _Tp __q2 = _Tp(1);
          _Tp __a1 = _Tp(0.25L) - __mu2;
          _Tp __q = __c = __a1;
          _Tp __a = -__a1;
          _Tp __s = _Tp(1) + __q * __delh;
          int __i;
          for (__i = 2; __i <= __max_iter; ++__i)
            {
              __a -= 2 * (__i - 1);
              __c = -__a * __c / __i;
              const _Tp __qnew = (__q1 - __b * __q2) / __a;
              __q1 = __q2;
              __q2 = __qnew;
              __q += __c * __qnew;
              __b += _Tp(2);
              __d = _Tp(1) / (__b + __a * __d);
              __delh = (__b * __d - _Tp(1)) * __delh;
              __h += __delh;
              const _Tp __dels = __q * __delh;
              __s += __dels;
              if ( std::abs(__dels / __s) < __eps )
                break;
            }
          if (__i > __max_iter)
            std::__throw_runtime_error(("Steed's method failed " "in __bessel_ik.")
                                                             );
          __h = __a1 * __h;
          __Kmu = std::sqrt(__numeric_constants<_Tp>::__pi() / (_Tp(2) * __x))
                * std::exp(-__x) / __s;
          __Knu1 = __Kmu * (__mu + __x + _Tp(0.5L) - __h) * __xi;
        }

      _Tp __Kpmu = __mu * __xi * __Kmu - __Knu1;
      _Tp __Inumu = __xi / (__f * __Kmu - __Kpmu);
      __Inu = __Inumu * __Inul1 / __Inul;
      __Ipnu = __Inumu * __Ipnu1 / __Inul;
      for ( __i = 1; __i <= __nl; ++__i )
        {
          const _Tp __Knutemp = (__mu + __i) * __xi2 * __Knu1 + __Kmu;
          __Kmu = __Knu1;
          __Knu1 = __Knutemp;
        }
      __Knu = __Kmu;
      __Kpnu = __nu * __xi * __Kmu - __Knu1;

      return;
    }
# 267 "/usr/include/c++/9/tr1/modified_bessel_func.tcc" 3
    template<typename _Tp>
    _Tp
    __cyl_bessel_i(_Tp __nu, _Tp __x)
    {
      if (__nu < _Tp(0) || __x < _Tp(0))
        std::__throw_domain_error(("Bad argument " "in __cyl_bessel_i.")
                                                           );
      else if (__isnan(__nu) || __isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__x * __x < _Tp(10) * (__nu + _Tp(1)))
        return __cyl_bessel_ij_series(__nu, __x, +_Tp(1), 200);
      else
        {
          _Tp __I_nu, __K_nu, __Ip_nu, __Kp_nu;
          __bessel_ik(__nu, __x, __I_nu, __K_nu, __Ip_nu, __Kp_nu);
          return __I_nu;
        }
    }
# 303 "/usr/include/c++/9/tr1/modified_bessel_func.tcc" 3
    template<typename _Tp>
    _Tp
    __cyl_bessel_k(_Tp __nu, _Tp __x)
    {
      if (__nu < _Tp(0) || __x < _Tp(0))
        std::__throw_domain_error(("Bad argument " "in __cyl_bessel_k.")
                                                           );
      else if (__isnan(__nu) || __isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else
        {
          _Tp __I_nu, __K_nu, __Ip_nu, __Kp_nu;
          __bessel_ik(__nu, __x, __I_nu, __K_nu, __Ip_nu, __Kp_nu);
          return __K_nu;
        }
    }
# 337 "/usr/include/c++/9/tr1/modified_bessel_func.tcc" 3
    template <typename _Tp>
    void
    __sph_bessel_ik(unsigned int __n, _Tp __x,
                    _Tp & __i_n, _Tp & __k_n, _Tp & __ip_n, _Tp & __kp_n)
    {
      const _Tp __nu = _Tp(__n) + _Tp(0.5L);

      _Tp __I_nu, __Ip_nu, __K_nu, __Kp_nu;
      __bessel_ik(__nu, __x, __I_nu, __K_nu, __Ip_nu, __Kp_nu);

      const _Tp __factor = __numeric_constants<_Tp>::__sqrtpio2()
                         / std::sqrt(__x);

      __i_n = __factor * __I_nu;
      __k_n = __factor * __K_nu;
      __ip_n = __factor * __Ip_nu - __i_n / (_Tp(2) * __x);
      __kp_n = __factor * __Kp_nu - __k_n / (_Tp(2) * __x);

      return;
    }
# 373 "/usr/include/c++/9/tr1/modified_bessel_func.tcc" 3
    template <typename _Tp>
    void
    __airy(_Tp __x, _Tp & __Ai, _Tp & __Bi, _Tp & __Aip, _Tp & __Bip)
    {
      const _Tp __absx = std::abs(__x);
      const _Tp __rootx = std::sqrt(__absx);
      const _Tp __z = _Tp(2) * __absx * __rootx / _Tp(3);
      const _Tp _S_NaN = std::numeric_limits<_Tp>::quiet_NaN();
      const _Tp _S_inf = std::numeric_limits<_Tp>::infinity();

      if (__isnan(__x))
        __Bip = __Aip = __Bi = __Ai = std::numeric_limits<_Tp>::quiet_NaN();
      else if (__z == _S_inf)
        {
   __Aip = __Ai = _Tp(0);
   __Bip = __Bi = _S_inf;
 }
      else if (__z == -_S_inf)
 __Bip = __Aip = __Bi = __Ai = _Tp(0);
      else if (__x > _Tp(0))
        {
          _Tp __I_nu, __Ip_nu, __K_nu, __Kp_nu;

          __bessel_ik(_Tp(1) / _Tp(3), __z, __I_nu, __K_nu, __Ip_nu, __Kp_nu);
          __Ai = __rootx * __K_nu
               / (__numeric_constants<_Tp>::__sqrt3()
                * __numeric_constants<_Tp>::__pi());
          __Bi = __rootx * (__K_nu / __numeric_constants<_Tp>::__pi()
                 + _Tp(2) * __I_nu / __numeric_constants<_Tp>::__sqrt3());

          __bessel_ik(_Tp(2) / _Tp(3), __z, __I_nu, __K_nu, __Ip_nu, __Kp_nu);
          __Aip = -__x * __K_nu
                / (__numeric_constants<_Tp>::__sqrt3()
                 * __numeric_constants<_Tp>::__pi());
          __Bip = __x * (__K_nu / __numeric_constants<_Tp>::__pi()
                      + _Tp(2) * __I_nu
                      / __numeric_constants<_Tp>::__sqrt3());
        }
      else if (__x < _Tp(0))
        {
          _Tp __J_nu, __Jp_nu, __N_nu, __Np_nu;

          __bessel_jn(_Tp(1) / _Tp(3), __z, __J_nu, __N_nu, __Jp_nu, __Np_nu);
          __Ai = __rootx * (__J_nu
                    - __N_nu / __numeric_constants<_Tp>::__sqrt3()) / _Tp(2);
          __Bi = -__rootx * (__N_nu
                    + __J_nu / __numeric_constants<_Tp>::__sqrt3()) / _Tp(2);

          __bessel_jn(_Tp(2) / _Tp(3), __z, __J_nu, __N_nu, __Jp_nu, __Np_nu);
          __Aip = __absx * (__N_nu / __numeric_constants<_Tp>::__sqrt3()
                          + __J_nu) / _Tp(2);
          __Bip = __absx * (__J_nu / __numeric_constants<_Tp>::__sqrt3()
                          - __N_nu) / _Tp(2);
        }
      else
        {



          __Ai = _Tp(0.35502805388781723926L);
          __Bi = __Ai * __numeric_constants<_Tp>::__sqrt3();




          __Aip = -_Tp(0.25881940379280679840L);
          __Bip = -__Aip * __numeric_constants<_Tp>::__sqrt3();
        }

      return;
    }
  }





}
# 57 "/usr/include/c++/9/bits/specfun.h" 2 3
# 1 "/usr/include/c++/9/tr1/poly_hermite.tcc" 1 3
# 42 "/usr/include/c++/9/tr1/poly_hermite.tcc" 3
namespace std __attribute__ ((__visibility__ ("default")))
{

# 56 "/usr/include/c++/9/tr1/poly_hermite.tcc" 3
  namespace __detail
  {
# 72 "/usr/include/c++/9/tr1/poly_hermite.tcc" 3
    template<typename _Tp>
    _Tp
    __poly_hermite_recursion(unsigned int __n, _Tp __x)
    {

      _Tp __H_0 = 1;
      if (__n == 0)
        return __H_0;


      _Tp __H_1 = 2 * __x;
      if (__n == 1)
        return __H_1;


      _Tp __H_n, __H_nm1, __H_nm2;
      unsigned int __i;
      for (__H_nm2 = __H_0, __H_nm1 = __H_1, __i = 2; __i <= __n; ++__i)
        {
          __H_n = 2 * (__x * __H_nm1 - (__i - 1) * __H_nm2);
          __H_nm2 = __H_nm1;
          __H_nm1 = __H_n;
        }

      return __H_n;
    }
# 114 "/usr/include/c++/9/tr1/poly_hermite.tcc" 3
    template<typename _Tp>
    inline _Tp
    __poly_hermite(unsigned int __n, _Tp __x)
    {
      if (__isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else
        return __poly_hermite_recursion(__n, __x);
    }
  }





}
# 58 "/usr/include/c++/9/bits/specfun.h" 2 3
# 1 "/usr/include/c++/9/tr1/poly_laguerre.tcc" 1 3
# 44 "/usr/include/c++/9/tr1/poly_laguerre.tcc" 3
namespace std __attribute__ ((__visibility__ ("default")))
{

# 60 "/usr/include/c++/9/tr1/poly_laguerre.tcc" 3
  namespace __detail
  {
# 75 "/usr/include/c++/9/tr1/poly_laguerre.tcc" 3
    template<typename _Tpa, typename _Tp>
    _Tp
    __poly_laguerre_large_n(unsigned __n, _Tpa __alpha1, _Tp __x)
    {
      const _Tp __a = -_Tp(__n);
      const _Tp __b = _Tp(__alpha1) + _Tp(1);
      const _Tp __eta = _Tp(2) * __b - _Tp(4) * __a;
      const _Tp __cos2th = __x / __eta;
      const _Tp __sin2th = _Tp(1) - __cos2th;
      const _Tp __th = std::acos(std::sqrt(__cos2th));
      const _Tp __pre_h = __numeric_constants<_Tp>::__pi_2()
                        * __numeric_constants<_Tp>::__pi_2()
                        * __eta * __eta * __cos2th * __sin2th;


      const _Tp __lg_b = ::std::lgamma(_Tp(__n) + __b);
      const _Tp __lnfact = ::std::lgamma(_Tp(__n + 1));





      _Tp __pre_term1 = _Tp(0.5L) * (_Tp(1) - __b)
                      * std::log(_Tp(0.25L) * __x * __eta);
      _Tp __pre_term2 = _Tp(0.25L) * std::log(__pre_h);
      _Tp __lnpre = __lg_b - __lnfact + _Tp(0.5L) * __x
                      + __pre_term1 - __pre_term2;
      _Tp __ser_term1 = std::sin(__a * __numeric_constants<_Tp>::__pi());
      _Tp __ser_term2 = std::sin(_Tp(0.25L) * __eta
                              * (_Tp(2) * __th
                               - std::sin(_Tp(2) * __th))
                               + __numeric_constants<_Tp>::__pi_4());
      _Tp __ser = __ser_term1 + __ser_term2;

      return std::exp(__lnpre) * __ser;
    }
# 129 "/usr/include/c++/9/tr1/poly_laguerre.tcc" 3
    template<typename _Tpa, typename _Tp>
    _Tp
    __poly_laguerre_hyperg(unsigned int __n, _Tpa __alpha1, _Tp __x)
    {
      const _Tp __b = _Tp(__alpha1) + _Tp(1);
      const _Tp __mx = -__x;
      const _Tp __tc_sgn = (__x < _Tp(0) ? _Tp(1)
                         : ((__n % 2 == 1) ? -_Tp(1) : _Tp(1)));

      _Tp __tc = _Tp(1);
      const _Tp __ax = std::abs(__x);
      for (unsigned int __k = 1; __k <= __n; ++__k)
        __tc *= (__ax / __k);

      _Tp __term = __tc * __tc_sgn;
      _Tp __sum = __term;
      for (int __k = int(__n) - 1; __k >= 0; --__k)
        {
          __term *= ((__b + _Tp(__k)) / _Tp(int(__n) - __k))
                  * _Tp(__k + 1) / __mx;
          __sum += __term;
        }

      return __sum;
    }
# 185 "/usr/include/c++/9/tr1/poly_laguerre.tcc" 3
    template<typename _Tpa, typename _Tp>
    _Tp
    __poly_laguerre_recursion(unsigned int __n, _Tpa __alpha1, _Tp __x)
    {

      _Tp __l_0 = _Tp(1);
      if (__n == 0)
        return __l_0;


      _Tp __l_1 = -__x + _Tp(1) + _Tp(__alpha1);
      if (__n == 1)
        return __l_1;


      _Tp __l_n2 = __l_0;
      _Tp __l_n1 = __l_1;
      _Tp __l_n = _Tp(0);
      for (unsigned int __nn = 2; __nn <= __n; ++__nn)
        {
            __l_n = (_Tp(2 * __nn - 1) + _Tp(__alpha1) - __x)
                  * __l_n1 / _Tp(__nn)
                  - (_Tp(__nn - 1) + _Tp(__alpha1)) * __l_n2 / _Tp(__nn);
            __l_n2 = __l_n1;
            __l_n1 = __l_n;
        }

      return __l_n;
    }
# 244 "/usr/include/c++/9/tr1/poly_laguerre.tcc" 3
    template<typename _Tpa, typename _Tp>
    _Tp
    __poly_laguerre(unsigned int __n, _Tpa __alpha1, _Tp __x)
    {
      if (__x < _Tp(0))
        std::__throw_domain_error(("Negative argument " "in __poly_laguerre.")
                                                            );

      else if (__isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__n == 0)
        return _Tp(1);
      else if (__n == 1)
        return _Tp(1) + _Tp(__alpha1) - __x;
      else if (__x == _Tp(0))
        {
          _Tp __prod = _Tp(__alpha1) + _Tp(1);
          for (unsigned int __k = 2; __k <= __n; ++__k)
            __prod *= (_Tp(__alpha1) + _Tp(__k)) / _Tp(__k);
          return __prod;
        }
      else if (__n > 10000000 && _Tp(__alpha1) > -_Tp(1)
            && __x < _Tp(2) * (_Tp(__alpha1) + _Tp(1)) + _Tp(4 * __n))
        return __poly_laguerre_large_n(__n, __alpha1, __x);
      else if (_Tp(__alpha1) >= _Tp(0)
           || (__x > _Tp(0) && _Tp(__alpha1) < -_Tp(__n + 1)))
        return __poly_laguerre_recursion(__n, __alpha1, __x);
      else
        return __poly_laguerre_hyperg(__n, __alpha1, __x);
    }
# 296 "/usr/include/c++/9/tr1/poly_laguerre.tcc" 3
    template<typename _Tp>
    inline _Tp
    __assoc_laguerre(unsigned int __n, unsigned int __m, _Tp __x)
    { return __poly_laguerre<unsigned int, _Tp>(__n, __m, __x); }
# 316 "/usr/include/c++/9/tr1/poly_laguerre.tcc" 3
    template<typename _Tp>
    inline _Tp
    __laguerre(unsigned int __n, _Tp __x)
    { return __poly_laguerre<unsigned int, _Tp>(__n, 0, __x); }
  }






}
# 59 "/usr/include/c++/9/bits/specfun.h" 2 3
# 1 "/usr/include/c++/9/tr1/riemann_zeta.tcc" 1 3
# 47 "/usr/include/c++/9/tr1/riemann_zeta.tcc" 3
namespace std __attribute__ ((__visibility__ ("default")))
{

# 63 "/usr/include/c++/9/tr1/riemann_zeta.tcc" 3
  namespace __detail
  {
# 78 "/usr/include/c++/9/tr1/riemann_zeta.tcc" 3
    template<typename _Tp>
    _Tp
    __riemann_zeta_sum(_Tp __s)
    {

      if (__s < _Tp(1))
        std::__throw_domain_error(("Bad argument in zeta sum."));

      const unsigned int max_iter = 10000;
      _Tp __zeta = _Tp(0);
      for (unsigned int __k = 1; __k < max_iter; ++__k)
        {
          _Tp __term = std::pow(static_cast<_Tp>(__k), -__s);
          if (__term < std::numeric_limits<_Tp>::epsilon())
            {
              break;
            }
          __zeta += __term;
        }

      return __zeta;
    }
# 115 "/usr/include/c++/9/tr1/riemann_zeta.tcc" 3
    template<typename _Tp>
    _Tp
    __riemann_zeta_alt(_Tp __s)
    {
      _Tp __sgn = _Tp(1);
      _Tp __zeta = _Tp(0);
      for (unsigned int __i = 1; __i < 10000000; ++__i)
        {
          _Tp __term = __sgn / std::pow(__i, __s);
          if (std::abs(__term) < std::numeric_limits<_Tp>::epsilon())
            break;
          __zeta += __term;
          __sgn *= _Tp(-1);
        }
      __zeta /= _Tp(1) - std::pow(_Tp(2), _Tp(1) - __s);

      return __zeta;
    }
# 157 "/usr/include/c++/9/tr1/riemann_zeta.tcc" 3
    template<typename _Tp>
    _Tp
    __riemann_zeta_glob(_Tp __s)
    {
      _Tp __zeta = _Tp(0);

      const _Tp __eps = std::numeric_limits<_Tp>::epsilon();

      const _Tp __max_bincoeff = std::numeric_limits<_Tp>::max_exponent10
                               * std::log(_Tp(10)) - _Tp(1);



      if (__s < _Tp(0))
        {

          if (::std::fmod(__s,_Tp(2)) == _Tp(0))
            return _Tp(0);
          else

            {
              _Tp __zeta = __riemann_zeta_glob(_Tp(1) - __s);
              __zeta *= std::pow(_Tp(2)
                     * __numeric_constants<_Tp>::__pi(), __s)
                     * std::sin(__numeric_constants<_Tp>::__pi_2() * __s)

                     * std::exp(::std::lgamma(_Tp(1) - __s))



                     / __numeric_constants<_Tp>::__pi();
              return __zeta;
            }
        }

      _Tp __num = _Tp(0.5L);
      const unsigned int __maxit = 10000;
      for (unsigned int __i = 0; __i < __maxit; ++__i)
        {
          bool __punt = false;
          _Tp __sgn = _Tp(1);
          _Tp __term = _Tp(0);
          for (unsigned int __j = 0; __j <= __i; ++__j)
            {

              _Tp __bincoeff = ::std::lgamma(_Tp(1 + __i))
                              - ::std::lgamma(_Tp(1 + __j))
                              - ::std::lgamma(_Tp(1 + __i - __j));





              if (__bincoeff > __max_bincoeff)
                {

                  __punt = true;
                  break;
                }
              __bincoeff = std::exp(__bincoeff);
              __term += __sgn * __bincoeff * std::pow(_Tp(1 + __j), -__s);
              __sgn *= _Tp(-1);
            }
          if (__punt)
            break;
          __term *= __num;
          __zeta += __term;
          if (std::abs(__term/__zeta) < __eps)
            break;
          __num *= _Tp(0.5L);
        }

      __zeta /= _Tp(1) - std::pow(_Tp(2), _Tp(1) - __s);

      return __zeta;
    }
# 252 "/usr/include/c++/9/tr1/riemann_zeta.tcc" 3
    template<typename _Tp>
    _Tp
    __riemann_zeta_product(_Tp __s)
    {
      static const _Tp __prime[] = {
        _Tp(2), _Tp(3), _Tp(5), _Tp(7), _Tp(11), _Tp(13), _Tp(17), _Tp(19),
        _Tp(23), _Tp(29), _Tp(31), _Tp(37), _Tp(41), _Tp(43), _Tp(47),
        _Tp(53), _Tp(59), _Tp(61), _Tp(67), _Tp(71), _Tp(73), _Tp(79),
        _Tp(83), _Tp(89), _Tp(97), _Tp(101), _Tp(103), _Tp(107), _Tp(109)
      };
      static const unsigned int __num_primes = sizeof(__prime) / sizeof(_Tp);

      _Tp __zeta = _Tp(1);
      for (unsigned int __i = 0; __i < __num_primes; ++__i)
        {
          const _Tp __fact = _Tp(1) - std::pow(__prime[__i], -__s);
          __zeta *= __fact;
          if (_Tp(1) - __fact < std::numeric_limits<_Tp>::epsilon())
            break;
        }

      __zeta = _Tp(1) / __zeta;

      return __zeta;
    }
# 293 "/usr/include/c++/9/tr1/riemann_zeta.tcc" 3
    template<typename _Tp>
    _Tp
    __riemann_zeta(_Tp __s)
    {
      if (__isnan(__s))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__s == _Tp(1))
        return std::numeric_limits<_Tp>::infinity();
      else if (__s < -_Tp(19))
        {
          _Tp __zeta = __riemann_zeta_product(_Tp(1) - __s);
          __zeta *= std::pow(_Tp(2) * __numeric_constants<_Tp>::__pi(), __s)
                 * std::sin(__numeric_constants<_Tp>::__pi_2() * __s)

                 * std::exp(::std::lgamma(_Tp(1) - __s))



                 / __numeric_constants<_Tp>::__pi();
          return __zeta;
        }
      else if (__s < _Tp(20))
        {

          bool __glob = true;
          if (__glob)
            return __riemann_zeta_glob(__s);
          else
            {
              if (__s > _Tp(1))
                return __riemann_zeta_sum(__s);
              else
                {
                  _Tp __zeta = std::pow(_Tp(2)
                                * __numeric_constants<_Tp>::__pi(), __s)
                         * std::sin(__numeric_constants<_Tp>::__pi_2() * __s)

                             * ::std::tgamma(_Tp(1) - __s)



                             * __riemann_zeta_sum(_Tp(1) - __s);
                  return __zeta;
                }
            }
        }
      else
        return __riemann_zeta_product(__s);
    }
# 365 "/usr/include/c++/9/tr1/riemann_zeta.tcc" 3
    template<typename _Tp>
    _Tp
    __hurwitz_zeta_glob(_Tp __a, _Tp __s)
    {
      _Tp __zeta = _Tp(0);

      const _Tp __eps = std::numeric_limits<_Tp>::epsilon();

      const _Tp __max_bincoeff = std::numeric_limits<_Tp>::max_exponent10
                               * std::log(_Tp(10)) - _Tp(1);

      const unsigned int __maxit = 10000;
      for (unsigned int __i = 0; __i < __maxit; ++__i)
        {
          bool __punt = false;
          _Tp __sgn = _Tp(1);
          _Tp __term = _Tp(0);
          for (unsigned int __j = 0; __j <= __i; ++__j)
            {

              _Tp __bincoeff = ::std::lgamma(_Tp(1 + __i))
                              - ::std::lgamma(_Tp(1 + __j))
                              - ::std::lgamma(_Tp(1 + __i - __j));





              if (__bincoeff > __max_bincoeff)
                {

                  __punt = true;
                  break;
                }
              __bincoeff = std::exp(__bincoeff);
              __term += __sgn * __bincoeff * std::pow(_Tp(__a + __j), -__s);
              __sgn *= _Tp(-1);
            }
          if (__punt)
            break;
          __term /= _Tp(__i + 1);
          if (std::abs(__term / __zeta) < __eps)
            break;
          __zeta += __term;
        }

      __zeta /= __s - _Tp(1);

      return __zeta;
    }
# 430 "/usr/include/c++/9/tr1/riemann_zeta.tcc" 3
    template<typename _Tp>
    inline _Tp
    __hurwitz_zeta(_Tp __a, _Tp __s)
    { return __hurwitz_zeta_glob(__a, __s); }
  }






}
# 60 "/usr/include/c++/9/bits/specfun.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{

# 205 "/usr/include/c++/9/bits/specfun.h" 3
  inline float
  assoc_laguerref(unsigned int __n, unsigned int __m, float __x)
  { return __detail::__assoc_laguerre<float>(__n, __m, __x); }







  inline long double
  assoc_laguerrel(unsigned int __n, unsigned int __m, long double __x)
  { return __detail::__assoc_laguerre<long double>(__n, __m, __x); }
# 250 "/usr/include/c++/9/bits/specfun.h" 3
  template<typename _Tp>
    inline typename __gnu_cxx::__promote<_Tp>::__type
    assoc_laguerre(unsigned int __n, unsigned int __m, _Tp __x)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __detail::__assoc_laguerre<__type>(__n, __m, __x);
    }
# 266 "/usr/include/c++/9/bits/specfun.h" 3
  inline float
  assoc_legendref(unsigned int __l, unsigned int __m, float __x)
  { return __detail::__assoc_legendre_p<float>(__l, __m, __x); }






  inline long double
  assoc_legendrel(unsigned int __l, unsigned int __m, long double __x)
  { return __detail::__assoc_legendre_p<long double>(__l, __m, __x); }
# 296 "/usr/include/c++/9/bits/specfun.h" 3
  template<typename _Tp>
    inline typename __gnu_cxx::__promote<_Tp>::__type
    assoc_legendre(unsigned int __l, unsigned int __m, _Tp __x)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __detail::__assoc_legendre_p<__type>(__l, __m, __x);
    }
# 311 "/usr/include/c++/9/bits/specfun.h" 3
  inline float
  betaf(float __a, float __b)
  { return __detail::__beta<float>(__a, __b); }







  inline long double
  betal(long double __a, long double __b)
  { return __detail::__beta<long double>(__a, __b); }
# 341 "/usr/include/c++/9/bits/specfun.h" 3
  template<typename _Tpa, typename _Tpb>
    inline typename __gnu_cxx::__promote_2<_Tpa, _Tpb>::__type
    beta(_Tpa __a, _Tpb __b)
    {
      typedef typename __gnu_cxx::__promote_2<_Tpa, _Tpb>::__type __type;
      return __detail::__beta<__type>(__a, __b);
    }
# 357 "/usr/include/c++/9/bits/specfun.h" 3
  inline float
  comp_ellint_1f(float __k)
  { return __detail::__comp_ellint_1<float>(__k); }







  inline long double
  comp_ellint_1l(long double __k)
  { return __detail::__comp_ellint_1<long double>(__k); }
# 389 "/usr/include/c++/9/bits/specfun.h" 3
  template<typename _Tp>
    inline typename __gnu_cxx::__promote<_Tp>::__type
    comp_ellint_1(_Tp __k)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __detail::__comp_ellint_1<__type>(__k);
    }
# 405 "/usr/include/c++/9/bits/specfun.h" 3
  inline float
  comp_ellint_2f(float __k)
  { return __detail::__comp_ellint_2<float>(__k); }







  inline long double
  comp_ellint_2l(long double __k)
  { return __detail::__comp_ellint_2<long double>(__k); }
# 436 "/usr/include/c++/9/bits/specfun.h" 3
  template<typename _Tp>
    inline typename __gnu_cxx::__promote<_Tp>::__type
    comp_ellint_2(_Tp __k)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __detail::__comp_ellint_2<__type>(__k);
    }
# 452 "/usr/include/c++/9/bits/specfun.h" 3
  inline float
  comp_ellint_3f(float __k, float __nu)
  { return __detail::__comp_ellint_3<float>(__k, __nu); }







  inline long double
  comp_ellint_3l(long double __k, long double __nu)
  { return __detail::__comp_ellint_3<long double>(__k, __nu); }
# 487 "/usr/include/c++/9/bits/specfun.h" 3
  template<typename _Tp, typename _Tpn>
    inline typename __gnu_cxx::__promote_2<_Tp, _Tpn>::__type
    comp_ellint_3(_Tp __k, _Tpn __nu)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Tpn>::__type __type;
      return __detail::__comp_ellint_3<__type>(__k, __nu);
    }
# 503 "/usr/include/c++/9/bits/specfun.h" 3
  inline float
  cyl_bessel_if(float __nu, float __x)
  { return __detail::__cyl_bessel_i<float>(__nu, __x); }







  inline long double
  cyl_bessel_il(long double __nu, long double __x)
  { return __detail::__cyl_bessel_i<long double>(__nu, __x); }
# 533 "/usr/include/c++/9/bits/specfun.h" 3
  template<typename _Tpnu, typename _Tp>
    inline typename __gnu_cxx::__promote_2<_Tpnu, _Tp>::__type
    cyl_bessel_i(_Tpnu __nu, _Tp __x)
    {
      typedef typename __gnu_cxx::__promote_2<_Tpnu, _Tp>::__type __type;
      return __detail::__cyl_bessel_i<__type>(__nu, __x);
    }
# 549 "/usr/include/c++/9/bits/specfun.h" 3
  inline float
  cyl_bessel_jf(float __nu, float __x)
  { return __detail::__cyl_bessel_j<float>(__nu, __x); }







  inline long double
  cyl_bessel_jl(long double __nu, long double __x)
  { return __detail::__cyl_bessel_j<long double>(__nu, __x); }
# 579 "/usr/include/c++/9/bits/specfun.h" 3
  template<typename _Tpnu, typename _Tp>
    inline typename __gnu_cxx::__promote_2<_Tpnu, _Tp>::__type
    cyl_bessel_j(_Tpnu __nu, _Tp __x)
    {
      typedef typename __gnu_cxx::__promote_2<_Tpnu, _Tp>::__type __type;
      return __detail::__cyl_bessel_j<__type>(__nu, __x);
    }
# 595 "/usr/include/c++/9/bits/specfun.h" 3
  inline float
  cyl_bessel_kf(float __nu, float __x)
  { return __detail::__cyl_bessel_k<float>(__nu, __x); }







  inline long double
  cyl_bessel_kl(long double __nu, long double __x)
  { return __detail::__cyl_bessel_k<long double>(__nu, __x); }
# 631 "/usr/include/c++/9/bits/specfun.h" 3
  template<typename _Tpnu, typename _Tp>
    inline typename __gnu_cxx::__promote_2<_Tpnu, _Tp>::__type
    cyl_bessel_k(_Tpnu __nu, _Tp __x)
    {
      typedef typename __gnu_cxx::__promote_2<_Tpnu, _Tp>::__type __type;
      return __detail::__cyl_bessel_k<__type>(__nu, __x);
    }
# 647 "/usr/include/c++/9/bits/specfun.h" 3
  inline float
  cyl_neumannf(float __nu, float __x)
  { return __detail::__cyl_neumann_n<float>(__nu, __x); }







  inline long double
  cyl_neumannl(long double __nu, long double __x)
  { return __detail::__cyl_neumann_n<long double>(__nu, __x); }
# 679 "/usr/include/c++/9/bits/specfun.h" 3
  template<typename _Tpnu, typename _Tp>
    inline typename __gnu_cxx::__promote_2<_Tpnu, _Tp>::__type
    cyl_neumann(_Tpnu __nu, _Tp __x)
    {
      typedef typename __gnu_cxx::__promote_2<_Tpnu, _Tp>::__type __type;
      return __detail::__cyl_neumann_n<__type>(__nu, __x);
    }
# 695 "/usr/include/c++/9/bits/specfun.h" 3
  inline float
  ellint_1f(float __k, float __phi)
  { return __detail::__ellint_1<float>(__k, __phi); }







  inline long double
  ellint_1l(long double __k, long double __phi)
  { return __detail::__ellint_1<long double>(__k, __phi); }
# 727 "/usr/include/c++/9/bits/specfun.h" 3
  template<typename _Tp, typename _Tpp>
    inline typename __gnu_cxx::__promote_2<_Tp, _Tpp>::__type
    ellint_1(_Tp __k, _Tpp __phi)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Tpp>::__type __type;
      return __detail::__ellint_1<__type>(__k, __phi);
    }
# 743 "/usr/include/c++/9/bits/specfun.h" 3
  inline float
  ellint_2f(float __k, float __phi)
  { return __detail::__ellint_2<float>(__k, __phi); }







  inline long double
  ellint_2l(long double __k, long double __phi)
  { return __detail::__ellint_2<long double>(__k, __phi); }
# 775 "/usr/include/c++/9/bits/specfun.h" 3
  template<typename _Tp, typename _Tpp>
    inline typename __gnu_cxx::__promote_2<_Tp, _Tpp>::__type
    ellint_2(_Tp __k, _Tpp __phi)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Tpp>::__type __type;
      return __detail::__ellint_2<__type>(__k, __phi);
    }
# 791 "/usr/include/c++/9/bits/specfun.h" 3
  inline float
  ellint_3f(float __k, float __nu, float __phi)
  { return __detail::__ellint_3<float>(__k, __nu, __phi); }







  inline long double
  ellint_3l(long double __k, long double __nu, long double __phi)
  { return __detail::__ellint_3<long double>(__k, __nu, __phi); }
# 828 "/usr/include/c++/9/bits/specfun.h" 3
  template<typename _Tp, typename _Tpn, typename _Tpp>
    inline typename __gnu_cxx::__promote_3<_Tp, _Tpn, _Tpp>::__type
    ellint_3(_Tp __k, _Tpn __nu, _Tpp __phi)
    {
      typedef typename __gnu_cxx::__promote_3<_Tp, _Tpn, _Tpp>::__type __type;
      return __detail::__ellint_3<__type>(__k, __nu, __phi);
    }
# 843 "/usr/include/c++/9/bits/specfun.h" 3
  inline float
  expintf(float __x)
  { return __detail::__expint<float>(__x); }







  inline long double
  expintl(long double __x)
  { return __detail::__expint<long double>(__x); }
# 868 "/usr/include/c++/9/bits/specfun.h" 3
  template<typename _Tp>
    inline typename __gnu_cxx::__promote<_Tp>::__type
    expint(_Tp __x)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __detail::__expint<__type>(__x);
    }
# 884 "/usr/include/c++/9/bits/specfun.h" 3
  inline float
  hermitef(unsigned int __n, float __x)
  { return __detail::__poly_hermite<float>(__n, __x); }







  inline long double
  hermitel(unsigned int __n, long double __x)
  { return __detail::__poly_hermite<long double>(__n, __x); }
# 916 "/usr/include/c++/9/bits/specfun.h" 3
  template<typename _Tp>
    inline typename __gnu_cxx::__promote<_Tp>::__type
    hermite(unsigned int __n, _Tp __x)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __detail::__poly_hermite<__type>(__n, __x);
    }
# 932 "/usr/include/c++/9/bits/specfun.h" 3
  inline float
  laguerref(unsigned int __n, float __x)
  { return __detail::__laguerre<float>(__n, __x); }







  inline long double
  laguerrel(unsigned int __n, long double __x)
  { return __detail::__laguerre<long double>(__n, __x); }
# 960 "/usr/include/c++/9/bits/specfun.h" 3
  template<typename _Tp>
    inline typename __gnu_cxx::__promote<_Tp>::__type
    laguerre(unsigned int __n, _Tp __x)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __detail::__laguerre<__type>(__n, __x);
    }
# 976 "/usr/include/c++/9/bits/specfun.h" 3
  inline float
  legendref(unsigned int __l, float __x)
  { return __detail::__poly_legendre_p<float>(__l, __x); }







  inline long double
  legendrel(unsigned int __l, long double __x)
  { return __detail::__poly_legendre_p<long double>(__l, __x); }
# 1005 "/usr/include/c++/9/bits/specfun.h" 3
  template<typename _Tp>
    inline typename __gnu_cxx::__promote<_Tp>::__type
    legendre(unsigned int __l, _Tp __x)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __detail::__poly_legendre_p<__type>(__l, __x);
    }
# 1021 "/usr/include/c++/9/bits/specfun.h" 3
  inline float
  riemann_zetaf(float __s)
  { return __detail::__riemann_zeta<float>(__s); }







  inline long double
  riemann_zetal(long double __s)
  { return __detail::__riemann_zeta<long double>(__s); }
# 1056 "/usr/include/c++/9/bits/specfun.h" 3
  template<typename _Tp>
    inline typename __gnu_cxx::__promote<_Tp>::__type
    riemann_zeta(_Tp __s)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __detail::__riemann_zeta<__type>(__s);
    }
# 1072 "/usr/include/c++/9/bits/specfun.h" 3
  inline float
  sph_besself(unsigned int __n, float __x)
  { return __detail::__sph_bessel<float>(__n, __x); }







  inline long double
  sph_bessell(unsigned int __n, long double __x)
  { return __detail::__sph_bessel<long double>(__n, __x); }
# 1100 "/usr/include/c++/9/bits/specfun.h" 3
  template<typename _Tp>
    inline typename __gnu_cxx::__promote<_Tp>::__type
    sph_bessel(unsigned int __n, _Tp __x)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __detail::__sph_bessel<__type>(__n, __x);
    }
# 1116 "/usr/include/c++/9/bits/specfun.h" 3
  inline float
  sph_legendref(unsigned int __l, unsigned int __m, float __theta)
  { return __detail::__sph_legendre<float>(__l, __m, __theta); }
# 1127 "/usr/include/c++/9/bits/specfun.h" 3
  inline long double
  sph_legendrel(unsigned int __l, unsigned int __m, long double __theta)
  { return __detail::__sph_legendre<long double>(__l, __m, __theta); }
# 1147 "/usr/include/c++/9/bits/specfun.h" 3
  template<typename _Tp>
    inline typename __gnu_cxx::__promote<_Tp>::__type
    sph_legendre(unsigned int __l, unsigned int __m, _Tp __theta)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __detail::__sph_legendre<__type>(__l, __m, __theta);
    }
# 1163 "/usr/include/c++/9/bits/specfun.h" 3
  inline float
  sph_neumannf(unsigned int __n, float __x)
  { return __detail::__sph_neumann<float>(__n, __x); }







  inline long double
  sph_neumannl(unsigned int __n, long double __x)
  { return __detail::__sph_neumann<long double>(__n, __x); }
# 1191 "/usr/include/c++/9/bits/specfun.h" 3
  template<typename _Tp>
    inline typename __gnu_cxx::__promote<_Tp>::__type
    sph_neumann(unsigned int __n, _Tp __x)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __detail::__sph_neumann<__type>(__n, __x);
    }




}
# 1383 "/usr/include/c++/9/bits/specfun.h" 3
#pragma GCC visibility pop
# 1928 "/usr/include/c++/9/cmath" 2 3


}
# 37 "/usr/include/c++/9/math.h" 2 3

using std::abs;
using std::acos;
using std::asin;
using std::atan;
using std::atan2;
using std::cos;
using std::sin;
using std::tan;
using std::cosh;
using std::sinh;
using std::tanh;
using std::exp;
using std::frexp;
using std::ldexp;
using std::log;
using std::log10;
using std::modf;
using std::pow;
using std::sqrt;
using std::ceil;
using std::fabs;
using std::floor;
using std::fmod;


using std::fpclassify;
using std::isfinite;
using std::isinf;
using std::isnan;
using std::isnormal;
using std::signbit;
using std::isgreater;
using std::isgreaterequal;
using std::isless;
using std::islessequal;
using std::islessgreater;
using std::isunordered;



using std::acosh;
using std::asinh;
using std::atanh;
using std::cbrt;
using std::copysign;
using std::erf;
using std::erfc;
using std::exp2;
using std::expm1;
using std::fdim;
using std::fma;
using std::fmax;
using std::fmin;
using std::hypot;
using std::ilogb;
using std::lgamma;
using std::llrint;
using std::llround;
using std::log1p;
using std::log2;
using std::logb;
using std::lrint;
using std::lround;
using std::nearbyint;
using std::nextafter;
using std::nexttoward;
using std::remainder;
using std::remquo;
using std::rint;
using std::round;
using std::scalbln;
using std::scalbn;
using std::tgamma;
using std::trunc;
# 46 "./src/lib/battery/battery.h" 2
# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/float.h" 1 3 4
# 47 "./src/lib/battery/battery.h" 2

# 1 "./boards/px4/sitl/src/board_config.h" 1
# 40 "./boards/px4/sitl/src/board_config.h"
       
# 55 "./boards/px4/sitl/src/board_config.h"
# 1 "./platforms/posix/include/system_config.h" 1
# 40 "./platforms/posix/include/system_config.h"
       
# 56 "./boards/px4/sitl/src/board_config.h" 2
# 1 "./platforms/common/include/px4_platform_common/board_common.h" 1
# 41 "./platforms/common/include/px4_platform_common/board_common.h"
       




# 1 "/usr/include/errno.h" 1 3 4
# 28 "/usr/include/errno.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/errno.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/bits/errno.h" 3 4
# 1 "/usr/include/linux/errno.h" 1 3 4
# 1 "/usr/include/x86_64-linux-gnu/asm/errno.h" 1 3 4
# 1 "/usr/include/asm-generic/errno.h" 1 3 4




# 1 "/usr/include/asm-generic/errno-base.h" 1 3 4
# 6 "/usr/include/asm-generic/errno.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/asm/errno.h" 2 3 4
# 1 "/usr/include/linux/errno.h" 2 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/errno.h" 2 3 4
# 29 "/usr/include/errno.h" 2 3 4





extern "C" {


extern int *__errno_location (void) throw () __attribute__ ((__const__));







extern char *program_invocation_name;
extern char *program_invocation_short_name;

# 1 "/usr/include/x86_64-linux-gnu/bits/types/error_t.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/types/error_t.h" 3 4
typedef int error_t;
# 49 "/usr/include/errno.h" 2 3 4



}
# 47 "./platforms/common/include/px4_platform_common/board_common.h" 2
# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stdint.h" 1 3 4
# 9 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stdint.h" 3 4
# 1 "/usr/include/stdint.h" 1 3 4
# 26 "/usr/include/stdint.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h" 1 3 4
# 27 "/usr/include/stdint.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/bits/wchar.h" 1 3 4
# 29 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 30 "/usr/include/stdint.h" 2 3 4







# 1 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h" 3 4
typedef __uint8_t uint8_t;
typedef __uint16_t uint16_t;
typedef __uint32_t uint32_t;
typedef __uint64_t uint64_t;
# 38 "/usr/include/stdint.h" 2 3 4





typedef __int_least8_t int_least8_t;
typedef __int_least16_t int_least16_t;
typedef __int_least32_t int_least32_t;
typedef __int_least64_t int_least64_t;


typedef __uint_least8_t uint_least8_t;
typedef __uint_least16_t uint_least16_t;
typedef __uint_least32_t uint_least32_t;
typedef __uint_least64_t uint_least64_t;





typedef signed char int_fast8_t;

typedef long int int_fast16_t;
typedef long int int_fast32_t;
typedef long int int_fast64_t;
# 71 "/usr/include/stdint.h" 3 4
typedef unsigned char uint_fast8_t;

typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long int uint_fast64_t;
# 87 "/usr/include/stdint.h" 3 4
typedef long int intptr_t;


typedef unsigned long int uintptr_t;
# 101 "/usr/include/stdint.h" 3 4
typedef __intmax_t intmax_t;
typedef __uintmax_t uintmax_t;
# 10 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stdint.h" 2 3 4
# 48 "./platforms/common/include/px4_platform_common/board_common.h" 2
# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stdbool.h" 1 3 4
# 49 "./platforms/common/include/px4_platform_common/board_common.h" 2
# 1 "/usr/include/string.h" 1 3 4
# 26 "/usr/include/string.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h" 1 3 4
# 27 "/usr/include/string.h" 2 3 4

extern "C" {




# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h" 1 3 4
# 34 "/usr/include/string.h" 2 3 4
# 43 "/usr/include/string.h" 3 4
extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
       size_t __n) throw () __attribute__ ((__nonnull__ (1, 2)));


extern void *memmove (void *__dest, const void *__src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));





extern void *memccpy (void *__restrict __dest, const void *__restrict __src,
        int __c, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern void *memset (void *__s, int __c, size_t __n) throw () __attribute__ ((__nonnull__ (1)));


extern int memcmp (const void *__s1, const void *__s2, size_t __n)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));



extern "C++"
{
extern void *memchr (void *__s, int __c, size_t __n)
      throw () __asm ("memchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern const void *memchr (const void *__s, int __c, size_t __n)
      throw () __asm ("memchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 89 "/usr/include/string.h" 3 4
}
# 99 "/usr/include/string.h" 3 4
extern "C++" void *rawmemchr (void *__s, int __c)
     throw () __asm ("rawmemchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern "C++" const void *rawmemchr (const void *__s, int __c)
     throw () __asm ("rawmemchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));







extern "C++" void *memrchr (void *__s, int __c, size_t __n)
      throw () __asm ("memrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern "C++" const void *memrchr (const void *__s, int __c, size_t __n)
      throw () __asm ("memrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 122 "/usr/include/string.h" 3 4
extern char *strcpy (char *__restrict __dest, const char *__restrict __src)
     throw () __attribute__ ((__nonnull__ (1, 2)));

extern char *strncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern char *strcat (char *__restrict __dest, const char *__restrict __src)
     throw () __attribute__ ((__nonnull__ (1, 2)));

extern char *strncat (char *__restrict __dest, const char *__restrict __src,
        size_t __n) throw () __attribute__ ((__nonnull__ (1, 2)));


extern int strcmp (const char *__s1, const char *__s2)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern int strncmp (const char *__s1, const char *__s2, size_t __n)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcoll (const char *__s1, const char *__s2)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern size_t strxfrm (char *__restrict __dest,
         const char *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (2)));






extern int strcoll_l (const char *__s1, const char *__s2, locale_t __l)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));


extern size_t strxfrm_l (char *__dest, const char *__src, size_t __n,
    locale_t __l) throw () __attribute__ ((__nonnull__ (2, 4)));





extern char *strdup (const char *__s)
     throw () __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));






extern char *strndup (const char *__string, size_t __n)
     throw () __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
# 204 "/usr/include/string.h" 3 4
extern "C++"
{
extern char *strchr (char *__s, int __c)
     throw () __asm ("strchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern const char *strchr (const char *__s, int __c)
     throw () __asm ("strchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 224 "/usr/include/string.h" 3 4
}






extern "C++"
{
extern char *strrchr (char *__s, int __c)
     throw () __asm ("strrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern const char *strrchr (const char *__s, int __c)
     throw () __asm ("strrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 251 "/usr/include/string.h" 3 4
}
# 261 "/usr/include/string.h" 3 4
extern "C++" char *strchrnul (char *__s, int __c)
     throw () __asm ("strchrnul") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern "C++" const char *strchrnul (const char *__s, int __c)
     throw () __asm ("strchrnul") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 273 "/usr/include/string.h" 3 4
extern size_t strcspn (const char *__s, const char *__reject)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern size_t strspn (const char *__s, const char *__accept)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern "C++"
{
extern char *strpbrk (char *__s, const char *__accept)
     throw () __asm ("strpbrk") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern const char *strpbrk (const char *__s, const char *__accept)
     throw () __asm ("strpbrk") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 301 "/usr/include/string.h" 3 4
}






extern "C++"
{
extern char *strstr (char *__haystack, const char *__needle)
     throw () __asm ("strstr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern const char *strstr (const char *__haystack, const char *__needle)
     throw () __asm ("strstr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 328 "/usr/include/string.h" 3 4
}







extern char *strtok (char *__restrict __s, const char *__restrict __delim)
     throw () __attribute__ ((__nonnull__ (2)));



extern char *__strtok_r (char *__restrict __s,
    const char *__restrict __delim,
    char **__restrict __save_ptr)
     throw () __attribute__ ((__nonnull__ (2, 3)));

extern char *strtok_r (char *__restrict __s, const char *__restrict __delim,
         char **__restrict __save_ptr)
     throw () __attribute__ ((__nonnull__ (2, 3)));





extern "C++" char *strcasestr (char *__haystack, const char *__needle)
     throw () __asm ("strcasestr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern "C++" const char *strcasestr (const char *__haystack,
         const char *__needle)
     throw () __asm ("strcasestr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 369 "/usr/include/string.h" 3 4
extern void *memmem (const void *__haystack, size_t __haystacklen,
       const void *__needle, size_t __needlelen)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 3)));



extern void *__mempcpy (void *__restrict __dest,
   const void *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern void *mempcpy (void *__restrict __dest,
        const void *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern size_t strlen (const char *__s)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));




extern size_t strnlen (const char *__string, size_t __maxlen)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));




extern char *strerror (int __errnum) throw ();
# 421 "/usr/include/string.h" 3 4
extern char *strerror_r (int __errnum, char *__buf, size_t __buflen)
     throw () __attribute__ ((__nonnull__ (2))) ;





extern char *strerror_l (int __errnum, locale_t __l) throw ();



# 1 "/usr/include/strings.h" 1 3 4
# 23 "/usr/include/strings.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h" 1 3 4
# 24 "/usr/include/strings.h" 2 3 4






extern "C" {



extern int bcmp (const void *__s1, const void *__s2, size_t __n)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern void bcopy (const void *__src, void *__dest, size_t __n)
  throw () __attribute__ ((__nonnull__ (1, 2)));


extern void bzero (void *__s, size_t __n) throw () __attribute__ ((__nonnull__ (1)));



extern "C++"
{
extern char *index (char *__s, int __c)
     throw () __asm ("index") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern const char *index (const char *__s, int __c)
     throw () __asm ("index") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 66 "/usr/include/strings.h" 3 4
}







extern "C++"
{
extern char *rindex (char *__s, int __c)
     throw () __asm ("rindex") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern const char *rindex (const char *__s, int __c)
     throw () __asm ("rindex") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 94 "/usr/include/strings.h" 3 4
}
# 104 "/usr/include/strings.h" 3 4
extern int ffs (int __i) throw () __attribute__ ((__const__));





extern int ffsl (long int __l) throw () __attribute__ ((__const__));
__extension__ extern int ffsll (long long int __ll)
     throw () __attribute__ ((__const__));



extern int strcasecmp (const char *__s1, const char *__s2)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strncasecmp (const char *__s1, const char *__s2, size_t __n)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));






extern int strcasecmp_l (const char *__s1, const char *__s2, locale_t __loc)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));



extern int strncasecmp_l (const char *__s1, const char *__s2,
     size_t __n, locale_t __loc)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 4)));


}
# 433 "/usr/include/string.h" 2 3 4



extern void explicit_bzero (void *__s, size_t __n) throw () __attribute__ ((__nonnull__ (1)));



extern char *strsep (char **__restrict __stringp,
       const char *__restrict __delim)
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern char *strsignal (int __sig) throw ();


extern char *__stpcpy (char *__restrict __dest, const char *__restrict __src)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, const char *__restrict __src)
     throw () __attribute__ ((__nonnull__ (1, 2)));



extern char *__stpncpy (char *__restrict __dest,
   const char *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern int strverscmp (const char *__s1, const char *__s2)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern char *strfry (char *__string) throw () __attribute__ ((__nonnull__ (1)));


extern void *memfrob (void *__s, size_t __n) throw () __attribute__ ((__nonnull__ (1)));







extern "C++" char *basename (char *__filename)
     throw () __asm ("basename") __attribute__ ((__nonnull__ (1)));
extern "C++" const char *basename (const char *__filename)
     throw () __asm ("basename") __attribute__ ((__nonnull__ (1)));
# 499 "/usr/include/string.h" 3 4
}
# 50 "./platforms/common/include/px4_platform_common/board_common.h" 2
# 1 "./build/px4_sitl_default/px4_boardconfig.h" 1
# 51 "./platforms/common/include/px4_platform_common/board_common.h" 2
# 345 "./platforms/common/include/px4_platform_common/board_common.h"

# 345 "./platforms/common/include/px4_platform_common/board_common.h"
typedef enum board_power_button_state_notification_e {
 PWR_BUTTON_IDEL,
 PWR_BUTTON_DOWN,
 PWR_BUTTON_UP,
 PWR_BUTTON_REQUEST_SHUT_DOWN,

 PWR_BUTTON_RESPONSE_SHUT_DOWN_PENDING,


 PWR_BUTTON_RESPONSE_SHUT_DOWN_NOW,
} board_power_button_state_notification_e;


typedef int (*power_button_state_notification_t)(board_power_button_state_notification_e request);







typedef enum PX4_SOC_ARCH_ID_t {

 PX4_SOC_ARCH_ID_UNUSED = 0x0000,

 PX4_SOC_ARCH_ID_STM32F4 = 0x0001,
 PX4_SOC_ARCH_ID_STM32F7 = 0x0002,
 PX4_SOC_ARCH_ID_KINETISK66 = 0x0003,
 PX4_SOC_ARCH_ID_SAMV7 = 0x0004,
 PX4_SOC_ARCH_ID_NXPIMXRT1062 = 0x0005,

 PX4_SOC_ARCH_ID_STM32H7 = 0x0006,

 PX4_SOC_ARCH_ID_NXPS32K146 = 0x0007,
 PX4_SOC_ARCH_ID_NXPS32K344 = 0x0008,
 PX4_SOC_ARCH_ID_NXPIMXRT1176 = 0x0009,

 PX4_SOC_ARCH_ID_EAGLE = 0x1001,
 PX4_SOC_ARCH_ID_QURT = 0x1002,

 PX4_SOC_ARCH_ID_RPI = 0x1004,
 PX4_SOC_ARCH_ID_SIM = 0x1005,
 PX4_SOC_ARCH_ID_SITL = 0x1006,

 PX4_SOC_ARCH_ID_BBBLUE = 0x1008,

 PX4_SOC_ARCH_ID_VOXL2 = 0x100A,

} PX4_SOC_ARCH_ID_t;
# 440 "./platforms/common/include/px4_platform_common/board_common.h"
typedef uint8_t uuid_byte_t[16];


typedef uint32_t uuid_uint32_t[4];




typedef uint8_t mfguid_t[16];





typedef uint8_t px4_guid_t[18];





# 459 "./platforms/common/include/px4_platform_common/board_common.h" 3 4
extern "C" {
# 483 "./platforms/common/include/px4_platform_common/board_common.h"

# 483 "./platforms/common/include/px4_platform_common/board_common.h"
static inline bool board_rc_singlewire(const char *device) { return false; }
# 514 "./platforms/common/include/px4_platform_common/board_common.h"
static inline bool board_rc_swap_rxtx(const char *device) { return false; }
# 543 "./platforms/common/include/px4_platform_common/board_common.h"
static inline bool board_rc_conflicting(const char *device) { return false; }
# 571 "./platforms/common/include/px4_platform_common/board_common.h"
static inline bool board_rc_invert_input(const char *device, bool invert) { return false; }
# 592 "./platforms/common/include/px4_platform_common/board_common.h"
int board_read_VBUS_state(void);
# 643 "./platforms/common/include/px4_platform_common/board_common.h"
int board_power_off(int status);
# 731 "./platforms/common/include/px4_platform_common/board_common.h"
typedef enum {
 PX4_MFT_PX4IO = 0,
 PX4_MFT_USB = 1,
 PX4_MFT_CAN2 = 2,
 PX4_MFT_CAN3 = 3,
 PX4_MFT_PM2 = 4,
 PX4_MFT_ETHERNET = 5,
 PX4_MFT_T1_ETH = 6,
 PX4_MFT_T100_ETH = 7,
 PX4_MFT_T1000_ETH = 8,
} px4_hw_mft_item_id_t;

typedef int (*system_query_func_t)(const char *sub, const char *val, void *out);
# 768 "./platforms/common/include/px4_platform_common/board_common.h"
typedef enum {
 px4_hw_con_unknown = 0,
 px4_hw_con_onboard = 1,
 px4_hw_con_connector = 3,
} px4_hw_connection_t;


typedef struct {
 unsigned int id: 16;
 unsigned int present: 1;
 unsigned int mandatory: 1;
 unsigned int connection: 2;
} px4_hw_mft_item_t;

typedef const px4_hw_mft_item_t *px4_hw_mft_item;
# 838 "./platforms/common/include/px4_platform_common/board_common.h"
inline uint16_t board_get_can_interfaces(void) { return 0x7; }
# 942 "./platforms/common/include/px4_platform_common/board_common.h"
__EXPORT void board_get_uuid(uuid_byte_t uuid_bytes);
# 964 "./platforms/common/include/px4_platform_common/board_common.h"
__EXPORT void board_get_uuid32(uuid_uint32_t uuid_words);
# 997 "./platforms/common/include/px4_platform_common/board_common.h"
__EXPORT int board_get_uuid32_formated(char *format_buffer, int size,
           const char *format,
           const char *seperator);
# 1019 "./platforms/common/include/px4_platform_common/board_common.h"
int board_get_mfguid(mfguid_t mfgid);
# 1040 "./platforms/common/include/px4_platform_common/board_common.h"
int board_get_mfguid_formated(char *format_buffer, int size);
# 1077 "./platforms/common/include/px4_platform_common/board_common.h"
int board_get_px4_guid(px4_guid_t guid);
# 1101 "./platforms/common/include/px4_platform_common/board_common.h"
int board_get_px4_guid_formated(char *format_buffer, int size);
# 1144 "./platforms/common/include/px4_platform_common/board_common.h"
int board_register_power_state_notification_cb(power_button_state_notification_t cb);
# 1153 "./platforms/common/include/px4_platform_common/board_common.h"
enum board_bus_types {
 BOARD_INVALID_BUS = 0,






};
# 1183 "./platforms/common/include/px4_platform_common/board_common.h"
__EXPORT void board_spi_reset(int ms, int bus_mask);







__EXPORT void board_control_spi_sensors_power_configgpio(void);
# 1204 "./platforms/common/include/px4_platform_common/board_common.h"
__EXPORT void board_control_spi_sensors_power(bool enable_power, int bus_mask);
# 1229 "./platforms/common/include/px4_platform_common/board_common.h"
int board_hardfault_init(int display_to_console, bool allow_prompt);


# 1231 "./platforms/common/include/px4_platform_common/board_common.h" 3 4
}
# 56 "./boards/px4/sitl/src/board_config.h" 2
# 49 "./src/lib/battery/battery.h" 2

# 1 "./platforms/common/include/px4_platform_common/module_params.h" 1
# 40 "./platforms/common/include/px4_platform_common/module_params.h"
       

# 1 "./src/include/containers/List.hpp" 1
# 40 "./src/include/containers/List.hpp"
       

# 1 "/usr/include/c++/9/stdlib.h" 1 3
# 36 "/usr/include/c++/9/stdlib.h" 3
# 1 "/usr/include/c++/9/cstdlib" 1 3
# 39 "/usr/include/c++/9/cstdlib" 3
       
# 40 "/usr/include/c++/9/cstdlib" 3
# 121 "/usr/include/c++/9/cstdlib" 3
extern "C++"
{
namespace std __attribute__ ((__visibility__ ("default")))
{


  using ::div_t;
  using ::ldiv_t;

  using ::abort;

  using ::aligned_alloc;

  using ::atexit;


  using ::at_quick_exit;


  using ::atof;
  using ::atoi;
  using ::atol;
  using ::bsearch;
  using ::calloc;
  using ::div;
  using ::exit;
  using ::free;
  using ::getenv;
  using ::labs;
  using ::ldiv;
  using ::malloc;

  using ::mblen;
  using ::mbstowcs;
  using ::mbtowc;

  using ::qsort;


  using ::quick_exit;


  using ::rand;
  using ::realloc;
  using ::srand;
  using ::strtod;
  using ::strtol;
  using ::strtoul;
  using ::system;

  using ::wcstombs;
  using ::wctomb;



  inline ldiv_t
  div(long __i, long __j) { return ldiv(__i, __j); }




}
# 195 "/usr/include/c++/9/cstdlib" 3
namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{



  using ::lldiv_t;





  using ::_Exit;



  using ::llabs;

  inline lldiv_t
  div(long long __n, long long __d)
  { lldiv_t __q; __q.quot = __n / __d; __q.rem = __n % __d; return __q; }

  using ::lldiv;
# 227 "/usr/include/c++/9/cstdlib" 3
  using ::atoll;
  using ::strtoll;
  using ::strtoull;

  using ::strtof;
  using ::strtold;


}

namespace std
{

  using ::__gnu_cxx::lldiv_t;

  using ::__gnu_cxx::_Exit;

  using ::__gnu_cxx::llabs;
  using ::__gnu_cxx::div;
  using ::__gnu_cxx::lldiv;

  using ::__gnu_cxx::atoll;
  using ::__gnu_cxx::strtof;
  using ::__gnu_cxx::strtoll;
  using ::__gnu_cxx::strtoull;
  using ::__gnu_cxx::strtold;
}



}
# 37 "/usr/include/c++/9/stdlib.h" 2 3

using std::abort;
using std::atexit;
using std::exit;


  using std::at_quick_exit;


  using std::quick_exit;




using std::div_t;
using std::ldiv_t;

using std::abs;
using std::atof;
using std::atoi;
using std::atol;
using std::bsearch;
using std::calloc;
using std::div;
using std::free;
using std::getenv;
using std::labs;
using std::ldiv;
using std::malloc;

using std::mblen;
using std::mbstowcs;
using std::mbtowc;

using std::qsort;
using std::rand;
using std::realloc;
using std::srand;
using std::strtod;
using std::strtol;
using std::strtoul;
using std::system;

using std::wcstombs;
using std::wctomb;
# 43 "./src/include/containers/List.hpp" 2


# 44 "./src/include/containers/List.hpp"
template<class T>
class ListNode
{
public:

 void setSibling(T sibling) { _list_node_sibling = sibling; }
 const T getSibling() const { return _list_node_sibling; }

protected:

 T _list_node_sibling{nullptr};

};

template<class T>
class List
{
public:

 void add(T newNode)
 {
  if (_head == nullptr) {

   _head = newNode;
   return;

  } else {

   T node = _head;

   while (node != nullptr) {
    if (node->getSibling() == nullptr) {

     node->setSibling(newNode);
     return;
    }

    node = node->getSibling();
   }
  }
 }

 bool remove(T removeNode)
 {
  if (removeNode == nullptr) {
   return false;
  }


  if (removeNode == _head) {
   if (_head != nullptr) {
    _head = _head->getSibling();
   }

   removeNode->setSibling(nullptr);

   return true;
  }

  for (T node = getHead(); node != nullptr; node = node->getSibling()) {

   if (node->getSibling() == removeNode) {

    if (node->getSibling() != nullptr) {
     node->setSibling(node->getSibling()->getSibling());

    } else {
     node->setSibling(nullptr);
    }

    removeNode->setSibling(nullptr);

    return true;
   }
  }

  return false;
 }

 struct Iterator {
  T node;
  explicit Iterator(T v) : node(v) {}

  operator T() const { return node; }
  operator T &() { return node; }
  const T &operator* () const { return node; }
  Iterator &operator++ ()
  {
   if (node) {
    node = node->getSibling();
   }

   return *this;
  }
 };

 Iterator begin() { return Iterator(getHead()); }
 Iterator end() { return Iterator(nullptr); }

 const T getHead() const { return _head; }

 bool empty() const { return getHead() == nullptr; }

 size_t size() const
 {
  size_t sz = 0;

  for (auto node = getHead(); node != nullptr; node = node->getSibling()) {
   sz++;
  }

  return sz;
 }

 void deleteNode(T node)
 {
  if (remove(node)) {

   delete node;
  }
 }

 void clear()
 {
  auto node = getHead();

  while (node != nullptr) {
   auto next = node->getSibling();
   delete node;
   node = next;
  }

  _head = nullptr;
 }

protected:

 T _head{nullptr};
};
# 43 "./platforms/common/include/px4_platform_common/module_params.h" 2

# 1 "./platforms/common/include/px4_platform_common/param.h" 1
# 40 "./platforms/common/include/px4_platform_common/param.h"
       

# 1 "./platforms/common/include/px4_platform_common/param_macros.h" 1
# 40 "./platforms/common/include/px4_platform_common/param_macros.h"
       
# 43 "./platforms/common/include/px4_platform_common/param.h" 2

# 1 "/usr/include/c++/9/math.h" 1 3
# 45 "./platforms/common/include/px4_platform_common/param.h" 2

# 1 "./build/px4_sitl_default/src/lib/parameters/px4_parameters.hpp" 1


# 1 "/usr/include/c++/9/math.h" 1 3
# 4 "./build/px4_sitl_default/src/lib/parameters/px4_parameters.hpp" 2


# 1 "./src/lib/parameters/param.h" 1
# 55 "./src/lib/parameters/param.h"

# 55 "./src/lib/parameters/param.h" 3 4
extern "C" {
# 64 "./src/lib/parameters/param.h"

# 64 "./src/lib/parameters/param.h"
typedef uint8_t param_type_t;
# 73 "./src/lib/parameters/param.h"
typedef uint16_t param_t;
# 89 "./src/lib/parameters/param.h"
__EXPORT void param_init(void);
# 99 "./src/lib/parameters/param.h"
__EXPORT param_t param_find(const char *name);







__EXPORT param_t param_find_no_notification(const char *name);






__EXPORT unsigned param_count(void);






__EXPORT unsigned param_count_used(void);






__EXPORT bool param_used(param_t param);







__EXPORT param_t param_for_index(unsigned index);







__EXPORT param_t param_for_used_index(unsigned index);







__EXPORT int param_get_index(param_t param);







__EXPORT int param_get_used_index(param_t param);







__EXPORT const char *param_name(param_t param);







__EXPORT bool param_is_volatile(param_t param);






__EXPORT bool param_value_is_default(param_t param);






__EXPORT bool param_value_unsaved(param_t param);







__EXPORT param_type_t param_type(param_t param);







__EXPORT size_t param_size(param_t param);
# 215 "./src/lib/parameters/param.h"
__EXPORT int param_get(param_t param, void *val);
# 224 "./src/lib/parameters/param.h"
__EXPORT int param_get_default_value(param_t param, void *default_val);
# 233 "./src/lib/parameters/param.h"
__EXPORT int param_get_system_default_value(param_t param, void *default_val);
# 242 "./src/lib/parameters/param.h"
__EXPORT int param_set(param_t param, const void *val);
# 251 "./src/lib/parameters/param.h"
__EXPORT int param_set_default_value(param_t param, const void *val);







__EXPORT void param_set_used(param_t param);
# 268 "./src/lib/parameters/param.h"
__EXPORT int param_set_no_notification(param_t param, const void *val);
# 280 "./src/lib/parameters/param.h"
__EXPORT int param_set_no_remote_update(param_t param, const void *val, bool notify);





__EXPORT void param_notify_changes(void);







__EXPORT int param_reset(param_t param);







__EXPORT int param_reset_no_notification(param_t param);




__EXPORT void param_reset_all(void);
# 316 "./src/lib/parameters/param.h"
__EXPORT void param_reset_excludes(const char *excludes[], int num_excludes);

typedef bool(*param_filter_func)(param_t handle);







__EXPORT void param_reset_specific(const char *resets[], int num_resets);
# 337 "./src/lib/parameters/param.h"
__EXPORT int param_export(const char *filename, param_filter_func filter);
# 348 "./src/lib/parameters/param.h"
__EXPORT int param_import(int fd);
# 360 "./src/lib/parameters/param.h"
__EXPORT int param_load(int fd);
# 376 "./src/lib/parameters/param.h"
__EXPORT void param_foreach(void (*func)(void *arg, param_t param), void *arg, bool only_changed, bool only_used);
# 386 "./src/lib/parameters/param.h"
__EXPORT int param_set_default_file(const char *filename);
# 395 "./src/lib/parameters/param.h"
__EXPORT const char *param_get_default_file(void);
# 404 "./src/lib/parameters/param.h"
__EXPORT int param_set_backup_file(const char *filename);






__EXPORT const char *param_get_backup_file(void);
# 425 "./src/lib/parameters/param.h"
__EXPORT int param_save_default(bool blocking);






__EXPORT int param_load_default(void);






__EXPORT uint32_t param_hash_check(void);





__EXPORT void param_print_status(void);






__EXPORT void param_control_autosave(bool enable);




union param_value_u {
 void *p;
 int32_t i;
 float f;
};







struct param_info_s {
 const char *name;
 union param_value_u val;
};


# 474 "./src/lib/parameters/param.h" 3 4
}
# 499 "./src/lib/parameters/param.h"

# 499 "./src/lib/parameters/param.h"
static inline int param_get_cplusplus(param_t param, float *val)
{
 ;
 return param_get(param, (void *)val);
}
static inline int param_get_cplusplus(param_t param, int32_t *val)
{
 ;
 return param_get(param, (void *)val);
}
# 7 "./build/px4_sitl_default/src/lib/parameters/px4_parameters.hpp" 2




namespace px4 {


enum class params : uint16_t {

 ADSB_CALLSIGN_1,
 ADSB_CALLSIGN_2,
 ADSB_EMERGC,
 ADSB_EMIT_TYPE,
 ADSB_GPS_OFF_LAT,
 ADSB_GPS_OFF_LON,
 ADSB_ICAO_ID,
 ADSB_ICAO_SPECL,
 ADSB_IDENT,
 ADSB_LEN_WIDTH,
 ADSB_LIST_MAX,
 ADSB_MAX_SPEED,
 ADSB_SQUAWK,
 ASPD_BETA_GATE,
 ASPD_BETA_NOISE,
 ASPD_DO_CHECKS,
 ASPD_FALLBACK,
 ASPD_FP_T_WINDOW,
 ASPD_FS_INNOV,
 ASPD_FS_INTEG,
 ASPD_FS_T_START,
 ASPD_FS_T_STOP,
 ASPD_PRIMARY,
 ASPD_SCALE_1,
 ASPD_SCALE_2,
 ASPD_SCALE_3,
 ASPD_SCALE_APPLY,
 ASPD_SCALE_NSD,
 ASPD_TAS_GATE,
 ASPD_TAS_NOISE,
 ASPD_WERR_THR,
 ASPD_WIND_NSD,
 ATT_ACC_COMP,
 ATT_BIAS_MAX,
 ATT_EN,
 ATT_EXT_HDG_M,
 ATT_MAG_DECL,
 ATT_MAG_DECL_A,
 ATT_W_ACC,
 ATT_W_EXT_HDG,
 ATT_W_GYRO_BIAS,
 ATT_W_MAG,
 BAT1_CAPACITY,
 BAT1_N_CELLS,
 BAT1_R_INTERNAL,
 BAT1_SOURCE,
 BAT1_V_CHARGED,
 BAT1_V_EMPTY,
 BAT2_CAPACITY,
 BAT2_N_CELLS,
 BAT2_R_INTERNAL,
 BAT2_SOURCE,
 BAT2_V_CHARGED,
 BAT2_V_EMPTY,
 BAT3_CAPACITY,
 BAT3_N_CELLS,
 BAT3_R_INTERNAL,
 BAT3_SOURCE,
 BAT3_V_CHARGED,
 BAT3_V_EMPTY,
 BAT_AVRG_CURRENT,
 BAT_CRIT_THR,
 BAT_EMERGEN_THR,
 BAT_LOW_THR,
 CAL_ACC0_ID,
 CAL_ACC0_PRIO,
 CAL_ACC0_ROT,
 CAL_ACC0_XOFF,
 CAL_ACC0_XSCALE,
 CAL_ACC0_YOFF,
 CAL_ACC0_YSCALE,
 CAL_ACC0_ZOFF,
 CAL_ACC0_ZSCALE,
 CAL_ACC1_ID,
 CAL_ACC1_PRIO,
 CAL_ACC1_ROT,
 CAL_ACC1_XOFF,
 CAL_ACC1_XSCALE,
 CAL_ACC1_YOFF,
 CAL_ACC1_YSCALE,
 CAL_ACC1_ZOFF,
 CAL_ACC1_ZSCALE,
 CAL_ACC2_ID,
 CAL_ACC2_PRIO,
 CAL_ACC2_ROT,
 CAL_ACC2_XOFF,
 CAL_ACC2_XSCALE,
 CAL_ACC2_YOFF,
 CAL_ACC2_YSCALE,
 CAL_ACC2_ZOFF,
 CAL_ACC2_ZSCALE,
 CAL_ACC3_ID,
 CAL_ACC3_PRIO,
 CAL_ACC3_ROT,
 CAL_ACC3_XOFF,
 CAL_ACC3_XSCALE,
 CAL_ACC3_YOFF,
 CAL_ACC3_YSCALE,
 CAL_ACC3_ZOFF,
 CAL_ACC3_ZSCALE,
 CAL_AIR_CMODEL,
 CAL_AIR_TUBED_MM,
 CAL_AIR_TUBELEN,
 CAL_BARO0_ID,
 CAL_BARO0_OFF,
 CAL_BARO0_PRIO,
 CAL_BARO1_ID,
 CAL_BARO1_OFF,
 CAL_BARO1_PRIO,
 CAL_BARO2_ID,
 CAL_BARO2_OFF,
 CAL_BARO2_PRIO,
 CAL_BARO3_ID,
 CAL_BARO3_OFF,
 CAL_BARO3_PRIO,
 CAL_GYRO0_ID,
 CAL_GYRO0_PRIO,
 CAL_GYRO0_ROT,
 CAL_GYRO0_XOFF,
 CAL_GYRO0_YOFF,
 CAL_GYRO0_ZOFF,
 CAL_GYRO1_ID,
 CAL_GYRO1_PRIO,
 CAL_GYRO1_ROT,
 CAL_GYRO1_XOFF,
 CAL_GYRO1_YOFF,
 CAL_GYRO1_ZOFF,
 CAL_GYRO2_ID,
 CAL_GYRO2_PRIO,
 CAL_GYRO2_ROT,
 CAL_GYRO2_XOFF,
 CAL_GYRO2_YOFF,
 CAL_GYRO2_ZOFF,
 CAL_GYRO3_ID,
 CAL_GYRO3_PRIO,
 CAL_GYRO3_ROT,
 CAL_GYRO3_XOFF,
 CAL_GYRO3_YOFF,
 CAL_GYRO3_ZOFF,
 CAL_MAG0_ID,
 CAL_MAG0_PITCH,
 CAL_MAG0_PRIO,
 CAL_MAG0_ROLL,
 CAL_MAG0_ROT,
 CAL_MAG0_XCOMP,
 CAL_MAG0_XODIAG,
 CAL_MAG0_XOFF,
 CAL_MAG0_XSCALE,
 CAL_MAG0_YAW,
 CAL_MAG0_YCOMP,
 CAL_MAG0_YODIAG,
 CAL_MAG0_YOFF,
 CAL_MAG0_YSCALE,
 CAL_MAG0_ZCOMP,
 CAL_MAG0_ZODIAG,
 CAL_MAG0_ZOFF,
 CAL_MAG0_ZSCALE,
 CAL_MAG1_ID,
 CAL_MAG1_PITCH,
 CAL_MAG1_PRIO,
 CAL_MAG1_ROLL,
 CAL_MAG1_ROT,
 CAL_MAG1_XCOMP,
 CAL_MAG1_XODIAG,
 CAL_MAG1_XOFF,
 CAL_MAG1_XSCALE,
 CAL_MAG1_YAW,
 CAL_MAG1_YCOMP,
 CAL_MAG1_YODIAG,
 CAL_MAG1_YOFF,
 CAL_MAG1_YSCALE,
 CAL_MAG1_ZCOMP,
 CAL_MAG1_ZODIAG,
 CAL_MAG1_ZOFF,
 CAL_MAG1_ZSCALE,
 CAL_MAG2_ID,
 CAL_MAG2_PITCH,
 CAL_MAG2_PRIO,
 CAL_MAG2_ROLL,
 CAL_MAG2_ROT,
 CAL_MAG2_XCOMP,
 CAL_MAG2_XODIAG,
 CAL_MAG2_XOFF,
 CAL_MAG2_XSCALE,
 CAL_MAG2_YAW,
 CAL_MAG2_YCOMP,
 CAL_MAG2_YODIAG,
 CAL_MAG2_YOFF,
 CAL_MAG2_YSCALE,
 CAL_MAG2_ZCOMP,
 CAL_MAG2_ZODIAG,
 CAL_MAG2_ZOFF,
 CAL_MAG2_ZSCALE,
 CAL_MAG3_ID,
 CAL_MAG3_PITCH,
 CAL_MAG3_PRIO,
 CAL_MAG3_ROLL,
 CAL_MAG3_ROT,
 CAL_MAG3_XCOMP,
 CAL_MAG3_XODIAG,
 CAL_MAG3_XOFF,
 CAL_MAG3_XSCALE,
 CAL_MAG3_YAW,
 CAL_MAG3_YCOMP,
 CAL_MAG3_YODIAG,
 CAL_MAG3_YOFF,
 CAL_MAG3_YSCALE,
 CAL_MAG3_ZCOMP,
 CAL_MAG3_ZODIAG,
 CAL_MAG3_ZOFF,
 CAL_MAG3_ZSCALE,
 CAL_MAG_COMP_TYP,
 CAL_MAG_SIDES,
 CA_AIRFRAME,
 CA_FAILURE_MODE,
 CA_HELI_PITCH_C0,
 CA_HELI_PITCH_C1,
 CA_HELI_PITCH_C2,
 CA_HELI_PITCH_C3,
 CA_HELI_PITCH_C4,
 CA_HELI_RPM_I,
 CA_HELI_RPM_P,
 CA_HELI_RPM_SP,
 CA_HELI_THR_C0,
 CA_HELI_THR_C1,
 CA_HELI_THR_C2,
 CA_HELI_THR_C3,
 CA_HELI_THR_C4,
 CA_HELI_YAW_CCW,
 CA_HELI_YAW_CP_O,
 CA_HELI_YAW_CP_S,
 CA_HELI_YAW_TH_S,
 CA_MAX_SVO_THROW,
 CA_METHOD,
 CA_R0_SLEW,
 CA_R10_SLEW,
 CA_R11_SLEW,
 CA_R1_SLEW,
 CA_R2_SLEW,
 CA_R3_SLEW,
 CA_R4_SLEW,
 CA_R5_SLEW,
 CA_R6_SLEW,
 CA_R7_SLEW,
 CA_R8_SLEW,
 CA_R9_SLEW,
 CA_ROTOR0_AX,
 CA_ROTOR0_AY,
 CA_ROTOR0_AZ,
 CA_ROTOR0_CT,
 CA_ROTOR0_KM,
 CA_ROTOR0_PX,
 CA_ROTOR0_PY,
 CA_ROTOR0_PZ,
 CA_ROTOR0_TILT,
 CA_ROTOR10_AX,
 CA_ROTOR10_AY,
 CA_ROTOR10_AZ,
 CA_ROTOR10_CT,
 CA_ROTOR10_KM,
 CA_ROTOR10_PX,
 CA_ROTOR10_PY,
 CA_ROTOR10_PZ,
 CA_ROTOR10_TILT,
 CA_ROTOR11_AX,
 CA_ROTOR11_AY,
 CA_ROTOR11_AZ,
 CA_ROTOR11_CT,
 CA_ROTOR11_KM,
 CA_ROTOR11_PX,
 CA_ROTOR11_PY,
 CA_ROTOR11_PZ,
 CA_ROTOR11_TILT,
 CA_ROTOR1_AX,
 CA_ROTOR1_AY,
 CA_ROTOR1_AZ,
 CA_ROTOR1_CT,
 CA_ROTOR1_KM,
 CA_ROTOR1_PX,
 CA_ROTOR1_PY,
 CA_ROTOR1_PZ,
 CA_ROTOR1_TILT,
 CA_ROTOR2_AX,
 CA_ROTOR2_AY,
 CA_ROTOR2_AZ,
 CA_ROTOR2_CT,
 CA_ROTOR2_KM,
 CA_ROTOR2_PX,
 CA_ROTOR2_PY,
 CA_ROTOR2_PZ,
 CA_ROTOR2_TILT,
 CA_ROTOR3_AX,
 CA_ROTOR3_AY,
 CA_ROTOR3_AZ,
 CA_ROTOR3_CT,
 CA_ROTOR3_KM,
 CA_ROTOR3_PX,
 CA_ROTOR3_PY,
 CA_ROTOR3_PZ,
 CA_ROTOR3_TILT,
 CA_ROTOR4_AX,
 CA_ROTOR4_AY,
 CA_ROTOR4_AZ,
 CA_ROTOR4_CT,
 CA_ROTOR4_KM,
 CA_ROTOR4_PX,
 CA_ROTOR4_PY,
 CA_ROTOR4_PZ,
 CA_ROTOR4_TILT,
 CA_ROTOR5_AX,
 CA_ROTOR5_AY,
 CA_ROTOR5_AZ,
 CA_ROTOR5_CT,
 CA_ROTOR5_KM,
 CA_ROTOR5_PX,
 CA_ROTOR5_PY,
 CA_ROTOR5_PZ,
 CA_ROTOR5_TILT,
 CA_ROTOR6_AX,
 CA_ROTOR6_AY,
 CA_ROTOR6_AZ,
 CA_ROTOR6_CT,
 CA_ROTOR6_KM,
 CA_ROTOR6_PX,
 CA_ROTOR6_PY,
 CA_ROTOR6_PZ,
 CA_ROTOR6_TILT,
 CA_ROTOR7_AX,
 CA_ROTOR7_AY,
 CA_ROTOR7_AZ,
 CA_ROTOR7_CT,
 CA_ROTOR7_KM,
 CA_ROTOR7_PX,
 CA_ROTOR7_PY,
 CA_ROTOR7_PZ,
 CA_ROTOR7_TILT,
 CA_ROTOR8_AX,
 CA_ROTOR8_AY,
 CA_ROTOR8_AZ,
 CA_ROTOR8_CT,
 CA_ROTOR8_KM,
 CA_ROTOR8_PX,
 CA_ROTOR8_PY,
 CA_ROTOR8_PZ,
 CA_ROTOR8_TILT,
 CA_ROTOR9_AX,
 CA_ROTOR9_AY,
 CA_ROTOR9_AZ,
 CA_ROTOR9_CT,
 CA_ROTOR9_KM,
 CA_ROTOR9_PX,
 CA_ROTOR9_PY,
 CA_ROTOR9_PZ,
 CA_ROTOR9_TILT,
 CA_ROTOR_COUNT,
 CA_R_REV,
 CA_SP0_ANG0,
 CA_SP0_ANG1,
 CA_SP0_ANG2,
 CA_SP0_ANG3,
 CA_SP0_ARM_L0,
 CA_SP0_ARM_L1,
 CA_SP0_ARM_L2,
 CA_SP0_ARM_L3,
 CA_SP0_COUNT,
 CA_SV0_SLEW,
 CA_SV1_SLEW,
 CA_SV2_SLEW,
 CA_SV3_SLEW,
 CA_SV4_SLEW,
 CA_SV5_SLEW,
 CA_SV6_SLEW,
 CA_SV7_SLEW,
 CA_SV_CS0_FLAP,
 CA_SV_CS0_SPOIL,
 CA_SV_CS0_TRIM,
 CA_SV_CS0_TRQ_P,
 CA_SV_CS0_TRQ_R,
 CA_SV_CS0_TRQ_Y,
 CA_SV_CS0_TYPE,
 CA_SV_CS1_FLAP,
 CA_SV_CS1_SPOIL,
 CA_SV_CS1_TRIM,
 CA_SV_CS1_TRQ_P,
 CA_SV_CS1_TRQ_R,
 CA_SV_CS1_TRQ_Y,
 CA_SV_CS1_TYPE,
 CA_SV_CS2_FLAP,
 CA_SV_CS2_SPOIL,
 CA_SV_CS2_TRIM,
 CA_SV_CS2_TRQ_P,
 CA_SV_CS2_TRQ_R,
 CA_SV_CS2_TRQ_Y,
 CA_SV_CS2_TYPE,
 CA_SV_CS3_FLAP,
 CA_SV_CS3_SPOIL,
 CA_SV_CS3_TRIM,
 CA_SV_CS3_TRQ_P,
 CA_SV_CS3_TRQ_R,
 CA_SV_CS3_TRQ_Y,
 CA_SV_CS3_TYPE,
 CA_SV_CS4_FLAP,
 CA_SV_CS4_SPOIL,
 CA_SV_CS4_TRIM,
 CA_SV_CS4_TRQ_P,
 CA_SV_CS4_TRQ_R,
 CA_SV_CS4_TRQ_Y,
 CA_SV_CS4_TYPE,
 CA_SV_CS5_FLAP,
 CA_SV_CS5_SPOIL,
 CA_SV_CS5_TRIM,
 CA_SV_CS5_TRQ_P,
 CA_SV_CS5_TRQ_R,
 CA_SV_CS5_TRQ_Y,
 CA_SV_CS5_TYPE,
 CA_SV_CS6_FLAP,
 CA_SV_CS6_SPOIL,
 CA_SV_CS6_TRIM,
 CA_SV_CS6_TRQ_P,
 CA_SV_CS6_TRQ_R,
 CA_SV_CS6_TRQ_Y,
 CA_SV_CS6_TYPE,
 CA_SV_CS7_FLAP,
 CA_SV_CS7_SPOIL,
 CA_SV_CS7_TRIM,
 CA_SV_CS7_TRQ_P,
 CA_SV_CS7_TRQ_R,
 CA_SV_CS7_TRQ_Y,
 CA_SV_CS7_TYPE,
 CA_SV_CS_COUNT,
 CA_SV_TL0_CT,
 CA_SV_TL0_MAXA,
 CA_SV_TL0_MINA,
 CA_SV_TL0_TD,
 CA_SV_TL1_CT,
 CA_SV_TL1_MAXA,
 CA_SV_TL1_MINA,
 CA_SV_TL1_TD,
 CA_SV_TL2_CT,
 CA_SV_TL2_MAXA,
 CA_SV_TL2_MINA,
 CA_SV_TL2_TD,
 CA_SV_TL3_CT,
 CA_SV_TL3_MAXA,
 CA_SV_TL3_MINA,
 CA_SV_TL3_TD,
 CA_SV_TL_COUNT,
 CBRK_BUZZER,
 CBRK_FLIGHTTERM,
 CBRK_IO_SAFETY,
 CBRK_SUPPLY_CHK,
 CBRK_USB_CHK,
 CBRK_VTOLARMING,
 COM_ACT_FAIL_ACT,
 COM_ARMABLE,
 COM_ARM_AUTH_ID,
 COM_ARM_AUTH_MET,
 COM_ARM_AUTH_REQ,
 COM_ARM_AUTH_TO,
 COM_ARM_BAT_MIN,
 COM_ARM_CHK_ESCS,
 COM_ARM_HFLT_CHK,
 COM_ARM_IMU_ACC,
 COM_ARM_IMU_GYR,
 COM_ARM_MAG_ANG,
 COM_ARM_MAG_STR,
 COM_ARM_MIS_REQ,
 COM_ARM_ODID,
 COM_ARM_SDCARD,
 COM_ARM_SWISBTN,
 COM_ARM_WO_GPS,
 COM_CPU_MAX,
 COM_DISARM_LAND,
 COM_DISARM_MAN,
 COM_DISARM_PRFLT,
 COM_DLL_EXCEPT,
 COM_DL_LOSS_T,
 COM_FAIL_ACT_T,
 COM_FLIGHT_UUID,
 COM_FLTMODE1,
 COM_FLTMODE2,
 COM_FLTMODE3,
 COM_FLTMODE4,
 COM_FLTMODE5,
 COM_FLTMODE6,
 COM_FLTT_LOW_ACT,
 COM_FLT_PROFILE,
 COM_FLT_TIME_MAX,
 COM_FORCE_SAFETY,
 COM_HLDL_LOSS_T,
 COM_HLDL_REG_T,
 COM_HOME_EN,
 COM_HOME_IN_AIR,
 COM_IMB_PROP_ACT,
 COM_KILL_DISARM,
 COM_LKDOWN_TKO,
 COM_LOW_BAT_ACT,
 COM_MODE0_HASH,
 COM_MODE1_HASH,
 COM_MODE2_HASH,
 COM_MODE3_HASH,
 COM_MODE4_HASH,
 COM_MODE5_HASH,
 COM_MODE6_HASH,
 COM_MODE7_HASH,
 COM_MODE_ARM_CHK,
 COM_MOT_TEST_EN,
 COM_OBC_LOSS_T,
 COM_OBL_RC_ACT,
 COM_OF_LOSS_T,
 COM_PARACHUTE,
 COM_POS_FS_EPH,
 COM_POS_LOW_ACT,
 COM_POS_LOW_EPH,
 COM_POWER_COUNT,
 COM_PREARM_MODE,
 COM_QC_ACT,
 COM_RAM_MAX,
 COM_RCL_EXCEPT,
 COM_RC_ARM_HYST,
 COM_RC_IN_MODE,
 COM_RC_LOSS_T,
 COM_RC_OVERRIDE,
 COM_RC_STICK_OV,
 COM_SPOOLUP_TIME,
 COM_TAKEOFF_ACT,
 COM_THROW_EN,
 COM_THROW_SPEED,
 COM_VEL_FS_EVH,
 COM_WIND_MAX,
 COM_WIND_MAX_ACT,
 COM_WIND_WARN,
 CP_DELAY,
 CP_DIST,
 CP_GO_NO_DATA,
 CP_GUIDE_ANG,
 EKF2_ABIAS_INIT,
 EKF2_ABL_ACCLIM,
 EKF2_ABL_GYRLIM,
 EKF2_ABL_LIM,
 EKF2_ABL_TAU,
 EKF2_ACC_B_NOISE,
 EKF2_ACC_NOISE,
 EKF2_AGP_CTRL,
 EKF2_AGP_DELAY,
 EKF2_AGP_GATE,
 EKF2_AGP_MODE,
 EKF2_AGP_NOISE,
 EKF2_ANGERR_INIT,
 EKF2_ARSP_THR,
 EKF2_ASPD_MAX,
 EKF2_ASP_DELAY,
 EKF2_AVEL_DELAY,
 EKF2_BARO_CTRL,
 EKF2_BARO_DELAY,
 EKF2_BARO_GATE,
 EKF2_BARO_NOISE,
 EKF2_BCOEF_X,
 EKF2_BCOEF_Y,
 EKF2_BETA_GATE,
 EKF2_BETA_NOISE,
 EKF2_DECL_TYPE,
 EKF2_DELAY_MAX,
 EKF2_DRAG_CTRL,
 EKF2_DRAG_NOISE,
 EKF2_EAS_NOISE,
 EKF2_EN,
 EKF2_EVA_NOISE,
 EKF2_EVP_GATE,
 EKF2_EVP_NOISE,
 EKF2_EVV_GATE,
 EKF2_EVV_NOISE,
 EKF2_EV_CTRL,
 EKF2_EV_DELAY,
 EKF2_EV_NOISE_MD,
 EKF2_EV_POS_X,
 EKF2_EV_POS_Y,
 EKF2_EV_POS_Z,
 EKF2_EV_QMIN,
 EKF2_FUSE_BETA,
 EKF2_GBIAS_INIT,
 EKF2_GND_EFF_DZ,
 EKF2_GND_MAX_HGT,
 EKF2_GPS_CHECK,
 EKF2_GPS_CTRL,
 EKF2_GPS_DELAY,
 EKF2_GPS_MODE,
 EKF2_GPS_POS_X,
 EKF2_GPS_POS_Y,
 EKF2_GPS_POS_Z,
 EKF2_GPS_P_GATE,
 EKF2_GPS_P_NOISE,
 EKF2_GPS_V_GATE,
 EKF2_GPS_V_NOISE,
 EKF2_GPS_YAW_OFF,
 EKF2_GRAV_NOISE,
 EKF2_GSF_TAS,
 EKF2_GYR_B_LIM,
 EKF2_GYR_B_NOISE,
 EKF2_GYR_NOISE,
 EKF2_HDG_GATE,
 EKF2_HEAD_NOISE,
 EKF2_HGT_REF,
 EKF2_IMU_CTRL,
 EKF2_IMU_POS_X,
 EKF2_IMU_POS_Y,
 EKF2_IMU_POS_Z,
 EKF2_LOG_VERBOSE,
 EKF2_MAG_ACCLIM,
 EKF2_MAG_B_NOISE,
 EKF2_MAG_CHECK,
 EKF2_MAG_CHK_INC,
 EKF2_MAG_CHK_STR,
 EKF2_MAG_DECL,
 EKF2_MAG_DELAY,
 EKF2_MAG_E_NOISE,
 EKF2_MAG_GATE,
 EKF2_MAG_NOISE,
 EKF2_MAG_TYPE,
 EKF2_MCOEF,
 EKF2_MIN_RNG,
 EKF2_MULTI_IMU,
 EKF2_MULTI_MAG,
 EKF2_NOAID_NOISE,
 EKF2_NOAID_TOUT,
 EKF2_OF_CTRL,
 EKF2_OF_DELAY,
 EKF2_OF_GATE,
 EKF2_OF_GYR_SRC,
 EKF2_OF_N_MAX,
 EKF2_OF_N_MIN,
 EKF2_OF_POS_X,
 EKF2_OF_POS_Y,
 EKF2_OF_POS_Z,
 EKF2_OF_QMIN,
 EKF2_OF_QMIN_GND,
 EKF2_PCOEF_XN,
 EKF2_PCOEF_XP,
 EKF2_PCOEF_YN,
 EKF2_PCOEF_YP,
 EKF2_PCOEF_Z,
 EKF2_PREDICT_US,
 EKF2_REQ_EPH,
 EKF2_REQ_EPV,
 EKF2_REQ_FIX,
 EKF2_REQ_GPS_H,
 EKF2_REQ_HDRIFT,
 EKF2_REQ_NSATS,
 EKF2_REQ_PDOP,
 EKF2_REQ_SACC,
 EKF2_REQ_VDRIFT,
 EKF2_RNG_A_HMAX,
 EKF2_RNG_A_VMAX,
 EKF2_RNG_CTRL,
 EKF2_RNG_DELAY,
 EKF2_RNG_FOG,
 EKF2_RNG_GATE,
 EKF2_RNG_K_GATE,
 EKF2_RNG_NOISE,
 EKF2_RNG_PITCH,
 EKF2_RNG_POS_X,
 EKF2_RNG_POS_Y,
 EKF2_RNG_POS_Z,
 EKF2_RNG_QLTY_T,
 EKF2_RNG_SFE,
 EKF2_SEL_ERR_RED,
 EKF2_SEL_IMU_ACC,
 EKF2_SEL_IMU_ANG,
 EKF2_SEL_IMU_RAT,
 EKF2_SEL_IMU_VEL,
 EKF2_SYNT_MAG_Z,
 EKF2_TAS_GATE,
 EKF2_TAU_POS,
 EKF2_TAU_VEL,
 EKF2_TERR_GRAD,
 EKF2_TERR_NOISE,
 EKF2_VEL_LIM,
 EKF2_WIND_NSD,
 EV_TSK_RC_LOSS,
 EV_TSK_STAT_DIS,
 FD_ACT_EN,
 FD_ACT_MOT_C2T,
 FD_ACT_MOT_THR,
 FD_ACT_MOT_TOUT,
 FD_ESCS_EN,
 FD_EXT_ATS_EN,
 FD_EXT_ATS_TRIG,
 FD_FAIL_P,
 FD_FAIL_P_TTRI,
 FD_FAIL_R,
 FD_FAIL_R_TTRI,
 FD_IMB_PROP_THR,
 FLW_TGT_ALT_M,
 FLW_TGT_DST,
 FLW_TGT_FA,
 FLW_TGT_HT,
 FLW_TGT_MAX_VEL,
 FLW_TGT_RS,
 FW_ACRO_X_MAX,
 FW_ACRO_YAW_EN,
 FW_ACRO_Y_MAX,
 FW_ACRO_Z_MAX,
 FW_AIRSPD_FLP_SC,
 FW_AIRSPD_MAX,
 FW_AIRSPD_MIN,
 FW_AIRSPD_STALL,
 FW_AIRSPD_TRIM,
 FW_ARSP_SCALE_EN,
 FW_AT_APPLY,
 FW_AT_AXES,
 FW_AT_MAN_AUX,
 FW_AT_START,
 FW_AT_SYSID_F0,
 FW_AT_SYSID_F1,
 FW_AT_SYSID_TIME,
 FW_AT_SYSID_TYPE,
 FW_BAT_SCALE_EN,
 FW_DTRIM_P_VMAX,
 FW_DTRIM_P_VMIN,
 FW_DTRIM_R_VMAX,
 FW_DTRIM_R_VMIN,
 FW_DTRIM_Y_VMAX,
 FW_DTRIM_Y_VMIN,
 FW_FLAPS_LND_SCL,
 FW_FLAPS_TO_SCL,
 FW_GND_SPD_MIN,
 FW_GPSF_LT,
 FW_GPSF_R,
 FW_LAUN_AC_T,
 FW_LAUN_AC_THLD,
 FW_LAUN_DETCN_ON,
 FW_LAUN_MOT_DEL,
 FW_LND_ABORT,
 FW_LND_AIRSPD,
 FW_LND_ANG,
 FW_LND_EARLYCFG,
 FW_LND_FLALT,
 FW_LND_FL_PMAX,
 FW_LND_FL_PMIN,
 FW_LND_FL_SINK,
 FW_LND_FL_TIME,
 FW_LND_NUDGE,
 FW_LND_TD_OFF,
 FW_LND_TD_TIME,
 FW_LND_THRTC_SC,
 FW_LND_USETER,
 FW_MAN_P_MAX,
 FW_MAN_P_SC,
 FW_MAN_R_MAX,
 FW_MAN_R_SC,
 FW_MAN_YR_MAX,
 FW_MAN_Y_SC,
 FW_PN_R_SLEW_MAX,
 FW_POS_STK_CONF,
 FW_PR_D,
 FW_PR_FF,
 FW_PR_I,
 FW_PR_IMAX,
 FW_PR_P,
 FW_PSP_OFF,
 FW_P_LIM_MAX,
 FW_P_LIM_MIN,
 FW_P_RMAX_NEG,
 FW_P_RMAX_POS,
 FW_P_TC,
 FW_RLL_TO_YAW_FF,
 FW_RR_D,
 FW_RR_FF,
 FW_RR_I,
 FW_RR_IMAX,
 FW_RR_P,
 FW_R_LIM,
 FW_R_RMAX,
 FW_R_TC,
 FW_SERVICE_CEIL,
 FW_SPOILERS_LND,
 FW_SPOILERS_MAN,
 FW_THR_ASPD_MAX,
 FW_THR_ASPD_MIN,
 FW_THR_IDLE,
 FW_THR_MAX,
 FW_THR_MIN,
 FW_THR_SLEW_MAX,
 FW_THR_TRIM,
 FW_TKO_AIRSPD,
 FW_TKO_PITCH_MIN,
 FW_T_ALT_TC,
 FW_T_CLMB_MAX,
 FW_T_CLMB_R_SP,
 FW_T_F_ALT_ERR,
 FW_T_HRATE_FF,
 FW_T_I_GAIN_PIT,
 FW_T_PTCH_DAMP,
 FW_T_RLL2THR,
 FW_T_SEB_R_FF,
 FW_T_SINK_MAX,
 FW_T_SINK_MIN,
 FW_T_SINK_R_SP,
 FW_T_SPDWEIGHT,
 FW_T_SPD_DEV_STD,
 FW_T_SPD_PRC_STD,
 FW_T_SPD_STD,
 FW_T_STE_R_TC,
 FW_T_TAS_TC,
 FW_T_THR_DAMPING,
 FW_T_THR_INTEG,
 FW_T_THR_LOW_HGT,
 FW_T_VERT_ACC,
 FW_USE_AIRSPD,
 FW_WIND_ARSP_SC,
 FW_WING_HEIGHT,
 FW_WING_SPAN,
 FW_WR_FF,
 FW_WR_I,
 FW_WR_IMAX,
 FW_WR_P,
 FW_W_EN,
 FW_W_RMAX,
 FW_YR_D,
 FW_YR_FF,
 FW_YR_I,
 FW_YR_IMAX,
 FW_YR_P,
 FW_Y_RMAX,
 GF_ACTION,
 GF_MAX_HOR_DIST,
 GF_MAX_VER_DIST,
 GF_PREDICT,
 GF_SOURCE,
 GPS_1_GNSS,
 GPS_1_PROTOCOL,
 GPS_2_GNSS,
 GPS_2_PROTOCOL,
 GPS_CFG_WIPE,
 GPS_DUMP_COMM,
 GPS_SAT_INFO,
 GPS_UBX_BAUD2,
 GPS_UBX_CFG_INTF,
 GPS_UBX_DYNMODEL,
 GPS_UBX_MODE,
 GPS_YAW_OFFSET,
 HTE_ACC_GATE,
 HTE_HT_ERR_INIT,
 HTE_HT_NOISE,
 HTE_THR_RANGE,
 HTE_VXY_THR,
 HTE_VZ_THR,
 IMU_ACCEL_CUTOFF,
 IMU_DGYRO_CUTOFF,
 IMU_GYRO_CAL_EN,
 IMU_GYRO_CUTOFF,
 IMU_GYRO_DNF_BW,
 IMU_GYRO_DNF_EN,
 IMU_GYRO_DNF_HMC,
 IMU_GYRO_DNF_MIN,
 IMU_GYRO_FFT_EN,
 IMU_GYRO_FFT_LEN,
 IMU_GYRO_FFT_MAX,
 IMU_GYRO_FFT_MIN,
 IMU_GYRO_FFT_SNR,
 IMU_GYRO_NF0_BW,
 IMU_GYRO_NF0_FRQ,
 IMU_GYRO_NF1_BW,
 IMU_GYRO_NF1_FRQ,
 IMU_GYRO_RATEMAX,
 IMU_INTEG_RATE,
 LNDFW_AIRSPD_MAX,
 LNDFW_ROT_MAX,
 LNDFW_TRIG_TIME,
 LNDFW_VEL_XY_MAX,
 LNDFW_VEL_Z_MAX,
 LNDFW_XYACC_MAX,
 LNDMC_ALT_GND,
 LNDMC_ROT_MAX,
 LNDMC_TRIG_TIME,
 LNDMC_XY_VEL_MAX,
 LNDMC_Z_VEL_MAX,
 LND_FLIGHT_T_HI,
 LND_FLIGHT_T_LO,
 LPE_ACC_XY,
 LPE_ACC_Z,
 LPE_BAR_Z,
 LPE_EN,
 LPE_EPH_MAX,
 LPE_EPV_MAX,
 LPE_FAKE_ORIGIN,
 LPE_FGYRO_HP,
 LPE_FLW_OFF_Z,
 LPE_FLW_QMIN,
 LPE_FLW_R,
 LPE_FLW_RR,
 LPE_FLW_SCALE,
 LPE_FUSION,
 LPE_GPS_DELAY,
 LPE_GPS_VXY,
 LPE_GPS_VZ,
 LPE_GPS_XY,
 LPE_GPS_Z,
 LPE_LAND_VXY,
 LPE_LAND_Z,
 LPE_LAT,
 LPE_LDR_OFF_Z,
 LPE_LDR_Z,
 LPE_LON,
 LPE_LT_COV,
 LPE_PN_B,
 LPE_PN_P,
 LPE_PN_T,
 LPE_PN_V,
 LPE_SNR_OFF_Z,
 LPE_SNR_Z,
 LPE_T_MAX_GRADE,
 LPE_VIC_P,
 LPE_VIS_DELAY,
 LPE_VIS_XY,
 LPE_VIS_Z,
 LPE_VXY_PUB,
 LPE_X_LP,
 LPE_Z_PUB,
 LTEST_ACC_UNC,
 LTEST_MEAS_UNC,
 LTEST_MODE,
 LTEST_POS_UNC_IN,
 LTEST_SCALE_X,
 LTEST_SCALE_Y,
 LTEST_SENS_POS_X,
 LTEST_SENS_POS_Y,
 LTEST_SENS_POS_Z,
 LTEST_SENS_ROT,
 LTEST_VEL_UNC_IN,
 MAN_ARM_GESTURE,
 MAN_DEADZONE,
 MAN_KILL_GEST_T,
 MAV_0_BROADCAST,
 MAV_0_FLOW_CTRL,
 MAV_0_FORWARD,
 MAV_0_HL_FREQ,
 MAV_0_MODE,
 MAV_0_RADIO_CTL,
 MAV_0_RATE,
 MAV_0_REMOTE_PRT,
 MAV_0_UDP_PRT,
 MAV_1_BROADCAST,
 MAV_1_FLOW_CTRL,
 MAV_1_FORWARD,
 MAV_1_HL_FREQ,
 MAV_1_MODE,
 MAV_1_RADIO_CTL,
 MAV_1_RATE,
 MAV_1_REMOTE_PRT,
 MAV_1_UDP_PRT,
 MAV_2_BROADCAST,
 MAV_2_FLOW_CTRL,
 MAV_2_FORWARD,
 MAV_2_HL_FREQ,
 MAV_2_MODE,
 MAV_2_RADIO_CTL,
 MAV_2_RATE,
 MAV_2_REMOTE_PRT,
 MAV_2_UDP_PRT,
 MAV_COMP_ID,
 MAV_FWDEXTSP,
 MAV_HASH_CHK_EN,
 MAV_HB_FORW_EN,
 MAV_PROTO_VER,
 MAV_RADIO_TOUT,
 MAV_SIK_RADIO_ID,
 MAV_SYS_ID,
 MAV_S_FORWARD,
 MAV_S_MODE,
 MAV_TYPE,
 MAV_USEHILGPS,
 MBE_ENABLE,
 MBE_LEARN_GAIN,
 MC_ACRO_EXPO,
 MC_ACRO_EXPO_Y,
 MC_ACRO_P_MAX,
 MC_ACRO_R_MAX,
 MC_ACRO_SUPEXPO,
 MC_ACRO_SUPEXPOY,
 MC_ACRO_Y_MAX,
 MC_AIRMODE,
 MC_AT_APPLY,
 MC_AT_EN,
 MC_AT_RISE_TIME,
 MC_AT_START,
 MC_AT_SYSID_AMP,
 MC_BAT_SCALE_EN,
 MC_MAN_TILT_TAU,
 MC_ORBIT_RAD_MAX,
 MC_ORBIT_YAW_MOD,
 MC_PITCHRATE_D,
 MC_PITCHRATE_FF,
 MC_PITCHRATE_I,
 MC_PITCHRATE_K,
 MC_PITCHRATE_MAX,
 MC_PITCHRATE_P,
 MC_PITCH_P,
 MC_PR_INT_LIM,
 MC_ROLLRATE_D,
 MC_ROLLRATE_FF,
 MC_ROLLRATE_I,
 MC_ROLLRATE_K,
 MC_ROLLRATE_MAX,
 MC_ROLLRATE_P,
 MC_ROLL_P,
 MC_RR_INT_LIM,
 MC_SLOW_DEF_HVEL,
 MC_SLOW_DEF_VVEL,
 MC_SLOW_DEF_YAWR,
 MC_SLOW_MAP_HVEL,
 MC_SLOW_MAP_PTCH,
 MC_SLOW_MAP_VVEL,
 MC_SLOW_MAP_YAWR,
 MC_SLOW_MIN_HVEL,
 MC_SLOW_MIN_VVEL,
 MC_SLOW_MIN_YAWR,
 MC_YAWRATE_D,
 MC_YAWRATE_FF,
 MC_YAWRATE_I,
 MC_YAWRATE_K,
 MC_YAWRATE_MAX,
 MC_YAWRATE_P,
 MC_YAW_P,
 MC_YAW_TQ_CUTOFF,
 MC_YAW_WEIGHT,
 MC_YR_INT_LIM,
 MIS_COMMAND_TOUT,
 MIS_DIST_1WP,
 MIS_LND_ABRT_ALT,
 MIS_MNT_YAW_CTL,
 MIS_TAKEOFF_ALT,
 MIS_TKO_LAND_REQ,
 MIS_YAW_ERR,
 MIS_YAW_TMT,
 MNT_DO_STAB,
 MNT_LND_P_MAX,
 MNT_LND_P_MIN,
 MNT_MAN_PITCH,
 MNT_MAN_ROLL,
 MNT_MAN_YAW,
 MNT_MAV_COMPID,
 MNT_MAV_SYSID,
 MNT_MODE_IN,
 MNT_MODE_OUT,
 MNT_OFF_PITCH,
 MNT_OFF_ROLL,
 MNT_OFF_YAW,
 MNT_RANGE_PITCH,
 MNT_RANGE_ROLL,
 MNT_RANGE_YAW,
 MNT_RATE_PITCH,
 MNT_RATE_YAW,
 MNT_RC_IN_MODE,
 MPC_ACC_DECOUPLE,
 MPC_ACC_DOWN_MAX,
 MPC_ACC_HOR,
 MPC_ACC_HOR_MAX,
 MPC_ACC_UP_MAX,
 MPC_ALT_MODE,
 MPC_HOLD_MAX_XY,
 MPC_HOLD_MAX_Z,
 MPC_JERK_AUTO,
 MPC_JERK_MAX,
 MPC_LAND_ALT1,
 MPC_LAND_ALT2,
 MPC_LAND_ALT3,
 MPC_LAND_CRWL,
 MPC_LAND_RADIUS,
 MPC_LAND_RC_HELP,
 MPC_LAND_SPEED,
 MPC_MANTHR_MIN,
 MPC_MAN_TILT_MAX,
 MPC_MAN_Y_MAX,
 MPC_MAN_Y_TAU,
 MPC_POS_MODE,
 MPC_THR_CURVE,
 MPC_THR_HOVER,
 MPC_THR_MAX,
 MPC_THR_MIN,
 MPC_THR_XY_MARG,
 MPC_TILTMAX_AIR,
 MPC_TILTMAX_LND,
 MPC_TKO_RAMP_T,
 MPC_TKO_SPEED,
 MPC_USE_HTE,
 MPC_VELD_LP,
 MPC_VEL_LP,
 MPC_VEL_MANUAL,
 MPC_VEL_MAN_BACK,
 MPC_VEL_MAN_SIDE,
 MPC_VEL_NF_BW,
 MPC_VEL_NF_FRQ,
 MPC_XY_CRUISE,
 MPC_XY_ERR_MAX,
 MPC_XY_P,
 MPC_XY_TRAJ_P,
 MPC_XY_VEL_ALL,
 MPC_XY_VEL_D_ACC,
 MPC_XY_VEL_I_ACC,
 MPC_XY_VEL_MAX,
 MPC_XY_VEL_P_ACC,
 MPC_YAWRAUTO_ACC,
 MPC_YAWRAUTO_MAX,
 MPC_YAW_MODE,
 MPC_Z_P,
 MPC_Z_VEL_ALL,
 MPC_Z_VEL_D_ACC,
 MPC_Z_VEL_I_ACC,
 MPC_Z_VEL_MAX_DN,
 MPC_Z_VEL_MAX_UP,
 MPC_Z_VEL_P_ACC,
 MPC_Z_V_AUTO_DN,
 MPC_Z_V_AUTO_UP,
 NAV_ACC_RAD,
 NAV_DLL_ACT,
 NAV_FORCE_VT,
 NAV_FW_ALTL_RAD,
 NAV_FW_ALT_RAD,
 NAV_LOITER_RAD,
 NAV_MC_ALT_RAD,
 NAV_MIN_GND_DIST,
 NAV_MIN_LTR_ALT,
 NAV_RCL_ACT,
 NAV_TRAFF_AVOID,
 NAV_TRAFF_A_HOR,
 NAV_TRAFF_A_VER,
 NAV_TRAFF_COLL_T,
 NPFG_DAMPING,
 NPFG_LB_PERIOD,
 NPFG_PERIOD,
 NPFG_PERIOD_SF,
 NPFG_ROLL_TC,
 NPFG_SW_DST_MLT,
 NPFG_UB_PERIOD,
 OSD_CH_HEIGHT,
 OSD_DWELL_TIME,
 OSD_LOG_LEVEL,
 OSD_RC_STICK,
 OSD_SCROLL_RATE,
 OSD_SYMBOLS,
 PD_GRIPPER_TO,
 PD_GRIPPER_TYPE,
 PLD_BTOUT,
 PLD_FAPPR_ALT,
 PLD_HACC_RAD,
 PLD_MAX_SRCH,
 PLD_SRCH_ALT,
 PLD_SRCH_TOUT,
 PP_LOOKAHD_GAIN,
 PP_LOOKAHD_MAX,
 PP_LOOKAHD_MIN,
 PWM_MAIN_FUNC1,
 PWM_MAIN_FUNC10,
 PWM_MAIN_FUNC11,
 PWM_MAIN_FUNC12,
 PWM_MAIN_FUNC13,
 PWM_MAIN_FUNC14,
 PWM_MAIN_FUNC15,
 PWM_MAIN_FUNC16,
 PWM_MAIN_FUNC2,
 PWM_MAIN_FUNC3,
 PWM_MAIN_FUNC4,
 PWM_MAIN_FUNC5,
 PWM_MAIN_FUNC6,
 PWM_MAIN_FUNC7,
 PWM_MAIN_FUNC8,
 PWM_MAIN_FUNC9,
 PWM_MAIN_REV,
 RA_ACC_RAD_GAIN,
 RA_ACC_RAD_MAX,
 RA_MAX_STR_ANG,
 RA_STR_RATE_LIM,
 RA_WHEEL_BASE,
 RC10_MAX,
 RC10_MIN,
 RC10_REV,
 RC10_TRIM,
 RC11_MAX,
 RC11_MIN,
 RC11_REV,
 RC11_TRIM,
 RC12_MAX,
 RC12_MIN,
 RC12_REV,
 RC12_TRIM,
 RC13_MAX,
 RC13_MIN,
 RC13_REV,
 RC13_TRIM,
 RC14_MAX,
 RC14_MIN,
 RC14_REV,
 RC14_TRIM,
 RC15_MAX,
 RC15_MIN,
 RC15_REV,
 RC15_TRIM,
 RC16_MAX,
 RC16_MIN,
 RC16_REV,
 RC16_TRIM,
 RC17_MAX,
 RC17_MIN,
 RC17_REV,
 RC17_TRIM,
 RC18_MAX,
 RC18_MIN,
 RC18_REV,
 RC18_TRIM,
 RC1_MAX,
 RC1_MIN,
 RC1_REV,
 RC1_TRIM,
 RC2_MAX,
 RC2_MIN,
 RC2_REV,
 RC2_TRIM,
 RC3_MAX,
 RC3_MIN,
 RC3_REV,
 RC3_TRIM,
 RC4_MAX,
 RC4_MIN,
 RC4_REV,
 RC4_TRIM,
 RC5_MAX,
 RC5_MIN,
 RC5_REV,
 RC5_TRIM,
 RC6_MAX,
 RC6_MIN,
 RC6_REV,
 RC6_TRIM,
 RC7_MAX,
 RC7_MIN,
 RC7_REV,
 RC7_TRIM,
 RC8_MAX,
 RC8_MIN,
 RC8_REV,
 RC8_TRIM,
 RC9_MAX,
 RC9_MIN,
 RC9_REV,
 RC9_TRIM,
 RC_ARMSWITCH_TH,
 RC_CHAN_CNT,
 RC_ENG_MOT_TH,
 RC_FAILS_THR,
 RC_GEAR_TH,
 RC_KILLSWITCH_TH,
 RC_LOITER_TH,
 RC_MAP_ARM_SW,
 RC_MAP_AUX1,
 RC_MAP_AUX2,
 RC_MAP_AUX3,
 RC_MAP_AUX4,
 RC_MAP_AUX5,
 RC_MAP_AUX6,
 RC_MAP_ENG_MOT,
 RC_MAP_FAILSAFE,
 RC_MAP_FLAPS,
 RC_MAP_FLTMODE,
 RC_MAP_FLTM_BTN,
 RC_MAP_GEAR_SW,
 RC_MAP_KILL_SW,
 RC_MAP_LOITER_SW,
 RC_MAP_MODE_SW,
 RC_MAP_OFFB_SW,
 RC_MAP_PARAM1,
 RC_MAP_PARAM2,
 RC_MAP_PARAM3,
 RC_MAP_PAY_SW,
 RC_MAP_PITCH,
 RC_MAP_RETURN_SW,
 RC_MAP_ROLL,
 RC_MAP_TERM_SW,
 RC_MAP_THROTTLE,
 RC_MAP_TRANS_SW,
 RC_MAP_YAW,
 RC_OFFB_TH,
 RC_PAYLOAD_MIDTH,
 RC_PAYLOAD_TH,
 RC_RETURN_TH,
 RC_RSSI_PWM_CHAN,
 RC_RSSI_PWM_MAX,
 RC_RSSI_PWM_MIN,
 RC_TRANS_TH,
 RD_TRANS_DRV_TRN,
 RD_TRANS_TRN_DRV,
 RD_WHEEL_TRACK,
 RD_YAW_STK_GAIN,
 RM_COURSE_CTL_TH,
 RM_WHEEL_TRACK,
 RM_YAW_STK_GAIN,
 RO_ACCEL_LIM,
 RO_DECEL_LIM,
 RO_JERK_LIM,
 RO_MAX_THR_SPEED,
 RO_SPEED_I,
 RO_SPEED_LIM,
 RO_SPEED_P,
 RO_SPEED_RED,
 RO_SPEED_TH,
 RO_YAW_ACCEL_LIM,
 RO_YAW_DECEL_LIM,
 RO_YAW_EXPO,
 RO_YAW_P,
 RO_YAW_RATE_CORR,
 RO_YAW_RATE_I,
 RO_YAW_RATE_LIM,
 RO_YAW_RATE_P,
 RO_YAW_RATE_TH,
 RO_YAW_STICK_DZ,
 RO_YAW_SUPEXPO,
 RTL_APPR_FORCE,
 RTL_CONE_ANG,
 RTL_DESCEND_ALT,
 RTL_LAND_DELAY,
 RTL_LOITER_RAD,
 RTL_MIN_DIST,
 RTL_PLD_MD,
 RTL_RETURN_ALT,
 RTL_TIME_FACTOR,
 RTL_TIME_MARGIN,
 RTL_TYPE,
 RWTO_MAX_THR,
 RWTO_NUDGE,
 RWTO_PSP,
 RWTO_RAMP_TIME,
 RWTO_ROT_AIRSPD,
 RWTO_ROT_TIME,
 RWTO_TKOFF,
 SDLOG_BACKEND,
 SDLOG_BOOT_BAT,
 SDLOG_DIRS_MAX,
 SDLOG_MISSION,
 SDLOG_MODE,
 SDLOG_PROFILE,
 SDLOG_UTC_OFFSET,
 SDLOG_UUID,
 SENS_BARO_QNH,
 SENS_BARO_RATE,
 SENS_BAR_AUTOCAL,
 SENS_BOARD_ROT,
 SENS_BOARD_X_OFF,
 SENS_BOARD_Y_OFF,
 SENS_BOARD_Z_OFF,
 SENS_DPRES_ANSC,
 SENS_DPRES_OFF,
 SENS_DPRES_REV,
 SENS_EN_AGPSIM,
 SENS_EN_ARSPDSIM,
 SENS_EN_BAROSIM,
 SENS_EN_GPSSIM,
 SENS_EN_MAGSIM,
 SENS_EN_THERMAL,
 SENS_EXT_I2C_PRB,
 SENS_FLOW_MAXHGT,
 SENS_FLOW_MAXR,
 SENS_FLOW_MINHGT,
 SENS_FLOW_RATE,
 SENS_FLOW_ROT,
 SENS_FLOW_SCALE,
 SENS_GPS_MASK,
 SENS_GPS_PRIME,
 SENS_GPS_TAU,
 SENS_IMU_AUTOCAL,
 SENS_IMU_CLPNOTI,
 SENS_IMU_MODE,
 SENS_INT_BARO_EN,
 SENS_MAG_AUTOCAL,
 SENS_MAG_AUTOROT,
 SENS_MAG_MODE,
 SENS_MAG_RATE,
 SENS_MAG_SIDES,
 SEP_AUTO_CONFIG,
 SEP_CONST_USAGE,
 SEP_DUMP_COMM,
 SEP_HARDW_SETUP,
 SEP_LOG_FORCE,
 SEP_LOG_HZ,
 SEP_LOG_LEVEL,
 SEP_OUTP_HZ,
 SEP_PITCH_OFFS,
 SEP_SAT_INFO,
 SEP_STREAM_LOG,
 SEP_STREAM_MAIN,
 SEP_YAW_OFFS,
 SIH_DISTSNSR_MAX,
 SIH_DISTSNSR_MIN,
 SIH_DISTSNSR_OVR,
 SIH_IXX,
 SIH_IXY,
 SIH_IXZ,
 SIH_IYY,
 SIH_IYZ,
 SIH_IZZ,
 SIH_KDV,
 SIH_KDW,
 SIH_LOC_H0,
 SIH_LOC_LAT0,
 SIH_LOC_LON0,
 SIH_L_PITCH,
 SIH_L_ROLL,
 SIH_MASS,
 SIH_Q_MAX,
 SIH_T_MAX,
 SIH_T_TAU,
 SIH_VEHICLE_TYPE,
 SIM_AGP_FAIL,
 SIM_ARSPD_FAIL,
 SIM_BARO_OFF_P,
 SIM_BARO_OFF_T,
 SIM_BAT_DRAIN,
 SIM_BAT_ENABLE,
 SIM_BAT_MIN_PCT,
 SIM_GPS_USED,
 SIM_MAG_OFFSET_X,
 SIM_MAG_OFFSET_Y,
 SIM_MAG_OFFSET_Z,
 SYS_AUTOCONFIG,
 SYS_AUTOSTART,
 SYS_BL_UPDATE,
 SYS_CAL_ACCEL,
 SYS_CAL_BARO,
 SYS_CAL_GYRO,
 SYS_CAL_TDEL,
 SYS_CAL_TMAX,
 SYS_CAL_TMIN,
 SYS_DM_BACKEND,
 SYS_FAC_CAL_MODE,
 SYS_FAILURE_EN,
 SYS_HAS_BARO,
 SYS_HAS_GPS,
 SYS_HAS_MAG,
 SYS_HAS_NUM_ASPD,
 SYS_HAS_NUM_DIST,
 SYS_HAS_NUM_OF,
 SYS_HITL,
 SYS_PARAM_VER,
 SYS_RGB_MAXBRT,
 SYS_STCK_EN,
 SYS_VEHICLE_RESP,
 TC_A0_ID,
 TC_A0_TMAX,
 TC_A0_TMIN,
 TC_A0_TREF,
 TC_A0_X0_0,
 TC_A0_X0_1,
 TC_A0_X0_2,
 TC_A0_X1_0,
 TC_A0_X1_1,
 TC_A0_X1_2,
 TC_A0_X2_0,
 TC_A0_X2_1,
 TC_A0_X2_2,
 TC_A0_X3_0,
 TC_A0_X3_1,
 TC_A0_X3_2,
 TC_A1_ID,
 TC_A1_TMAX,
 TC_A1_TMIN,
 TC_A1_TREF,
 TC_A1_X0_0,
 TC_A1_X0_1,
 TC_A1_X0_2,
 TC_A1_X1_0,
 TC_A1_X1_1,
 TC_A1_X1_2,
 TC_A1_X2_0,
 TC_A1_X2_1,
 TC_A1_X2_2,
 TC_A1_X3_0,
 TC_A1_X3_1,
 TC_A1_X3_2,
 TC_A2_ID,
 TC_A2_TMAX,
 TC_A2_TMIN,
 TC_A2_TREF,
 TC_A2_X0_0,
 TC_A2_X0_1,
 TC_A2_X0_2,
 TC_A2_X1_0,
 TC_A2_X1_1,
 TC_A2_X1_2,
 TC_A2_X2_0,
 TC_A2_X2_1,
 TC_A2_X2_2,
 TC_A2_X3_0,
 TC_A2_X3_1,
 TC_A2_X3_2,
 TC_A3_ID,
 TC_A3_TMAX,
 TC_A3_TMIN,
 TC_A3_TREF,
 TC_A3_X0_0,
 TC_A3_X0_1,
 TC_A3_X0_2,
 TC_A3_X1_0,
 TC_A3_X1_1,
 TC_A3_X1_2,
 TC_A3_X2_0,
 TC_A3_X2_1,
 TC_A3_X2_2,
 TC_A3_X3_0,
 TC_A3_X3_1,
 TC_A3_X3_2,
 TC_A_ENABLE,
 TC_B0_ID,
 TC_B0_TMAX,
 TC_B0_TMIN,
 TC_B0_TREF,
 TC_B0_X0,
 TC_B0_X1,
 TC_B0_X2,
 TC_B0_X3,
 TC_B0_X4,
 TC_B0_X5,
 TC_B1_ID,
 TC_B1_TMAX,
 TC_B1_TMIN,
 TC_B1_TREF,
 TC_B1_X0,
 TC_B1_X1,
 TC_B1_X2,
 TC_B1_X3,
 TC_B1_X4,
 TC_B1_X5,
 TC_B2_ID,
 TC_B2_TMAX,
 TC_B2_TMIN,
 TC_B2_TREF,
 TC_B2_X0,
 TC_B2_X1,
 TC_B2_X2,
 TC_B2_X3,
 TC_B2_X4,
 TC_B2_X5,
 TC_B3_ID,
 TC_B3_TMAX,
 TC_B3_TMIN,
 TC_B3_TREF,
 TC_B3_X0,
 TC_B3_X1,
 TC_B3_X2,
 TC_B3_X3,
 TC_B3_X4,
 TC_B3_X5,
 TC_B_ENABLE,
 TC_G0_ID,
 TC_G0_TMAX,
 TC_G0_TMIN,
 TC_G0_TREF,
 TC_G0_X0_0,
 TC_G0_X0_1,
 TC_G0_X0_2,
 TC_G0_X1_0,
 TC_G0_X1_1,
 TC_G0_X1_2,
 TC_G0_X2_0,
 TC_G0_X2_1,
 TC_G0_X2_2,
 TC_G0_X3_0,
 TC_G0_X3_1,
 TC_G0_X3_2,
 TC_G1_ID,
 TC_G1_TMAX,
 TC_G1_TMIN,
 TC_G1_TREF,
 TC_G1_X0_0,
 TC_G1_X0_1,
 TC_G1_X0_2,
 TC_G1_X1_0,
 TC_G1_X1_1,
 TC_G1_X1_2,
 TC_G1_X2_0,
 TC_G1_X2_1,
 TC_G1_X2_2,
 TC_G1_X3_0,
 TC_G1_X3_1,
 TC_G1_X3_2,
 TC_G2_ID,
 TC_G2_TMAX,
 TC_G2_TMIN,
 TC_G2_TREF,
 TC_G2_X0_0,
 TC_G2_X0_1,
 TC_G2_X0_2,
 TC_G2_X1_0,
 TC_G2_X1_1,
 TC_G2_X1_2,
 TC_G2_X2_0,
 TC_G2_X2_1,
 TC_G2_X2_2,
 TC_G2_X3_0,
 TC_G2_X3_1,
 TC_G2_X3_2,
 TC_G3_ID,
 TC_G3_TMAX,
 TC_G3_TMIN,
 TC_G3_TREF,
 TC_G3_X0_0,
 TC_G3_X0_1,
 TC_G3_X0_2,
 TC_G3_X1_0,
 TC_G3_X1_1,
 TC_G3_X1_2,
 TC_G3_X2_0,
 TC_G3_X2_1,
 TC_G3_X2_2,
 TC_G3_X3_0,
 TC_G3_X3_1,
 TC_G3_X3_2,
 TC_G_ENABLE,
 TC_M0_ID,
 TC_M0_TMAX,
 TC_M0_TMIN,
 TC_M0_TREF,
 TC_M0_X0_0,
 TC_M0_X0_1,
 TC_M0_X0_2,
 TC_M0_X1_0,
 TC_M0_X1_1,
 TC_M0_X1_2,
 TC_M0_X2_0,
 TC_M0_X2_1,
 TC_M0_X2_2,
 TC_M0_X3_0,
 TC_M0_X3_1,
 TC_M0_X3_2,
 TC_M1_ID,
 TC_M1_TMAX,
 TC_M1_TMIN,
 TC_M1_TREF,
 TC_M1_X0_0,
 TC_M1_X0_1,
 TC_M1_X0_2,
 TC_M1_X1_0,
 TC_M1_X1_1,
 TC_M1_X1_2,
 TC_M1_X2_0,
 TC_M1_X2_1,
 TC_M1_X2_2,
 TC_M1_X3_0,
 TC_M1_X3_1,
 TC_M1_X3_2,
 TC_M2_ID,
 TC_M2_TMAX,
 TC_M2_TMIN,
 TC_M2_TREF,
 TC_M2_X0_0,
 TC_M2_X0_1,
 TC_M2_X0_2,
 TC_M2_X1_0,
 TC_M2_X1_1,
 TC_M2_X1_2,
 TC_M2_X2_0,
 TC_M2_X2_1,
 TC_M2_X2_2,
 TC_M2_X3_0,
 TC_M2_X3_1,
 TC_M2_X3_2,
 TC_M3_ID,
 TC_M3_TMAX,
 TC_M3_TMIN,
 TC_M3_TREF,
 TC_M3_X0_0,
 TC_M3_X0_1,
 TC_M3_X0_2,
 TC_M3_X1_0,
 TC_M3_X1_1,
 TC_M3_X1_2,
 TC_M3_X2_0,
 TC_M3_X2_1,
 TC_M3_X2_2,
 TC_M3_X3_0,
 TC_M3_X3_1,
 TC_M3_X3_2,
 TC_M_ENABLE,
 TEST_1,
 TEST_2,
 TEST_3,
 TEST_D,
 TEST_DEV,
 TEST_D_LP,
 TEST_HP,
 TEST_I,
 TEST_I_MAX,
 TEST_LP,
 TEST_MAX,
 TEST_MEAN,
 TEST_MIN,
 TEST_P,
 TEST_PARAMS,
 TEST_RC2_X,
 TEST_RC_X,
 TEST_TRIM,
 THR_MDL_FAC,
 TRIG_ACT_TIME,
 TRIG_DISTANCE,
 TRIG_INTERFACE,
 TRIG_INTERVAL,
 TRIG_MIN_INTERVA,
 TRIG_MODE,
 TRIG_POLARITY,
 TRIG_PWM_NEUTRAL,
 TRIG_PWM_SHOOT,
 TRIM_PITCH,
 TRIM_ROLL,
 TRIM_YAW,
 UUV_GAIN_X_D,
 UUV_GAIN_X_P,
 UUV_GAIN_Y_D,
 UUV_GAIN_Y_P,
 UUV_GAIN_Z_D,
 UUV_GAIN_Z_P,
 UUV_MGM_PITCH,
 UUV_MGM_ROLL,
 UUV_MGM_THRTL,
 UUV_MGM_YAW,
 UUV_PGM_VEL,
 UUV_PITCH_D,
 UUV_PITCH_P,
 UUV_POS_MODE,
 UUV_POS_STICK_DB,
 UUV_RGM_PITCH,
 UUV_RGM_ROLL,
 UUV_RGM_THRTL,
 UUV_RGM_YAW,
 UUV_ROLL_D,
 UUV_ROLL_P,
 UUV_SGM_PITCH,
 UUV_SGM_ROLL,
 UUV_SGM_THRTL,
 UUV_SGM_YAW,
 UUV_SP_MAX_AGE,
 UUV_STAB_MODE,
 UUV_THRUST_SAT,
 UUV_TORQUE_SAT,
 UUV_YAW_D,
 UUV_YAW_P,
 UXRCE_DDS_AG_IP,
 UXRCE_DDS_DOM_ID,
 UXRCE_DDS_KEY,
 UXRCE_DDS_NS_IDX,
 UXRCE_DDS_PRT,
 UXRCE_DDS_PTCFG,
 UXRCE_DDS_RX_TO,
 UXRCE_DDS_SYNCC,
 UXRCE_DDS_SYNCT,
 UXRCE_DDS_TX_TO,
 VTO_LOITER_ALT,
 VT_ARSP_BLEND,
 VT_ARSP_TRANS,
 VT_BT_TILT_DUR,
 VT_B_DEC_I,
 VT_B_DEC_MSS,
 VT_B_TRANS_DUR,
 VT_B_TRANS_RAMP,
 VT_ELEV_MC_LOCK,
 VT_FWD_THRUST_EN,
 VT_FWD_THRUST_SC,
 VT_FW_DIFTHR_EN,
 VT_FW_DIFTHR_S_P,
 VT_FW_DIFTHR_S_R,
 VT_FW_DIFTHR_S_Y,
 VT_FW_MIN_ALT,
 VT_FW_QC_HMAX,
 VT_FW_QC_P,
 VT_FW_QC_R,
 VT_F_TRANS_DUR,
 VT_F_TRANS_THR,
 VT_F_TR_OL_TM,
 VT_LND_PITCH_MIN,
 VT_PITCH_MIN,
 VT_PSHER_SLEW,
 VT_QC_ALT_LOSS,
 VT_QC_T_ALT_LOSS,
 VT_SPOILER_MC_LD,
 VT_TILT_FW,
 VT_TILT_MC,
 VT_TILT_TRANS,
 VT_TRANS_MIN_TM,
 VT_TRANS_P2_DUR,
 VT_TRANS_TIMEOUT,
 VT_TYPE,
 WEIGHT_BASE,
 WEIGHT_GROSS,
 WV_EN,
 WV_GAIN,
 WV_ROLL_MIN,
 WV_YRATE_MAX,

};

static constexpr param_info_s parameters[] = {

 {
  .name = "ADSB_CALLSIGN_1",
  .val = { .i = 0},
 },

 {
  .name = "ADSB_CALLSIGN_2",
  .val = { .i = 0},
 },

 {
  .name = "ADSB_EMERGC",
  .val = { .i = 0},
 },

 {
  .name = "ADSB_EMIT_TYPE",
  .val = { .i = 14},
 },

 {
  .name = "ADSB_GPS_OFF_LAT",
  .val = { .i = 0},
 },

 {
  .name = "ADSB_GPS_OFF_LON",
  .val = { .i = 0},
 },

 {
  .name = "ADSB_ICAO_ID",
  .val = { .i = 1194684},
 },

 {
  .name = "ADSB_ICAO_SPECL",
  .val = { .i = 0},
 },

 {
  .name = "ADSB_IDENT",
  .val = { .i = 0},
 },

 {
  .name = "ADSB_LEN_WIDTH",
  .val = { .i = 1},
 },

 {
  .name = "ADSB_LIST_MAX",
  .val = { .i = 25},
 },

 {
  .name = "ADSB_MAX_SPEED",
  .val = { .i = 0},
 },

 {
  .name = "ADSB_SQUAWK",
  .val = { .i = 1200},
 },

 {
  .name = "ASPD_BETA_GATE",
  .val = { .i = 1},
 },

 {
  .name = "ASPD_BETA_NOISE",
  .val = { .f = 0.15 },
 },

 {
  .name = "ASPD_DO_CHECKS",
  .val = { .i = 7},
 },

 {
  .name = "ASPD_FALLBACK",
  .val = { .i = 0},
 },

 {
  .name = "ASPD_FP_T_WINDOW",
  .val = { .f = 2.0 },
 },

 {
  .name = "ASPD_FS_INNOV",
  .val = { .f = 5. },
 },

 {
  .name = "ASPD_FS_INTEG",
  .val = { .f = 10. },
 },

 {
  .name = "ASPD_FS_T_START",
  .val = { .f = -1. },
 },

 {
  .name = "ASPD_FS_T_STOP",
  .val = { .f = 1. },
 },

 {
  .name = "ASPD_PRIMARY",
  .val = { .i = 1},
 },

 {
  .name = "ASPD_SCALE_1",
  .val = { .f = 1.0 },
 },

 {
  .name = "ASPD_SCALE_2",
  .val = { .f = 1.0 },
 },

 {
  .name = "ASPD_SCALE_3",
  .val = { .f = 1.0 },
 },

 {
  .name = "ASPD_SCALE_APPLY",
  .val = { .i = 2},
 },

 {
  .name = "ASPD_SCALE_NSD",
  .val = { .f = 1.e-4 },
 },

 {
  .name = "ASPD_TAS_GATE",
  .val = { .i = 4},
 },

 {
  .name = "ASPD_TAS_NOISE",
  .val = { .f = 1.4 },
 },

 {
  .name = "ASPD_WERR_THR",
  .val = { .f = 2. },
 },

 {
  .name = "ASPD_WIND_NSD",
  .val = { .f = 1.e-1 },
 },

 {
  .name = "ATT_ACC_COMP",
  .val = { .i = 0},
 },

 {
  .name = "ATT_BIAS_MAX",
  .val = { .f = 0.05 },
 },

 {
  .name = "ATT_EN",
  .val = { .i = 0},
 },

 {
  .name = "ATT_EXT_HDG_M",
  .val = { .i = 0},
 },

 {
  .name = "ATT_MAG_DECL",
  .val = { .f = 0.0 },
 },

 {
  .name = "ATT_MAG_DECL_A",
  .val = { .i = 1},
 },

 {
  .name = "ATT_W_ACC",
  .val = { .f = 0.2 },
 },

 {
  .name = "ATT_W_EXT_HDG",
  .val = { .f = 0.1 },
 },

 {
  .name = "ATT_W_GYRO_BIAS",
  .val = { .f = 0.1 },
 },

 {
  .name = "ATT_W_MAG",
  .val = { .f = 0.1 },
 },

 {
  .name = "BAT1_CAPACITY",
  .val = { .f = -1.0 },
 },

 {
  .name = "BAT1_N_CELLS",
  .val = { .i = 0},
 },

 {
  .name = "BAT1_R_INTERNAL",
  .val = { .f = -1.0 },
 },

 {
  .name = "BAT1_SOURCE",
  .val = { .i = 0},
 },

 {
  .name = "BAT1_V_CHARGED",
  .val = { .f = 4.05 },
 },

 {
  .name = "BAT1_V_EMPTY",
  .val = { .f = 3.6 },
 },

 {
  .name = "BAT2_CAPACITY",
  .val = { .f = -1.0 },
 },

 {
  .name = "BAT2_N_CELLS",
  .val = { .i = 0},
 },

 {
  .name = "BAT2_R_INTERNAL",
  .val = { .f = -1.0 },
 },

 {
  .name = "BAT2_SOURCE",
  .val = { .i = -1},
 },

 {
  .name = "BAT2_V_CHARGED",
  .val = { .f = 4.05 },
 },

 {
  .name = "BAT2_V_EMPTY",
  .val = { .f = 3.6 },
 },

 {
  .name = "BAT3_CAPACITY",
  .val = { .f = -1.0 },
 },

 {
  .name = "BAT3_N_CELLS",
  .val = { .i = 0},
 },

 {
  .name = "BAT3_R_INTERNAL",
  .val = { .f = -1.0 },
 },

 {
  .name = "BAT3_SOURCE",
  .val = { .i = -1},
 },

 {
  .name = "BAT3_V_CHARGED",
  .val = { .f = 4.05 },
 },

 {
  .name = "BAT3_V_EMPTY",
  .val = { .f = 3.6 },
 },

 {
  .name = "BAT_AVRG_CURRENT",
  .val = { .f = 15 },
 },

 {
  .name = "BAT_CRIT_THR",
  .val = { .f = 0.07 },
 },

 {
  .name = "BAT_EMERGEN_THR",
  .val = { .f = 0.05 },
 },

 {
  .name = "BAT_LOW_THR",
  .val = { .f = 0.15 },
 },

 {
  .name = "CAL_ACC0_ID",
  .val = { .i = 0},
 },

 {
  .name = "CAL_ACC0_PRIO",
  .val = { .i = -1},
 },

 {
  .name = "CAL_ACC0_ROT",
  .val = { .i = -1},
 },

 {
  .name = "CAL_ACC0_XOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_ACC0_XSCALE",
  .val = { .f = 1.0 },
 },

 {
  .name = "CAL_ACC0_YOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_ACC0_YSCALE",
  .val = { .f = 1.0 },
 },

 {
  .name = "CAL_ACC0_ZOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_ACC0_ZSCALE",
  .val = { .f = 1.0 },
 },

 {
  .name = "CAL_ACC1_ID",
  .val = { .i = 0},
 },

 {
  .name = "CAL_ACC1_PRIO",
  .val = { .i = -1},
 },

 {
  .name = "CAL_ACC1_ROT",
  .val = { .i = -1},
 },

 {
  .name = "CAL_ACC1_XOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_ACC1_XSCALE",
  .val = { .f = 1.0 },
 },

 {
  .name = "CAL_ACC1_YOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_ACC1_YSCALE",
  .val = { .f = 1.0 },
 },

 {
  .name = "CAL_ACC1_ZOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_ACC1_ZSCALE",
  .val = { .f = 1.0 },
 },

 {
  .name = "CAL_ACC2_ID",
  .val = { .i = 0},
 },

 {
  .name = "CAL_ACC2_PRIO",
  .val = { .i = -1},
 },

 {
  .name = "CAL_ACC2_ROT",
  .val = { .i = -1},
 },

 {
  .name = "CAL_ACC2_XOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_ACC2_XSCALE",
  .val = { .f = 1.0 },
 },

 {
  .name = "CAL_ACC2_YOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_ACC2_YSCALE",
  .val = { .f = 1.0 },
 },

 {
  .name = "CAL_ACC2_ZOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_ACC2_ZSCALE",
  .val = { .f = 1.0 },
 },

 {
  .name = "CAL_ACC3_ID",
  .val = { .i = 0},
 },

 {
  .name = "CAL_ACC3_PRIO",
  .val = { .i = -1},
 },

 {
  .name = "CAL_ACC3_ROT",
  .val = { .i = -1},
 },

 {
  .name = "CAL_ACC3_XOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_ACC3_XSCALE",
  .val = { .f = 1.0 },
 },

 {
  .name = "CAL_ACC3_YOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_ACC3_YSCALE",
  .val = { .f = 1.0 },
 },

 {
  .name = "CAL_ACC3_ZOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_ACC3_ZSCALE",
  .val = { .f = 1.0 },
 },

 {
  .name = "CAL_AIR_CMODEL",
  .val = { .i = 0},
 },

 {
  .name = "CAL_AIR_TUBED_MM",
  .val = { .f = 1.5 },
 },

 {
  .name = "CAL_AIR_TUBELEN",
  .val = { .f = 0.2 },
 },

 {
  .name = "CAL_BARO0_ID",
  .val = { .i = 0},
 },

 {
  .name = "CAL_BARO0_OFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_BARO0_PRIO",
  .val = { .i = -1},
 },

 {
  .name = "CAL_BARO1_ID",
  .val = { .i = 0},
 },

 {
  .name = "CAL_BARO1_OFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_BARO1_PRIO",
  .val = { .i = -1},
 },

 {
  .name = "CAL_BARO2_ID",
  .val = { .i = 0},
 },

 {
  .name = "CAL_BARO2_OFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_BARO2_PRIO",
  .val = { .i = -1},
 },

 {
  .name = "CAL_BARO3_ID",
  .val = { .i = 0},
 },

 {
  .name = "CAL_BARO3_OFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_BARO3_PRIO",
  .val = { .i = -1},
 },

 {
  .name = "CAL_GYRO0_ID",
  .val = { .i = 0},
 },

 {
  .name = "CAL_GYRO0_PRIO",
  .val = { .i = -1},
 },

 {
  .name = "CAL_GYRO0_ROT",
  .val = { .i = -1},
 },

 {
  .name = "CAL_GYRO0_XOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_GYRO0_YOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_GYRO0_ZOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_GYRO1_ID",
  .val = { .i = 0},
 },

 {
  .name = "CAL_GYRO1_PRIO",
  .val = { .i = -1},
 },

 {
  .name = "CAL_GYRO1_ROT",
  .val = { .i = -1},
 },

 {
  .name = "CAL_GYRO1_XOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_GYRO1_YOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_GYRO1_ZOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_GYRO2_ID",
  .val = { .i = 0},
 },

 {
  .name = "CAL_GYRO2_PRIO",
  .val = { .i = -1},
 },

 {
  .name = "CAL_GYRO2_ROT",
  .val = { .i = -1},
 },

 {
  .name = "CAL_GYRO2_XOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_GYRO2_YOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_GYRO2_ZOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_GYRO3_ID",
  .val = { .i = 0},
 },

 {
  .name = "CAL_GYRO3_PRIO",
  .val = { .i = -1},
 },

 {
  .name = "CAL_GYRO3_ROT",
  .val = { .i = -1},
 },

 {
  .name = "CAL_GYRO3_XOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_GYRO3_YOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_GYRO3_ZOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG0_ID",
  .val = { .i = 0},
 },

 {
  .name = "CAL_MAG0_PITCH",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG0_PRIO",
  .val = { .i = -1},
 },

 {
  .name = "CAL_MAG0_ROLL",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG0_ROT",
  .val = { .i = -1},
 },

 {
  .name = "CAL_MAG0_XCOMP",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG0_XODIAG",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG0_XOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG0_XSCALE",
  .val = { .f = 1.0 },
 },

 {
  .name = "CAL_MAG0_YAW",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG0_YCOMP",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG0_YODIAG",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG0_YOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG0_YSCALE",
  .val = { .f = 1.0 },
 },

 {
  .name = "CAL_MAG0_ZCOMP",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG0_ZODIAG",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG0_ZOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG0_ZSCALE",
  .val = { .f = 1.0 },
 },

 {
  .name = "CAL_MAG1_ID",
  .val = { .i = 0},
 },

 {
  .name = "CAL_MAG1_PITCH",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG1_PRIO",
  .val = { .i = -1},
 },

 {
  .name = "CAL_MAG1_ROLL",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG1_ROT",
  .val = { .i = -1},
 },

 {
  .name = "CAL_MAG1_XCOMP",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG1_XODIAG",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG1_XOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG1_XSCALE",
  .val = { .f = 1.0 },
 },

 {
  .name = "CAL_MAG1_YAW",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG1_YCOMP",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG1_YODIAG",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG1_YOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG1_YSCALE",
  .val = { .f = 1.0 },
 },

 {
  .name = "CAL_MAG1_ZCOMP",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG1_ZODIAG",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG1_ZOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG1_ZSCALE",
  .val = { .f = 1.0 },
 },

 {
  .name = "CAL_MAG2_ID",
  .val = { .i = 0},
 },

 {
  .name = "CAL_MAG2_PITCH",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG2_PRIO",
  .val = { .i = -1},
 },

 {
  .name = "CAL_MAG2_ROLL",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG2_ROT",
  .val = { .i = -1},
 },

 {
  .name = "CAL_MAG2_XCOMP",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG2_XODIAG",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG2_XOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG2_XSCALE",
  .val = { .f = 1.0 },
 },

 {
  .name = "CAL_MAG2_YAW",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG2_YCOMP",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG2_YODIAG",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG2_YOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG2_YSCALE",
  .val = { .f = 1.0 },
 },

 {
  .name = "CAL_MAG2_ZCOMP",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG2_ZODIAG",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG2_ZOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG2_ZSCALE",
  .val = { .f = 1.0 },
 },

 {
  .name = "CAL_MAG3_ID",
  .val = { .i = 0},
 },

 {
  .name = "CAL_MAG3_PITCH",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG3_PRIO",
  .val = { .i = -1},
 },

 {
  .name = "CAL_MAG3_ROLL",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG3_ROT",
  .val = { .i = -1},
 },

 {
  .name = "CAL_MAG3_XCOMP",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG3_XODIAG",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG3_XOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG3_XSCALE",
  .val = { .f = 1.0 },
 },

 {
  .name = "CAL_MAG3_YAW",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG3_YCOMP",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG3_YODIAG",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG3_YOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG3_YSCALE",
  .val = { .f = 1.0 },
 },

 {
  .name = "CAL_MAG3_ZCOMP",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG3_ZODIAG",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG3_ZOFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "CAL_MAG3_ZSCALE",
  .val = { .f = 1.0 },
 },

 {
  .name = "CAL_MAG_COMP_TYP",
  .val = { .i = 0},
 },

 {
  .name = "CAL_MAG_SIDES",
  .val = { .i = 63},
 },

 {
  .name = "CA_AIRFRAME",
  .val = { .i = 0},
 },

 {
  .name = "CA_FAILURE_MODE",
  .val = { .i = 0},
 },

 {
  .name = "CA_HELI_PITCH_C0",
  .val = { .f = -0.05 },
 },

 {
  .name = "CA_HELI_PITCH_C1",
  .val = { .f = 0.0725 },
 },

 {
  .name = "CA_HELI_PITCH_C2",
  .val = { .f = 0.2 },
 },

 {
  .name = "CA_HELI_PITCH_C3",
  .val = { .f = 0.325 },
 },

 {
  .name = "CA_HELI_PITCH_C4",
  .val = { .f = 0.45 },
 },

 {
  .name = "CA_HELI_RPM_I",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_HELI_RPM_P",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_HELI_RPM_SP",
  .val = { .f = 1500 },
 },

 {
  .name = "CA_HELI_THR_C0",
  .val = { .f = 1 },
 },

 {
  .name = "CA_HELI_THR_C1",
  .val = { .f = 1 },
 },

 {
  .name = "CA_HELI_THR_C2",
  .val = { .f = 1 },
 },

 {
  .name = "CA_HELI_THR_C3",
  .val = { .f = 1 },
 },

 {
  .name = "CA_HELI_THR_C4",
  .val = { .f = 1 },
 },

 {
  .name = "CA_HELI_YAW_CCW",
  .val = { .i = 0},
 },

 {
  .name = "CA_HELI_YAW_CP_O",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_HELI_YAW_CP_S",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_HELI_YAW_TH_S",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_MAX_SVO_THROW",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_METHOD",
  .val = { .i = 2},
 },

 {
  .name = "CA_R0_SLEW",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_R10_SLEW",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_R11_SLEW",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_R1_SLEW",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_R2_SLEW",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_R3_SLEW",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_R4_SLEW",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_R5_SLEW",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_R6_SLEW",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_R7_SLEW",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_R8_SLEW",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_R9_SLEW",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR0_AX",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR0_AY",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR0_AZ",
  .val = { .f = -1.0 },
 },

 {
  .name = "CA_ROTOR0_CT",
  .val = { .f = 6.5 },
 },

 {
  .name = "CA_ROTOR0_KM",
  .val = { .f = 0.05 },
 },

 {
  .name = "CA_ROTOR0_PX",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR0_PY",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR0_PZ",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR0_TILT",
  .val = { .i = 0},
 },

 {
  .name = "CA_ROTOR10_AX",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR10_AY",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR10_AZ",
  .val = { .f = -1.0 },
 },

 {
  .name = "CA_ROTOR10_CT",
  .val = { .f = 6.5 },
 },

 {
  .name = "CA_ROTOR10_KM",
  .val = { .f = 0.05 },
 },

 {
  .name = "CA_ROTOR10_PX",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR10_PY",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR10_PZ",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR10_TILT",
  .val = { .i = 0},
 },

 {
  .name = "CA_ROTOR11_AX",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR11_AY",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR11_AZ",
  .val = { .f = -1.0 },
 },

 {
  .name = "CA_ROTOR11_CT",
  .val = { .f = 6.5 },
 },

 {
  .name = "CA_ROTOR11_KM",
  .val = { .f = 0.05 },
 },

 {
  .name = "CA_ROTOR11_PX",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR11_PY",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR11_PZ",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR11_TILT",
  .val = { .i = 0},
 },

 {
  .name = "CA_ROTOR1_AX",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR1_AY",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR1_AZ",
  .val = { .f = -1.0 },
 },

 {
  .name = "CA_ROTOR1_CT",
  .val = { .f = 6.5 },
 },

 {
  .name = "CA_ROTOR1_KM",
  .val = { .f = 0.05 },
 },

 {
  .name = "CA_ROTOR1_PX",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR1_PY",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR1_PZ",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR1_TILT",
  .val = { .i = 0},
 },

 {
  .name = "CA_ROTOR2_AX",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR2_AY",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR2_AZ",
  .val = { .f = -1.0 },
 },

 {
  .name = "CA_ROTOR2_CT",
  .val = { .f = 6.5 },
 },

 {
  .name = "CA_ROTOR2_KM",
  .val = { .f = 0.05 },
 },

 {
  .name = "CA_ROTOR2_PX",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR2_PY",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR2_PZ",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR2_TILT",
  .val = { .i = 0},
 },

 {
  .name = "CA_ROTOR3_AX",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR3_AY",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR3_AZ",
  .val = { .f = -1.0 },
 },

 {
  .name = "CA_ROTOR3_CT",
  .val = { .f = 6.5 },
 },

 {
  .name = "CA_ROTOR3_KM",
  .val = { .f = 0.05 },
 },

 {
  .name = "CA_ROTOR3_PX",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR3_PY",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR3_PZ",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR3_TILT",
  .val = { .i = 0},
 },

 {
  .name = "CA_ROTOR4_AX",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR4_AY",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR4_AZ",
  .val = { .f = -1.0 },
 },

 {
  .name = "CA_ROTOR4_CT",
  .val = { .f = 6.5 },
 },

 {
  .name = "CA_ROTOR4_KM",
  .val = { .f = 0.05 },
 },

 {
  .name = "CA_ROTOR4_PX",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR4_PY",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR4_PZ",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR4_TILT",
  .val = { .i = 0},
 },

 {
  .name = "CA_ROTOR5_AX",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR5_AY",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR5_AZ",
  .val = { .f = -1.0 },
 },

 {
  .name = "CA_ROTOR5_CT",
  .val = { .f = 6.5 },
 },

 {
  .name = "CA_ROTOR5_KM",
  .val = { .f = 0.05 },
 },

 {
  .name = "CA_ROTOR5_PX",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR5_PY",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR5_PZ",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR5_TILT",
  .val = { .i = 0},
 },

 {
  .name = "CA_ROTOR6_AX",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR6_AY",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR6_AZ",
  .val = { .f = -1.0 },
 },

 {
  .name = "CA_ROTOR6_CT",
  .val = { .f = 6.5 },
 },

 {
  .name = "CA_ROTOR6_KM",
  .val = { .f = 0.05 },
 },

 {
  .name = "CA_ROTOR6_PX",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR6_PY",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR6_PZ",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR6_TILT",
  .val = { .i = 0},
 },

 {
  .name = "CA_ROTOR7_AX",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR7_AY",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR7_AZ",
  .val = { .f = -1.0 },
 },

 {
  .name = "CA_ROTOR7_CT",
  .val = { .f = 6.5 },
 },

 {
  .name = "CA_ROTOR7_KM",
  .val = { .f = 0.05 },
 },

 {
  .name = "CA_ROTOR7_PX",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR7_PY",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR7_PZ",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR7_TILT",
  .val = { .i = 0},
 },

 {
  .name = "CA_ROTOR8_AX",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR8_AY",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR8_AZ",
  .val = { .f = -1.0 },
 },

 {
  .name = "CA_ROTOR8_CT",
  .val = { .f = 6.5 },
 },

 {
  .name = "CA_ROTOR8_KM",
  .val = { .f = 0.05 },
 },

 {
  .name = "CA_ROTOR8_PX",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR8_PY",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR8_PZ",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR8_TILT",
  .val = { .i = 0},
 },

 {
  .name = "CA_ROTOR9_AX",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR9_AY",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR9_AZ",
  .val = { .f = -1.0 },
 },

 {
  .name = "CA_ROTOR9_CT",
  .val = { .f = 6.5 },
 },

 {
  .name = "CA_ROTOR9_KM",
  .val = { .f = 0.05 },
 },

 {
  .name = "CA_ROTOR9_PX",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR9_PY",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR9_PZ",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_ROTOR9_TILT",
  .val = { .i = 0},
 },

 {
  .name = "CA_ROTOR_COUNT",
  .val = { .i = 0},
 },

 {
  .name = "CA_R_REV",
  .val = { .i = 0},
 },

 {
  .name = "CA_SP0_ANG0",
  .val = { .f = 0 },
 },

 {
  .name = "CA_SP0_ANG1",
  .val = { .f = 140 },
 },

 {
  .name = "CA_SP0_ANG2",
  .val = { .f = 220 },
 },

 {
  .name = "CA_SP0_ANG3",
  .val = { .f = 0 },
 },

 {
  .name = "CA_SP0_ARM_L0",
  .val = { .f = 1.0 },
 },

 {
  .name = "CA_SP0_ARM_L1",
  .val = { .f = 1.0 },
 },

 {
  .name = "CA_SP0_ARM_L2",
  .val = { .f = 1.0 },
 },

 {
  .name = "CA_SP0_ARM_L3",
  .val = { .f = 1.0 },
 },

 {
  .name = "CA_SP0_COUNT",
  .val = { .i = 3},
 },

 {
  .name = "CA_SV0_SLEW",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV1_SLEW",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV2_SLEW",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV3_SLEW",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV4_SLEW",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV5_SLEW",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV6_SLEW",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV7_SLEW",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS0_FLAP",
  .val = { .f = 0 },
 },

 {
  .name = "CA_SV_CS0_SPOIL",
  .val = { .f = 0 },
 },

 {
  .name = "CA_SV_CS0_TRIM",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS0_TRQ_P",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS0_TRQ_R",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS0_TRQ_Y",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS0_TYPE",
  .val = { .i = 0},
 },

 {
  .name = "CA_SV_CS1_FLAP",
  .val = { .f = 0 },
 },

 {
  .name = "CA_SV_CS1_SPOIL",
  .val = { .f = 0 },
 },

 {
  .name = "CA_SV_CS1_TRIM",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS1_TRQ_P",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS1_TRQ_R",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS1_TRQ_Y",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS1_TYPE",
  .val = { .i = 0},
 },

 {
  .name = "CA_SV_CS2_FLAP",
  .val = { .f = 0 },
 },

 {
  .name = "CA_SV_CS2_SPOIL",
  .val = { .f = 0 },
 },

 {
  .name = "CA_SV_CS2_TRIM",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS2_TRQ_P",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS2_TRQ_R",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS2_TRQ_Y",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS2_TYPE",
  .val = { .i = 0},
 },

 {
  .name = "CA_SV_CS3_FLAP",
  .val = { .f = 0 },
 },

 {
  .name = "CA_SV_CS3_SPOIL",
  .val = { .f = 0 },
 },

 {
  .name = "CA_SV_CS3_TRIM",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS3_TRQ_P",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS3_TRQ_R",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS3_TRQ_Y",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS3_TYPE",
  .val = { .i = 0},
 },

 {
  .name = "CA_SV_CS4_FLAP",
  .val = { .f = 0 },
 },

 {
  .name = "CA_SV_CS4_SPOIL",
  .val = { .f = 0 },
 },

 {
  .name = "CA_SV_CS4_TRIM",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS4_TRQ_P",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS4_TRQ_R",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS4_TRQ_Y",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS4_TYPE",
  .val = { .i = 0},
 },

 {
  .name = "CA_SV_CS5_FLAP",
  .val = { .f = 0 },
 },

 {
  .name = "CA_SV_CS5_SPOIL",
  .val = { .f = 0 },
 },

 {
  .name = "CA_SV_CS5_TRIM",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS5_TRQ_P",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS5_TRQ_R",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS5_TRQ_Y",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS5_TYPE",
  .val = { .i = 0},
 },

 {
  .name = "CA_SV_CS6_FLAP",
  .val = { .f = 0 },
 },

 {
  .name = "CA_SV_CS6_SPOIL",
  .val = { .f = 0 },
 },

 {
  .name = "CA_SV_CS6_TRIM",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS6_TRQ_P",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS6_TRQ_R",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS6_TRQ_Y",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS6_TYPE",
  .val = { .i = 0},
 },

 {
  .name = "CA_SV_CS7_FLAP",
  .val = { .f = 0 },
 },

 {
  .name = "CA_SV_CS7_SPOIL",
  .val = { .f = 0 },
 },

 {
  .name = "CA_SV_CS7_TRIM",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS7_TRQ_P",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS7_TRQ_R",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS7_TRQ_Y",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_CS7_TYPE",
  .val = { .i = 0},
 },

 {
  .name = "CA_SV_CS_COUNT",
  .val = { .i = 0},
 },

 {
  .name = "CA_SV_TL0_CT",
  .val = { .i = 1},
 },

 {
  .name = "CA_SV_TL0_MAXA",
  .val = { .f = 90.0 },
 },

 {
  .name = "CA_SV_TL0_MINA",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_TL0_TD",
  .val = { .i = 0},
 },

 {
  .name = "CA_SV_TL1_CT",
  .val = { .i = 1},
 },

 {
  .name = "CA_SV_TL1_MAXA",
  .val = { .f = 90.0 },
 },

 {
  .name = "CA_SV_TL1_MINA",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_TL1_TD",
  .val = { .i = 0},
 },

 {
  .name = "CA_SV_TL2_CT",
  .val = { .i = 1},
 },

 {
  .name = "CA_SV_TL2_MAXA",
  .val = { .f = 90.0 },
 },

 {
  .name = "CA_SV_TL2_MINA",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_TL2_TD",
  .val = { .i = 0},
 },

 {
  .name = "CA_SV_TL3_CT",
  .val = { .i = 1},
 },

 {
  .name = "CA_SV_TL3_MAXA",
  .val = { .f = 90.0 },
 },

 {
  .name = "CA_SV_TL3_MINA",
  .val = { .f = 0.0 },
 },

 {
  .name = "CA_SV_TL3_TD",
  .val = { .i = 0},
 },

 {
  .name = "CA_SV_TL_COUNT",
  .val = { .i = 0},
 },

 {
  .name = "CBRK_BUZZER",
  .val = { .i = 0},
 },

 {
  .name = "CBRK_FLIGHTTERM",
  .val = { .i = 121212},
 },

 {
  .name = "CBRK_IO_SAFETY",
  .val = { .i = 22027},
 },

 {
  .name = "CBRK_SUPPLY_CHK",
  .val = { .i = 0},
 },

 {
  .name = "CBRK_USB_CHK",
  .val = { .i = 197848},
 },

 {
  .name = "CBRK_VTOLARMING",
  .val = { .i = 0},
 },

 {
  .name = "COM_ACT_FAIL_ACT",
  .val = { .i = 0},
 },

 {
  .name = "COM_ARMABLE",
  .val = { .i = 1},
 },

 {
  .name = "COM_ARM_AUTH_ID",
  .val = { .i = 10},
 },

 {
  .name = "COM_ARM_AUTH_MET",
  .val = { .i = 0},
 },

 {
  .name = "COM_ARM_AUTH_REQ",
  .val = { .i = 0},
 },

 {
  .name = "COM_ARM_AUTH_TO",
  .val = { .f = 1 },
 },

 {
  .name = "COM_ARM_BAT_MIN",
  .val = { .f = -1. },
 },

 {
  .name = "COM_ARM_CHK_ESCS",
  .val = { .i = 0},
 },

 {
  .name = "COM_ARM_HFLT_CHK",
  .val = { .i = 1},
 },

 {
  .name = "COM_ARM_IMU_ACC",
  .val = { .f = 0.7 },
 },

 {
  .name = "COM_ARM_IMU_GYR",
  .val = { .f = 0.25 },
 },

 {
  .name = "COM_ARM_MAG_ANG",
  .val = { .i = 60},
 },

 {
  .name = "COM_ARM_MAG_STR",
  .val = { .i = 2},
 },

 {
  .name = "COM_ARM_MIS_REQ",
  .val = { .i = 0},
 },

 {
  .name = "COM_ARM_ODID",
  .val = { .i = 0},
 },

 {
  .name = "COM_ARM_SDCARD",
  .val = { .i = 1},
 },

 {
  .name = "COM_ARM_SWISBTN",
  .val = { .i = 0},
 },

 {
  .name = "COM_ARM_WO_GPS",
  .val = { .i = 1},
 },

 {
  .name = "COM_CPU_MAX",
  .val = { .f = 95.0 },
 },

 {
  .name = "COM_DISARM_LAND",
  .val = { .f = 2.0 },
 },

 {
  .name = "COM_DISARM_MAN",
  .val = { .i = 1},
 },

 {
  .name = "COM_DISARM_PRFLT",
  .val = { .f = 10.0 },
 },

 {
  .name = "COM_DLL_EXCEPT",
  .val = { .i = 0},
 },

 {
  .name = "COM_DL_LOSS_T",
  .val = { .i = 10},
 },

 {
  .name = "COM_FAIL_ACT_T",
  .val = { .f = 5. },
 },

 {
  .name = "COM_FLIGHT_UUID",
  .val = { .i = 0},
 },

 {
  .name = "COM_FLTMODE1",
  .val = { .i = -1},
 },

 {
  .name = "COM_FLTMODE2",
  .val = { .i = -1},
 },

 {
  .name = "COM_FLTMODE3",
  .val = { .i = -1},
 },

 {
  .name = "COM_FLTMODE4",
  .val = { .i = -1},
 },

 {
  .name = "COM_FLTMODE5",
  .val = { .i = -1},
 },

 {
  .name = "COM_FLTMODE6",
  .val = { .i = -1},
 },

 {
  .name = "COM_FLTT_LOW_ACT",
  .val = { .i = 0},
 },

 {
  .name = "COM_FLT_PROFILE",
  .val = { .i = 0},
 },

 {
  .name = "COM_FLT_TIME_MAX",
  .val = { .i = -1},
 },

 {
  .name = "COM_FORCE_SAFETY",
  .val = { .i = 0},
 },

 {
  .name = "COM_HLDL_LOSS_T",
  .val = { .i = 120},
 },

 {
  .name = "COM_HLDL_REG_T",
  .val = { .i = 0},
 },

 {
  .name = "COM_HOME_EN",
  .val = { .i = 1},
 },

 {
  .name = "COM_HOME_IN_AIR",
  .val = { .i = 0},
 },

 {
  .name = "COM_IMB_PROP_ACT",
  .val = { .i = 0},
 },

 {
  .name = "COM_KILL_DISARM",
  .val = { .f = 5.0 },
 },

 {
  .name = "COM_LKDOWN_TKO",
  .val = { .f = 3.0 },
 },

 {
  .name = "COM_LOW_BAT_ACT",
  .val = { .i = 0},
 },

 {
  .name = "COM_MODE0_HASH",
  .val = { .i = 0},
 },

 {
  .name = "COM_MODE1_HASH",
  .val = { .i = 0},
 },

 {
  .name = "COM_MODE2_HASH",
  .val = { .i = 0},
 },

 {
  .name = "COM_MODE3_HASH",
  .val = { .i = 0},
 },

 {
  .name = "COM_MODE4_HASH",
  .val = { .i = 0},
 },

 {
  .name = "COM_MODE5_HASH",
  .val = { .i = 0},
 },

 {
  .name = "COM_MODE6_HASH",
  .val = { .i = 0},
 },

 {
  .name = "COM_MODE7_HASH",
  .val = { .i = 0},
 },

 {
  .name = "COM_MODE_ARM_CHK",
  .val = { .i = 0},
 },

 {
  .name = "COM_MOT_TEST_EN",
  .val = { .i = 1},
 },

 {
  .name = "COM_OBC_LOSS_T",
  .val = { .f = 5.0 },
 },

 {
  .name = "COM_OBL_RC_ACT",
  .val = { .i = 0},
 },

 {
  .name = "COM_OF_LOSS_T",
  .val = { .f = 1.0 },
 },

 {
  .name = "COM_PARACHUTE",
  .val = { .i = 0},
 },

 {
  .name = "COM_POS_FS_EPH",
  .val = { .f = 5. },
 },

 {
  .name = "COM_POS_LOW_ACT",
  .val = { .i = 3},
 },

 {
  .name = "COM_POS_LOW_EPH",
  .val = { .f = -1.0 },
 },

 {
  .name = "COM_POWER_COUNT",
  .val = { .i = 1},
 },

 {
  .name = "COM_PREARM_MODE",
  .val = { .i = 0},
 },

 {
  .name = "COM_QC_ACT",
  .val = { .i = 0},
 },

 {
  .name = "COM_RAM_MAX",
  .val = { .f = 95.0 },
 },

 {
  .name = "COM_RCL_EXCEPT",
  .val = { .i = 0},
 },

 {
  .name = "COM_RC_ARM_HYST",
  .val = { .i = 1000},
 },

 {
  .name = "COM_RC_IN_MODE",
  .val = { .i = 3},
 },

 {
  .name = "COM_RC_LOSS_T",
  .val = { .f = 0.5 },
 },

 {
  .name = "COM_RC_OVERRIDE",
  .val = { .i = 1},
 },

 {
  .name = "COM_RC_STICK_OV",
  .val = { .f = 30.0 },
 },

 {
  .name = "COM_SPOOLUP_TIME",
  .val = { .f = 1.0 },
 },

 {
  .name = "COM_TAKEOFF_ACT",
  .val = { .i = 0},
 },

 {
  .name = "COM_THROW_EN",
  .val = { .i = 0},
 },

 {
  .name = "COM_THROW_SPEED",
  .val = { .f = 5 },
 },

 {
  .name = "COM_VEL_FS_EVH",
  .val = { .f = 1. },
 },

 {
  .name = "COM_WIND_MAX",
  .val = { .f = -1. },
 },

 {
  .name = "COM_WIND_MAX_ACT",
  .val = { .i = 0},
 },

 {
  .name = "COM_WIND_WARN",
  .val = { .f = -1. },
 },

 {
  .name = "CP_DELAY",
  .val = { .f = 0.4 },
 },

 {
  .name = "CP_DIST",
  .val = { .f = -1.0 },
 },

 {
  .name = "CP_GO_NO_DATA",
  .val = { .i = 0},
 },

 {
  .name = "CP_GUIDE_ANG",
  .val = { .f = 30. },
 },

 {
  .name = "EKF2_ABIAS_INIT",
  .val = { .f = 0.2 },
 },

 {
  .name = "EKF2_ABL_ACCLIM",
  .val = { .f = 25.0 },
 },

 {
  .name = "EKF2_ABL_GYRLIM",
  .val = { .f = 3.0 },
 },

 {
  .name = "EKF2_ABL_LIM",
  .val = { .f = 0.4 },
 },

 {
  .name = "EKF2_ABL_TAU",
  .val = { .f = 0.5 },
 },

 {
  .name = "EKF2_ACC_B_NOISE",
  .val = { .f = 0.003 },
 },

 {
  .name = "EKF2_ACC_NOISE",
  .val = { .f = 0.35 },
 },

 {
  .name = "EKF2_AGP_CTRL",
  .val = { .i = 0},
 },

 {
  .name = "EKF2_AGP_DELAY",
  .val = { .f = 0 },
 },

 {
  .name = "EKF2_AGP_GATE",
  .val = { .f = 3.0 },
 },

 {
  .name = "EKF2_AGP_MODE",
  .val = { .i = 0},
 },

 {
  .name = "EKF2_AGP_NOISE",
  .val = { .f = 0.9 },
 },

 {
  .name = "EKF2_ANGERR_INIT",
  .val = { .f = 0.1 },
 },

 {
  .name = "EKF2_ARSP_THR",
  .val = { .f = 0.0 },
 },

 {
  .name = "EKF2_ASPD_MAX",
  .val = { .f = 20.0 },
 },

 {
  .name = "EKF2_ASP_DELAY",
  .val = { .f = 100 },
 },

 {
  .name = "EKF2_AVEL_DELAY",
  .val = { .f = 5 },
 },

 {
  .name = "EKF2_BARO_CTRL",
  .val = { .i = 1},
 },

 {
  .name = "EKF2_BARO_DELAY",
  .val = { .f = 0 },
 },

 {
  .name = "EKF2_BARO_GATE",
  .val = { .f = 5.0 },
 },

 {
  .name = "EKF2_BARO_NOISE",
  .val = { .f = 3.5 },
 },

 {
  .name = "EKF2_BCOEF_X",
  .val = { .f = 100.0 },
 },

 {
  .name = "EKF2_BCOEF_Y",
  .val = { .f = 100.0 },
 },

 {
  .name = "EKF2_BETA_GATE",
  .val = { .f = 5.0 },
 },

 {
  .name = "EKF2_BETA_NOISE",
  .val = { .f = 0.3 },
 },

 {
  .name = "EKF2_DECL_TYPE",
  .val = { .i = 3},
 },

 {
  .name = "EKF2_DELAY_MAX",
  .val = { .f = 200 },
 },

 {
  .name = "EKF2_DRAG_CTRL",
  .val = { .i = 0},
 },

 {
  .name = "EKF2_DRAG_NOISE",
  .val = { .f = 2.5 },
 },

 {
  .name = "EKF2_EAS_NOISE",
  .val = { .f = 1.4 },
 },

 {
  .name = "EKF2_EN",
  .val = { .i = 1},
 },

 {
  .name = "EKF2_EVA_NOISE",
  .val = { .f = 0.1 },
 },

 {
  .name = "EKF2_EVP_GATE",
  .val = { .f = 5.0 },
 },

 {
  .name = "EKF2_EVP_NOISE",
  .val = { .f = 0.1 },
 },

 {
  .name = "EKF2_EVV_GATE",
  .val = { .f = 3.0 },
 },

 {
  .name = "EKF2_EVV_NOISE",
  .val = { .f = 0.1 },
 },

 {
  .name = "EKF2_EV_CTRL",
  .val = { .i = 0},
 },

 {
  .name = "EKF2_EV_DELAY",
  .val = { .f = 0 },
 },

 {
  .name = "EKF2_EV_NOISE_MD",
  .val = { .i = 0},
 },

 {
  .name = "EKF2_EV_POS_X",
  .val = { .f = 0.0 },
 },

 {
  .name = "EKF2_EV_POS_Y",
  .val = { .f = 0.0 },
 },

 {
  .name = "EKF2_EV_POS_Z",
  .val = { .f = 0.0 },
 },

 {
  .name = "EKF2_EV_QMIN",
  .val = { .i = 0},
 },

 {
  .name = "EKF2_FUSE_BETA",
  .val = { .i = 0},
 },

 {
  .name = "EKF2_GBIAS_INIT",
  .val = { .f = 0.1 },
 },

 {
  .name = "EKF2_GND_EFF_DZ",
  .val = { .f = 4.0 },
 },

 {
  .name = "EKF2_GND_MAX_HGT",
  .val = { .f = 0.5 },
 },

 {
  .name = "EKF2_GPS_CHECK",
  .val = { .i = 2047},
 },

 {
  .name = "EKF2_GPS_CTRL",
  .val = { .i = 7},
 },

 {
  .name = "EKF2_GPS_DELAY",
  .val = { .f = 110 },
 },

 {
  .name = "EKF2_GPS_MODE",
  .val = { .i = 0},
 },

 {
  .name = "EKF2_GPS_POS_X",
  .val = { .f = 0.0 },
 },

 {
  .name = "EKF2_GPS_POS_Y",
  .val = { .f = 0.0 },
 },

 {
  .name = "EKF2_GPS_POS_Z",
  .val = { .f = 0.0 },
 },

 {
  .name = "EKF2_GPS_P_GATE",
  .val = { .f = 5.0 },
 },

 {
  .name = "EKF2_GPS_P_NOISE",
  .val = { .f = 0.5 },
 },

 {
  .name = "EKF2_GPS_V_GATE",
  .val = { .f = 5.0 },
 },

 {
  .name = "EKF2_GPS_V_NOISE",
  .val = { .f = 0.3 },
 },

 {
  .name = "EKF2_GPS_YAW_OFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "EKF2_GRAV_NOISE",
  .val = { .f = 1.0 },
 },

 {
  .name = "EKF2_GSF_TAS",
  .val = { .f = 15.0 },
 },

 {
  .name = "EKF2_GYR_B_LIM",
  .val = { .f = 0.15 },
 },

 {
  .name = "EKF2_GYR_B_NOISE",
  .val = { .f = 0.001 },
 },

 {
  .name = "EKF2_GYR_NOISE",
  .val = { .f = 0.015 },
 },

 {
  .name = "EKF2_HDG_GATE",
  .val = { .f = 2.6 },
 },

 {
  .name = "EKF2_HEAD_NOISE",
  .val = { .f = 0.3 },
 },

 {
  .name = "EKF2_HGT_REF",
  .val = { .i = 1},
 },

 {
  .name = "EKF2_IMU_CTRL",
  .val = { .i = 7},
 },

 {
  .name = "EKF2_IMU_POS_X",
  .val = { .f = 0.0 },
 },

 {
  .name = "EKF2_IMU_POS_Y",
  .val = { .f = 0.0 },
 },

 {
  .name = "EKF2_IMU_POS_Z",
  .val = { .f = 0.0 },
 },

 {
  .name = "EKF2_LOG_VERBOSE",
  .val = { .i = 1},
 },

 {
  .name = "EKF2_MAG_ACCLIM",
  .val = { .f = 0.5 },
 },

 {
  .name = "EKF2_MAG_B_NOISE",
  .val = { .f = 0.0001 },
 },

 {
  .name = "EKF2_MAG_CHECK",
  .val = { .i = 1},
 },

 {
  .name = "EKF2_MAG_CHK_INC",
  .val = { .f = 20.0 },
 },

 {
  .name = "EKF2_MAG_CHK_STR",
  .val = { .f = 0.2 },
 },

 {
  .name = "EKF2_MAG_DECL",
  .val = { .f = 0 },
 },

 {
  .name = "EKF2_MAG_DELAY",
  .val = { .f = 0 },
 },

 {
  .name = "EKF2_MAG_E_NOISE",
  .val = { .f = 0.001 },
 },

 {
  .name = "EKF2_MAG_GATE",
  .val = { .f = 3.0 },
 },

 {
  .name = "EKF2_MAG_NOISE",
  .val = { .f = 0.05 },
 },

 {
  .name = "EKF2_MAG_TYPE",
  .val = { .i = 0},
 },

 {
  .name = "EKF2_MCOEF",
  .val = { .f = 0.15 },
 },

 {
  .name = "EKF2_MIN_RNG",
  .val = { .f = 0.01 },
 },

 {
  .name = "EKF2_MULTI_IMU",
  .val = { .i = 0},
 },

 {
  .name = "EKF2_MULTI_MAG",
  .val = { .i = 0},
 },

 {
  .name = "EKF2_NOAID_NOISE",
  .val = { .f = 10.0 },
 },

 {
  .name = "EKF2_NOAID_TOUT",
  .val = { .i = 5000000},
 },

 {
  .name = "EKF2_OF_CTRL",
  .val = { .i = 1},
 },

 {
  .name = "EKF2_OF_DELAY",
  .val = { .f = 20 },
 },

 {
  .name = "EKF2_OF_GATE",
  .val = { .f = 3.0 },
 },

 {
  .name = "EKF2_OF_GYR_SRC",
  .val = { .i = 0},
 },

 {
  .name = "EKF2_OF_N_MAX",
  .val = { .f = 0.5 },
 },

 {
  .name = "EKF2_OF_N_MIN",
  .val = { .f = 0.15 },
 },

 {
  .name = "EKF2_OF_POS_X",
  .val = { .f = 0.0 },
 },

 {
  .name = "EKF2_OF_POS_Y",
  .val = { .f = 0.0 },
 },

 {
  .name = "EKF2_OF_POS_Z",
  .val = { .f = 0.0 },
 },

 {
  .name = "EKF2_OF_QMIN",
  .val = { .i = 1},
 },

 {
  .name = "EKF2_OF_QMIN_GND",
  .val = { .i = 0},
 },

 {
  .name = "EKF2_PCOEF_XN",
  .val = { .f = 0.0 },
 },

 {
  .name = "EKF2_PCOEF_XP",
  .val = { .f = 0.0 },
 },

 {
  .name = "EKF2_PCOEF_YN",
  .val = { .f = 0.0 },
 },

 {
  .name = "EKF2_PCOEF_YP",
  .val = { .f = 0.0 },
 },

 {
  .name = "EKF2_PCOEF_Z",
  .val = { .f = 0.0 },
 },

 {
  .name = "EKF2_PREDICT_US",
  .val = { .i = 10000},
 },

 {
  .name = "EKF2_REQ_EPH",
  .val = { .f = 3.0 },
 },

 {
  .name = "EKF2_REQ_EPV",
  .val = { .f = 5.0 },
 },

 {
  .name = "EKF2_REQ_FIX",
  .val = { .i = 3},
 },

 {
  .name = "EKF2_REQ_GPS_H",
  .val = { .f = 10.0 },
 },

 {
  .name = "EKF2_REQ_HDRIFT",
  .val = { .f = 0.1 },
 },

 {
  .name = "EKF2_REQ_NSATS",
  .val = { .i = 6},
 },

 {
  .name = "EKF2_REQ_PDOP",
  .val = { .f = 2.5 },
 },

 {
  .name = "EKF2_REQ_SACC",
  .val = { .f = 0.5 },
 },

 {
  .name = "EKF2_REQ_VDRIFT",
  .val = { .f = 0.2 },
 },

 {
  .name = "EKF2_RNG_A_HMAX",
  .val = { .f = 5.0 },
 },

 {
  .name = "EKF2_RNG_A_VMAX",
  .val = { .f = 1.0 },
 },

 {
  .name = "EKF2_RNG_CTRL",
  .val = { .i = 1},
 },

 {
  .name = "EKF2_RNG_DELAY",
  .val = { .f = 5 },
 },

 {
  .name = "EKF2_RNG_FOG",
  .val = { .f = 3.0 },
 },

 {
  .name = "EKF2_RNG_GATE",
  .val = { .f = 5.0 },
 },

 {
  .name = "EKF2_RNG_K_GATE",
  .val = { .f = 1.0 },
 },

 {
  .name = "EKF2_RNG_NOISE",
  .val = { .f = 0.1 },
 },

 {
  .name = "EKF2_RNG_PITCH",
  .val = { .f = 0.0 },
 },

 {
  .name = "EKF2_RNG_POS_X",
  .val = { .f = 0.0 },
 },

 {
  .name = "EKF2_RNG_POS_Y",
  .val = { .f = 0.0 },
 },

 {
  .name = "EKF2_RNG_POS_Z",
  .val = { .f = 0.0 },
 },

 {
  .name = "EKF2_RNG_QLTY_T",
  .val = { .f = 1.0 },
 },

 {
  .name = "EKF2_RNG_SFE",
  .val = { .f = 0.05 },
 },

 {
  .name = "EKF2_SEL_ERR_RED",
  .val = { .f = 0.2 },
 },

 {
  .name = "EKF2_SEL_IMU_ACC",
  .val = { .f = 1.0 },
 },

 {
  .name = "EKF2_SEL_IMU_ANG",
  .val = { .f = 15.0 },
 },

 {
  .name = "EKF2_SEL_IMU_RAT",
  .val = { .f = 7.0 },
 },

 {
  .name = "EKF2_SEL_IMU_VEL",
  .val = { .f = 2.0 },
 },

 {
  .name = "EKF2_SYNT_MAG_Z",
  .val = { .i = 0},
 },

 {
  .name = "EKF2_TAS_GATE",
  .val = { .f = 5.0 },
 },

 {
  .name = "EKF2_TAU_POS",
  .val = { .f = 0.25 },
 },

 {
  .name = "EKF2_TAU_VEL",
  .val = { .f = 0.25 },
 },

 {
  .name = "EKF2_TERR_GRAD",
  .val = { .f = 0.5 },
 },

 {
  .name = "EKF2_TERR_NOISE",
  .val = { .f = 5.0 },
 },

 {
  .name = "EKF2_VEL_LIM",
  .val = { .f = 100 },
 },

 {
  .name = "EKF2_WIND_NSD",
  .val = { .f = 0.05 },
 },

 {
  .name = "EV_TSK_RC_LOSS",
  .val = { .i = 0},
 },

 {
  .name = "EV_TSK_STAT_DIS",
  .val = { .i = 0},
 },

 {
  .name = "FD_ACT_EN",
  .val = { .i = 1},
 },

 {
  .name = "FD_ACT_MOT_C2T",
  .val = { .f = 2.0 },
 },

 {
  .name = "FD_ACT_MOT_THR",
  .val = { .f = 0.2 },
 },

 {
  .name = "FD_ACT_MOT_TOUT",
  .val = { .i = 100},
 },

 {
  .name = "FD_ESCS_EN",
  .val = { .i = 1},
 },

 {
  .name = "FD_EXT_ATS_EN",
  .val = { .i = 0},
 },

 {
  .name = "FD_EXT_ATS_TRIG",
  .val = { .i = 1900},
 },

 {
  .name = "FD_FAIL_P",
  .val = { .i = 60},
 },

 {
  .name = "FD_FAIL_P_TTRI",
  .val = { .f = 0.3 },
 },

 {
  .name = "FD_FAIL_R",
  .val = { .i = 60},
 },

 {
  .name = "FD_FAIL_R_TTRI",
  .val = { .f = 0.3 },
 },

 {
  .name = "FD_IMB_PROP_THR",
  .val = { .i = 30},
 },

 {
  .name = "FLW_TGT_ALT_M",
  .val = { .i = 0},
 },

 {
  .name = "FLW_TGT_DST",
  .val = { .f = 8.0 },
 },

 {
  .name = "FLW_TGT_FA",
  .val = { .f = 180.0 },
 },

 {
  .name = "FLW_TGT_HT",
  .val = { .f = 8.0 },
 },

 {
  .name = "FLW_TGT_MAX_VEL",
  .val = { .f = 5.0 },
 },

 {
  .name = "FLW_TGT_RS",
  .val = { .f = 0.1 },
 },

 {
  .name = "FW_ACRO_X_MAX",
  .val = { .f = 90 },
 },

 {
  .name = "FW_ACRO_YAW_EN",
  .val = { .i = 0},
 },

 {
  .name = "FW_ACRO_Y_MAX",
  .val = { .f = 90 },
 },

 {
  .name = "FW_ACRO_Z_MAX",
  .val = { .f = 45 },
 },

 {
  .name = "FW_AIRSPD_FLP_SC",
  .val = { .f = 1. },
 },

 {
  .name = "FW_AIRSPD_MAX",
  .val = { .f = 20.0 },
 },

 {
  .name = "FW_AIRSPD_MIN",
  .val = { .f = 10.0 },
 },

 {
  .name = "FW_AIRSPD_STALL",
  .val = { .f = 7.0 },
 },

 {
  .name = "FW_AIRSPD_TRIM",
  .val = { .f = 15.0 },
 },

 {
  .name = "FW_ARSP_SCALE_EN",
  .val = { .i = 1},
 },

 {
  .name = "FW_AT_APPLY",
  .val = { .i = 2},
 },

 {
  .name = "FW_AT_AXES",
  .val = { .i = 3},
 },

 {
  .name = "FW_AT_MAN_AUX",
  .val = { .i = 0},
 },

 {
  .name = "FW_AT_START",
  .val = { .i = 0},
 },

 {
  .name = "FW_AT_SYSID_F0",
  .val = { .f = 1. },
 },

 {
  .name = "FW_AT_SYSID_F1",
  .val = { .f = 10. },
 },

 {
  .name = "FW_AT_SYSID_TIME",
  .val = { .f = 10. },
 },

 {
  .name = "FW_AT_SYSID_TYPE",
  .val = { .i = 1},
 },

 {
  .name = "FW_BAT_SCALE_EN",
  .val = { .i = 0},
 },

 {
  .name = "FW_DTRIM_P_VMAX",
  .val = { .f = 0.0 },
 },

 {
  .name = "FW_DTRIM_P_VMIN",
  .val = { .f = 0.0 },
 },

 {
  .name = "FW_DTRIM_R_VMAX",
  .val = { .f = 0.0 },
 },

 {
  .name = "FW_DTRIM_R_VMIN",
  .val = { .f = 0.0 },
 },

 {
  .name = "FW_DTRIM_Y_VMAX",
  .val = { .f = 0.0 },
 },

 {
  .name = "FW_DTRIM_Y_VMIN",
  .val = { .f = 0.0 },
 },

 {
  .name = "FW_FLAPS_LND_SCL",
  .val = { .f = 1.0 },
 },

 {
  .name = "FW_FLAPS_TO_SCL",
  .val = { .f = 0.0 },
 },

 {
  .name = "FW_GND_SPD_MIN",
  .val = { .f = 5.0 },
 },

 {
  .name = "FW_GPSF_LT",
  .val = { .i = 30},
 },

 {
  .name = "FW_GPSF_R",
  .val = { .f = 15.0 },
 },

 {
  .name = "FW_LAUN_AC_T",
  .val = { .f = 0.05 },
 },

 {
  .name = "FW_LAUN_AC_THLD",
  .val = { .f = 30.0 },
 },

 {
  .name = "FW_LAUN_DETCN_ON",
  .val = { .i = 0},
 },

 {
  .name = "FW_LAUN_MOT_DEL",
  .val = { .f = 0.0 },
 },

 {
  .name = "FW_LND_ABORT",
  .val = { .i = 3},
 },

 {
  .name = "FW_LND_AIRSPD",
  .val = { .f = -1. },
 },

 {
  .name = "FW_LND_ANG",
  .val = { .f = 5.0 },
 },

 {
  .name = "FW_LND_EARLYCFG",
  .val = { .i = 0},
 },

 {
  .name = "FW_LND_FLALT",
  .val = { .f = 0.5 },
 },

 {
  .name = "FW_LND_FL_PMAX",
  .val = { .f = 15.0 },
 },

 {
  .name = "FW_LND_FL_PMIN",
  .val = { .f = 2.5 },
 },

 {
  .name = "FW_LND_FL_SINK",
  .val = { .f = 0.25 },
 },

 {
  .name = "FW_LND_FL_TIME",
  .val = { .f = 1.0 },
 },

 {
  .name = "FW_LND_NUDGE",
  .val = { .i = 2},
 },

 {
  .name = "FW_LND_TD_OFF",
  .val = { .f = 3.0 },
 },

 {
  .name = "FW_LND_TD_TIME",
  .val = { .f = -1.0 },
 },

 {
  .name = "FW_LND_THRTC_SC",
  .val = { .f = 1.0 },
 },

 {
  .name = "FW_LND_USETER",
  .val = { .i = 1},
 },

 {
  .name = "FW_MAN_P_MAX",
  .val = { .f = 30.0 },
 },

 {
  .name = "FW_MAN_P_SC",
  .val = { .f = 1.0 },
 },

 {
  .name = "FW_MAN_R_MAX",
  .val = { .f = 45.0 },
 },

 {
  .name = "FW_MAN_R_SC",
  .val = { .f = 1.0 },
 },

 {
  .name = "FW_MAN_YR_MAX",
  .val = { .f = 30. },
 },

 {
  .name = "FW_MAN_Y_SC",
  .val = { .f = 1.0 },
 },

 {
  .name = "FW_PN_R_SLEW_MAX",
  .val = { .f = 90.0 },
 },

 {
  .name = "FW_POS_STK_CONF",
  .val = { .i = 2},
 },

 {
  .name = "FW_PR_D",
  .val = { .f = 0. },
 },

 {
  .name = "FW_PR_FF",
  .val = { .f = 0.5 },
 },

 {
  .name = "FW_PR_I",
  .val = { .f = 0.1 },
 },

 {
  .name = "FW_PR_IMAX",
  .val = { .f = 0.4 },
 },

 {
  .name = "FW_PR_P",
  .val = { .f = 0.08 },
 },

 {
  .name = "FW_PSP_OFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "FW_P_LIM_MAX",
  .val = { .f = 30.0 },
 },

 {
  .name = "FW_P_LIM_MIN",
  .val = { .f = -30.0 },
 },

 {
  .name = "FW_P_RMAX_NEG",
  .val = { .f = 60.0 },
 },

 {
  .name = "FW_P_RMAX_POS",
  .val = { .f = 60.0 },
 },

 {
  .name = "FW_P_TC",
  .val = { .f = 0.4 },
 },

 {
  .name = "FW_RLL_TO_YAW_FF",
  .val = { .f = 0.0 },
 },

 {
  .name = "FW_RR_D",
  .val = { .f = 0.0 },
 },

 {
  .name = "FW_RR_FF",
  .val = { .f = 0.5 },
 },

 {
  .name = "FW_RR_I",
  .val = { .f = 0.1 },
 },

 {
  .name = "FW_RR_IMAX",
  .val = { .f = 0.2 },
 },

 {
  .name = "FW_RR_P",
  .val = { .f = 0.05 },
 },

 {
  .name = "FW_R_LIM",
  .val = { .f = 50.0 },
 },

 {
  .name = "FW_R_RMAX",
  .val = { .f = 70.0 },
 },

 {
  .name = "FW_R_TC",
  .val = { .f = 0.4 },
 },

 {
  .name = "FW_SERVICE_CEIL",
  .val = { .f = -1.0 },
 },

 {
  .name = "FW_SPOILERS_LND",
  .val = { .f = 0. },
 },

 {
  .name = "FW_SPOILERS_MAN",
  .val = { .i = 0},
 },

 {
  .name = "FW_THR_ASPD_MAX",
  .val = { .f = 0. },
 },

 {
  .name = "FW_THR_ASPD_MIN",
  .val = { .f = 0. },
 },

 {
  .name = "FW_THR_IDLE",
  .val = { .f = 0.0 },
 },

 {
  .name = "FW_THR_MAX",
  .val = { .f = 1.0 },
 },

 {
  .name = "FW_THR_MIN",
  .val = { .f = 0.0 },
 },

 {
  .name = "FW_THR_SLEW_MAX",
  .val = { .f = 0.0 },
 },

 {
  .name = "FW_THR_TRIM",
  .val = { .f = 0.6 },
 },

 {
  .name = "FW_TKO_AIRSPD",
  .val = { .f = -1.0 },
 },

 {
  .name = "FW_TKO_PITCH_MIN",
  .val = { .f = 10.0 },
 },

 {
  .name = "FW_T_ALT_TC",
  .val = { .f = 5.0 },
 },

 {
  .name = "FW_T_CLMB_MAX",
  .val = { .f = 5.0 },
 },

 {
  .name = "FW_T_CLMB_R_SP",
  .val = { .f = 3.0 },
 },

 {
  .name = "FW_T_F_ALT_ERR",
  .val = { .f = -1.0 },
 },

 {
  .name = "FW_T_HRATE_FF",
  .val = { .f = 0.3 },
 },

 {
  .name = "FW_T_I_GAIN_PIT",
  .val = { .f = 0.1 },
 },

 {
  .name = "FW_T_PTCH_DAMP",
  .val = { .f = 0.1 },
 },

 {
  .name = "FW_T_RLL2THR",
  .val = { .f = 15.0 },
 },

 {
  .name = "FW_T_SEB_R_FF",
  .val = { .f = 1.0 },
 },

 {
  .name = "FW_T_SINK_MAX",
  .val = { .f = 5.0 },
 },

 {
  .name = "FW_T_SINK_MIN",
  .val = { .f = 2.0 },
 },

 {
  .name = "FW_T_SINK_R_SP",
  .val = { .f = 2.0 },
 },

 {
  .name = "FW_T_SPDWEIGHT",
  .val = { .f = 1.0 },
 },

 {
  .name = "FW_T_SPD_DEV_STD",
  .val = { .f = 0.2 },
 },

 {
  .name = "FW_T_SPD_PRC_STD",
  .val = { .f = 0.2 },
 },

 {
  .name = "FW_T_SPD_STD",
  .val = { .f = 0.07 },
 },

 {
  .name = "FW_T_STE_R_TC",
  .val = { .f = 0.4 },
 },

 {
  .name = "FW_T_TAS_TC",
  .val = { .f = 5.0 },
 },

 {
  .name = "FW_T_THR_DAMPING",
  .val = { .f = 0.05 },
 },

 {
  .name = "FW_T_THR_INTEG",
  .val = { .f = 0.02 },
 },

 {
  .name = "FW_T_THR_LOW_HGT",
  .val = { .f = -1. },
 },

 {
  .name = "FW_T_VERT_ACC",
  .val = { .f = 7.0 },
 },

 {
  .name = "FW_USE_AIRSPD",
  .val = { .i = 1},
 },

 {
  .name = "FW_WIND_ARSP_SC",
  .val = { .f = 0. },
 },

 {
  .name = "FW_WING_HEIGHT",
  .val = { .f = 0.5 },
 },

 {
  .name = "FW_WING_SPAN",
  .val = { .f = 3.0 },
 },

 {
  .name = "FW_WR_FF",
  .val = { .f = 0.2 },
 },

 {
  .name = "FW_WR_I",
  .val = { .f = 0.1 },
 },

 {
  .name = "FW_WR_IMAX",
  .val = { .f = 0.4 },
 },

 {
  .name = "FW_WR_P",
  .val = { .f = 0.5 },
 },

 {
  .name = "FW_W_EN",
  .val = { .i = 0},
 },

 {
  .name = "FW_W_RMAX",
  .val = { .f = 30.0 },
 },

 {
  .name = "FW_YR_D",
  .val = { .f = 0.0 },
 },

 {
  .name = "FW_YR_FF",
  .val = { .f = 0.3 },
 },

 {
  .name = "FW_YR_I",
  .val = { .f = 0.1 },
 },

 {
  .name = "FW_YR_IMAX",
  .val = { .f = 0.2 },
 },

 {
  .name = "FW_YR_P",
  .val = { .f = 0.05 },
 },

 {
  .name = "FW_Y_RMAX",
  .val = { .f = 50.0 },
 },

 {
  .name = "GF_ACTION",
  .val = { .i = 2},
 },

 {
  .name = "GF_MAX_HOR_DIST",
  .val = { .f = 0.0 },
 },

 {
  .name = "GF_MAX_VER_DIST",
  .val = { .f = 0.0 },
 },

 {
  .name = "GF_PREDICT",
  .val = { .i = 0},
 },

 {
  .name = "GF_SOURCE",
  .val = { .i = 0},
 },

 {
  .name = "GPS_1_GNSS",
  .val = { .i = 0},
 },

 {
  .name = "GPS_1_PROTOCOL",
  .val = { .i = 1},
 },

 {
  .name = "GPS_2_GNSS",
  .val = { .i = 0},
 },

 {
  .name = "GPS_2_PROTOCOL",
  .val = { .i = 1},
 },

 {
  .name = "GPS_CFG_WIPE",
  .val = { .i = 0},
 },

 {
  .name = "GPS_DUMP_COMM",
  .val = { .i = 0},
 },

 {
  .name = "GPS_SAT_INFO",
  .val = { .i = 0},
 },

 {
  .name = "GPS_UBX_BAUD2",
  .val = { .i = 230400},
 },

 {
  .name = "GPS_UBX_CFG_INTF",
  .val = { .i = 0},
 },

 {
  .name = "GPS_UBX_DYNMODEL",
  .val = { .i = 7},
 },

 {
  .name = "GPS_UBX_MODE",
  .val = { .i = 0},
 },

 {
  .name = "GPS_YAW_OFFSET",
  .val = { .f = 0. },
 },

 {
  .name = "HTE_ACC_GATE",
  .val = { .f = 3.0 },
 },

 {
  .name = "HTE_HT_ERR_INIT",
  .val = { .f = 0.1 },
 },

 {
  .name = "HTE_HT_NOISE",
  .val = { .f = 0.0036 },
 },

 {
  .name = "HTE_THR_RANGE",
  .val = { .f = 0.2 },
 },

 {
  .name = "HTE_VXY_THR",
  .val = { .f = 10.0 },
 },

 {
  .name = "HTE_VZ_THR",
  .val = { .f = 2.0 },
 },

 {
  .name = "IMU_ACCEL_CUTOFF",
  .val = { .f = 30.0 },
 },

 {
  .name = "IMU_DGYRO_CUTOFF",
  .val = { .f = 20.0 },
 },

 {
  .name = "IMU_GYRO_CAL_EN",
  .val = { .i = 1},
 },

 {
  .name = "IMU_GYRO_CUTOFF",
  .val = { .f = 40.0 },
 },

 {
  .name = "IMU_GYRO_DNF_BW",
  .val = { .f = 15. },
 },

 {
  .name = "IMU_GYRO_DNF_EN",
  .val = { .i = 0},
 },

 {
  .name = "IMU_GYRO_DNF_HMC",
  .val = { .i = 3},
 },

 {
  .name = "IMU_GYRO_DNF_MIN",
  .val = { .f = 25. },
 },

 {
  .name = "IMU_GYRO_FFT_EN",
  .val = { .i = 0},
 },

 {
  .name = "IMU_GYRO_FFT_LEN",
  .val = { .i = 512},
 },

 {
  .name = "IMU_GYRO_FFT_MAX",
  .val = { .f = 150. },
 },

 {
  .name = "IMU_GYRO_FFT_MIN",
  .val = { .f = 30. },
 },

 {
  .name = "IMU_GYRO_FFT_SNR",
  .val = { .f = 10. },
 },

 {
  .name = "IMU_GYRO_NF0_BW",
  .val = { .f = 20.0 },
 },

 {
  .name = "IMU_GYRO_NF0_FRQ",
  .val = { .f = 0.0 },
 },

 {
  .name = "IMU_GYRO_NF1_BW",
  .val = { .f = 20.0 },
 },

 {
  .name = "IMU_GYRO_NF1_FRQ",
  .val = { .f = 0.0 },
 },

 {
  .name = "IMU_GYRO_RATEMAX",
  .val = { .i = 400},
 },

 {
  .name = "IMU_INTEG_RATE",
  .val = { .i = 200},
 },

 {
  .name = "LNDFW_AIRSPD_MAX",
  .val = { .f = 6.00 },
 },

 {
  .name = "LNDFW_ROT_MAX",
  .val = { .f = 0.5 },
 },

 {
  .name = "LNDFW_TRIG_TIME",
  .val = { .f = 2. },
 },

 {
  .name = "LNDFW_VEL_XY_MAX",
  .val = { .f = 5.0 },
 },

 {
  .name = "LNDFW_VEL_Z_MAX",
  .val = { .f = 1.0 },
 },

 {
  .name = "LNDFW_XYACC_MAX",
  .val = { .f = 8.0 },
 },

 {
  .name = "LNDMC_ALT_GND",
  .val = { .f = 2. },
 },

 {
  .name = "LNDMC_ROT_MAX",
  .val = { .f = 20.0 },
 },

 {
  .name = "LNDMC_TRIG_TIME",
  .val = { .f = 1.0 },
 },

 {
  .name = "LNDMC_XY_VEL_MAX",
  .val = { .f = 1.5 },
 },

 {
  .name = "LNDMC_Z_VEL_MAX",
  .val = { .f = 0.25 },
 },

 {
  .name = "LND_FLIGHT_T_HI",
  .val = { .i = 0},
 },

 {
  .name = "LND_FLIGHT_T_LO",
  .val = { .i = 0},
 },

 {
  .name = "LPE_ACC_XY",
  .val = { .f = 0.012 },
 },

 {
  .name = "LPE_ACC_Z",
  .val = { .f = 0.02 },
 },

 {
  .name = "LPE_BAR_Z",
  .val = { .f = 3.0 },
 },

 {
  .name = "LPE_EN",
  .val = { .i = 0},
 },

 {
  .name = "LPE_EPH_MAX",
  .val = { .f = 3.0 },
 },

 {
  .name = "LPE_EPV_MAX",
  .val = { .f = 5.0 },
 },

 {
  .name = "LPE_FAKE_ORIGIN",
  .val = { .i = 0},
 },

 {
  .name = "LPE_FGYRO_HP",
  .val = { .f = 0.001 },
 },

 {
  .name = "LPE_FLW_OFF_Z",
  .val = { .f = 0.0 },
 },

 {
  .name = "LPE_FLW_QMIN",
  .val = { .i = 150},
 },

 {
  .name = "LPE_FLW_R",
  .val = { .f = 7.0 },
 },

 {
  .name = "LPE_FLW_RR",
  .val = { .f = 7.0 },
 },

 {
  .name = "LPE_FLW_SCALE",
  .val = { .f = 1.3 },
 },

 {
  .name = "LPE_FUSION",
  .val = { .i = 145},
 },

 {
  .name = "LPE_GPS_DELAY",
  .val = { .f = 0.29 },
 },

 {
  .name = "LPE_GPS_VXY",
  .val = { .f = 0.25 },
 },

 {
  .name = "LPE_GPS_VZ",
  .val = { .f = 0.25 },
 },

 {
  .name = "LPE_GPS_XY",
  .val = { .f = 1.0 },
 },

 {
  .name = "LPE_GPS_Z",
  .val = { .f = 3.0 },
 },

 {
  .name = "LPE_LAND_VXY",
  .val = { .f = 0.05 },
 },

 {
  .name = "LPE_LAND_Z",
  .val = { .f = 0.03 },
 },

 {
  .name = "LPE_LAT",
  .val = { .f = 47.397742 },
 },

 {
  .name = "LPE_LDR_OFF_Z",
  .val = { .f = 0.00 },
 },

 {
  .name = "LPE_LDR_Z",
  .val = { .f = 0.03 },
 },

 {
  .name = "LPE_LON",
  .val = { .f = 8.545594 },
 },

 {
  .name = "LPE_LT_COV",
  .val = { .f = 0.0001 },
 },

 {
  .name = "LPE_PN_B",
  .val = { .f = 1e-3 },
 },

 {
  .name = "LPE_PN_P",
  .val = { .f = 0.1 },
 },

 {
  .name = "LPE_PN_T",
  .val = { .f = 0.001 },
 },

 {
  .name = "LPE_PN_V",
  .val = { .f = 0.1 },
 },

 {
  .name = "LPE_SNR_OFF_Z",
  .val = { .f = 0.00 },
 },

 {
  .name = "LPE_SNR_Z",
  .val = { .f = 0.05 },
 },

 {
  .name = "LPE_T_MAX_GRADE",
  .val = { .f = 1.0 },
 },

 {
  .name = "LPE_VIC_P",
  .val = { .f = 0.001 },
 },

 {
  .name = "LPE_VIS_DELAY",
  .val = { .f = 0.1 },
 },

 {
  .name = "LPE_VIS_XY",
  .val = { .f = 0.1 },
 },

 {
  .name = "LPE_VIS_Z",
  .val = { .f = 0.5 },
 },

 {
  .name = "LPE_VXY_PUB",
  .val = { .f = 0.3 },
 },

 {
  .name = "LPE_X_LP",
  .val = { .f = 5.0 },
 },

 {
  .name = "LPE_Z_PUB",
  .val = { .f = 1.0 },
 },

 {
  .name = "LTEST_ACC_UNC",
  .val = { .f = 10.0 },
 },

 {
  .name = "LTEST_MEAS_UNC",
  .val = { .f = 0.005 },
 },

 {
  .name = "LTEST_MODE",
  .val = { .i = 0},
 },

 {
  .name = "LTEST_POS_UNC_IN",
  .val = { .f = 0.1 },
 },

 {
  .name = "LTEST_SCALE_X",
  .val = { .f = 1.0 },
 },

 {
  .name = "LTEST_SCALE_Y",
  .val = { .f = 1.0 },
 },

 {
  .name = "LTEST_SENS_POS_X",
  .val = { .f = 0.0 },
 },

 {
  .name = "LTEST_SENS_POS_Y",
  .val = { .f = 0.0 },
 },

 {
  .name = "LTEST_SENS_POS_Z",
  .val = { .f = 0.0 },
 },

 {
  .name = "LTEST_SENS_ROT",
  .val = { .i = 2},
 },

 {
  .name = "LTEST_VEL_UNC_IN",
  .val = { .f = 0.1 },
 },

 {
  .name = "MAN_ARM_GESTURE",
  .val = { .i = 1},
 },

 {
  .name = "MAN_DEADZONE",
  .val = { .f = 0.1 },
 },

 {
  .name = "MAN_KILL_GEST_T",
  .val = { .f = -1. },
 },

 {
  .name = "MAV_0_BROADCAST",
  .val = { .i = 1},
 },

 {
  .name = "MAV_0_FLOW_CTRL",
  .val = { .i = 2},
 },

 {
  .name = "MAV_0_FORWARD",
  .val = { .i = 1},
 },

 {
  .name = "MAV_0_HL_FREQ",
  .val = { .f = 0.015 },
 },

 {
  .name = "MAV_0_MODE",
  .val = { .i = 0},
 },

 {
  .name = "MAV_0_RADIO_CTL",
  .val = { .i = 1},
 },

 {
  .name = "MAV_0_RATE",
  .val = { .i = 1200},
 },

 {
  .name = "MAV_0_REMOTE_PRT",
  .val = { .i = 14550},
 },

 {
  .name = "MAV_0_UDP_PRT",
  .val = { .i = 14556},
 },

 {
  .name = "MAV_1_BROADCAST",
  .val = { .i = 0},
 },

 {
  .name = "MAV_1_FLOW_CTRL",
  .val = { .i = 2},
 },

 {
  .name = "MAV_1_FORWARD",
  .val = { .i = 0},
 },

 {
  .name = "MAV_1_HL_FREQ",
  .val = { .f = 0.015 },
 },

 {
  .name = "MAV_1_MODE",
  .val = { .i = 2},
 },

 {
  .name = "MAV_1_RADIO_CTL",
  .val = { .i = 1},
 },

 {
  .name = "MAV_1_RATE",
  .val = { .i = 0},
 },

 {
  .name = "MAV_1_REMOTE_PRT",
  .val = { .i = 0},
 },

 {
  .name = "MAV_1_UDP_PRT",
  .val = { .i = 0},
 },

 {
  .name = "MAV_2_BROADCAST",
  .val = { .i = 0},
 },

 {
  .name = "MAV_2_FLOW_CTRL",
  .val = { .i = 2},
 },

 {
  .name = "MAV_2_FORWARD",
  .val = { .i = 0},
 },

 {
  .name = "MAV_2_HL_FREQ",
  .val = { .f = 0.015 },
 },

 {
  .name = "MAV_2_MODE",
  .val = { .i = 0},
 },

 {
  .name = "MAV_2_RADIO_CTL",
  .val = { .i = 1},
 },

 {
  .name = "MAV_2_RATE",
  .val = { .i = 0},
 },

 {
  .name = "MAV_2_REMOTE_PRT",
  .val = { .i = 0},
 },

 {
  .name = "MAV_2_UDP_PRT",
  .val = { .i = 0},
 },

 {
  .name = "MAV_COMP_ID",
  .val = { .i = 1},
 },

 {
  .name = "MAV_FWDEXTSP",
  .val = { .i = 1},
 },

 {
  .name = "MAV_HASH_CHK_EN",
  .val = { .i = 1},
 },

 {
  .name = "MAV_HB_FORW_EN",
  .val = { .i = 1},
 },

 {
  .name = "MAV_PROTO_VER",
  .val = { .i = 2},
 },

 {
  .name = "MAV_RADIO_TOUT",
  .val = { .i = 5},
 },

 {
  .name = "MAV_SIK_RADIO_ID",
  .val = { .i = 0},
 },

 {
  .name = "MAV_SYS_ID",
  .val = { .i = 1},
 },

 {
  .name = "MAV_S_FORWARD",
  .val = { .i = 0},
 },

 {
  .name = "MAV_S_MODE",
  .val = { .i = 11},
 },

 {
  .name = "MAV_TYPE",
  .val = { .i = 0},
 },

 {
  .name = "MAV_USEHILGPS",
  .val = { .i = 0},
 },

 {
  .name = "MBE_ENABLE",
  .val = { .i = 1},
 },

 {
  .name = "MBE_LEARN_GAIN",
  .val = { .f = 18. },
 },

 {
  .name = "MC_ACRO_EXPO",
  .val = { .f = 0. },
 },

 {
  .name = "MC_ACRO_EXPO_Y",
  .val = { .f = 0. },
 },

 {
  .name = "MC_ACRO_P_MAX",
  .val = { .f = 100. },
 },

 {
  .name = "MC_ACRO_R_MAX",
  .val = { .f = 100. },
 },

 {
  .name = "MC_ACRO_SUPEXPO",
  .val = { .f = 0. },
 },

 {
  .name = "MC_ACRO_SUPEXPOY",
  .val = { .f = 0. },
 },

 {
  .name = "MC_ACRO_Y_MAX",
  .val = { .f = 100. },
 },

 {
  .name = "MC_AIRMODE",
  .val = { .i = 0},
 },

 {
  .name = "MC_AT_APPLY",
  .val = { .i = 1},
 },

 {
  .name = "MC_AT_EN",
  .val = { .i = 0},
 },

 {
  .name = "MC_AT_RISE_TIME",
  .val = { .f = 0.14 },
 },

 {
  .name = "MC_AT_START",
  .val = { .i = 0},
 },

 {
  .name = "MC_AT_SYSID_AMP",
  .val = { .f = 0.7 },
 },

 {
  .name = "MC_BAT_SCALE_EN",
  .val = { .i = 0},
 },

 {
  .name = "MC_MAN_TILT_TAU",
  .val = { .f = 0.0 },
 },

 {
  .name = "MC_ORBIT_RAD_MAX",
  .val = { .f = 1000.0 },
 },

 {
  .name = "MC_ORBIT_YAW_MOD",
  .val = { .i = 0},
 },

 {
  .name = "MC_PITCHRATE_D",
  .val = { .f = 0.003 },
 },

 {
  .name = "MC_PITCHRATE_FF",
  .val = { .f = 0.0 },
 },

 {
  .name = "MC_PITCHRATE_I",
  .val = { .f = 0.2 },
 },

 {
  .name = "MC_PITCHRATE_K",
  .val = { .f = 1.0 },
 },

 {
  .name = "MC_PITCHRATE_MAX",
  .val = { .f = 220.0 },
 },

 {
  .name = "MC_PITCHRATE_P",
  .val = { .f = 0.15 },
 },

 {
  .name = "MC_PITCH_P",
  .val = { .f = 4.0 },
 },

 {
  .name = "MC_PR_INT_LIM",
  .val = { .f = 0.30 },
 },

 {
  .name = "MC_ROLLRATE_D",
  .val = { .f = 0.003 },
 },

 {
  .name = "MC_ROLLRATE_FF",
  .val = { .f = 0.0 },
 },

 {
  .name = "MC_ROLLRATE_I",
  .val = { .f = 0.2 },
 },

 {
  .name = "MC_ROLLRATE_K",
  .val = { .f = 1.0 },
 },

 {
  .name = "MC_ROLLRATE_MAX",
  .val = { .f = 220.0 },
 },

 {
  .name = "MC_ROLLRATE_P",
  .val = { .f = 0.15 },
 },

 {
  .name = "MC_ROLL_P",
  .val = { .f = 4.0 },
 },

 {
  .name = "MC_RR_INT_LIM",
  .val = { .f = 0.30 },
 },

 {
  .name = "MC_SLOW_DEF_HVEL",
  .val = { .f = 3. },
 },

 {
  .name = "MC_SLOW_DEF_VVEL",
  .val = { .f = 1. },
 },

 {
  .name = "MC_SLOW_DEF_YAWR",
  .val = { .f = 45. },
 },

 {
  .name = "MC_SLOW_MAP_HVEL",
  .val = { .i = 0},
 },

 {
  .name = "MC_SLOW_MAP_PTCH",
  .val = { .i = 0},
 },

 {
  .name = "MC_SLOW_MAP_VVEL",
  .val = { .i = 0},
 },

 {
  .name = "MC_SLOW_MAP_YAWR",
  .val = { .i = 0},
 },

 {
  .name = "MC_SLOW_MIN_HVEL",
  .val = { .f = .3 },
 },

 {
  .name = "MC_SLOW_MIN_VVEL",
  .val = { .f = .3 },
 },

 {
  .name = "MC_SLOW_MIN_YAWR",
  .val = { .f = 3. },
 },

 {
  .name = "MC_YAWRATE_D",
  .val = { .f = 0.0 },
 },

 {
  .name = "MC_YAWRATE_FF",
  .val = { .f = 0.0 },
 },

 {
  .name = "MC_YAWRATE_I",
  .val = { .f = 0.1 },
 },

 {
  .name = "MC_YAWRATE_K",
  .val = { .f = 1.0 },
 },

 {
  .name = "MC_YAWRATE_MAX",
  .val = { .f = 200.0 },
 },

 {
  .name = "MC_YAWRATE_P",
  .val = { .f = 0.2 },
 },

 {
  .name = "MC_YAW_P",
  .val = { .f = 2.8 },
 },

 {
  .name = "MC_YAW_TQ_CUTOFF",
  .val = { .f = 2. },
 },

 {
  .name = "MC_YAW_WEIGHT",
  .val = { .f = 0.4 },
 },

 {
  .name = "MC_YR_INT_LIM",
  .val = { .f = 0.30 },
 },

 {
  .name = "MIS_COMMAND_TOUT",
  .val = { .f = 0. },
 },

 {
  .name = "MIS_DIST_1WP",
  .val = { .f = 10000 },
 },

 {
  .name = "MIS_LND_ABRT_ALT",
  .val = { .i = 30},
 },

 {
  .name = "MIS_MNT_YAW_CTL",
  .val = { .i = 0},
 },

 {
  .name = "MIS_TAKEOFF_ALT",
  .val = { .f = 2.5 },
 },

 {
  .name = "MIS_TKO_LAND_REQ",
  .val = { .i = 0},
 },

 {
  .name = "MIS_YAW_ERR",
  .val = { .f = 12.0 },
 },

 {
  .name = "MIS_YAW_TMT",
  .val = { .f = -1.0 },
 },

 {
  .name = "MNT_DO_STAB",
  .val = { .i = 0},
 },

 {
  .name = "MNT_LND_P_MAX",
  .val = { .f = 90.0 },
 },

 {
  .name = "MNT_LND_P_MIN",
  .val = { .f = -90.0 },
 },

 {
  .name = "MNT_MAN_PITCH",
  .val = { .i = 0},
 },

 {
  .name = "MNT_MAN_ROLL",
  .val = { .i = 0},
 },

 {
  .name = "MNT_MAN_YAW",
  .val = { .i = 0},
 },

 {
  .name = "MNT_MAV_COMPID",
  .val = { .i = 154},
 },

 {
  .name = "MNT_MAV_SYSID",
  .val = { .i = 1},
 },

 {
  .name = "MNT_MODE_IN",
  .val = { .i = -1},
 },

 {
  .name = "MNT_MODE_OUT",
  .val = { .i = 0},
 },

 {
  .name = "MNT_OFF_PITCH",
  .val = { .f = 0.0 },
 },

 {
  .name = "MNT_OFF_ROLL",
  .val = { .f = 0.0 },
 },

 {
  .name = "MNT_OFF_YAW",
  .val = { .f = 0.0 },
 },

 {
  .name = "MNT_RANGE_PITCH",
  .val = { .f = 90.0 },
 },

 {
  .name = "MNT_RANGE_ROLL",
  .val = { .f = 90.0 },
 },

 {
  .name = "MNT_RANGE_YAW",
  .val = { .f = 360.0 },
 },

 {
  .name = "MNT_RATE_PITCH",
  .val = { .f = 30.0 },
 },

 {
  .name = "MNT_RATE_YAW",
  .val = { .f = 30.0 },
 },

 {
  .name = "MNT_RC_IN_MODE",
  .val = { .i = 1},
 },

 {
  .name = "MPC_ACC_DECOUPLE",
  .val = { .i = 1},
 },

 {
  .name = "MPC_ACC_DOWN_MAX",
  .val = { .f = 3. },
 },

 {
  .name = "MPC_ACC_HOR",
  .val = { .f = 3. },
 },

 {
  .name = "MPC_ACC_HOR_MAX",
  .val = { .f = 5. },
 },

 {
  .name = "MPC_ACC_UP_MAX",
  .val = { .f = 4. },
 },

 {
  .name = "MPC_ALT_MODE",
  .val = { .i = 2},
 },

 {
  .name = "MPC_HOLD_MAX_XY",
  .val = { .f = 0.8 },
 },

 {
  .name = "MPC_HOLD_MAX_Z",
  .val = { .f = 0.6 },
 },

 {
  .name = "MPC_JERK_AUTO",
  .val = { .f = 4. },
 },

 {
  .name = "MPC_JERK_MAX",
  .val = { .f = 8. },
 },

 {
  .name = "MPC_LAND_ALT1",
  .val = { .f = 10. },
 },

 {
  .name = "MPC_LAND_ALT2",
  .val = { .f = 5. },
 },

 {
  .name = "MPC_LAND_ALT3",
  .val = { .f = 1. },
 },

 {
  .name = "MPC_LAND_CRWL",
  .val = { .f = 0.3 },
 },

 {
  .name = "MPC_LAND_RADIUS",
  .val = { .f = -1.0 },
 },

 {
  .name = "MPC_LAND_RC_HELP",
  .val = { .i = 0},
 },

 {
  .name = "MPC_LAND_SPEED",
  .val = { .f = 0.7 },
 },

 {
  .name = "MPC_MANTHR_MIN",
  .val = { .f = 0.08 },
 },

 {
  .name = "MPC_MAN_TILT_MAX",
  .val = { .f = 35. },
 },

 {
  .name = "MPC_MAN_Y_MAX",
  .val = { .f = 150. },
 },

 {
  .name = "MPC_MAN_Y_TAU",
  .val = { .f = 0.08 },
 },

 {
  .name = "MPC_POS_MODE",
  .val = { .i = 4},
 },

 {
  .name = "MPC_THR_CURVE",
  .val = { .i = 0},
 },

 {
  .name = "MPC_THR_HOVER",
  .val = { .f = 0.5 },
 },

 {
  .name = "MPC_THR_MAX",
  .val = { .f = 1. },
 },

 {
  .name = "MPC_THR_MIN",
  .val = { .f = 0.12 },
 },

 {
  .name = "MPC_THR_XY_MARG",
  .val = { .f = 0.3 },
 },

 {
  .name = "MPC_TILTMAX_AIR",
  .val = { .f = 45. },
 },

 {
  .name = "MPC_TILTMAX_LND",
  .val = { .f = 12. },
 },

 {
  .name = "MPC_TKO_RAMP_T",
  .val = { .f = 3. },
 },

 {
  .name = "MPC_TKO_SPEED",
  .val = { .f = 1.5 },
 },

 {
  .name = "MPC_USE_HTE",
  .val = { .i = 1},
 },

 {
  .name = "MPC_VELD_LP",
  .val = { .f = 5.0 },
 },

 {
  .name = "MPC_VEL_LP",
  .val = { .f = 0.0 },
 },

 {
  .name = "MPC_VEL_MANUAL",
  .val = { .f = 10. },
 },

 {
  .name = "MPC_VEL_MAN_BACK",
  .val = { .f = -1. },
 },

 {
  .name = "MPC_VEL_MAN_SIDE",
  .val = { .f = -1. },
 },

 {
  .name = "MPC_VEL_NF_BW",
  .val = { .f = 5.0 },
 },

 {
  .name = "MPC_VEL_NF_FRQ",
  .val = { .f = 0.0 },
 },

 {
  .name = "MPC_XY_CRUISE",
  .val = { .f = 5. },
 },

 {
  .name = "MPC_XY_ERR_MAX",
  .val = { .f = 2. },
 },

 {
  .name = "MPC_XY_P",
  .val = { .f = 0.95 },
 },

 {
  .name = "MPC_XY_TRAJ_P",
  .val = { .f = 0.5 },
 },

 {
  .name = "MPC_XY_VEL_ALL",
  .val = { .f = -10. },
 },

 {
  .name = "MPC_XY_VEL_D_ACC",
  .val = { .f = 0.2 },
 },

 {
  .name = "MPC_XY_VEL_I_ACC",
  .val = { .f = 0.4 },
 },

 {
  .name = "MPC_XY_VEL_MAX",
  .val = { .f = 12. },
 },

 {
  .name = "MPC_XY_VEL_P_ACC",
  .val = { .f = 1.8 },
 },

 {
  .name = "MPC_YAWRAUTO_ACC",
  .val = { .f = 20. },
 },

 {
  .name = "MPC_YAWRAUTO_MAX",
  .val = { .f = 60. },
 },

 {
  .name = "MPC_YAW_MODE",
  .val = { .i = 0},
 },

 {
  .name = "MPC_Z_P",
  .val = { .f = 1. },
 },

 {
  .name = "MPC_Z_VEL_ALL",
  .val = { .f = -3. },
 },

 {
  .name = "MPC_Z_VEL_D_ACC",
  .val = { .f = 0. },
 },

 {
  .name = "MPC_Z_VEL_I_ACC",
  .val = { .f = 2. },
 },

 {
  .name = "MPC_Z_VEL_MAX_DN",
  .val = { .f = 1.5 },
 },

 {
  .name = "MPC_Z_VEL_MAX_UP",
  .val = { .f = 3. },
 },

 {
  .name = "MPC_Z_VEL_P_ACC",
  .val = { .f = 4. },
 },

 {
  .name = "MPC_Z_V_AUTO_DN",
  .val = { .f = 1.5 },
 },

 {
  .name = "MPC_Z_V_AUTO_UP",
  .val = { .f = 3. },
 },

 {
  .name = "NAV_ACC_RAD",
  .val = { .f = 10.0 },
 },

 {
  .name = "NAV_DLL_ACT",
  .val = { .i = 0},
 },

 {
  .name = "NAV_FORCE_VT",
  .val = { .i = 1},
 },

 {
  .name = "NAV_FW_ALTL_RAD",
  .val = { .f = 5.0 },
 },

 {
  .name = "NAV_FW_ALT_RAD",
  .val = { .f = 10.0 },
 },

 {
  .name = "NAV_LOITER_RAD",
  .val = { .f = 80.0 },
 },

 {
  .name = "NAV_MC_ALT_RAD",
  .val = { .f = 0.8 },
 },

 {
  .name = "NAV_MIN_GND_DIST",
  .val = { .f = -1. },
 },

 {
  .name = "NAV_MIN_LTR_ALT",
  .val = { .f = -1. },
 },

 {
  .name = "NAV_RCL_ACT",
  .val = { .i = 2},
 },

 {
  .name = "NAV_TRAFF_AVOID",
  .val = { .i = 1},
 },

 {
  .name = "NAV_TRAFF_A_HOR",
  .val = { .f = 500 },
 },

 {
  .name = "NAV_TRAFF_A_VER",
  .val = { .f = 500 },
 },

 {
  .name = "NAV_TRAFF_COLL_T",
  .val = { .i = 60},
 },

 {
  .name = "NPFG_DAMPING",
  .val = { .f = 0.7 },
 },

 {
  .name = "NPFG_LB_PERIOD",
  .val = { .i = 1},
 },

 {
  .name = "NPFG_PERIOD",
  .val = { .f = 10.0 },
 },

 {
  .name = "NPFG_PERIOD_SF",
  .val = { .f = 1.5 },
 },

 {
  .name = "NPFG_ROLL_TC",
  .val = { .f = 0.5 },
 },

 {
  .name = "NPFG_SW_DST_MLT",
  .val = { .f = 0.32 },
 },

 {
  .name = "NPFG_UB_PERIOD",
  .val = { .i = 1},
 },

 {
  .name = "OSD_CH_HEIGHT",
  .val = { .i = 0},
 },

 {
  .name = "OSD_DWELL_TIME",
  .val = { .i = 500},
 },

 {
  .name = "OSD_LOG_LEVEL",
  .val = { .i = 3},
 },

 {
  .name = "OSD_RC_STICK",
  .val = { .i = 1},
 },

 {
  .name = "OSD_SCROLL_RATE",
  .val = { .i = 125},
 },

 {
  .name = "OSD_SYMBOLS",
  .val = { .i = 16383},
 },

 {
  .name = "PD_GRIPPER_TO",
  .val = { .f = 1 },
 },

 {
  .name = "PD_GRIPPER_TYPE",
  .val = { .i = 0},
 },

 {
  .name = "PLD_BTOUT",
  .val = { .f = 5.0 },
 },

 {
  .name = "PLD_FAPPR_ALT",
  .val = { .f = 0.1 },
 },

 {
  .name = "PLD_HACC_RAD",
  .val = { .f = 0.2 },
 },

 {
  .name = "PLD_MAX_SRCH",
  .val = { .i = 3},
 },

 {
  .name = "PLD_SRCH_ALT",
  .val = { .f = 10.0 },
 },

 {
  .name = "PLD_SRCH_TOUT",
  .val = { .f = 10.0 },
 },

 {
  .name = "PP_LOOKAHD_GAIN",
  .val = { .f = 1.0 },
 },

 {
  .name = "PP_LOOKAHD_MAX",
  .val = { .f = 10.0 },
 },

 {
  .name = "PP_LOOKAHD_MIN",
  .val = { .f = 1.0 },
 },

 {
  .name = "PWM_MAIN_FUNC1",
  .val = { .i = 0},
 },

 {
  .name = "PWM_MAIN_FUNC10",
  .val = { .i = 0},
 },

 {
  .name = "PWM_MAIN_FUNC11",
  .val = { .i = 0},
 },

 {
  .name = "PWM_MAIN_FUNC12",
  .val = { .i = 0},
 },

 {
  .name = "PWM_MAIN_FUNC13",
  .val = { .i = 0},
 },

 {
  .name = "PWM_MAIN_FUNC14",
  .val = { .i = 0},
 },

 {
  .name = "PWM_MAIN_FUNC15",
  .val = { .i = 0},
 },

 {
  .name = "PWM_MAIN_FUNC16",
  .val = { .i = 0},
 },

 {
  .name = "PWM_MAIN_FUNC2",
  .val = { .i = 0},
 },

 {
  .name = "PWM_MAIN_FUNC3",
  .val = { .i = 0},
 },

 {
  .name = "PWM_MAIN_FUNC4",
  .val = { .i = 0},
 },

 {
  .name = "PWM_MAIN_FUNC5",
  .val = { .i = 0},
 },

 {
  .name = "PWM_MAIN_FUNC6",
  .val = { .i = 0},
 },

 {
  .name = "PWM_MAIN_FUNC7",
  .val = { .i = 0},
 },

 {
  .name = "PWM_MAIN_FUNC8",
  .val = { .i = 0},
 },

 {
  .name = "PWM_MAIN_FUNC9",
  .val = { .i = 0},
 },

 {
  .name = "PWM_MAIN_REV",
  .val = { .i = 0},
 },

 {
  .name = "RA_ACC_RAD_GAIN",
  .val = { .f = 1 },
 },

 {
  .name = "RA_ACC_RAD_MAX",
  .val = { .f = -1 },
 },

 {
  .name = "RA_MAX_STR_ANG",
  .val = { .f = 0 },
 },

 {
  .name = "RA_STR_RATE_LIM",
  .val = { .f = -1 },
 },

 {
  .name = "RA_WHEEL_BASE",
  .val = { .f = 0 },
 },

 {
  .name = "RC10_MAX",
  .val = { .f = 2000 },
 },

 {
  .name = "RC10_MIN",
  .val = { .f = 1000 },
 },

 {
  .name = "RC10_REV",
  .val = { .f = 1.0 },
 },

 {
  .name = "RC10_TRIM",
  .val = { .f = 1500 },
 },

 {
  .name = "RC11_MAX",
  .val = { .f = 2000 },
 },

 {
  .name = "RC11_MIN",
  .val = { .f = 1000 },
 },

 {
  .name = "RC11_REV",
  .val = { .f = 1.0 },
 },

 {
  .name = "RC11_TRIM",
  .val = { .f = 1500 },
 },

 {
  .name = "RC12_MAX",
  .val = { .f = 2000 },
 },

 {
  .name = "RC12_MIN",
  .val = { .f = 1000 },
 },

 {
  .name = "RC12_REV",
  .val = { .f = 1.0 },
 },

 {
  .name = "RC12_TRIM",
  .val = { .f = 1500 },
 },

 {
  .name = "RC13_MAX",
  .val = { .f = 2000 },
 },

 {
  .name = "RC13_MIN",
  .val = { .f = 1000 },
 },

 {
  .name = "RC13_REV",
  .val = { .f = 1.0 },
 },

 {
  .name = "RC13_TRIM",
  .val = { .f = 1500 },
 },

 {
  .name = "RC14_MAX",
  .val = { .f = 2000 },
 },

 {
  .name = "RC14_MIN",
  .val = { .f = 1000 },
 },

 {
  .name = "RC14_REV",
  .val = { .f = 1.0 },
 },

 {
  .name = "RC14_TRIM",
  .val = { .f = 1500 },
 },

 {
  .name = "RC15_MAX",
  .val = { .f = 2000 },
 },

 {
  .name = "RC15_MIN",
  .val = { .f = 1000 },
 },

 {
  .name = "RC15_REV",
  .val = { .f = 1.0 },
 },

 {
  .name = "RC15_TRIM",
  .val = { .f = 1500 },
 },

 {
  .name = "RC16_MAX",
  .val = { .f = 2000 },
 },

 {
  .name = "RC16_MIN",
  .val = { .f = 1000 },
 },

 {
  .name = "RC16_REV",
  .val = { .f = 1.0 },
 },

 {
  .name = "RC16_TRIM",
  .val = { .f = 1500 },
 },

 {
  .name = "RC17_MAX",
  .val = { .f = 2000 },
 },

 {
  .name = "RC17_MIN",
  .val = { .f = 1000 },
 },

 {
  .name = "RC17_REV",
  .val = { .f = 1.0 },
 },

 {
  .name = "RC17_TRIM",
  .val = { .f = 1500 },
 },

 {
  .name = "RC18_MAX",
  .val = { .f = 2000 },
 },

 {
  .name = "RC18_MIN",
  .val = { .f = 1000 },
 },

 {
  .name = "RC18_REV",
  .val = { .f = 1.0 },
 },

 {
  .name = "RC18_TRIM",
  .val = { .f = 1500 },
 },

 {
  .name = "RC1_MAX",
  .val = { .f = 2000.0 },
 },

 {
  .name = "RC1_MIN",
  .val = { .f = 1000.0 },
 },

 {
  .name = "RC1_REV",
  .val = { .f = 1.0 },
 },

 {
  .name = "RC1_TRIM",
  .val = { .f = 1500.0 },
 },

 {
  .name = "RC2_MAX",
  .val = { .f = 2000.0 },
 },

 {
  .name = "RC2_MIN",
  .val = { .f = 1000.0 },
 },

 {
  .name = "RC2_REV",
  .val = { .f = 1.0 },
 },

 {
  .name = "RC2_TRIM",
  .val = { .f = 1500.0 },
 },

 {
  .name = "RC3_MAX",
  .val = { .f = 2000 },
 },

 {
  .name = "RC3_MIN",
  .val = { .f = 1000 },
 },

 {
  .name = "RC3_REV",
  .val = { .f = 1.0 },
 },

 {
  .name = "RC3_TRIM",
  .val = { .f = 1500 },
 },

 {
  .name = "RC4_MAX",
  .val = { .f = 2000 },
 },

 {
  .name = "RC4_MIN",
  .val = { .f = 1000 },
 },

 {
  .name = "RC4_REV",
  .val = { .f = 1.0 },
 },

 {
  .name = "RC4_TRIM",
  .val = { .f = 1500 },
 },

 {
  .name = "RC5_MAX",
  .val = { .f = 2000 },
 },

 {
  .name = "RC5_MIN",
  .val = { .f = 1000 },
 },

 {
  .name = "RC5_REV",
  .val = { .f = 1.0 },
 },

 {
  .name = "RC5_TRIM",
  .val = { .f = 1500 },
 },

 {
  .name = "RC6_MAX",
  .val = { .f = 2000 },
 },

 {
  .name = "RC6_MIN",
  .val = { .f = 1000 },
 },

 {
  .name = "RC6_REV",
  .val = { .f = 1.0 },
 },

 {
  .name = "RC6_TRIM",
  .val = { .f = 1500 },
 },

 {
  .name = "RC7_MAX",
  .val = { .f = 2000 },
 },

 {
  .name = "RC7_MIN",
  .val = { .f = 1000 },
 },

 {
  .name = "RC7_REV",
  .val = { .f = 1.0 },
 },

 {
  .name = "RC7_TRIM",
  .val = { .f = 1500 },
 },

 {
  .name = "RC8_MAX",
  .val = { .f = 2000 },
 },

 {
  .name = "RC8_MIN",
  .val = { .f = 1000 },
 },

 {
  .name = "RC8_REV",
  .val = { .f = 1.0 },
 },

 {
  .name = "RC8_TRIM",
  .val = { .f = 1500 },
 },

 {
  .name = "RC9_MAX",
  .val = { .f = 2000 },
 },

 {
  .name = "RC9_MIN",
  .val = { .f = 1000 },
 },

 {
  .name = "RC9_REV",
  .val = { .f = 1.0 },
 },

 {
  .name = "RC9_TRIM",
  .val = { .f = 1500 },
 },

 {
  .name = "RC_ARMSWITCH_TH",
  .val = { .f = 0.75 },
 },

 {
  .name = "RC_CHAN_CNT",
  .val = { .i = 0},
 },

 {
  .name = "RC_ENG_MOT_TH",
  .val = { .f = 0.75 },
 },

 {
  .name = "RC_FAILS_THR",
  .val = { .i = 0},
 },

 {
  .name = "RC_GEAR_TH",
  .val = { .f = 0.75 },
 },

 {
  .name = "RC_KILLSWITCH_TH",
  .val = { .f = 0.75 },
 },

 {
  .name = "RC_LOITER_TH",
  .val = { .f = 0.75 },
 },

 {
  .name = "RC_MAP_ARM_SW",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_AUX1",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_AUX2",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_AUX3",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_AUX4",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_AUX5",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_AUX6",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_ENG_MOT",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_FAILSAFE",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_FLAPS",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_FLTMODE",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_FLTM_BTN",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_GEAR_SW",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_KILL_SW",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_LOITER_SW",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_MODE_SW",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_OFFB_SW",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_PARAM1",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_PARAM2",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_PARAM3",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_PAY_SW",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_PITCH",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_RETURN_SW",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_ROLL",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_TERM_SW",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_THROTTLE",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_TRANS_SW",
  .val = { .i = 0},
 },

 {
  .name = "RC_MAP_YAW",
  .val = { .i = 0},
 },

 {
  .name = "RC_OFFB_TH",
  .val = { .f = 0.75 },
 },

 {
  .name = "RC_PAYLOAD_MIDTH",
  .val = { .f = 0.25 },
 },

 {
  .name = "RC_PAYLOAD_TH",
  .val = { .f = 0.75 },
 },

 {
  .name = "RC_RETURN_TH",
  .val = { .f = 0.75 },
 },

 {
  .name = "RC_RSSI_PWM_CHAN",
  .val = { .i = 0},
 },

 {
  .name = "RC_RSSI_PWM_MAX",
  .val = { .i = 2000},
 },

 {
  .name = "RC_RSSI_PWM_MIN",
  .val = { .i = 1000},
 },

 {
  .name = "RC_TRANS_TH",
  .val = { .f = 0.75 },
 },

 {
  .name = "RD_TRANS_DRV_TRN",
  .val = { .f = 0.174533 },
 },

 {
  .name = "RD_TRANS_TRN_DRV",
  .val = { .f = 0.0872665 },
 },

 {
  .name = "RD_WHEEL_TRACK",
  .val = { .f = 0 },
 },

 {
  .name = "RD_YAW_STK_GAIN",
  .val = { .f = 1 },
 },

 {
  .name = "RM_COURSE_CTL_TH",
  .val = { .f = 0.17 },
 },

 {
  .name = "RM_WHEEL_TRACK",
  .val = { .f = 0 },
 },

 {
  .name = "RM_YAW_STK_GAIN",
  .val = { .f = 1 },
 },

 {
  .name = "RO_ACCEL_LIM",
  .val = { .f = -1. },
 },

 {
  .name = "RO_DECEL_LIM",
  .val = { .f = -1. },
 },

 {
  .name = "RO_JERK_LIM",
  .val = { .f = -1. },
 },

 {
  .name = "RO_MAX_THR_SPEED",
  .val = { .f = 0. },
 },

 {
  .name = "RO_SPEED_I",
  .val = { .f = 0. },
 },

 {
  .name = "RO_SPEED_LIM",
  .val = { .f = -1. },
 },

 {
  .name = "RO_SPEED_P",
  .val = { .f = 0. },
 },

 {
  .name = "RO_SPEED_RED",
  .val = { .f = -1. },
 },

 {
  .name = "RO_SPEED_TH",
  .val = { .f = 0.1 },
 },

 {
  .name = "RO_YAW_ACCEL_LIM",
  .val = { .f = -1. },
 },

 {
  .name = "RO_YAW_DECEL_LIM",
  .val = { .f = -1. },
 },

 {
  .name = "RO_YAW_EXPO",
  .val = { .f = 0. },
 },

 {
  .name = "RO_YAW_P",
  .val = { .f = 0. },
 },

 {
  .name = "RO_YAW_RATE_CORR",
  .val = { .f = 1. },
 },

 {
  .name = "RO_YAW_RATE_I",
  .val = { .f = 0. },
 },

 {
  .name = "RO_YAW_RATE_LIM",
  .val = { .f = 0. },
 },

 {
  .name = "RO_YAW_RATE_P",
  .val = { .f = 0. },
 },

 {
  .name = "RO_YAW_RATE_TH",
  .val = { .f = 3. },
 },

 {
  .name = "RO_YAW_STICK_DZ",
  .val = { .f = 0.1 },
 },

 {
  .name = "RO_YAW_SUPEXPO",
  .val = { .f = 0. },
 },

 {
  .name = "RTL_APPR_FORCE",
  .val = { .i = 0},
 },

 {
  .name = "RTL_CONE_ANG",
  .val = { .i = 45},
 },

 {
  .name = "RTL_DESCEND_ALT",
  .val = { .f = 30. },
 },

 {
  .name = "RTL_LAND_DELAY",
  .val = { .f = 0.0 },
 },

 {
  .name = "RTL_LOITER_RAD",
  .val = { .f = 80.0 },
 },

 {
  .name = "RTL_MIN_DIST",
  .val = { .f = 10.0 },
 },

 {
  .name = "RTL_PLD_MD",
  .val = { .i = 0},
 },

 {
  .name = "RTL_RETURN_ALT",
  .val = { .f = 60. },
 },

 {
  .name = "RTL_TIME_FACTOR",
  .val = { .f = 1.1 },
 },

 {
  .name = "RTL_TIME_MARGIN",
  .val = { .i = 100},
 },

 {
  .name = "RTL_TYPE",
  .val = { .i = 0},
 },

 {
  .name = "RWTO_MAX_THR",
  .val = { .f = 1.0 },
 },

 {
  .name = "RWTO_NUDGE",
  .val = { .i = 1},
 },

 {
  .name = "RWTO_PSP",
  .val = { .f = 0.0 },
 },

 {
  .name = "RWTO_RAMP_TIME",
  .val = { .f = 2.0 },
 },

 {
  .name = "RWTO_ROT_AIRSPD",
  .val = { .f = -1.0 },
 },

 {
  .name = "RWTO_ROT_TIME",
  .val = { .f = 1.0 },
 },

 {
  .name = "RWTO_TKOFF",
  .val = { .i = 0},
 },

 {
  .name = "SDLOG_BACKEND",
  .val = { .i = 3},
 },

 {
  .name = "SDLOG_BOOT_BAT",
  .val = { .i = 0},
 },

 {
  .name = "SDLOG_DIRS_MAX",
  .val = { .i = 0},
 },

 {
  .name = "SDLOG_MISSION",
  .val = { .i = 0},
 },

 {
  .name = "SDLOG_MODE",
  .val = { .i = 0},
 },

 {
  .name = "SDLOG_PROFILE",
  .val = { .i = 1},
 },

 {
  .name = "SDLOG_UTC_OFFSET",
  .val = { .i = 0},
 },

 {
  .name = "SDLOG_UUID",
  .val = { .i = 1},
 },

 {
  .name = "SENS_BARO_QNH",
  .val = { .f = 1013.25 },
 },

 {
  .name = "SENS_BARO_RATE",
  .val = { .f = 20.0 },
 },

 {
  .name = "SENS_BAR_AUTOCAL",
  .val = { .i = 1},
 },

 {
  .name = "SENS_BOARD_ROT",
  .val = { .i = 0},
 },

 {
  .name = "SENS_BOARD_X_OFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "SENS_BOARD_Y_OFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "SENS_BOARD_Z_OFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "SENS_DPRES_ANSC",
  .val = { .f = 0 },
 },

 {
  .name = "SENS_DPRES_OFF",
  .val = { .f = 0.0 },
 },

 {
  .name = "SENS_DPRES_REV",
  .val = { .i = 0},
 },

 {
  .name = "SENS_EN_AGPSIM",
  .val = { .i = 0},
 },

 {
  .name = "SENS_EN_ARSPDSIM",
  .val = { .i = 0},
 },

 {
  .name = "SENS_EN_BAROSIM",
  .val = { .i = 0},
 },

 {
  .name = "SENS_EN_GPSSIM",
  .val = { .i = 0},
 },

 {
  .name = "SENS_EN_MAGSIM",
  .val = { .i = 0},
 },

 {
  .name = "SENS_EN_THERMAL",
  .val = { .i = -1},
 },

 {
  .name = "SENS_EXT_I2C_PRB",
  .val = { .i = 1},
 },

 {
  .name = "SENS_FLOW_MAXHGT",
  .val = { .f = 100. },
 },

 {
  .name = "SENS_FLOW_MAXR",
  .val = { .f = 8. },
 },

 {
  .name = "SENS_FLOW_MINHGT",
  .val = { .f = 0.08 },
 },

 {
  .name = "SENS_FLOW_RATE",
  .val = { .f = 70.0 },
 },

 {
  .name = "SENS_FLOW_ROT",
  .val = { .i = 0},
 },

 {
  .name = "SENS_FLOW_SCALE",
  .val = { .f = 1. },
 },

 {
  .name = "SENS_GPS_MASK",
  .val = { .i = 7},
 },

 {
  .name = "SENS_GPS_PRIME",
  .val = { .i = 0},
 },

 {
  .name = "SENS_GPS_TAU",
  .val = { .f = 10.0 },
 },

 {
  .name = "SENS_IMU_AUTOCAL",
  .val = { .i = 1},
 },

 {
  .name = "SENS_IMU_CLPNOTI",
  .val = { .i = 1},
 },

 {
  .name = "SENS_IMU_MODE",
  .val = { .i = 1},
 },

 {
  .name = "SENS_INT_BARO_EN",
  .val = { .i = 1},
 },

 {
  .name = "SENS_MAG_AUTOCAL",
  .val = { .i = 1},
 },

 {
  .name = "SENS_MAG_AUTOROT",
  .val = { .i = 1},
 },

 {
  .name = "SENS_MAG_MODE",
  .val = { .i = 1},
 },

 {
  .name = "SENS_MAG_RATE",
  .val = { .f = 15.0 },
 },

 {
  .name = "SENS_MAG_SIDES",
  .val = { .i = 63},
 },

 {
  .name = "SEP_AUTO_CONFIG",
  .val = { .i = 1},
 },

 {
  .name = "SEP_CONST_USAGE",
  .val = { .i = 0},
 },

 {
  .name = "SEP_DUMP_COMM",
  .val = { .i = 0},
 },

 {
  .name = "SEP_HARDW_SETUP",
  .val = { .i = 0},
 },

 {
  .name = "SEP_LOG_FORCE",
  .val = { .i = 0},
 },

 {
  .name = "SEP_LOG_HZ",
  .val = { .i = 0},
 },

 {
  .name = "SEP_LOG_LEVEL",
  .val = { .i = 2},
 },

 {
  .name = "SEP_OUTP_HZ",
  .val = { .i = 1},
 },

 {
  .name = "SEP_PITCH_OFFS",
  .val = { .f = 0 },
 },

 {
  .name = "SEP_SAT_INFO",
  .val = { .i = 0},
 },

 {
  .name = "SEP_STREAM_LOG",
  .val = { .i = 2},
 },

 {
  .name = "SEP_STREAM_MAIN",
  .val = { .i = 1},
 },

 {
  .name = "SEP_YAW_OFFS",
  .val = { .f = 0 },
 },

 {
  .name = "SIH_DISTSNSR_MAX",
  .val = { .f = 100.0 },
 },

 {
  .name = "SIH_DISTSNSR_MIN",
  .val = { .f = 0.0 },
 },

 {
  .name = "SIH_DISTSNSR_OVR",
  .val = { .f = -1.0 },
 },

 {
  .name = "SIH_IXX",
  .val = { .f = 0.025 },
 },

 {
  .name = "SIH_IXY",
  .val = { .f = 0.0 },
 },

 {
  .name = "SIH_IXZ",
  .val = { .f = 0.0 },
 },

 {
  .name = "SIH_IYY",
  .val = { .f = 0.025 },
 },

 {
  .name = "SIH_IYZ",
  .val = { .f = 0.0 },
 },

 {
  .name = "SIH_IZZ",
  .val = { .f = 0.030 },
 },

 {
  .name = "SIH_KDV",
  .val = { .f = 1.0 },
 },

 {
  .name = "SIH_KDW",
  .val = { .f = 0.025 },
 },

 {
  .name = "SIH_LOC_H0",
  .val = { .f = 489.4 },
 },

 {
  .name = "SIH_LOC_LAT0",
  .val = { .f = 47.397742 },
 },

 {
  .name = "SIH_LOC_LON0",
  .val = { .f = 8.545594 },
 },

 {
  .name = "SIH_L_PITCH",
  .val = { .f = 0.2 },
 },

 {
  .name = "SIH_L_ROLL",
  .val = { .f = 0.2 },
 },

 {
  .name = "SIH_MASS",
  .val = { .f = 1.0 },
 },

 {
  .name = "SIH_Q_MAX",
  .val = { .f = 0.1 },
 },

 {
  .name = "SIH_T_MAX",
  .val = { .f = 5.0 },
 },

 {
  .name = "SIH_T_TAU",
  .val = { .f = 0.05 },
 },

 {
  .name = "SIH_VEHICLE_TYPE",
  .val = { .i = 0},
 },

 {
  .name = "SIM_AGP_FAIL",
  .val = { .i = 0},
 },

 {
  .name = "SIM_ARSPD_FAIL",
  .val = { .i = 0},
 },

 {
  .name = "SIM_BARO_OFF_P",
  .val = { .f = 0.0 },
 },

 {
  .name = "SIM_BARO_OFF_T",
  .val = { .f = 0.0 },
 },

 {
  .name = "SIM_BAT_DRAIN",
  .val = { .f = 60 },
 },

 {
  .name = "SIM_BAT_ENABLE",
  .val = { .i = 1},
 },

 {
  .name = "SIM_BAT_MIN_PCT",
  .val = { .f = 50.0 },
 },

 {
  .name = "SIM_GPS_USED",
  .val = { .i = 10},
 },

 {
  .name = "SIM_MAG_OFFSET_X",
  .val = { .f = 0.0 },
 },

 {
  .name = "SIM_MAG_OFFSET_Y",
  .val = { .f = 0.0 },
 },

 {
  .name = "SIM_MAG_OFFSET_Z",
  .val = { .f = 0.0 },
 },

 {
  .name = "SYS_AUTOCONFIG",
  .val = { .i = 0},
 },

 {
  .name = "SYS_AUTOSTART",
  .val = { .i = 0},
 },

 {
  .name = "SYS_BL_UPDATE",
  .val = { .i = 0},
 },

 {
  .name = "SYS_CAL_ACCEL",
  .val = { .i = 0},
 },

 {
  .name = "SYS_CAL_BARO",
  .val = { .i = 0},
 },

 {
  .name = "SYS_CAL_GYRO",
  .val = { .i = 0},
 },

 {
  .name = "SYS_CAL_TDEL",
  .val = { .i = 24},
 },

 {
  .name = "SYS_CAL_TMAX",
  .val = { .i = 10},
 },

 {
  .name = "SYS_CAL_TMIN",
  .val = { .i = 5},
 },

 {
  .name = "SYS_DM_BACKEND",
  .val = { .i = 0},
 },

 {
  .name = "SYS_FAC_CAL_MODE",
  .val = { .i = 0},
 },

 {
  .name = "SYS_FAILURE_EN",
  .val = { .i = 0},
 },

 {
  .name = "SYS_HAS_BARO",
  .val = { .i = 1},
 },

 {
  .name = "SYS_HAS_GPS",
  .val = { .i = 1},
 },

 {
  .name = "SYS_HAS_MAG",
  .val = { .i = 1},
 },

 {
  .name = "SYS_HAS_NUM_ASPD",
  .val = { .i = 0},
 },

 {
  .name = "SYS_HAS_NUM_DIST",
  .val = { .i = 0},
 },

 {
  .name = "SYS_HAS_NUM_OF",
  .val = { .i = 0},
 },

 {
  .name = "SYS_HITL",
  .val = { .i = 0},
 },

 {
  .name = "SYS_PARAM_VER",
  .val = { .i = 1},
 },

 {
  .name = "SYS_RGB_MAXBRT",
  .val = { .f = 1. },
 },

 {
  .name = "SYS_STCK_EN",
  .val = { .i = 1},
 },

 {
  .name = "SYS_VEHICLE_RESP",
  .val = { .f = -0.4 },
 },

 {
  .name = "TC_A0_ID",
  .val = { .i = 0},
 },

 {
  .name = "TC_A0_TMAX",
  .val = { .f = 100.0 },
 },

 {
  .name = "TC_A0_TMIN",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A0_TREF",
  .val = { .f = 25.0 },
 },

 {
  .name = "TC_A0_X0_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A0_X0_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A0_X0_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A0_X1_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A0_X1_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A0_X1_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A0_X2_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A0_X2_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A0_X2_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A0_X3_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A0_X3_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A0_X3_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A1_ID",
  .val = { .i = 0},
 },

 {
  .name = "TC_A1_TMAX",
  .val = { .f = 100.0 },
 },

 {
  .name = "TC_A1_TMIN",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A1_TREF",
  .val = { .f = 25.0 },
 },

 {
  .name = "TC_A1_X0_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A1_X0_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A1_X0_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A1_X1_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A1_X1_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A1_X1_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A1_X2_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A1_X2_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A1_X2_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A1_X3_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A1_X3_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A1_X3_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A2_ID",
  .val = { .i = 0},
 },

 {
  .name = "TC_A2_TMAX",
  .val = { .f = 100.0 },
 },

 {
  .name = "TC_A2_TMIN",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A2_TREF",
  .val = { .f = 25.0 },
 },

 {
  .name = "TC_A2_X0_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A2_X0_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A2_X0_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A2_X1_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A2_X1_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A2_X1_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A2_X2_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A2_X2_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A2_X2_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A2_X3_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A2_X3_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A2_X3_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A3_ID",
  .val = { .i = 0},
 },

 {
  .name = "TC_A3_TMAX",
  .val = { .f = 100.0 },
 },

 {
  .name = "TC_A3_TMIN",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A3_TREF",
  .val = { .f = 25.0 },
 },

 {
  .name = "TC_A3_X0_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A3_X0_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A3_X0_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A3_X1_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A3_X1_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A3_X1_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A3_X2_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A3_X2_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A3_X2_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A3_X3_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A3_X3_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A3_X3_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_A_ENABLE",
  .val = { .i = 0},
 },

 {
  .name = "TC_B0_ID",
  .val = { .i = 0},
 },

 {
  .name = "TC_B0_TMAX",
  .val = { .f = 75.0 },
 },

 {
  .name = "TC_B0_TMIN",
  .val = { .f = 5.0 },
 },

 {
  .name = "TC_B0_TREF",
  .val = { .f = 40.0 },
 },

 {
  .name = "TC_B0_X0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_B0_X1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_B0_X2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_B0_X3",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_B0_X4",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_B0_X5",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_B1_ID",
  .val = { .i = 0},
 },

 {
  .name = "TC_B1_TMAX",
  .val = { .f = 75.0 },
 },

 {
  .name = "TC_B1_TMIN",
  .val = { .f = 5.0 },
 },

 {
  .name = "TC_B1_TREF",
  .val = { .f = 40.0 },
 },

 {
  .name = "TC_B1_X0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_B1_X1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_B1_X2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_B1_X3",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_B1_X4",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_B1_X5",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_B2_ID",
  .val = { .i = 0},
 },

 {
  .name = "TC_B2_TMAX",
  .val = { .f = 75.0 },
 },

 {
  .name = "TC_B2_TMIN",
  .val = { .f = 5.0 },
 },

 {
  .name = "TC_B2_TREF",
  .val = { .f = 40.0 },
 },

 {
  .name = "TC_B2_X0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_B2_X1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_B2_X2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_B2_X3",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_B2_X4",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_B2_X5",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_B3_ID",
  .val = { .i = 0},
 },

 {
  .name = "TC_B3_TMAX",
  .val = { .f = 75.0 },
 },

 {
  .name = "TC_B3_TMIN",
  .val = { .f = 5.0 },
 },

 {
  .name = "TC_B3_TREF",
  .val = { .f = 40.0 },
 },

 {
  .name = "TC_B3_X0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_B3_X1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_B3_X2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_B3_X3",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_B3_X4",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_B3_X5",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_B_ENABLE",
  .val = { .i = 0},
 },

 {
  .name = "TC_G0_ID",
  .val = { .i = 0},
 },

 {
  .name = "TC_G0_TMAX",
  .val = { .f = 100.0 },
 },

 {
  .name = "TC_G0_TMIN",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G0_TREF",
  .val = { .f = 25.0 },
 },

 {
  .name = "TC_G0_X0_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G0_X0_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G0_X0_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G0_X1_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G0_X1_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G0_X1_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G0_X2_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G0_X2_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G0_X2_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G0_X3_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G0_X3_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G0_X3_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G1_ID",
  .val = { .i = 0},
 },

 {
  .name = "TC_G1_TMAX",
  .val = { .f = 100.0 },
 },

 {
  .name = "TC_G1_TMIN",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G1_TREF",
  .val = { .f = 25.0 },
 },

 {
  .name = "TC_G1_X0_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G1_X0_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G1_X0_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G1_X1_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G1_X1_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G1_X1_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G1_X2_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G1_X2_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G1_X2_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G1_X3_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G1_X3_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G1_X3_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G2_ID",
  .val = { .i = 0},
 },

 {
  .name = "TC_G2_TMAX",
  .val = { .f = 100.0 },
 },

 {
  .name = "TC_G2_TMIN",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G2_TREF",
  .val = { .f = 25.0 },
 },

 {
  .name = "TC_G2_X0_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G2_X0_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G2_X0_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G2_X1_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G2_X1_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G2_X1_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G2_X2_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G2_X2_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G2_X2_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G2_X3_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G2_X3_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G2_X3_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G3_ID",
  .val = { .i = 0},
 },

 {
  .name = "TC_G3_TMAX",
  .val = { .f = 100.0 },
 },

 {
  .name = "TC_G3_TMIN",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G3_TREF",
  .val = { .f = 25.0 },
 },

 {
  .name = "TC_G3_X0_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G3_X0_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G3_X0_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G3_X1_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G3_X1_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G3_X1_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G3_X2_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G3_X2_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G3_X2_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G3_X3_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G3_X3_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G3_X3_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_G_ENABLE",
  .val = { .i = 0},
 },

 {
  .name = "TC_M0_ID",
  .val = { .i = 0},
 },

 {
  .name = "TC_M0_TMAX",
  .val = { .f = 100.0 },
 },

 {
  .name = "TC_M0_TMIN",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M0_TREF",
  .val = { .f = 25.0 },
 },

 {
  .name = "TC_M0_X0_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M0_X0_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M0_X0_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M0_X1_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M0_X1_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M0_X1_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M0_X2_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M0_X2_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M0_X2_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M0_X3_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M0_X3_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M0_X3_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M1_ID",
  .val = { .i = 0},
 },

 {
  .name = "TC_M1_TMAX",
  .val = { .f = 100.0 },
 },

 {
  .name = "TC_M1_TMIN",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M1_TREF",
  .val = { .f = 25.0 },
 },

 {
  .name = "TC_M1_X0_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M1_X0_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M1_X0_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M1_X1_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M1_X1_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M1_X1_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M1_X2_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M1_X2_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M1_X2_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M1_X3_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M1_X3_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M1_X3_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M2_ID",
  .val = { .i = 0},
 },

 {
  .name = "TC_M2_TMAX",
  .val = { .f = 100.0 },
 },

 {
  .name = "TC_M2_TMIN",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M2_TREF",
  .val = { .f = 25.0 },
 },

 {
  .name = "TC_M2_X0_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M2_X0_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M2_X0_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M2_X1_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M2_X1_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M2_X1_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M2_X2_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M2_X2_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M2_X2_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M2_X3_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M2_X3_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M2_X3_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M3_ID",
  .val = { .i = 0},
 },

 {
  .name = "TC_M3_TMAX",
  .val = { .f = 100.0 },
 },

 {
  .name = "TC_M3_TMIN",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M3_TREF",
  .val = { .f = 25.0 },
 },

 {
  .name = "TC_M3_X0_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M3_X0_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M3_X0_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M3_X1_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M3_X1_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M3_X1_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M3_X2_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M3_X2_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M3_X2_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M3_X3_0",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M3_X3_1",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M3_X3_2",
  .val = { .f = 0.0 },
 },

 {
  .name = "TC_M_ENABLE",
  .val = { .i = 0},
 },

 {
  .name = "TEST_1",
  .val = { .i = 2},
 },

 {
  .name = "TEST_2",
  .val = { .i = 4},
 },

 {
  .name = "TEST_3",
  .val = { .f = 5.0 },
 },

 {
  .name = "TEST_D",
  .val = { .f = 0.01 },
 },

 {
  .name = "TEST_DEV",
  .val = { .f = 2.0 },
 },

 {
  .name = "TEST_D_LP",
  .val = { .f = 10.0 },
 },

 {
  .name = "TEST_HP",
  .val = { .f = 10.0 },
 },

 {
  .name = "TEST_I",
  .val = { .f = 0.1 },
 },

 {
  .name = "TEST_I_MAX",
  .val = { .f = 1.0 },
 },

 {
  .name = "TEST_LP",
  .val = { .f = 10.0 },
 },

 {
  .name = "TEST_MAX",
  .val = { .f = 1.0 },
 },

 {
  .name = "TEST_MEAN",
  .val = { .f = 1.0 },
 },

 {
  .name = "TEST_MIN",
  .val = { .f = -1.0 },
 },

 {
  .name = "TEST_P",
  .val = { .f = 0.2 },
 },

 {
  .name = "TEST_PARAMS",
  .val = { .i = 12345678},
 },

 {
  .name = "TEST_RC2_X",
  .val = { .i = 16},
 },

 {
  .name = "TEST_RC_X",
  .val = { .i = 8},
 },

 {
  .name = "TEST_TRIM",
  .val = { .f = 0.5 },
 },

 {
  .name = "THR_MDL_FAC",
  .val = { .f = 0.0 },
 },

 {
  .name = "TRIG_ACT_TIME",
  .val = { .f = 40.0 },
 },

 {
  .name = "TRIG_DISTANCE",
  .val = { .f = 25.0 },
 },

 {
  .name = "TRIG_INTERFACE",
  .val = { .i = 4},
 },

 {
  .name = "TRIG_INTERVAL",
  .val = { .f = 40.0 },
 },

 {
  .name = "TRIG_MIN_INTERVA",
  .val = { .f = 1.0 },
 },

 {
  .name = "TRIG_MODE",
  .val = { .i = 0},
 },

 {
  .name = "TRIG_POLARITY",
  .val = { .i = 0},
 },

 {
  .name = "TRIG_PWM_NEUTRAL",
  .val = { .i = 1500},
 },

 {
  .name = "TRIG_PWM_SHOOT",
  .val = { .i = 1900},
 },

 {
  .name = "TRIM_PITCH",
  .val = { .f = 0.0 },
 },

 {
  .name = "TRIM_ROLL",
  .val = { .f = 0.0 },
 },

 {
  .name = "TRIM_YAW",
  .val = { .f = 0.0 },
 },

 {
  .name = "UUV_GAIN_X_D",
  .val = { .f = 0.2 },
 },

 {
  .name = "UUV_GAIN_X_P",
  .val = { .f = 1.0 },
 },

 {
  .name = "UUV_GAIN_Y_D",
  .val = { .f = 0.2 },
 },

 {
  .name = "UUV_GAIN_Y_P",
  .val = { .f = 1.0 },
 },

 {
  .name = "UUV_GAIN_Z_D",
  .val = { .f = 0.2 },
 },

 {
  .name = "UUV_GAIN_Z_P",
  .val = { .f = 1.0 },
 },

 {
  .name = "UUV_MGM_PITCH",
  .val = { .f = 0.05 },
 },

 {
  .name = "UUV_MGM_ROLL",
  .val = { .f = 0.05 },
 },

 {
  .name = "UUV_MGM_THRTL",
  .val = { .f = 0.1 },
 },

 {
  .name = "UUV_MGM_YAW",
  .val = { .f = 0.05 },
 },

 {
  .name = "UUV_PGM_VEL",
  .val = { .f = 0.5 },
 },

 {
  .name = "UUV_PITCH_D",
  .val = { .f = 2.0 },
 },

 {
  .name = "UUV_PITCH_P",
  .val = { .f = 4.0 },
 },

 {
  .name = "UUV_POS_MODE",
  .val = { .i = 1},
 },

 {
  .name = "UUV_POS_STICK_DB",
  .val = { .f = 0.1 },
 },

 {
  .name = "UUV_RGM_PITCH",
  .val = { .f = 100.0 },
 },

 {
  .name = "UUV_RGM_ROLL",
  .val = { .f = 100.0 },
 },

 {
  .name = "UUV_RGM_THRTL",
  .val = { .f = 10.0 },
 },

 {
  .name = "UUV_RGM_YAW",
  .val = { .f = 100.0 },
 },

 {
  .name = "UUV_ROLL_D",
  .val = { .f = 1.5 },
 },

 {
  .name = "UUV_ROLL_P",
  .val = { .f = 4.0 },
 },

 {
  .name = "UUV_SGM_PITCH",
  .val = { .f = 0.5 },
 },

 {
  .name = "UUV_SGM_ROLL",
  .val = { .f = 0.5 },
 },

 {
  .name = "UUV_SGM_THRTL",
  .val = { .f = 0.1 },
 },

 {
  .name = "UUV_SGM_YAW",
  .val = { .f = 0.5 },
 },

 {
  .name = "UUV_SP_MAX_AGE",
  .val = { .f = 2.0 },
 },

 {
  .name = "UUV_STAB_MODE",
  .val = { .i = 1},
 },

 {
  .name = "UUV_THRUST_SAT",
  .val = { .f = 0.1 },
 },

 {
  .name = "UUV_TORQUE_SAT",
  .val = { .f = 0.3 },
 },

 {
  .name = "UUV_YAW_D",
  .val = { .f = 2.0 },
 },

 {
  .name = "UUV_YAW_P",
  .val = { .f = 4.0 },
 },

 {
  .name = "UXRCE_DDS_AG_IP",
  .val = { .i = 2130706433},
 },

 {
  .name = "UXRCE_DDS_DOM_ID",
  .val = { .i = 0},
 },

 {
  .name = "UXRCE_DDS_KEY",
  .val = { .i = 1},
 },

 {
  .name = "UXRCE_DDS_NS_IDX",
  .val = { .i = -1},
 },

 {
  .name = "UXRCE_DDS_PRT",
  .val = { .i = 8888},
 },

 {
  .name = "UXRCE_DDS_PTCFG",
  .val = { .i = 0},
 },

 {
  .name = "UXRCE_DDS_RX_TO",
  .val = { .i = -1},
 },

 {
  .name = "UXRCE_DDS_SYNCC",
  .val = { .i = 0},
 },

 {
  .name = "UXRCE_DDS_SYNCT",
  .val = { .i = 1},
 },

 {
  .name = "UXRCE_DDS_TX_TO",
  .val = { .i = 3},
 },

 {
  .name = "VTO_LOITER_ALT",
  .val = { .f = 80 },
 },

 {
  .name = "VT_ARSP_BLEND",
  .val = { .f = 8.0 },
 },

 {
  .name = "VT_ARSP_TRANS",
  .val = { .f = 10.0 },
 },

 {
  .name = "VT_BT_TILT_DUR",
  .val = { .f = 1. },
 },

 {
  .name = "VT_B_DEC_I",
  .val = { .f = 0.1 },
 },

 {
  .name = "VT_B_DEC_MSS",
  .val = { .f = 2.0 },
 },

 {
  .name = "VT_B_TRANS_DUR",
  .val = { .f = 10.0 },
 },

 {
  .name = "VT_B_TRANS_RAMP",
  .val = { .f = 3.0 },
 },

 {
  .name = "VT_ELEV_MC_LOCK",
  .val = { .i = 1},
 },

 {
  .name = "VT_FWD_THRUST_EN",
  .val = { .i = 0},
 },

 {
  .name = "VT_FWD_THRUST_SC",
  .val = { .f = 0.7 },
 },

 {
  .name = "VT_FW_DIFTHR_EN",
  .val = { .i = 0},
 },

 {
  .name = "VT_FW_DIFTHR_S_P",
  .val = { .f = 1. },
 },

 {
  .name = "VT_FW_DIFTHR_S_R",
  .val = { .f = 1. },
 },

 {
  .name = "VT_FW_DIFTHR_S_Y",
  .val = { .f = 0.1 },
 },

 {
  .name = "VT_FW_MIN_ALT",
  .val = { .f = 0.0 },
 },

 {
  .name = "VT_FW_QC_HMAX",
  .val = { .i = 0},
 },

 {
  .name = "VT_FW_QC_P",
  .val = { .i = 0},
 },

 {
  .name = "VT_FW_QC_R",
  .val = { .i = 0},
 },

 {
  .name = "VT_F_TRANS_DUR",
  .val = { .f = 5.0 },
 },

 {
  .name = "VT_F_TRANS_THR",
  .val = { .f = 1.0 },
 },

 {
  .name = "VT_F_TR_OL_TM",
  .val = { .f = 6.0 },
 },

 {
  .name = "VT_LND_PITCH_MIN",
  .val = { .f = 0.0 },
 },

 {
  .name = "VT_PITCH_MIN",
  .val = { .f = 0.0 },
 },

 {
  .name = "VT_PSHER_SLEW",
  .val = { .f = 0.33 },
 },

 {
  .name = "VT_QC_ALT_LOSS",
  .val = { .f = 0.0 },
 },

 {
  .name = "VT_QC_T_ALT_LOSS",
  .val = { .f = 20.0 },
 },

 {
  .name = "VT_SPOILER_MC_LD",
  .val = { .f = 0. },
 },

 {
  .name = "VT_TILT_FW",
  .val = { .f = 1.0 },
 },

 {
  .name = "VT_TILT_MC",
  .val = { .f = 0.0 },
 },

 {
  .name = "VT_TILT_TRANS",
  .val = { .f = 0.4 },
 },

 {
  .name = "VT_TRANS_MIN_TM",
  .val = { .f = 2.0 },
 },

 {
  .name = "VT_TRANS_P2_DUR",
  .val = { .f = 0.5 },
 },

 {
  .name = "VT_TRANS_TIMEOUT",
  .val = { .f = 15.0 },
 },

 {
  .name = "VT_TYPE",
  .val = { .i = 0},
 },

 {
  .name = "WEIGHT_BASE",
  .val = { .f = -1.0 },
 },

 {
  .name = "WEIGHT_GROSS",
  .val = { .f = -1.0 },
 },

 {
  .name = "WV_EN",
  .val = { .i = 0},
 },

 {
  .name = "WV_GAIN",
  .val = { .f = 1.0 },
 },

 {
  .name = "WV_ROLL_MIN",
  .val = { .f = 1.0 },
 },

 {
  .name = "WV_YRATE_MAX",
  .val = { .f = 90.0 },
 },

};

static constexpr param_type_t parameters_type[] = {

 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 2,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 1,
 2,
 1,
 2,
 2,
 2,
 1,
 2,
 1,
 1,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 1,
 2,
 2,
 2,
 1,
 2,
 1,
 2,
 2,
 2,
 1,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 1,
 2,
 1,
 1,
 2,
 1,
 1,
 2,
 1,
 1,
 2,
 1,
 1,
 1,
 1,
 2,
 2,
 2,
 1,
 1,
 1,
 2,
 2,
 2,
 1,
 1,
 1,
 2,
 2,
 2,
 1,
 1,
 1,
 2,
 2,
 2,
 1,
 2,
 1,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 1,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 1,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 1,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 1,
 2,
 2,
 1,
 1,
 2,
 2,
 1,
 1,
 2,
 2,
 1,
 1,
 2,
 2,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 2,
 2,
 1,
 1,
 2,
 2,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 2,
 2,
 1,
 2,
 1,
 1,
 2,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 2,
 2,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 2,
 1,
 2,
 1,
 2,
 1,
 2,
 1,
 1,
 1,
 2,
 1,
 1,
 1,
 2,
 1,
 2,
 2,
 1,
 1,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 1,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 1,
 2,
 2,
 2,
 1,
 1,
 2,
 2,
 2,
 1,
 1,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 2,
 2,
 2,
 1,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 1,
 1,
 2,
 1,
 1,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 1,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 1,
 2,
 2,
 1,
 1,
 1,
 1,
 1,
 2,
 1,
 2,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 1,
 1,
 1,
 2,
 2,
 2,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 1,
 2,
 1,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 1,
 1,
 2,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 2,
 2,
 2,
 1,
 2,
 2,
 1,
 2,
 2,
 1,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 1,
 2,
 2,
 1,
 1,
 1,
 2,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 2,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 2,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 1,
 2,
 1,
 2,
 1,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 2,
 1,
 2,
 2,
 1,
 2,
 2,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 2,
 2,
 1,
 2,
 1,
 2,
 2,
 2,
 2,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 2,
 1,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 1,
 2,
 2,
 2,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 2,
 2,
 2,
 2,
 1,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 1,
 1,
 2,
 1,
 2,
 2,
 2,
 2,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 2,
 2,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 2,
 2,
 2,
 2,
 1,
 2,
 1,
 1,
 2,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 2,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 2,
 1,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 1,
 2,
 2,
 2,
 1,
 2,
 1,
 2,
 2,
 2,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 2,
 1,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 1,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 1,
 1,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 2,
 2,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 1,
 2,
 1,
 2,
 2,
 2,
 2,
 1,
 1,
 1,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 2,
 1,
 2,
 2,
 1,
 2,
 2,
 2,};

static constexpr params parameters_volatile[] = {

 params::ASPD_SCALE_1,
 params::ASPD_SCALE_2,
 params::ASPD_SCALE_3,
 params::CAL_ACC0_XOFF,
 params::CAL_ACC0_XSCALE,
 params::CAL_ACC0_YOFF,
 params::CAL_ACC0_YSCALE,
 params::CAL_ACC0_ZOFF,
 params::CAL_ACC0_ZSCALE,
 params::CAL_ACC1_XOFF,
 params::CAL_ACC1_XSCALE,
 params::CAL_ACC1_YOFF,
 params::CAL_ACC1_YSCALE,
 params::CAL_ACC1_ZOFF,
 params::CAL_ACC1_ZSCALE,
 params::CAL_ACC2_XOFF,
 params::CAL_ACC2_XSCALE,
 params::CAL_ACC2_YOFF,
 params::CAL_ACC2_YSCALE,
 params::CAL_ACC2_ZOFF,
 params::CAL_ACC2_ZSCALE,
 params::CAL_ACC3_XOFF,
 params::CAL_ACC3_XSCALE,
 params::CAL_ACC3_YOFF,
 params::CAL_ACC3_YSCALE,
 params::CAL_ACC3_ZOFF,
 params::CAL_ACC3_ZSCALE,
 params::CAL_BARO0_OFF,
 params::CAL_BARO1_OFF,
 params::CAL_BARO2_OFF,
 params::CAL_BARO3_OFF,
 params::CAL_GYRO0_XOFF,
 params::CAL_GYRO0_YOFF,
 params::CAL_GYRO0_ZOFF,
 params::CAL_GYRO1_XOFF,
 params::CAL_GYRO1_YOFF,
 params::CAL_GYRO1_ZOFF,
 params::CAL_GYRO2_XOFF,
 params::CAL_GYRO2_YOFF,
 params::CAL_GYRO2_ZOFF,
 params::CAL_GYRO3_XOFF,
 params::CAL_GYRO3_YOFF,
 params::CAL_GYRO3_ZOFF,
 params::CAL_MAG0_XCOMP,
 params::CAL_MAG0_XODIAG,
 params::CAL_MAG0_XOFF,
 params::CAL_MAG0_XSCALE,
 params::CAL_MAG0_YCOMP,
 params::CAL_MAG0_YODIAG,
 params::CAL_MAG0_YOFF,
 params::CAL_MAG0_YSCALE,
 params::CAL_MAG0_ZCOMP,
 params::CAL_MAG0_ZODIAG,
 params::CAL_MAG0_ZOFF,
 params::CAL_MAG0_ZSCALE,
 params::CAL_MAG1_XCOMP,
 params::CAL_MAG1_XODIAG,
 params::CAL_MAG1_XOFF,
 params::CAL_MAG1_XSCALE,
 params::CAL_MAG1_YCOMP,
 params::CAL_MAG1_YODIAG,
 params::CAL_MAG1_YOFF,
 params::CAL_MAG1_YSCALE,
 params::CAL_MAG1_ZCOMP,
 params::CAL_MAG1_ZODIAG,
 params::CAL_MAG1_ZOFF,
 params::CAL_MAG1_ZSCALE,
 params::CAL_MAG2_XCOMP,
 params::CAL_MAG2_XODIAG,
 params::CAL_MAG2_XOFF,
 params::CAL_MAG2_XSCALE,
 params::CAL_MAG2_YCOMP,
 params::CAL_MAG2_YODIAG,
 params::CAL_MAG2_YOFF,
 params::CAL_MAG2_YSCALE,
 params::CAL_MAG2_ZCOMP,
 params::CAL_MAG2_ZODIAG,
 params::CAL_MAG2_ZOFF,
 params::CAL_MAG2_ZSCALE,
 params::CAL_MAG3_XCOMP,
 params::CAL_MAG3_XODIAG,
 params::CAL_MAG3_XOFF,
 params::CAL_MAG3_XSCALE,
 params::CAL_MAG3_YCOMP,
 params::CAL_MAG3_YODIAG,
 params::CAL_MAG3_YOFF,
 params::CAL_MAG3_YSCALE,
 params::CAL_MAG3_ZCOMP,
 params::CAL_MAG3_ZODIAG,
 params::CAL_MAG3_ZOFF,
 params::CAL_MAG3_ZSCALE,
 params::COM_FLIGHT_UUID,
 params::COM_MODE0_HASH,
 params::COM_MODE1_HASH,
 params::COM_MODE2_HASH,
 params::COM_MODE3_HASH,
 params::COM_MODE4_HASH,
 params::COM_MODE5_HASH,
 params::COM_MODE6_HASH,
 params::COM_MODE7_HASH,
 params::EKF2_MAG_DECL,
 params::LND_FLIGHT_T_HI,
 params::LND_FLIGHT_T_LO,
 params::SENS_DPRES_OFF,
};


}
# 47 "./platforms/common/include/px4_platform_common/param.h" 2




inline static param_t param_handle(px4::params p)
{
 return (param_t)p;
}
# 102 "./platforms/common/include/px4_platform_common/param.h"
namespace do_not_explicitly_use_this_namespace
{

template<typename T, px4::params p>
class Param
{
};



template<px4::params p>
class Param<float, p>
{
public:

 static_assert(px4::parameters_type[(int)p] == 2, "parameter type must be float");

 Param()
 {
  param_set_used(handle());
  update();
 }

 float get() const { return _val; }

 const float &reference() const { return _val; }


 bool commit() const { return param_set(handle(), &_val) == 0; }


 bool commit_no_notification() const { return param_set_no_notification(handle(), &_val) == 0; }


 bool commit_no_notification(float val)
 {
  if (fabsf(val - _val) > 1.19209289550781250000000000000000000e-7F) {
   set(val);
   commit_no_notification();
   return true;
  }

  return false;
 }

 void set(float val) { _val = val; }

 void reset()
 {
  param_reset_no_notification(handle());
  update();
 }

 bool update() { return param_get_cplusplus(handle(), &_val) == 0; }

 param_t handle() const { return param_handle(p); }
private:
 float _val;
};


template<px4::params p>
class Param<float &, p>
{
public:

 static_assert(px4::parameters_type[(int)p] == 2, "parameter type must be float");

 Param(float &external_val)
  : _val(external_val)
 {
  param_set_used(handle());
  update();
 }

 float get() const { return _val; }

 const float &reference() const { return _val; }


 bool commit() const { return param_set(handle(), &_val) == 0; }


 bool commit_no_notification() const { return param_set_no_notification(handle(), &_val) == 0; }


 bool commit_no_notification(float val)
 {
  if (fabsf(val - _val) > 1.19209289550781250000000000000000000e-7F) {
   set(val);
   commit_no_notification();
   return true;
  }

  return false;
 }

 void set(float val) { _val = val; }

 void reset()
 {
  param_reset_no_notification(handle());
  update();
 }

 bool update() { return param_get_cplusplus(handle(), &_val) == 0; }

 param_t handle() const { return param_handle(p); }
private:
 float &_val;
};

template<px4::params p>
class Param<int32_t, p>
{
public:

 static_assert(px4::parameters_type[(int)p] == 1, "parameter type must be int32_t");

 Param()
 {
  param_set_used(handle());
  update();
 }

 int32_t get() const { return _val; }

 const int32_t &reference() const { return _val; }


 bool commit() const { return param_set(handle(), &_val) == 0; }


 bool commit_no_notification() const { return param_set_no_notification(handle(), &_val) == 0; }


 bool commit_no_notification(int32_t val)
 {
  if (val != _val) {
   set(val);
   commit_no_notification();
   return true;
  }

  return false;
 }

 void set(int32_t val) { _val = val; }

 void reset()
 {
  param_reset_no_notification(handle());
  update();
 }

 bool update() { return param_get_cplusplus(handle(), &_val) == 0; }

 param_t handle() const { return param_handle(p); }
private:
 int32_t _val;
};


template<px4::params p>
class Param<int32_t &, p>
{
public:

 static_assert(px4::parameters_type[(int)p] == 1, "parameter type must be int32_t");

 Param(int32_t &external_val)
  : _val(external_val)
 {
  param_set_used(handle());
  update();
 }

 int32_t get() const { return _val; }

 const int32_t &reference() const { return _val; }


 bool commit() const { return param_set(handle(), &_val) == 0; }


 bool commit_no_notification() const { return param_set_no_notification(handle(), &_val) == 0; }


 bool commit_no_notification(int32_t val)
 {
  if (val != _val) {
   set(val);
   commit_no_notification();
   return true;
  }

  return false;
 }

 void set(int32_t val) { _val = val; }

 void reset()
 {
  param_reset_no_notification(handle());
  update();
 }

 bool update() { return param_get_cplusplus(handle(), &_val) == 0; }

 param_t handle() const { return param_handle(p); }
private:
 int32_t &_val;
};

template<px4::params p>
class Param<bool, p>
{
public:

 static_assert(px4::parameters_type[(int)p] == 1, "parameter type must be int32_t");

 Param()
 {
  param_set_used(handle());
  update();
 }

 bool get() const { return _val; }

 const bool &reference() const { return _val; }


 bool commit() const
 {
  int32_t value_int = (int32_t)_val;
  return param_set(handle(), &value_int) == 0;
 }


 bool commit_no_notification() const
 {
  int32_t value_int = (int32_t)_val;
  return param_set_no_notification(handle(), &value_int) == 0;
 }


 bool commit_no_notification(bool val)
 {
  if (val != _val) {
   set(val);
   commit_no_notification();
   return true;
  }

  return false;
 }

 void set(bool val) { _val = val; }

 void reset()
 {
  param_reset_no_notification(handle());
  update();
 }

 bool update()
 {
  int32_t value_int;
  int ret = param_get_cplusplus(handle(), &value_int);

  if (ret == 0) {
   _val = value_int != 0;
   return true;
  }

  return false;
 }

 param_t handle() const { return param_handle(p); }
private:
 bool _val;
};

template <px4::params p>
using ParamFloat = Param<float, p>;

template <px4::params p>
using ParamInt = Param<int32_t, p>;

template <px4::params p>
using ParamExtFloat = Param<float &, p>;

template <px4::params p>
using ParamExtInt = Param<int32_t &, p>;

template <px4::params p>
using ParamBool = Param<bool, p>;

}



template<px4::params p>
class ParamInt
{
 static_assert((int)p &&false, "Do not use this class directly, use the DEFINE_PARAMETERS macro instead");
};
template<px4::params p>
class ParamFloat
{
 static_assert((int)p &&false, "Do not use this class directly, use the DEFINE_PARAMETERS macro instead");
};
# 45 "./platforms/common/include/px4_platform_common/module_params.h" 2

class ModuleParams : public ListNode<ModuleParams *>
{
public:

 ModuleParams(ModuleParams *parent)
 {
  setParent(parent);
 }





 void setParent(ModuleParams *parent)
 {
  if (parent) {
   parent->_children.add(this);
  }

  _parent = parent;
 }

 virtual ~ModuleParams()
 {
  if (_parent) { _parent->_children.remove(this); }
 }


 ModuleParams(const ModuleParams &) = delete;
 ModuleParams &operator=(const ModuleParams &) = delete;
 ModuleParams(ModuleParams &&) = delete;
 ModuleParams &operator=(ModuleParams &&) = delete;

protected:




 virtual void updateParams()
 {
  for (const auto &child : _children) {
   child->updateParams();
  }

  updateParamsImpl();
 }




 virtual void updateParamsImpl() {}

private:

 List<ModuleParams *> _children;
 ModuleParams *_parent{nullptr};
};
# 51 "./src/lib/battery/battery.h" 2
# 1 "./src/lib/matrix/matrix/math.hpp" 1
       

# 1 "./src/lib/matrix/matrix/AxisAngle.hpp" 1






       

# 1 "./src/lib/matrix/matrix/Vector3.hpp" 1
# 9 "./src/lib/matrix/matrix/Vector3.hpp"
       

# 1 "./src/lib/matrix/matrix/Vector.hpp" 1
# 9 "./src/lib/matrix/matrix/Vector.hpp"
       

# 1 "./src/lib/matrix/matrix/Matrix.hpp" 1
# 9 "./src/lib/matrix/matrix/Matrix.hpp"
       

# 1 "/usr/include/c++/9/cmath" 1 3
# 39 "/usr/include/c++/9/cmath" 3
       
# 40 "/usr/include/c++/9/cmath" 3
# 12 "./src/lib/matrix/matrix/Matrix.hpp" 2
# 1 "/usr/include/c++/9/cstdio" 1 3
# 39 "/usr/include/c++/9/cstdio" 3
       
# 40 "/usr/include/c++/9/cstdio" 3


# 1 "/usr/include/stdio.h" 1 3 4
# 27 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h" 1 3 4
# 28 "/usr/include/stdio.h" 2 3 4


# 29 "/usr/include/stdio.h" 3 4
extern "C" {



# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h" 1 3 4
# 34 "/usr/include/stdio.h" 2 3 4


# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stdarg.h" 1 3 4
# 40 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 37 "/usr/include/stdio.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h" 1 3 4




# 1 "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h" 1 3 4
# 13 "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h" 3 4
typedef struct
{
  int __count;
  union
  {
    unsigned int __wch;
    char __wchb[4];
  } __value;
} __mbstate_t;
# 6 "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h" 2 3 4




typedef struct _G_fpos_t
{
  __off_t __pos;
  __mbstate_t __state;
} __fpos_t;
# 40 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/__fpos64_t.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/bits/types/__fpos64_t.h" 3 4
typedef struct _G_fpos64_t
{
  __off64_t __pos;
  __mbstate_t __state;
} __fpos64_t;
# 41 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h" 1 3 4



struct _IO_FILE;
typedef struct _IO_FILE __FILE;
# 42 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h" 1 3 4



struct _IO_FILE;


typedef struct _IO_FILE FILE;
# 43 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h" 1 3 4
# 35 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h" 3 4
struct _IO_FILE;
struct _IO_marker;
struct _IO_codecvt;
struct _IO_wide_data;




typedef void _IO_lock_t;





struct _IO_FILE
{
  int _flags;


  char *_IO_read_ptr;
  char *_IO_read_end;
  char *_IO_read_base;
  char *_IO_write_base;
  char *_IO_write_ptr;
  char *_IO_write_end;
  char *_IO_buf_base;
  char *_IO_buf_end;


  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;
  int _flags2;
  __off_t _old_offset;


  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];

  _IO_lock_t *_lock;







  __off64_t _offset;

  struct _IO_codecvt *_codecvt;
  struct _IO_wide_data *_wide_data;
  struct _IO_FILE *_freeres_list;
  void *_freeres_buf;
  size_t __pad5;
  int _mode;

  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];
};
# 44 "/usr/include/stdio.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/types/cookie_io_functions_t.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/types/cookie_io_functions_t.h" 3 4
typedef __ssize_t cookie_read_function_t (void *__cookie, char *__buf,
                                          size_t __nbytes);







typedef __ssize_t cookie_write_function_t (void *__cookie, const char *__buf,
                                           size_t __nbytes);







typedef int cookie_seek_function_t (void *__cookie, __off64_t *__pos, int __w);


typedef int cookie_close_function_t (void *__cookie);






typedef struct _IO_cookie_io_functions_t
{
  cookie_read_function_t *read;
  cookie_write_function_t *write;
  cookie_seek_function_t *seek;
  cookie_close_function_t *close;
} cookie_io_functions_t;
# 47 "/usr/include/stdio.h" 2 3 4





typedef __gnuc_va_list va_list;
# 84 "/usr/include/stdio.h" 3 4
typedef __fpos_t fpos_t;




typedef __fpos64_t fpos64_t;
# 133 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h" 1 3 4
# 134 "/usr/include/stdio.h" 2 3 4



extern FILE *stdin;
extern FILE *stdout;
extern FILE *stderr;






extern int remove (const char *__filename) throw ();

extern int rename (const char *__old, const char *__new) throw ();



extern int renameat (int __oldfd, const char *__old, int __newfd,
       const char *__new) throw ();
# 164 "/usr/include/stdio.h" 3 4
extern int renameat2 (int __oldfd, const char *__old, int __newfd,
        const char *__new, unsigned int __flags) throw ();







extern FILE *tmpfile (void) ;
# 183 "/usr/include/stdio.h" 3 4
extern FILE *tmpfile64 (void) ;



extern char *tmpnam (char *__s) throw () ;




extern char *tmpnam_r (char *__s) throw () ;
# 204 "/usr/include/stdio.h" 3 4
extern char *tempnam (const char *__dir, const char *__pfx)
     throw () __attribute__ ((__malloc__)) ;







extern int fclose (FILE *__stream);




extern int fflush (FILE *__stream);
# 227 "/usr/include/stdio.h" 3 4
extern int fflush_unlocked (FILE *__stream);
# 237 "/usr/include/stdio.h" 3 4
extern int fcloseall (void);
# 246 "/usr/include/stdio.h" 3 4
extern FILE *fopen (const char *__restrict __filename,
      const char *__restrict __modes) ;




extern FILE *freopen (const char *__restrict __filename,
        const char *__restrict __modes,
        FILE *__restrict __stream) ;
# 270 "/usr/include/stdio.h" 3 4
extern FILE *fopen64 (const char *__restrict __filename,
        const char *__restrict __modes) ;
extern FILE *freopen64 (const char *__restrict __filename,
   const char *__restrict __modes,
   FILE *__restrict __stream) ;




extern FILE *fdopen (int __fd, const char *__modes) throw () ;





extern FILE *fopencookie (void *__restrict __magic_cookie,
     const char *__restrict __modes,
     cookie_io_functions_t __io_funcs) throw () ;




extern FILE *fmemopen (void *__s, size_t __len, const char *__modes)
  throw () ;




extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) throw () ;





extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) throw ();



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) throw ();




extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) throw ();


extern void setlinebuf (FILE *__stream) throw ();







extern int fprintf (FILE *__restrict __stream,
      const char *__restrict __format, ...);




extern int printf (const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      const char *__restrict __format, ...) throw ();





extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg);




extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) throw ();



extern int snprintf (char *__restrict __s, size_t __maxlen,
       const char *__restrict __format, ...)
     throw () __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        const char *__restrict __format, __gnuc_va_list __arg)
     throw () __attribute__ ((__format__ (__printf__, 3, 0)));





extern int vasprintf (char **__restrict __ptr, const char *__restrict __f,
        __gnuc_va_list __arg)
     throw () __attribute__ ((__format__ (__printf__, 2, 0))) ;
extern int __asprintf (char **__restrict __ptr,
         const char *__restrict __fmt, ...)
     throw () __attribute__ ((__format__ (__printf__, 2, 3))) ;
extern int asprintf (char **__restrict __ptr,
       const char *__restrict __fmt, ...)
     throw () __attribute__ ((__format__ (__printf__, 2, 3))) ;




extern int vdprintf (int __fd, const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));







extern int fscanf (FILE *__restrict __stream,
     const char *__restrict __format, ...) ;




extern int scanf (const char *__restrict __format, ...) ;

extern int sscanf (const char *__restrict __s,
     const char *__restrict __format, ...) throw ();






extern int fscanf (FILE *__restrict __stream, const char *__restrict __format, ...) __asm__ ("" "__isoc99_fscanf")

                               ;
extern int scanf (const char *__restrict __format, ...) __asm__ ("" "__isoc99_scanf")
                              ;
extern int sscanf (const char *__restrict __s, const char *__restrict __format, ...) throw () __asm__ ("" "__isoc99_sscanf")

                      ;
# 432 "/usr/include/stdio.h" 3 4
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;





extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;


extern int vsscanf (const char *__restrict __s,
      const char *__restrict __format, __gnuc_va_list __arg)
     throw () __attribute__ ((__format__ (__scanf__, 2, 0)));




extern int vfscanf (FILE *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vfscanf")



     __attribute__ ((__format__ (__scanf__, 2, 0))) ;
extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vscanf")

     __attribute__ ((__format__ (__scanf__, 1, 0))) ;
extern int vsscanf (const char *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) throw () __asm__ ("" "__isoc99_vsscanf")



     __attribute__ ((__format__ (__scanf__, 2, 0)));
# 485 "/usr/include/stdio.h" 3 4
extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);





extern int getchar (void);






extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
# 510 "/usr/include/stdio.h" 3 4
extern int fgetc_unlocked (FILE *__stream);
# 521 "/usr/include/stdio.h" 3 4
extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);





extern int putchar (int __c);
# 537 "/usr/include/stdio.h" 3 4
extern int fputc_unlocked (int __c, FILE *__stream);







extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);






extern int getw (FILE *__stream);


extern int putw (int __w, FILE *__stream);







extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     ;
# 587 "/usr/include/stdio.h" 3 4
extern char *fgets_unlocked (char *__restrict __s, int __n,
        FILE *__restrict __stream) ;
# 603 "/usr/include/stdio.h" 3 4
extern __ssize_t __getdelim (char **__restrict __lineptr,
                             size_t *__restrict __n, int __delimiter,
                             FILE *__restrict __stream) ;
extern __ssize_t getdelim (char **__restrict __lineptr,
                           size_t *__restrict __n, int __delimiter,
                           FILE *__restrict __stream) ;







extern __ssize_t getline (char **__restrict __lineptr,
                          size_t *__restrict __n,
                          FILE *__restrict __stream) ;







extern int fputs (const char *__restrict __s, FILE *__restrict __stream);





extern int puts (const char *__s);






extern int ungetc (int __c, FILE *__stream);






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;




extern size_t fwrite (const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s);
# 662 "/usr/include/stdio.h" 3 4
extern int fputs_unlocked (const char *__restrict __s,
      FILE *__restrict __stream);
# 673 "/usr/include/stdio.h" 3 4
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite_unlocked (const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream);







extern int fseek (FILE *__stream, long int __off, int __whence);




extern long int ftell (FILE *__stream) ;




extern void rewind (FILE *__stream);
# 707 "/usr/include/stdio.h" 3 4
extern int fseeko (FILE *__stream, __off_t __off, int __whence);




extern __off_t ftello (FILE *__stream) ;
# 731 "/usr/include/stdio.h" 3 4
extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);




extern int fsetpos (FILE *__stream, const fpos_t *__pos);
# 750 "/usr/include/stdio.h" 3 4
extern int fseeko64 (FILE *__stream, __off64_t __off, int __whence);
extern __off64_t ftello64 (FILE *__stream) ;
extern int fgetpos64 (FILE *__restrict __stream, fpos64_t *__restrict __pos);
extern int fsetpos64 (FILE *__stream, const fpos64_t *__pos);



extern void clearerr (FILE *__stream) throw ();

extern int feof (FILE *__stream) throw () ;

extern int ferror (FILE *__stream) throw () ;



extern void clearerr_unlocked (FILE *__stream) throw ();
extern int feof_unlocked (FILE *__stream) throw () ;
extern int ferror_unlocked (FILE *__stream) throw () ;







extern void perror (const char *__s);





# 1 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h" 3 4
extern int sys_nerr;
extern const char *const sys_errlist[];


extern int _sys_nerr;
extern const char *const _sys_errlist[];
# 782 "/usr/include/stdio.h" 2 3 4




extern int fileno (FILE *__stream) throw () ;




extern int fileno_unlocked (FILE *__stream) throw () ;
# 800 "/usr/include/stdio.h" 3 4
extern FILE *popen (const char *__command, const char *__modes) ;





extern int pclose (FILE *__stream);





extern char *ctermid (char *__s) throw ();





extern char *cuserid (char *__s);




struct obstack;


extern int obstack_printf (struct obstack *__restrict __obstack,
      const char *__restrict __format, ...)
     throw () __attribute__ ((__format__ (__printf__, 2, 3)));
extern int obstack_vprintf (struct obstack *__restrict __obstack,
       const char *__restrict __format,
       __gnuc_va_list __args)
     throw () __attribute__ ((__format__ (__printf__, 2, 0)));







extern void flockfile (FILE *__stream) throw ();



extern int ftrylockfile (FILE *__stream) throw () ;


extern void funlockfile (FILE *__stream) throw ();
# 858 "/usr/include/stdio.h" 3 4
extern int __uflow (FILE *);
extern int __overflow (FILE *, int);
# 873 "/usr/include/stdio.h" 3 4
}
# 43 "/usr/include/c++/9/cstdio" 2 3
# 96 "/usr/include/c++/9/cstdio" 3
namespace std
{
  using ::FILE;
  using ::fpos_t;

  using ::clearerr;
  using ::fclose;
  using ::feof;
  using ::ferror;
  using ::fflush;
  using ::fgetc;
  using ::fgetpos;
  using ::fgets;
  using ::fopen;
  using ::fprintf;
  using ::fputc;
  using ::fputs;
  using ::fread;
  using ::freopen;
  using ::fscanf;
  using ::fseek;
  using ::fsetpos;
  using ::ftell;
  using ::fwrite;
  using ::getc;
  using ::getchar;




  using ::perror;
  using ::printf;
  using ::putc;
  using ::putchar;
  using ::puts;
  using ::remove;
  using ::rename;
  using ::rewind;
  using ::scanf;
  using ::setbuf;
  using ::setvbuf;
  using ::sprintf;
  using ::sscanf;
  using ::tmpfile;

  using ::tmpnam;

  using ::ungetc;
  using ::vfprintf;
  using ::vprintf;
  using ::vsprintf;
}
# 157 "/usr/include/c++/9/cstdio" 3
namespace __gnu_cxx
{
# 175 "/usr/include/c++/9/cstdio" 3
  using ::snprintf;
  using ::vfscanf;
  using ::vscanf;
  using ::vsnprintf;
  using ::vsscanf;

}

namespace std
{
  using ::__gnu_cxx::snprintf;
  using ::__gnu_cxx::vfscanf;
  using ::__gnu_cxx::vscanf;
  using ::__gnu_cxx::vsnprintf;
  using ::__gnu_cxx::vsscanf;
}
# 13 "./src/lib/matrix/matrix/Matrix.hpp" 2
# 1 "/usr/include/c++/9/cstring" 1 3
# 39 "/usr/include/c++/9/cstring" 3
       
# 40 "/usr/include/c++/9/cstring" 3
# 71 "/usr/include/c++/9/cstring" 3
extern "C++"
{
namespace std __attribute__ ((__visibility__ ("default")))
{


  using ::memchr;
  using ::memcmp;
  using ::memcpy;
  using ::memmove;
  using ::memset;
  using ::strcat;
  using ::strcmp;
  using ::strcoll;
  using ::strcpy;
  using ::strcspn;
  using ::strerror;
  using ::strlen;
  using ::strncat;
  using ::strncmp;
  using ::strncpy;
  using ::strspn;
  using ::strtok;
  using ::strxfrm;
  using ::strchr;
  using ::strpbrk;
  using ::strrchr;
  using ::strstr;
# 122 "/usr/include/c++/9/cstring" 3

}
}
# 14 "./src/lib/matrix/matrix/Matrix.hpp" 2

# 1 "./src/lib/matrix/matrix/helper_functions.hpp" 1
       

# 1 "/usr/include/c++/9/cmath" 1 3
# 39 "/usr/include/c++/9/cmath" 3
       
# 40 "/usr/include/c++/9/cmath" 3
# 4 "./src/lib/matrix/matrix/helper_functions.hpp" 2

# 1 "./platforms/common/include/px4_platform_common/defines.h" 1
# 40 "./platforms/common/include/px4_platform_common/defines.h"
       

# 1 "/usr/include/x86_64-linux-gnu/sys/ioctl.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/sys/ioctl.h" 3 4
extern "C" {


# 1 "/usr/include/x86_64-linux-gnu/bits/ioctls.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/ioctls.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/asm/ioctls.h" 1 3 4
# 1 "/usr/include/asm-generic/ioctls.h" 1 3 4




# 1 "/usr/include/linux/ioctl.h" 1 3 4




# 1 "/usr/include/x86_64-linux-gnu/asm/ioctl.h" 1 3 4
# 1 "/usr/include/asm-generic/ioctl.h" 1 3 4
# 1 "/usr/include/x86_64-linux-gnu/asm/ioctl.h" 2 3 4
# 6 "/usr/include/linux/ioctl.h" 2 3 4
# 6 "/usr/include/asm-generic/ioctls.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/asm/ioctls.h" 2 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/ioctls.h" 2 3 4
# 27 "/usr/include/x86_64-linux-gnu/sys/ioctl.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/ioctl-types.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/ioctl-types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/asm/ioctls.h" 1 3 4
# 25 "/usr/include/x86_64-linux-gnu/bits/ioctl-types.h" 2 3 4


struct winsize
  {
    unsigned short int ws_row;
    unsigned short int ws_col;
    unsigned short int ws_xpixel;
    unsigned short int ws_ypixel;
  };


struct termio
  {
    unsigned short int c_iflag;
    unsigned short int c_oflag;
    unsigned short int c_cflag;
    unsigned short int c_lflag;
    unsigned char c_line;
    unsigned char c_cc[8];
};
# 30 "/usr/include/x86_64-linux-gnu/sys/ioctl.h" 2 3 4






# 1 "/usr/include/x86_64-linux-gnu/sys/ttydefaults.h" 1 3 4
# 37 "/usr/include/x86_64-linux-gnu/sys/ioctl.h" 2 3 4




extern int ioctl (int __fd, unsigned long int __request, ...) throw ();

}
# 43 "./platforms/common/include/px4_platform_common/defines.h" 2
# 1 "./build/px4_sitl_default/px4_boardconfig.h" 1
# 44 "./platforms/common/include/px4_platform_common/defines.h" 2
# 55 "./platforms/common/include/px4_platform_common/defines.h"

# 55 "./platforms/common/include/px4_platform_common/defines.h"
static inline constexpr bool PX4_ISFINITE(float x) { return __builtin_isfinite(x); }
static inline constexpr bool PX4_ISFINITE(double x) { return __builtin_isfinite(x); }
# 96 "./platforms/common/include/px4_platform_common/defines.h"

# 96 "./platforms/common/include/px4_platform_common/defines.h" 3 4
extern "C" {

# 97 "./platforms/common/include/px4_platform_common/defines.h"
extern long PX4_TICKS_PER_SEC;

# 98 "./platforms/common/include/px4_platform_common/defines.h" 3 4
}
# 6 "./src/lib/matrix/matrix/helper_functions.hpp" 2


# 7 "./src/lib/matrix/matrix/helper_functions.hpp"
namespace matrix
{
# 21 "./src/lib/matrix/matrix/helper_functions.hpp"
template<typename Type>
bool isEqualF(const Type x, const Type y, const Type eps = Type(1e-4f))
{
 return (std::fabs(x - y) <= eps)
        || (std::isnan(x) && std::isnan(y))
        || (std::isinf(x) && std::isinf(y) && std::isnan(x - y));
}

namespace detail
{

template<typename Floating>
Floating wrap_floating(Floating x, Floating low, Floating high)
{

 if (low <= x && x < high) {
  return x;
 }

 const auto range = high - low;
 const auto inv_range = Floating(1) / range;
 const auto num_wraps = std::floor((x - low) * inv_range);
 return x - range * num_wraps;
}

}
# 56 "./src/lib/matrix/matrix/helper_functions.hpp"
inline float wrap(float x, float low, float high)
{
 return matrix::detail::wrap_floating(x, low, high);
}
# 69 "./src/lib/matrix/matrix/helper_functions.hpp"
inline double wrap(double x, double low, double high)
{
 return matrix::detail::wrap_floating(x, low, high);
}
# 82 "./src/lib/matrix/matrix/helper_functions.hpp"
template<typename Integer>
Integer wrap(Integer x, Integer low, Integer high)
{
 const auto range = high - low;

 if (x < low) {
  x += range * ((low - x) / range + 1);
 }

 return low + (x - low) % range;
}




template<typename Type>
Type wrap_pi(Type x)
{
 return wrap(x, Type(-
# 100 "./src/lib/matrix/matrix/helper_functions.hpp" 3 4
                     3.14159265358979323846
# 100 "./src/lib/matrix/matrix/helper_functions.hpp"
                         ), Type(
# 100 "./src/lib/matrix/matrix/helper_functions.hpp" 3 4
                                 3.14159265358979323846
# 100 "./src/lib/matrix/matrix/helper_functions.hpp"
                                     ));
}




template<typename Type>
Type wrap_2pi(Type x)
{
 return wrap(x, Type(0), Type((2 * 
# 109 "./src/lib/matrix/matrix/helper_functions.hpp" 3 4
                                  3.14159265358979323846
# 109 "./src/lib/matrix/matrix/helper_functions.hpp"
                                      )));
}
# 121 "./src/lib/matrix/matrix/helper_functions.hpp"
template<typename Type>
Type unwrap(const Type last_x, const Type new_x, const Type low, const Type high)
{
 return last_x + wrap(new_x - last_x, low, high);
}
# 134 "./src/lib/matrix/matrix/helper_functions.hpp"
template<typename Type>
Type unwrap_pi(const Type last_angle, const Type new_angle)
{
 return unwrap(last_angle, new_angle, Type(-
# 137 "./src/lib/matrix/matrix/helper_functions.hpp" 3 4
                                           3.14159265358979323846
# 137 "./src/lib/matrix/matrix/helper_functions.hpp"
                                               ), Type(
# 137 "./src/lib/matrix/matrix/helper_functions.hpp" 3 4
                                                       3.14159265358979323846
# 137 "./src/lib/matrix/matrix/helper_functions.hpp"
                                                           ));
}







template<typename T>
int sign(T val)
{
 return (T(0) < val) - (val < T(0));
}

}
# 16 "./src/lib/matrix/matrix/Matrix.hpp" 2
# 1 "./src/lib/matrix/matrix/Slice.hpp" 1
# 9 "./src/lib/matrix/matrix/Slice.hpp"
       

# 1 "/usr/include/c++/9/cassert" 1 3
# 41 "/usr/include/c++/9/cassert" 3
       
# 42 "/usr/include/c++/9/cassert" 3


# 1 "/usr/include/assert.h" 1 3 4
# 66 "/usr/include/assert.h" 3 4

# 66 "/usr/include/assert.h" 3 4
extern "C" {


extern void __assert_fail (const char *__assertion, const char *__file,
      unsigned int __line, const char *__function)
     throw () __attribute__ ((__noreturn__));


extern void __assert_perror_fail (int __errnum, const char *__file,
      unsigned int __line, const char *__function)
     throw () __attribute__ ((__noreturn__));




extern void __assert (const char *__assertion, const char *__file, int __line)
     throw () __attribute__ ((__noreturn__));


}
# 44 "/usr/include/c++/9/cassert" 2 3
# 12 "./src/lib/matrix/matrix/Slice.hpp" 2
# 1 "/usr/include/c++/9/cstdio" 1 3
# 39 "/usr/include/c++/9/cstdio" 3
       
# 40 "/usr/include/c++/9/cstdio" 3
# 13 "./src/lib/matrix/matrix/Slice.hpp" 2
# 1 "/usr/include/c++/9/cmath" 1 3
# 39 "/usr/include/c++/9/cmath" 3
       
# 40 "/usr/include/c++/9/cmath" 3
# 14 "./src/lib/matrix/matrix/Slice.hpp" 2


# 15 "./src/lib/matrix/matrix/Slice.hpp"
namespace matrix
{

template<typename Type, size_t M, size_t N>
class Matrix;

template<typename Type, size_t M>
class Vector;

template <typename MatrixT, typename Type, size_t P, size_t Q, size_t M, size_t N>
class SliceT
{
public:
 using Self = SliceT<MatrixT, Type, P, Q, M, N>;

 SliceT(size_t x0, size_t y0, MatrixT *data) :
  _x0(x0),
  _y0(y0),
  _data(data)
 {
  static_assert(P <= M, "Slice rows bigger than backing matrix");
  static_assert(Q <= N, "Slice cols bigger than backing matrix");
  
# 37 "./src/lib/matrix/matrix/Slice.hpp" 3 4
 (static_cast <bool> (
# 37 "./src/lib/matrix/matrix/Slice.hpp"
 x0 + P <= M
# 37 "./src/lib/matrix/matrix/Slice.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 37 "./src/lib/matrix/matrix/Slice.hpp"
 "x0 + P <= M"
# 37 "./src/lib/matrix/matrix/Slice.hpp" 3 4
 , "./src/lib/matrix/matrix/Slice.hpp", 37, __extension__ __PRETTY_FUNCTION__))
# 37 "./src/lib/matrix/matrix/Slice.hpp"
                    ;
  
# 38 "./src/lib/matrix/matrix/Slice.hpp" 3 4
 (static_cast <bool> (
# 38 "./src/lib/matrix/matrix/Slice.hpp"
 y0 + Q <= N
# 38 "./src/lib/matrix/matrix/Slice.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 38 "./src/lib/matrix/matrix/Slice.hpp"
 "y0 + Q <= N"
# 38 "./src/lib/matrix/matrix/Slice.hpp" 3 4
 , "./src/lib/matrix/matrix/Slice.hpp", 38, __extension__ __PRETTY_FUNCTION__))
# 38 "./src/lib/matrix/matrix/Slice.hpp"
                    ;
 }

 SliceT(const Self &other) = default;

 const Type &operator()(size_t i, size_t j) const
 {
  
# 45 "./src/lib/matrix/matrix/Slice.hpp" 3 4
 (static_cast <bool> (
# 45 "./src/lib/matrix/matrix/Slice.hpp"
 i < P
# 45 "./src/lib/matrix/matrix/Slice.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 45 "./src/lib/matrix/matrix/Slice.hpp"
 "i < P"
# 45 "./src/lib/matrix/matrix/Slice.hpp" 3 4
 , "./src/lib/matrix/matrix/Slice.hpp", 45, __extension__ __PRETTY_FUNCTION__))
# 45 "./src/lib/matrix/matrix/Slice.hpp"
              ;
  
# 46 "./src/lib/matrix/matrix/Slice.hpp" 3 4
 (static_cast <bool> (
# 46 "./src/lib/matrix/matrix/Slice.hpp"
 j < Q
# 46 "./src/lib/matrix/matrix/Slice.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 46 "./src/lib/matrix/matrix/Slice.hpp"
 "j < Q"
# 46 "./src/lib/matrix/matrix/Slice.hpp" 3 4
 , "./src/lib/matrix/matrix/Slice.hpp", 46, __extension__ __PRETTY_FUNCTION__))
# 46 "./src/lib/matrix/matrix/Slice.hpp"
              ;

  return (*_data)(_x0 + i, _y0 + j);
 }

 Type &operator()(size_t i, size_t j)
 {
  
# 53 "./src/lib/matrix/matrix/Slice.hpp" 3 4
 (static_cast <bool> (
# 53 "./src/lib/matrix/matrix/Slice.hpp"
 i < P
# 53 "./src/lib/matrix/matrix/Slice.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 53 "./src/lib/matrix/matrix/Slice.hpp"
 "i < P"
# 53 "./src/lib/matrix/matrix/Slice.hpp" 3 4
 , "./src/lib/matrix/matrix/Slice.hpp", 53, __extension__ __PRETTY_FUNCTION__))
# 53 "./src/lib/matrix/matrix/Slice.hpp"
              ;
  
# 54 "./src/lib/matrix/matrix/Slice.hpp" 3 4
 (static_cast <bool> (
# 54 "./src/lib/matrix/matrix/Slice.hpp"
 j < Q
# 54 "./src/lib/matrix/matrix/Slice.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 54 "./src/lib/matrix/matrix/Slice.hpp"
 "j < Q"
# 54 "./src/lib/matrix/matrix/Slice.hpp" 3 4
 , "./src/lib/matrix/matrix/Slice.hpp", 54, __extension__ __PRETTY_FUNCTION__))
# 54 "./src/lib/matrix/matrix/Slice.hpp"
              ;

  return (*_data)(_x0 + i, _y0 + j);
 }


 Self &operator=(const Self &other)
 {
  return this->operator=<M, N>(other);
 }

 template<size_t MM, size_t NN>
 Self &operator=(const SliceT<Matrix<Type, MM, NN>, Type, P, Q, MM, NN> &other)
 {
  Self &self = *this;

  for (size_t i = 0; i < P; i++) {
   for (size_t j = 0; j < Q; j++) {
    self(i, j) = other(i, j);
   }
  }

  return self;
 }

 template<size_t MM, size_t NN>
 SliceT<MatrixT, Type, P, Q, M, N> &operator=(const SliceT<const Matrix<Type, MM, NN>, Type, P, Q, MM, NN> &other)
 {
  SliceT<MatrixT, Type, P, Q, M, N> &self = *this;

  for (size_t i = 0; i < P; i++) {
   for (size_t j = 0; j < Q; j++) {
    self(i, j) = other(i, j);
   }
  }

  return self;
 }

 SliceT<MatrixT, Type, P, Q, M, N> &operator=(const Matrix<Type, P, Q> &other)
 {
  SliceT<MatrixT, Type, P, Q, M, N> &self = *this;

  for (size_t i = 0; i < P; i++) {
   for (size_t j = 0; j < Q; j++) {
    self(i, j) = other(i, j);
   }
  }

  return self;
 }

 SliceT<MatrixT, Type, P, Q, M, N> &operator=(const Type &other)
 {
  SliceT<MatrixT, Type, P, Q, M, N> &self = *this;

  for (size_t i = 0; i < P; i++) {
   for (size_t j = 0; j < Q; j++) {
    self(i, j) = other;
   }
  }

  return self;
 }

 template<size_t MM, size_t NN>
 Matrix<Type, P, Q> operator-(const SliceT<const Matrix<Type, MM, NN>, Type, P, Q, MM, NN> &other)
 {
  return Matrix<Type, P, Q> {*this} - other;
 }


 Matrix<Type, P, Q> operator-(const Matrix<Type, P, Q> &other)
 {
  return Matrix<Type, P, Q> {*this} - other;
 }

 Matrix<Type, P, Q> operator-(const Type &other)
 {
  return Matrix<Type, P, Q> {*this} - other;
 }

 template<size_t MM, size_t NN>
 Matrix<Type, P, Q> operator+(const SliceT<const Matrix<Type, MM, NN>, Type, P, Q, MM, NN> &other)
 {
  return Matrix<Type, P, Q> {*this} + other;
 }

 Matrix<Type, P, Q> operator+(const Matrix<Type, P, Q> &other)
 {
  return Matrix<Type, P, Q> {*this} + other;
 }

 Matrix<Type, P, Q> operator+(const Type &other)
 {
  return Matrix<Type, P, Q> {*this} + other;
 }


 template <size_t DUMMY = 1>
 SliceT<MatrixT, Type, 1, Q, M, N> &operator=(const Vector<Type, Q> &other)
 {
  SliceT<MatrixT, Type, 1, Q, M, N> &self = *this;

  for (size_t j = 0; j < Q; j++) {
   self(0, j) = other(j);
  }

  return self;
 }

 template<size_t MM, size_t NN>
 SliceT<MatrixT, Type, P, Q, M, N> &operator+=(const SliceT<MatrixT, Type, P, Q, MM, NN> &other)
 {
  SliceT<MatrixT, Type, P, Q, M, N> &self = *this;

  for (size_t i = 0; i < P; i++) {
   for (size_t j = 0; j < Q; j++) {
    self(i, j) += other(i, j);
   }
  }

  return self;
 }

 SliceT<MatrixT, Type, P, Q, M, N> &operator+=(const Matrix<Type, P, Q> &other)
 {
  SliceT<MatrixT, Type, P, Q, M, N> &self = *this;

  for (size_t i = 0; i < P; i++) {
   for (size_t j = 0; j < Q; j++) {
    self(i, j) += other(i, j);
   }
  }

  return self;
 }

 SliceT<MatrixT, Type, P, Q, M, N> &operator+=(const Type &other)
 {
  SliceT<MatrixT, Type, P, Q, M, N> &self = *this;

  for (size_t i = 0; i < P; i++) {
   for (size_t j = 0; j < Q; j++) {
    self(i, j) += other;
   }
  }

  return self;
 }

 template<size_t MM, size_t NN>
 SliceT<MatrixT, Type, P, Q, M, N> &operator-=(const SliceT<MatrixT, Type, P, Q, MM, NN> &other)
 {
  SliceT<MatrixT, Type, P, Q, M, N> &self = *this;

  for (size_t i = 0; i < P; i++) {
   for (size_t j = 0; j < Q; j++) {
    self(i, j) -= other(i, j);
   }
  }

  return self;
 }

 SliceT<MatrixT, Type, P, Q, M, N> &operator-=(const Matrix<Type, P, Q> &other)
 {
  SliceT<MatrixT, Type, P, Q, M, N> &self = *this;

  for (size_t i = 0; i < P; i++) {
   for (size_t j = 0; j < Q; j++) {
    self(i, j) -= other(i, j);
   }
  }

  return self;
 }

 SliceT<MatrixT, Type, P, Q, M, N> &operator-=(const Type &other)
 {
  SliceT<MatrixT, Type, P, Q, M, N> &self = *this;

  for (size_t i = 0; i < P; i++) {
   for (size_t j = 0; j < Q; j++) {
    self(i, j) -= other;
   }
  }

  return self;
 }

 SliceT<MatrixT, Type, P, Q, M, N> &operator*=(const Type &other)
 {
  SliceT<MatrixT, Type, P, Q, M, N> &self = *this;

  for (size_t i = 0; i < P; i++) {
   for (size_t j = 0; j < Q; j++) {
    self(i, j) *= other;
   }
  }

  return self;
 }

 SliceT<MatrixT, Type, P, Q, M, N> &operator/=(const Type &scalar)
 {
  return operator*=(Type(1) / scalar);
 }

 Matrix<Type, P, Q> operator*(const Type &scalar) const
 {
  return Matrix<Type, P, Q> {*this} * scalar;
 }

 Matrix<Type, P, Q> operator/(const Type &scalar) const
 {
  return (*this) * (1 / scalar);
 }

 template<size_t R, size_t S>
 const SliceT<MatrixT, Type, R, S, M, N> slice(size_t x0, size_t y0) const
 {
  return SliceT<MatrixT, Type, R, S, M, N>(x0 + _x0, y0 + _y0, _data);
 }

 template<size_t R, size_t S>
 SliceT<MatrixT, Type, R, S, M, N> slice(size_t x0, size_t y0)
 {
  return SliceT<MatrixT, Type, R, S, M, N>(x0 + _x0, y0 + _y0, _data);
 }

 void copyTo(Type dst[P * Q]) const
 {
  const SliceT<MatrixT, Type, P, Q, M, N> &self = *this;

  for (size_t i = 0; i < P; i++) {
   for (size_t j = 0; j < Q; j++) {
    dst[i * N + j] = self(i, j);
   }
  }
 }

 void copyToColumnMajor(Type dst[P * Q]) const
 {
  const SliceT<MatrixT, Type, P, Q, M, N> &self = *this;

  for (size_t i = 0; i < P; i++) {
   for (size_t j = 0; j < Q; j++) {
    dst[i + (j * M)] = self(i, j);
   }
  }
 }

 Vector < Type, P < Q ? P : Q > diag() const
 {
  const SliceT<MatrixT, Type, P, Q, M, N> &self = *this;
  Vector < Type, P < Q ? P : Q > res;

  for (size_t j = 0; j < (P < Q ? P : Q); j++) {
   res(j) = self(j, j);
  }

  return res;
 }

 Type norm_squared() const
 {
  const SliceT<MatrixT, Type, P, Q, M, N> &self = *this;
  Type accum(0);

  for (size_t i = 0; i < P; i++) {
   for (size_t j = 0; j < Q; j++) {
    accum += self(i, j) * self(i, j);
   }
  }

  return accum;
 }

 Type norm() const
 {
  return std::sqrt(norm_squared());
 }

 bool longerThan(Type testVal) const
 {
  return norm_squared() > testVal * testVal;
 }

 Type max() const
 {
  Type max_val = (*this)(0, 0);

  for (size_t i = 0; i < P; i++) {
   for (size_t j = 0; j < Q; j++) {
    Type val = (*this)(i, j);

    if (val > max_val) {
     max_val = val;
    }
   }
  }

  return max_val;
 }

 Type min() const
 {
  Type min_val = (*this)(0, 0);

  for (size_t i = 0; i < P; i++) {
   for (size_t j = 0; j < Q; j++) {
    Type val = (*this)(i, j);

    if (val < min_val) {
     min_val = val;
    }
   }
  }

  return min_val;
 }

private:
 size_t _x0, _y0;
 MatrixT *_data;
};

template <typename Type, size_t P, size_t Q, size_t M, size_t N>
using Slice = SliceT<Matrix<Type, M, N>, Type, P, Q, M, N>;

template <typename Type, size_t P, size_t Q, size_t M, size_t N>
using ConstSlice = SliceT<const Matrix<Type, M, N>, Type, P, Q, M, N>;

}
# 17 "./src/lib/matrix/matrix/Matrix.hpp" 2

namespace matrix
{

template<typename Type, size_t M, size_t N>
class Matrix
{
 Type _data[M][N] {};

public:


 Matrix() = default;

 explicit Matrix(const Type data_[M * N])
 {
  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    _data[i][j] = data_[N * i + j];
   }
  }
 }

 explicit Matrix(const Type data_[M][N])
 {
  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    _data[i][j] = data_[i][j];
   }
  }
 }

 Matrix(const Matrix &other)
 {
  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    _data[i][j] = other(i, j);
   }
  }
 }

 template<typename S>
 Matrix(const Matrix<S, M, N> &aa)
 {
  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    _data[i][j] = static_cast<Type>(aa(i, j));
   }
  }
 }

 template<size_t P, size_t Q>
 Matrix(const Slice<Type, M, N, P, Q> &in_slice)
 {
  Matrix<Type, M, N> &self = *this;

  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    self(i, j) = in_slice(i, j);
   }
  }
 }

 template<size_t P, size_t Q>
 Matrix(const ConstSlice<Type, M, N, P, Q> &in_slice)
 {
  Matrix<Type, M, N> &self = *this;

  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    self(i, j) = in_slice(i, j);
   }
  }
 }






 inline const Type &operator()(size_t i, size_t j) const
 {
  
# 99 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
 (static_cast <bool> (
# 99 "./src/lib/matrix/matrix/Matrix.hpp"
 i < M
# 99 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 99 "./src/lib/matrix/matrix/Matrix.hpp"
 "i < M"
# 99 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
 , "./src/lib/matrix/matrix/Matrix.hpp", 99, __extension__ __PRETTY_FUNCTION__))
# 99 "./src/lib/matrix/matrix/Matrix.hpp"
              ;
  
# 100 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
 (static_cast <bool> (
# 100 "./src/lib/matrix/matrix/Matrix.hpp"
 j < N
# 100 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 100 "./src/lib/matrix/matrix/Matrix.hpp"
 "j < N"
# 100 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
 , "./src/lib/matrix/matrix/Matrix.hpp", 100, __extension__ __PRETTY_FUNCTION__))
# 100 "./src/lib/matrix/matrix/Matrix.hpp"
              ;

  return _data[i][j];
 }

 inline Type &operator()(size_t i, size_t j)
 {
  
# 107 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
 (static_cast <bool> (
# 107 "./src/lib/matrix/matrix/Matrix.hpp"
 i < M
# 107 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 107 "./src/lib/matrix/matrix/Matrix.hpp"
 "i < M"
# 107 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
 , "./src/lib/matrix/matrix/Matrix.hpp", 107, __extension__ __PRETTY_FUNCTION__))
# 107 "./src/lib/matrix/matrix/Matrix.hpp"
              ;
  
# 108 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
 (static_cast <bool> (
# 108 "./src/lib/matrix/matrix/Matrix.hpp"
 j < N
# 108 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 108 "./src/lib/matrix/matrix/Matrix.hpp"
 "j < N"
# 108 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
 , "./src/lib/matrix/matrix/Matrix.hpp", 108, __extension__ __PRETTY_FUNCTION__))
# 108 "./src/lib/matrix/matrix/Matrix.hpp"
              ;

  return _data[i][j];
 }

 Matrix<Type, M, N> &operator=(const Matrix<Type, M, N> &other)
 {
  if (this != &other) {
   Matrix<Type, M, N> &self = *this;

   for (size_t i = 0; i < M; i++) {
    for (size_t j = 0; j < N; j++) {
     self(i, j) = other(i, j);
    }
   }
  }

  return (*this);
 }

 void copyTo(Type dst[M * N]) const
 {
  const Matrix<Type, M, N> &self = *this;

  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    dst[N * i + j] = self(i, j);
   }
  }
 }

 void copyToColumnMajor(Type dst[M * N]) const
 {
  const Matrix<Type, M, N> &self = *this;

  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    dst[i + (j * M)] = self(i, j);
   }
  }
 }
# 158 "./src/lib/matrix/matrix/Matrix.hpp"
 template<size_t P>
 Matrix<Type, M, P> operator*(const Matrix<Type, N, P> &other) const
 {
  const Matrix<Type, M, N> &self = *this;
  Matrix<Type, M, P> res{};

  for (size_t i = 0; i < M; i++) {
   for (size_t k = 0; k < P; k++) {
    for (size_t j = 0; j < N; j++) {
     res(i, k) += self(i, j) * other(j, k);
    }
   }
  }

  return res;
 }


 template<size_t P>
 Matrix<Type, M, M> multiplyByTranspose(const Matrix<Type, P, N> &other) const
 {
  Matrix<Type, M, P> res;
  const Matrix<Type, M, N> &self = *this;

  for (size_t i = 0; i < M; i++) {
   for (size_t k = 0; k < P; k++) {
    for (size_t j = 0; j < N; j++) {
     res(i, k) += self(i, j) * other(k, j);
    }
   }
  }

  return res;
 }


 Matrix<Type, M, N> emult(const Matrix<Type, M, N> &other) const
 {
  Matrix<Type, M, N> res;
  const Matrix<Type, M, N> &self = *this;

  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    res(i, j) = self(i, j) * other(i, j);
   }
  }

  return res;
 }


 Matrix<Type, M, N> edivide(const Matrix<Type, M, N> &other) const
 {
  Matrix<Type, M, N> res;
  const Matrix<Type, M, N> &self = *this;

  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    res(i, j) = self(i, j) / other(i, j);
   }
  }

  return res;
 }

 Matrix<Type, M, N> operator+(const Matrix<Type, M, N> &other) const
 {
  Matrix<Type, M, N> res;
  const Matrix<Type, M, N> &self = *this;

  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    res(i, j) = self(i, j) + other(i, j);
   }
  }

  return res;
 }

 Matrix<Type, M, N> operator-(const Matrix<Type, M, N> &other) const
 {
  Matrix<Type, M, N> res;
  const Matrix<Type, M, N> &self = *this;

  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    res(i, j) = self(i, j) - other(i, j);
   }
  }

  return res;
 }


 Matrix<Type, M, N> operator-() const
 {
  Matrix<Type, M, N> res;
  const Matrix<Type, M, N> &self = *this;

  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    res(i, j) = -self(i, j);
   }
  }

  return res;
 }

 void operator+=(const Matrix<Type, M, N> &other)
 {
  Matrix<Type, M, N> &self = *this;

  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    self(i, j) += other(i, j);
   }
  }
 }

 void operator-=(const Matrix<Type, M, N> &other)
 {
  Matrix<Type, M, N> &self = *this;

  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    self(i, j) -= other(i, j);
   }
  }
 }

 template<size_t P>
 void operator*=(const Matrix<Type, N, P> &other)
 {
  Matrix<Type, M, N> &self = *this;
  self = self * other;
 }





 Matrix<Type, M, N> operator*(Type scalar) const
 {
  Matrix<Type, M, N> res;
  const Matrix<Type, M, N> &self = *this;

  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    res(i, j) = self(i, j) * scalar;
   }
  }

  return res;
 }

 inline Matrix<Type, M, N> operator/(Type scalar) const
 {
  return (*this) * (1 / scalar);
 }

 Matrix<Type, M, N> operator+(Type scalar) const
 {
  Matrix<Type, M, N> res;
  const Matrix<Type, M, N> &self = *this;

  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    res(i, j) = self(i, j) + scalar;
   }
  }

  return res;
 }

 inline Matrix<Type, M, N> operator-(Type scalar) const
 {
  return (*this) + (-1 * scalar);
 }

 void operator*=(Type scalar)
 {
  Matrix<Type, M, N> &self = *this;

  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    self(i, j) *= scalar;
   }
  }
 }

 void operator/=(Type scalar)
 {
  Matrix<Type, M, N> &self = *this;
  self *= (Type(1) / scalar);
 }

 inline void operator+=(Type scalar)
 {
  Matrix<Type, M, N> &self = *this;

  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    self(i, j) += scalar;
   }
  }
 }

 inline void operator-=(Type scalar)
 {
  Matrix<Type, M, N> &self = *this;
  self += (-scalar);
 }

 bool operator==(const Matrix<Type, M, N> &other) const
 {
  return isEqual(*this, other);
 }

 bool operator!=(const Matrix<Type, M, N> &other) const
 {
  const Matrix<Type, M, N> &self = *this;
  return !(self == other);
 }





 void write_string(char *buf, size_t n) const
 {
  buf[0] = '\0';
  const Matrix<Type, M, N> &self = *this;

  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    snprintf(buf + strlen(buf), n - strlen(buf), "\t%8.8g", double(self(i, j)));
   }

   snprintf(buf + strlen(buf), n - strlen(buf), "\n");
  }
 }

 void print(float eps = 1e-9) const
 {

  if (N > 1) {
   printf("  ");

   for (unsigned i = 0; i < N; i++) {
    printf("|%2u      ", i);

   }

   printf("\n");
  }

  const Matrix<Type, M, N> &self = *this;
  bool is_prev_symmetric = true;

  for (unsigned i = 0; i < M; i++) {
   printf("%2u|", i);

   for (unsigned j = 0; j < N; j++) {
    double d = static_cast<double>(self(i, j));


    if (is_prev_symmetric && (M == N) && (j > i) && (i < N) && (j < M)
        && (fabs(d - static_cast<double>(self(j, i))) < (double)eps)
       ) {

     printf("         ");

    } else {

     if (fabs(d - 0.0) < (double)eps) {

      printf(" 0       ");

     } else if ((fabs(d) < 1e-4) || (fabs(d) >= 10.0)) {
      printf("% .1e ", d);

     } else {
      printf("% 6.5f ", d);
     }

     is_prev_symmetric = false;
    }
   }

   printf("\n");
  }
 }

 Matrix<Type, N, M> transpose() const
 {
  Matrix<Type, N, M> res;
  const Matrix<Type, M, N> &self = *this;

  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    res(j, i) = self(i, j);
   }
  }

  return res;
 }


 inline Matrix<Type, N, M> T() const
 {
  return transpose();
 }

 template<size_t P, size_t Q>
 ConstSlice<Type, P, Q, M, N> slice(size_t x0, size_t y0) const
 {
  return {x0, y0, this};
 }

 template<size_t P, size_t Q>
 Slice<Type, P, Q, M, N> slice(size_t x0, size_t y0)
 {
  return {x0, y0, this};
 }

 ConstSlice<Type, 1, N, M, N> row(size_t i) const
 {
  return slice<1, N>(i, 0);
 }

 Slice<Type, 1, N, M, N> row(size_t i)
 {
  return slice<1, N>(i, 0);
 }

 ConstSlice<Type, M, 1, M, N> col(size_t j) const
 {
  return slice<M, 1>(0, j);
 }

 Slice<Type, M, 1, M, N> col(size_t j)
 {
  return slice<M, 1>(0, j);
 }

 void setRow(size_t i, const Matrix<Type, N, 1> &row_in)
 {
  slice<1, N>(i, 0) = row_in.transpose();
 }

 void setRow(size_t i, Type val)
 {
  slice<1, N>(i, 0) = val;
 }

 void setCol(size_t j, const Matrix<Type, M, 1> &column)
 {
  slice<M, 1>(0, j) = column;
 }

 void setCol(size_t j, Type val)
 {
  slice<M, 1>(0, j) = val;
 }

 void setZero()
 {
  memset(_data, 0, sizeof(_data));
 }

 inline void zero()
 {
  setZero();
 }

 void setAll(Type val)
 {
  Matrix<Type, M, N> &self = *this;

  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    self(i, j) = val;
   }
  }
 }

 inline void setOne()
 {
  setAll(1);
 }

 inline void setNaN()
 {
  setAll(
# 551 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
        (__builtin_nanf (""))
# 551 "./src/lib/matrix/matrix/Matrix.hpp"
           );
 }

 void setIdentity()
 {
  setZero();
  Matrix<Type, M, N> &self = *this;

  const size_t min_i = M > N ? N : M;

  for (size_t i = 0; i < min_i; i++) {
   self(i, i) = 1;
  }
 }

 inline void identity()
 {
  setIdentity();
 }

 inline void swapRows(size_t a, size_t b)
 {
  
# 573 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
 (static_cast <bool> (
# 573 "./src/lib/matrix/matrix/Matrix.hpp"
 a < M
# 573 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 573 "./src/lib/matrix/matrix/Matrix.hpp"
 "a < M"
# 573 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
 , "./src/lib/matrix/matrix/Matrix.hpp", 573, __extension__ __PRETTY_FUNCTION__))
# 573 "./src/lib/matrix/matrix/Matrix.hpp"
              ;
  
# 574 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
 (static_cast <bool> (
# 574 "./src/lib/matrix/matrix/Matrix.hpp"
 b < M
# 574 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 574 "./src/lib/matrix/matrix/Matrix.hpp"
 "b < M"
# 574 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
 , "./src/lib/matrix/matrix/Matrix.hpp", 574, __extension__ __PRETTY_FUNCTION__))
# 574 "./src/lib/matrix/matrix/Matrix.hpp"
              ;

  if (a == b) {
   return;
  }

  Matrix<Type, M, N> &self = *this;

  for (size_t j = 0; j < N; j++) {
   Type tmp = self(a, j);
   self(a, j) = self(b, j);
   self(b, j) = tmp;
  }
 }

 inline void swapCols(size_t a, size_t b)
 {
  
# 591 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
 (static_cast <bool> (
# 591 "./src/lib/matrix/matrix/Matrix.hpp"
 a < N
# 591 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 591 "./src/lib/matrix/matrix/Matrix.hpp"
 "a < N"
# 591 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
 , "./src/lib/matrix/matrix/Matrix.hpp", 591, __extension__ __PRETTY_FUNCTION__))
# 591 "./src/lib/matrix/matrix/Matrix.hpp"
              ;
  
# 592 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
 (static_cast <bool> (
# 592 "./src/lib/matrix/matrix/Matrix.hpp"
 b < N
# 592 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 592 "./src/lib/matrix/matrix/Matrix.hpp"
 "b < N"
# 592 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
 , "./src/lib/matrix/matrix/Matrix.hpp", 592, __extension__ __PRETTY_FUNCTION__))
# 592 "./src/lib/matrix/matrix/Matrix.hpp"
              ;

  if (a == b) {
   return;
  }

  Matrix<Type, M, N> &self = *this;

  for (size_t i = 0; i < M; i++) {
   Type tmp = self(i, a);
   self(i, a) = self(i, b);
   self(i, b) = tmp;
  }
 }

 Matrix<Type, M, N> abs() const
 {
  Matrix<Type, M, N> r;

  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    r(i, j) = Type(std::fabs((*this)(i, j)));
   }
  }

  return r;
 }

 Type max() const
 {
  Type max_val = (*this)(0, 0);

  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    Type val = (*this)(i, j);

    if (val > max_val) {
     max_val = val;
    }
   }
  }

  return max_val;
 }

 Type min() const
 {
  Type min_val = (*this)(0, 0);

  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    Type val = (*this)(i, j);

    if (val < min_val) {
     min_val = val;
    }
   }
  }

  return min_val;
 }

 bool isAllNan() const
 {
  const Matrix<Type, M, N> &self = *this;
  bool result = true;

  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    result = result && std::isnan(self(i, j));
   }
  }

  return result;
 }

 bool isAllFinite() const
 {
  const Matrix<Type, M, N> &self = *this;

  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    if (!std::isfinite(self(i, j))) {
     return false;
    }
   }
  }

  return true;
 }
};

template<typename Type, size_t M, size_t N>
Matrix<Type, M, N> zeros()
{
 Matrix<Type, M, N> m;
 m.setZero();
 return m;
}

template<typename Type, size_t M, size_t N>
Matrix<Type, M, N> ones()
{
 Matrix<Type, M, N> m;
 m.setOne();
 return m;
}

template<size_t M, size_t N>
Matrix<float, M, N> nans()
{
 Matrix<float, M, N> m;
 m.setNaN();
 return m;
}

template<typename Type, size_t M, size_t N>
Matrix<Type, M, N> operator*(Type scalar, const Matrix<Type, M, N> &other)
{
 return other * scalar;
}

template<typename Type, size_t M, size_t N>
bool isEqual(const Matrix<Type, M, N> &x,
      const Matrix<Type, M, N> &y, const Type eps = Type(1e-4f))
{
 for (size_t i = 0; i < M; i++) {
  for (size_t j = 0; j < N; j++) {
   if (!isEqualF(x(i, j), y(i, j), eps)) {
    return false;
   }
  }
 }

 return true;
}

namespace typeFunction
{
template<typename Type>
Type min(const Type x, const Type y)
{
 bool x_is_nan = std::isnan(x);
 bool y_is_nan = std::isnan(y);


 if (x_is_nan || y_is_nan) {
  if (x_is_nan && !y_is_nan) {
   return y;
  }


  return x;
 }

 return (x < y) ? x : y;
}

template<typename Type>
Type max(const Type x, const Type y)
{
 bool x_is_nan = std::isnan(x);
 bool y_is_nan = std::isnan(y);


 if (x_is_nan || y_is_nan) {
  if (x_is_nan && !y_is_nan) {
   return y;
  }


  return x;
 }

 return (x > y) ? x : y;
}

template<typename Type>
Type constrain(const Type x, const Type lower_bound, const Type upper_bound)
{
 if (lower_bound > upper_bound) {
  return 
# 773 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
        (__builtin_nanf (""))
# 773 "./src/lib/matrix/matrix/Matrix.hpp"
           ;

 } else if (std::isnan(x)) {
  return 
# 776 "./src/lib/matrix/matrix/Matrix.hpp" 3 4
        (__builtin_nanf (""))
# 776 "./src/lib/matrix/matrix/Matrix.hpp"
           ;

 } else {
  return typeFunction::max(lower_bound, typeFunction::min(upper_bound, x));
 }
}
}

template<typename Type, size_t M, size_t N>
Matrix<Type, M, N> min(const Matrix<Type, M, N> &x, const Type scalar_upper_bound)
{
 Matrix<Type, M, N> m;

 for (size_t i = 0; i < M; i++) {
  for (size_t j = 0; j < N; j++) {
   m(i, j) = typeFunction::min(x(i, j), scalar_upper_bound);
  }
 }

 return m;
}

template<typename Type, size_t M, size_t N>
Matrix<Type, M, N> min(const Type scalar_upper_bound, const Matrix<Type, M, N> &x)
{
 return min(x, scalar_upper_bound);
}

template<typename Type, size_t M, size_t N>
Matrix<Type, M, N> min(const Matrix<Type, M, N> &x1, const Matrix<Type, M, N> &x2)
{
 Matrix<Type, M, N> m;

 for (size_t i = 0; i < M; i++) {
  for (size_t j = 0; j < N; j++) {
   m(i, j) = typeFunction::min(x1(i, j), x2(i, j));
  }
 }

 return m;
}

template<typename Type, size_t M, size_t N>
Matrix<Type, M, N> max(const Matrix<Type, M, N> &x, const Type scalar_lower_bound)
{
 Matrix<Type, M, N> m;

 for (size_t i = 0; i < M; i++) {
  for (size_t j = 0; j < N; j++) {
   m(i, j) = typeFunction::max(x(i, j), scalar_lower_bound);
  }
 }

 return m;
}

template<typename Type, size_t M, size_t N>
Matrix<Type, M, N> max(const Type scalar_lower_bound, const Matrix<Type, M, N> &x)
{
 return max(x, scalar_lower_bound);
}

template<typename Type, size_t M, size_t N>
Matrix<Type, M, N> max(const Matrix<Type, M, N> &x1, const Matrix<Type, M, N> &x2)
{
 Matrix<Type, M, N> m;

 for (size_t i = 0; i < M; i++) {
  for (size_t j = 0; j < N; j++) {
   m(i, j) = typeFunction::max(x1(i, j), x2(i, j));
  }
 }

 return m;
}

template<typename Type, size_t M, size_t N>
Matrix<Type, M, N> constrain(const Matrix<Type, M, N> &x,
        const Type scalar_lower_bound,
        const Type scalar_upper_bound)
{
 Matrix<Type, M, N> m;

 if (scalar_lower_bound > scalar_upper_bound) {
  m.setNaN();

 } else {
  for (size_t i = 0; i < M; i++) {
   for (size_t j = 0; j < N; j++) {
    m(i, j) = typeFunction::constrain(x(i, j), scalar_lower_bound, scalar_upper_bound);
   }
  }
 }

 return m;
}

template<typename Type, size_t M, size_t N>
Matrix<Type, M, N> constrain(const Matrix<Type, M, N> &x,
        const Matrix<Type, M, N> &x_lower_bound,
        const Matrix<Type, M, N> &x_upper_bound)
{
 Matrix<Type, M, N> m;

 for (size_t i = 0; i < M; i++) {
  for (size_t j = 0; j < N; j++) {
   m(i, j) = typeFunction::constrain(x(i, j), x_lower_bound(i, j), x_upper_bound(i, j));
  }
 }

 return m;
}

template<typename OStream, typename Type, size_t M, size_t N>
OStream &operator<<(OStream &os, const matrix::Matrix<Type, M, N> &matrix)
{
 os << "\n";

 static const size_t n = 15 * N * M + M + 1;
 char string[n];
 matrix.write_string(string, n);
 os << string;
 return os;
}

}
# 12 "./src/lib/matrix/matrix/Vector.hpp" 2

namespace matrix
{

template<typename Type, size_t M>
class Vector : public Matrix<Type, M, 1>
{
public:
 using MatrixM1 = Matrix<Type, M, 1>;

 Vector() = default;

 Vector(const MatrixM1 &other) :
  MatrixM1(other)
 {
 }

 explicit Vector(const Type data_[M]) :
  MatrixM1(data_)
 {
 }

 template<size_t P, size_t Q>
 Vector(const Slice<Type, M, 1, P, Q> &slice_in) :
  Matrix<Type, M, 1>(slice_in)
 {
 }

 template<size_t P, size_t Q, size_t DUMMY = 1>
 Vector(const Slice<Type, 1, M, P, Q> &slice_in)
 {
  Vector &self(*this);

  for (size_t i = 0; i < M; i++) {
   self(i) = slice_in(0, i);
  }
 }

 template<size_t P, size_t Q>
 Vector(const ConstSlice<Type, M, 1, P, Q> &slice_in) :
  Matrix<Type, M, 1>(slice_in)
 {
 }

 template<size_t P, size_t Q, size_t DUMMY = 1>
 Vector(const ConstSlice<Type, 1, M, P, Q> &slice_in)
 {
  Vector &self(*this);

  for (size_t i = 0; i < M; i++) {
   self(i) = slice_in(0, i);
  }
 }

 inline const Type &operator()(size_t i) const
 {
  
# 68 "./src/lib/matrix/matrix/Vector.hpp" 3 4
 (static_cast <bool> (
# 68 "./src/lib/matrix/matrix/Vector.hpp"
 i < M
# 68 "./src/lib/matrix/matrix/Vector.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 68 "./src/lib/matrix/matrix/Vector.hpp"
 "i < M"
# 68 "./src/lib/matrix/matrix/Vector.hpp" 3 4
 , "./src/lib/matrix/matrix/Vector.hpp", 68, __extension__ __PRETTY_FUNCTION__))
# 68 "./src/lib/matrix/matrix/Vector.hpp"
              ;

  const MatrixM1 &v = *this;
  return v(i, 0);
 }

 inline Type &operator()(size_t i)
 {
  
# 76 "./src/lib/matrix/matrix/Vector.hpp" 3 4
 (static_cast <bool> (
# 76 "./src/lib/matrix/matrix/Vector.hpp"
 i < M
# 76 "./src/lib/matrix/matrix/Vector.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 76 "./src/lib/matrix/matrix/Vector.hpp"
 "i < M"
# 76 "./src/lib/matrix/matrix/Vector.hpp" 3 4
 , "./src/lib/matrix/matrix/Vector.hpp", 76, __extension__ __PRETTY_FUNCTION__))
# 76 "./src/lib/matrix/matrix/Vector.hpp"
              ;

  MatrixM1 &v = *this;
  return v(i, 0);
 }

 Type dot(const MatrixM1 &b) const
 {
  const Vector &a(*this);
  Type r(0);

  for (size_t i = 0; i < M; i++) {
   r += a(i) * b(i, 0);
  }

  return r;
 }

 inline Type operator*(const MatrixM1 &b) const
 {
  const Vector &a(*this);
  return a.dot(b);
 }

 inline Vector operator*(Type b) const
 {
  return Vector(MatrixM1::operator*(b));
 }

 Type norm() const
 {
  const Vector &a(*this);
  return Type(std::sqrt(a.dot(a)));
 }

 Type norm_squared() const
 {
  const Vector &a(*this);
  return a.dot(a);
 }

 inline Type length() const
 {
  return norm();
 }

 inline void normalize()
 {
  (*this) /= norm();
 }

 Vector unit() const
 {
  return (*this) / norm();
 }

 Vector unit_or_zero(const Type eps = Type(1e-5)) const
 {
  const Type n = norm();

  if (n > eps) {
   return (*this) / n;
  }

  return Vector();
 }

 inline Vector normalized() const
 {
  return unit();
 }

 bool longerThan(Type testVal) const
 {
  return norm_squared() > testVal * testVal;
 }

 Vector sqrt() const
 {
  const Vector &a(*this);
  Vector r;

  for (size_t i = 0; i < M; i++) {
   r(i) = Type(std::sqrt(a(i)));
  }

  return r;
 }

 void print() const
 {
  (*this).transpose().print();
 }

 static size_t size()
 {
  return M;
 }
};

template<typename OStream, typename Type, size_t M>
OStream &operator<<(OStream &os, const matrix::Vector<Type, M> &vector)
{
 os << "\n";

 static const size_t n = 15 * M * 1 + 1 + 1;
 char string[n];
 vector.transpose().write_string(string, n);
 os << string;
 return os;
}

}
# 12 "./src/lib/matrix/matrix/Vector3.hpp" 2

namespace matrix
{

template <typename Type>
class Dcm;

template<typename Type>
class Vector3 : public Vector<Type, 3>
{
public:

 using Matrix31 = Matrix<Type, 3, 1>;

 Vector3() = default;

 Vector3(const Matrix31 &other) :
  Vector<Type, 3>(other)
 {
 }

 explicit Vector3(const Type data_[3]) :
  Vector<Type, 3>(data_)
 {
 }

 Vector3(Type x, Type y, Type z)
 {
  Vector3 &v(*this);
  v(0) = x;
  v(1) = y;
  v(2) = z;
 }

 using base = Vector<Type, 3>;
 using base::base;

 Vector3 cross(const Matrix31 &b) const
 {
  const Vector3 &a(*this);
  return {a(1) *b(2, 0) - a(2) *b(1, 0), -a(0) *b(2, 0) + a(2) *b(0, 0), a(0) *b(1, 0) - a(1) *b(0, 0)};
 }





 inline Vector3 operator+(Vector3 other) const
 {
  return Matrix31::operator+(other);
 }

 inline Vector3 operator+(Type scalar) const
 {
  return Matrix31::operator+(scalar);
 }

 inline Vector3 operator-(Vector3 other) const
 {
  return Matrix31::operator-(other);
 }

 inline Vector3 operator-(Type scalar) const
 {
  return Matrix31::operator-(scalar);
 }

 inline Vector3 operator-() const
 {
  return Matrix31::operator-();
 }

 inline Vector3 operator*(Type scalar) const
 {
  return Matrix31::operator*(scalar);
 }

 inline Type operator*(Vector3 b) const
 {
  return Vector<Type, 3>::operator*(b);
 }

 inline Vector3 operator%(const Matrix31 &b) const
 {
  return (*this).cross(b);
 }

 ConstSlice<Type, 2, 1, 3, 1> xy() const
 {
  return {0, 0, this};
 }

 Slice<Type, 2, 1, 3, 1> xy()
 {
  return {0, 0, this};
 }

 Dcm<Type> hat() const
 {
  const Vector3 &v(*this);
  Dcm<Type> A;
  A(0, 0) = 0;
  A(0, 1) = -v(2);
  A(0, 2) = v(1);
  A(1, 0) = v(2);
  A(1, 1) = 0;
  A(1, 2) = -v(0);
  A(2, 0) = -v(1);
  A(2, 1) = v(0);
  A(2, 2) = 0;
  return A;
 }

};

using Vector3f = Vector3<float>;
using Vector3d = Vector3<double>;

}
# 10 "./src/lib/matrix/matrix/AxisAngle.hpp" 2

namespace matrix
{

template <typename Type>
class Euler;

template<typename Type>
class Quaternion;







template<typename Type>
class AxisAngle : public Vector3<Type>
{
public:
 using Matrix31 = Matrix<Type, 3, 1>;






 explicit AxisAngle(const Type data_[3]) :
  Vector3<Type>(data_)
 {
 }




 AxisAngle() = default;






 AxisAngle(const Matrix31 &other) :
  Vector3<Type>(other)
 {
 }
# 66 "./src/lib/matrix/matrix/AxisAngle.hpp"
 AxisAngle(const Quaternion<Type> &q)
 {
  AxisAngle &v = *this;
  Type mag = q.imag().norm();

  if (std::fabs(mag) >= Type(1e-10)) {
   v = q.imag() * Type(Type(2) * std::atan2(mag, q(0)) / mag);

  } else {
   v = q.imag() * Type(Type(2) * Type(sign(q(0))));
  }
 }
# 87 "./src/lib/matrix/matrix/AxisAngle.hpp"
 AxisAngle(const Dcm<Type> &dcm)
 {
  AxisAngle &v = *this;
  v = AxisAngle<Type>(Quaternion<Type>(dcm));
 }
# 102 "./src/lib/matrix/matrix/AxisAngle.hpp"
 AxisAngle(const Euler<Type> &euler)
 {
  AxisAngle &v = *this;
  v = AxisAngle<Type>(Quaternion<Type>(euler));
 }
# 115 "./src/lib/matrix/matrix/AxisAngle.hpp"
 AxisAngle(Type x, Type y, Type z)
 {
  AxisAngle &v = *this;
  v(0) = x;
  v(1) = y;
  v(2) = z;
 }







 AxisAngle(const Matrix31 &axis_, Type angle_)
 {
  AxisAngle &v = *this;

  Vector3<Type> a = axis_;
  a = a.unit();
  v(0) = a(0) * angle_;
  v(1) = a(1) * angle_;
  v(2) = a(2) * angle_;
 }


 Vector3<Type> axis()
 {
  if (Vector3<Type>::norm() > 0) {
   return Vector3<Type>::unit();

  } else {
   return Vector3<Type>(1, 0, 0);
  }
 }

 Type angle()
 {
  return Vector3<Type>::norm();
 }
};

using AxisAnglef = AxisAngle<float>;
using AxisAngled = AxisAngle<double>;

}
# 4 "./src/lib/matrix/matrix/math.hpp" 2
# 1 "./src/lib/matrix/matrix/Dcm.hpp" 1
# 16 "./src/lib/matrix/matrix/Dcm.hpp"
       

# 1 "./src/lib/matrix/matrix/SquareMatrix.hpp" 1
# 9 "./src/lib/matrix/matrix/SquareMatrix.hpp"
       





namespace matrix
{

template <typename Type, size_t M>
class SquareMatrix : public Matrix<Type, M, M>
{
public:
 SquareMatrix() = default;

 explicit SquareMatrix(const Type data_[M][M]) :
  Matrix<Type, M, M>(data_)
 {
 }

 explicit SquareMatrix(const Type data_[M * M]) :
  Matrix<Type, M, M>(data_)
 {
 }

 SquareMatrix(const Matrix<Type, M, M> &other) :
  Matrix<Type, M, M>(other)
 {
 }

 using base = Matrix<Type, M, M>;
 using base::base;

 SquareMatrix<Type, M> &operator=(const Matrix<Type, M, M> &other)
 {
  Matrix<Type, M, M>::operator=(other);
  return *this;
 }

 template <size_t P, size_t Q>
 SquareMatrix<Type, M> &operator=(const Slice<Type, M, M, P, Q> &in_slice)
 {
  Matrix<Type, M, M>::operator=(in_slice);
  return *this;
 }

 template<size_t P, size_t Q>
 ConstSlice<Type, P, Q, M, M> slice(size_t x0, size_t y0) const
 {
  return {x0, y0, this};
 }

 template<size_t P, size_t Q>
 Slice<Type, P, Q, M, M> slice(size_t x0, size_t y0)
 {
  return {x0, y0, this};
 }


 inline SquareMatrix<Type, M> I() const
 {
  SquareMatrix<Type, M> i;

  if (inv(*this, i)) {
   return i;

  } else {
   i.setZero();
   return i;
  }
 }


 inline bool I(SquareMatrix<Type, M> &i) const
 {
  return inv(*this, i);
 }


 Vector<Type, M> diag() const
 {
  Vector<Type, M> res;
  const SquareMatrix<Type, M> &self = *this;

  for (size_t i = 0; i < M; i++) {
   res(i) = self(i, i);
  }

  return res;
 }


 Vector < Type, M *(M + 1) / 2 > upper_right_triangle() const
 {
  Vector < Type, M * (M + 1) / 2 > res;
  const SquareMatrix<Type, M> &self = *this;

  unsigned idx = 0;

  for (size_t x = 0; x < M; x++) {
   for (size_t y = x; y < M; y++) {
    res(idx) = self(x, y);
    ++idx;
   }
  }

  return res;
 }

 template <size_t Width>
 Type trace(size_t first) const
 {
  static_assert(Width <= M, "Width bigger than matrix");
  
# 122 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 (static_cast <bool> (
# 122 "./src/lib/matrix/matrix/SquareMatrix.hpp"
 first + Width <= M
# 122 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 122 "./src/lib/matrix/matrix/SquareMatrix.hpp"
 "first + Width <= M"
# 122 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 , "./src/lib/matrix/matrix/SquareMatrix.hpp", 122, __extension__ __PRETTY_FUNCTION__))
# 122 "./src/lib/matrix/matrix/SquareMatrix.hpp"
                           ;

  Type res = 0;
  const SquareMatrix<Type, M> &self = *this;

  for (size_t i = first; i < (first + Width); i++) {
   res += self(i, i);
  }

  return res;
 }

 Type trace() const
 {
  const SquareMatrix<Type, M> &self = *this;
  return self.trace<M>(0);
 }



 template <size_t Width>
 void uncorrelateCovarianceBlock(size_t first)
 {
  static_assert(Width <= M, "Width bigger than matrix");
  
# 146 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 (static_cast <bool> (
# 146 "./src/lib/matrix/matrix/SquareMatrix.hpp"
 first + Width <= M
# 146 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 146 "./src/lib/matrix/matrix/SquareMatrix.hpp"
 "first + Width <= M"
# 146 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 , "./src/lib/matrix/matrix/SquareMatrix.hpp", 146, __extension__ __PRETTY_FUNCTION__))
# 146 "./src/lib/matrix/matrix/SquareMatrix.hpp"
                           ;

  SquareMatrix<Type, M> &self = *this;
  SquareMatrix<Type, Width> cov = self.slice<Width, Width>(first, first);
  self.slice<M, Width>(0, first) = 0.f;
  self.slice<Width, M>(first, 0) = 0.f;
  self.slice<Width, Width>(first, first) = cov;
 }


 template <size_t Width>
 void uncorrelateCovariance(size_t first)
 {
  static_assert(Width <= M, "Width bigger than matrix");
  
# 160 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 (static_cast <bool> (
# 160 "./src/lib/matrix/matrix/SquareMatrix.hpp"
 first + Width <= M
# 160 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 160 "./src/lib/matrix/matrix/SquareMatrix.hpp"
 "first + Width <= M"
# 160 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 , "./src/lib/matrix/matrix/SquareMatrix.hpp", 160, __extension__ __PRETTY_FUNCTION__))
# 160 "./src/lib/matrix/matrix/SquareMatrix.hpp"
                           ;

  SquareMatrix<Type, M> &self = *this;
  Vector<Type, Width> diag_elements = self.slice<Width, Width>(first, first).diag();
  self.uncorrelateCovarianceSetVariance(first, diag_elements);
 }

 template <size_t Width>
 void uncorrelateCovarianceSetVariance(size_t first, const Vector<Type, Width> &vec)
 {
  static_assert(Width <= M, "Width bigger than matrix");
  
# 171 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 (static_cast <bool> (
# 171 "./src/lib/matrix/matrix/SquareMatrix.hpp"
 first + Width <= M
# 171 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 171 "./src/lib/matrix/matrix/SquareMatrix.hpp"
 "first + Width <= M"
# 171 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 , "./src/lib/matrix/matrix/SquareMatrix.hpp", 171, __extension__ __PRETTY_FUNCTION__))
# 171 "./src/lib/matrix/matrix/SquareMatrix.hpp"
                           ;

  SquareMatrix<Type, M> &self = *this;

  self.slice<Width, M>(first, 0) = Type(0);
  self.slice<M, Width>(0, first) = Type(0);


  unsigned vec_idx = 0;

  for (size_t idx = first; idx < first + Width; idx++) {
   self(idx, idx) = vec(vec_idx);
   vec_idx ++;
  }
 }

 template <size_t Width>
 void uncorrelateCovarianceSetVariance(size_t first, Type val)
 {
  static_assert(Width <= M, "Width bigger than matrix");
  
# 191 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 (static_cast <bool> (
# 191 "./src/lib/matrix/matrix/SquareMatrix.hpp"
 first + Width <= M
# 191 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 191 "./src/lib/matrix/matrix/SquareMatrix.hpp"
 "first + Width <= M"
# 191 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 , "./src/lib/matrix/matrix/SquareMatrix.hpp", 191, __extension__ __PRETTY_FUNCTION__))
# 191 "./src/lib/matrix/matrix/SquareMatrix.hpp"
                           ;

  SquareMatrix<Type, M> &self = *this;

  self.slice<Width, M>(first, 0) = Type(0);
  self.slice<M, Width>(0, first) = Type(0);


  for (size_t idx = first; idx < first + Width; idx++) {
   self(idx, idx) = val;
  }
 }


 template <size_t Width>
 void makeBlockSymmetric(size_t first)
 {
  static_assert(Width <= M, "Width bigger than matrix");
  
# 209 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 (static_cast <bool> (
# 209 "./src/lib/matrix/matrix/SquareMatrix.hpp"
 first + Width <= M
# 209 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 209 "./src/lib/matrix/matrix/SquareMatrix.hpp"
 "first + Width <= M"
# 209 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 , "./src/lib/matrix/matrix/SquareMatrix.hpp", 209, __extension__ __PRETTY_FUNCTION__))
# 209 "./src/lib/matrix/matrix/SquareMatrix.hpp"
                           ;

  SquareMatrix<Type, M> &self = *this;

  if (Width > 1) {
   for (size_t row_idx = first + 1; row_idx < first + Width; row_idx++) {
    for (size_t col_idx = first; col_idx < row_idx; col_idx++) {
     Type tmp = (self(row_idx, col_idx) + self(col_idx, row_idx)) / Type(2);
     self(row_idx, col_idx) = tmp;
     self(col_idx, row_idx) = tmp;
    }
   }
  }
 }


 template <size_t Width>
 void makeRowColSymmetric(size_t first)
 {
  static_assert(Width <= M, "Width bigger than matrix");
  
# 229 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 (static_cast <bool> (
# 229 "./src/lib/matrix/matrix/SquareMatrix.hpp"
 first + Width <= M
# 229 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 229 "./src/lib/matrix/matrix/SquareMatrix.hpp"
 "first + Width <= M"
# 229 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 , "./src/lib/matrix/matrix/SquareMatrix.hpp", 229, __extension__ __PRETTY_FUNCTION__))
# 229 "./src/lib/matrix/matrix/SquareMatrix.hpp"
                           ;

  SquareMatrix<Type, M> &self = *this;
  self.makeBlockSymmetric<Width>(first);

  for (size_t row_idx = first; row_idx < first + Width; row_idx++) {
   for (size_t col_idx = 0; col_idx < first; col_idx++) {
    Type tmp = (self(row_idx, col_idx) + self(col_idx, row_idx)) / Type(2);
    self(row_idx, col_idx) = tmp;
    self(col_idx, row_idx) = tmp;
   }

   for (size_t col_idx = first + Width; col_idx < M; col_idx++) {
    Type tmp = (self(row_idx, col_idx) + self(col_idx, row_idx)) / Type(2);
    self(row_idx, col_idx) = tmp;
    self(col_idx, row_idx) = tmp;
   }
  }
 }


 template <size_t Width>
 bool isBlockSymmetric(size_t first, const Type eps = Type(1e-8f))
 {
  static_assert(Width <= M, "Width bigger than matrix");
  
# 254 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 (static_cast <bool> (
# 254 "./src/lib/matrix/matrix/SquareMatrix.hpp"
 first + Width <= M
# 254 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 254 "./src/lib/matrix/matrix/SquareMatrix.hpp"
 "first + Width <= M"
# 254 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 , "./src/lib/matrix/matrix/SquareMatrix.hpp", 254, __extension__ __PRETTY_FUNCTION__))
# 254 "./src/lib/matrix/matrix/SquareMatrix.hpp"
                           ;

  SquareMatrix<Type, M> &self = *this;

  if (Width > 1) {
   for (size_t row_idx = first + 1; row_idx < first + Width; row_idx++) {
    for (size_t col_idx = first; col_idx < row_idx; col_idx++) {
     if (!isEqualF(self(row_idx, col_idx), self(col_idx, row_idx), eps)) {
      return false;
     }
    }
   }
  }

  return true;
 }


 template <size_t Width>
 bool isRowColSymmetric(size_t first, const Type eps = Type(1e-8f))
 {
  static_assert(Width <= M, "Width bigger than matrix");
  
# 276 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 (static_cast <bool> (
# 276 "./src/lib/matrix/matrix/SquareMatrix.hpp"
 first + Width <= M
# 276 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 276 "./src/lib/matrix/matrix/SquareMatrix.hpp"
 "first + Width <= M"
# 276 "./src/lib/matrix/matrix/SquareMatrix.hpp" 3 4
 , "./src/lib/matrix/matrix/SquareMatrix.hpp", 276, __extension__ __PRETTY_FUNCTION__))
# 276 "./src/lib/matrix/matrix/SquareMatrix.hpp"
                           ;

  SquareMatrix<Type, M> &self = *this;

  for (size_t row_idx = first; row_idx < first + Width; row_idx++) {
   for (size_t col_idx = 0; col_idx < first; col_idx++) {
    if (!isEqualF(self(row_idx, col_idx), self(col_idx, row_idx), eps)) {
     return false;
    }
   }

   for (size_t col_idx = first + Width; col_idx < M; col_idx++) {
    if (!isEqualF(self(row_idx, col_idx), self(col_idx, row_idx), eps)) {
     return false;
    }
   }
  }

  return self.isBlockSymmetric<Width>(first, eps);
 }

 void copyLowerToUpperTriangle()
 {
  SquareMatrix<Type, M> &self = *this;

  for (size_t row_idx = 1; row_idx < M; row_idx++) {
   for (size_t col_idx = 0 ; col_idx < row_idx; col_idx++) {
    self(col_idx, row_idx) = self(row_idx, col_idx);
   }
  }
 }

 void copyUpperToLowerTriangle()
 {
  SquareMatrix<Type, M> &self = *this;

  for (size_t row_idx = 1; row_idx < M; row_idx++) {
   for (size_t col_idx = 0 ; col_idx < row_idx; col_idx++) {
    self(row_idx, col_idx) = self(col_idx, row_idx);
   }
  }
 }
};

using SquareMatrix2f = SquareMatrix<float, 2>;
using SquareMatrix3f = SquareMatrix<float, 3>;
using SquareMatrix3d = SquareMatrix<double, 3>;

template<typename Type, size_t M>
SquareMatrix<Type, M> eye()
{
 SquareMatrix<Type, M> m;
 m.setIdentity();
 return m;
}

template<typename Type, size_t M>
SquareMatrix<Type, M> diag(Vector<Type, M> d)
{
 SquareMatrix<Type, M> m;

 for (size_t i = 0; i < M; i++) {
  m(i, i) = d(i);
 }

 return m;
}

template<typename Type, size_t M>
SquareMatrix<Type, M> expm(const Matrix<Type, M, M> &A, size_t order = 5)
{
 SquareMatrix<Type, M> res;
 SquareMatrix<Type, M> A_pow = A;
 res.setIdentity();
 size_t i_factorial = 1;

 for (size_t i = 1; i <= order; i++) {
  i_factorial *= i;
  res += A_pow / Type(i_factorial);
  A_pow *= A_pow;
 }

 return res;
}




template<typename Type>
bool inv(const SquareMatrix<Type, 1> &A, SquareMatrix<Type, 1> &inv, size_t rank = 1)
{
 if (std::fabs(A(0, 0)) < Type(1.19209289550781250000000000000000000e-7F)) {
  return false;
 }

 inv(0, 0) = Type(1) / A(0, 0);
 return true;
}




template<typename Type, size_t M>
bool inv(const SquareMatrix<Type, M> &A, SquareMatrix<Type, M> &inv, size_t rank = M)
{
 SquareMatrix<Type, M> L;
 L.setIdentity();
 SquareMatrix<Type, M> U = A;
 SquareMatrix<Type, M> P;
 P.setIdentity();




 for (size_t n = 0; n < rank; n++) {


  if (std::fabs(U(n, n)) < Type(1.19209289550781250000000000000000000e-7F)) {

   for (size_t i = n + 1; i < rank; i++) {


    if (std::fabs(U(i, n)) > Type(1.19209289550781250000000000000000000e-7F)) {

     U.swapRows(i, n);
     P.swapRows(i, n);
     L.swapRows(i, n);
     L.swapCols(i, n);
     break;
    }
   }
  }
# 418 "./src/lib/matrix/matrix/SquareMatrix.hpp"
  if (std::fabs(static_cast<float>(U(n, n))) < 1.19209289550781250000000000000000000e-7F) {
   return false;
  }


  for (size_t i = (n + 1); i < rank; i++) {
   L(i, n) = U(i, n) / U(n, n);



   for (size_t k = n; k < rank; k++) {
    U(i, k) -= L(i, n) * U(n, k);
   }
  }
 }
# 441 "./src/lib/matrix/matrix/SquareMatrix.hpp"
 for (size_t c = 0; c < rank; c++) {

  for (size_t i = 0; i < rank; i++) {

   for (size_t j = 0; j < i; j++) {



    P(i, c) -= L(i, j) * P(j, c);
   }






  }
 }







 for (size_t c = 0; c < rank; c++) {

  for (size_t k = 0; k < rank; k++) {

   size_t i = rank - 1 - k;


   for (size_t j = i + 1; j < rank; j++) {



    P(i, c) -= U(i, j) * P(j, c);
   }






   P(i, c) /= U(i, i);
  }
 }


 for (size_t i = 0; i < rank; i++) {
  for (size_t j = 0; j < rank; j++) {
   if (!std::isfinite(P(i, j))) {
    return false;
   }
  }
 }


 inv = P;
 return true;
}

template<typename Type>
bool inv(const SquareMatrix<Type, 2> &A, SquareMatrix<Type, 2> &inv)
{
 Type det = A(0, 0) * A(1, 1) - A(1, 0) * A(0, 1);

 if (std::fabs(static_cast<float>(det)) < 1.19209289550781250000000000000000000e-7F || !std::isfinite(det)) {
  return false;
 }

 inv(0, 0) = A(1, 1);
 inv(1, 0) = -A(1, 0);
 inv(0, 1) = -A(0, 1);
 inv(1, 1) = A(0, 0);
 inv /= det;
 return true;
}

template<typename Type>
bool inv(const SquareMatrix<Type, 3> &A, SquareMatrix<Type, 3> &inv)
{
 Type det = A(0, 0) * (A(1, 1) * A(2, 2) - A(2, 1) * A(1, 2)) -
     A(0, 1) * (A(1, 0) * A(2, 2) - A(1, 2) * A(2, 0)) +
     A(0, 2) * (A(1, 0) * A(2, 1) - A(1, 1) * A(2, 0));

 if (std::fabs(static_cast<float>(det)) < 1.19209289550781250000000000000000000e-7F || !std::isfinite(det)) {
  return false;
 }

 inv(0, 0) = A(1, 1) * A(2, 2) - A(2, 1) * A(1, 2);
 inv(0, 1) = A(0, 2) * A(2, 1) - A(0, 1) * A(2, 2);
 inv(0, 2) = A(0, 1) * A(1, 2) - A(0, 2) * A(1, 1);
 inv(1, 0) = A(1, 2) * A(2, 0) - A(1, 0) * A(2, 2);
 inv(1, 1) = A(0, 0) * A(2, 2) - A(0, 2) * A(2, 0);
 inv(1, 2) = A(1, 0) * A(0, 2) - A(0, 0) * A(1, 2);
 inv(2, 0) = A(1, 0) * A(2, 1) - A(2, 0) * A(1, 1);
 inv(2, 1) = A(2, 0) * A(0, 1) - A(0, 0) * A(2, 1);
 inv(2, 2) = A(0, 0) * A(1, 1) - A(1, 0) * A(0, 1);
 inv /= det;
 return true;
}




template<typename Type, size_t M>
SquareMatrix<Type, M> inv(const SquareMatrix<Type, M> &A)
{
 SquareMatrix<Type, M> i;

 if (inv(A, i)) {
  return i;

 } else {
  i.setZero();
  return i;
 }
}






template<typename Type, size_t M>
SquareMatrix <Type, M> cholesky(const SquareMatrix<Type, M> &A)
{
 SquareMatrix<Type, M> L;

 for (size_t j = 0; j < M; j++) {
  for (size_t i = j; i < M; i++) {
   if (i == j) {
    float sum = 0;

    for (size_t k = 0; k < j; k++) {
     sum += L(j, k) * L(j, k);
    }

    Type res = A(j, j) - sum;

    if (res <= 0) {
     L(j, j) = 0;

    } else {
     L(j, j) = std::sqrt(res);
    }

   } else {
    float sum = 0;

    for (size_t k = 0; k < j; k++) {
     sum += L(i, k) * L(j, k);
    }

    if (L(j, j) <= 0) {
     L(i, j) = 0;

    } else {
     L(i, j) = (A(i, j) - sum) / L(j, j);
    }
   }
  }
 }

 return L;
}







template<typename Type, size_t M>
SquareMatrix <Type, M> choleskyInv(const SquareMatrix<Type, M> &A)
{
 SquareMatrix<Type, M> L_inv = inv(cholesky(A));
 return L_inv.T() * L_inv;
}

using Matrix2f = SquareMatrix<float, 2>;
using Matrix3f = SquareMatrix<float, 3>;
using Matrix3d = SquareMatrix<double, 3>;

}
# 19 "./src/lib/matrix/matrix/Dcm.hpp" 2


namespace matrix
{

template<typename Type>
class AxisAngle;

template<typename Type>
class Euler;

template<typename Type>
class Quaternion;







template<typename Type>
class Dcm : public SquareMatrix<Type, 3>
{
public:





 Dcm() : SquareMatrix<Type, 3>(eye<Type, 3>()) {}






 explicit Dcm(const Type data_[3][3]) : SquareMatrix<Type, 3>(data_)
 {
 }






 explicit Dcm(const Type data_[9]) : SquareMatrix<Type, 3>(data_)
 {
 }






 Dcm(const Matrix<Type, 3, 3> &other) : SquareMatrix<Type, 3>(other)
 {
 }
# 85 "./src/lib/matrix/matrix/Dcm.hpp"
 Dcm(const Quaternion<Type> &q)
 {
  Dcm &dcm = *this;
  const Type a = q(0);
  const Type b = q(1);
  const Type c = q(2);
  const Type d = q(3);
  const Type ab = a * b;
  const Type ac = a * c;
  const Type ad = a * d;
  const Type bb = b * b;
  const Type bc = b * c;
  const Type bd = b * d;
  const Type cc = c * c;
  const Type cd = c * d;
  const Type dd = d * d;
  dcm(0, 0) = Type(1) - Type(2) * (cc + dd);
  dcm(0, 1) = Type(2) * (bc - ad);
  dcm(0, 2) = Type(2) * (ac + bd);
  dcm(1, 0) = Type(2) * (bc + ad);
  dcm(1, 1) = Type(1) - Type(2) * (bb + dd);
  dcm(1, 2) = Type(2) * (cd - ab);
  dcm(2, 0) = Type(2) * (bd - ac);
  dcm(2, 1) = Type(2) * (ab + cd);
  dcm(2, 2) = Type(1) - Type(2) * (bb + cc);
 }
# 121 "./src/lib/matrix/matrix/Dcm.hpp"
 Dcm(const Euler<Type> &euler)
 {
  Dcm &dcm = *this;
  Type cosPhi = Type(std::cos(euler.phi()));
  Type sinPhi = Type(std::sin(euler.phi()));
  Type cosThe = Type(std::cos(euler.theta()));
  Type sinThe = Type(std::sin(euler.theta()));
  Type cosPsi = Type(std::cos(euler.psi()));
  Type sinPsi = Type(std::sin(euler.psi()));

  dcm(0, 0) = cosThe * cosPsi;
  dcm(0, 1) = -cosPhi * sinPsi + sinPhi * sinThe * cosPsi;
  dcm(0, 2) = sinPhi * sinPsi + cosPhi * sinThe * cosPsi;

  dcm(1, 0) = cosThe * sinPsi;
  dcm(1, 1) = cosPhi * cosPsi + sinPhi * sinThe * sinPsi;
  dcm(1, 2) = -sinPhi * cosPsi + cosPhi * sinThe * sinPsi;

  dcm(2, 0) = -sinThe;
  dcm(2, 1) = sinPhi * cosThe;
  dcm(2, 2) = cosPhi * cosThe;
 }
# 154 "./src/lib/matrix/matrix/Dcm.hpp"
 Dcm(const AxisAngle<Type> &aa)
 {
  Dcm &dcm = *this;
  dcm = Quaternion<Type>(aa);
 }

 Vector3<Type> vee() const
 {
  const Dcm &A(*this);
  return {-A(1, 2), A(0, 2), -A(0, 1)};
 }

 void renormalize()
 {

  for (size_t r = 0; r < 3; r++) {
   matrix::Vector3<Type> rvec(Matrix<Type, 1, 3>(this->Matrix<Type, 3, 3>::row(r)).transpose());
   this->Matrix<Type, 3, 3>::row(r) = rvec.normalized();
  }
 }
};

using Dcmf = Dcm<float>;
using Dcmd = Dcm<double>;

}
# 5 "./src/lib/matrix/matrix/math.hpp" 2
# 1 "./src/lib/matrix/matrix/Dcm2.hpp" 1
# 49 "./src/lib/matrix/matrix/Dcm2.hpp"
       


# 1 "./src/lib/matrix/matrix/Vector2.hpp" 1
# 9 "./src/lib/matrix/matrix/Vector2.hpp"
       



namespace matrix
{

template<typename Type>
class Vector2 : public Vector<Type, 2>
{
public:

 using Matrix21 = Matrix<Type, 2, 1>;
 using Vector3 = Vector<Type, 3>;

 Vector2() = default;

 Vector2(const Matrix21 &other) :
  Vector<Type, 2>(other)
 {
 }

 explicit Vector2(const Type data_[2]) :
  Vector<Type, 2>(data_)
 {
 }

 Vector2(Type x, Type y)
 {
  Vector2 &v(*this);
  v(0) = x;
  v(1) = y;
 }

 using base = Vector<Type, 2>;
 using base::base;

 explicit Vector2(const Vector3 &other)
 {
  Vector2 &v(*this);
  v(0) = other(0);
  v(1) = other(1);
 }

 Type cross(const Matrix21 &b) const
 {
  const Vector2 &a(*this);
  return a(0) * b(1, 0) - a(1) * b(0, 0);
 }





 Vector2 operator+(Vector2 other) const
 {
  return Matrix21::operator+(other);
 }

 Vector2 operator+(Type scalar) const
 {
  return Matrix21::operator+(scalar);
 }

 Vector2 operator-(Vector2 other) const
 {
  return Matrix21::operator-(other);
 }

 Vector2 operator-(Type scalar) const
 {
  return Matrix21::operator-(scalar);
 }

 Vector2 operator-() const
 {
  return Matrix21::operator-();
 }

 Vector2 operator*(Type scalar) const
 {
  return Matrix21::operator*(scalar);
 }

 Type operator*(Vector2 b) const
 {
  return Vector<Type, 2>::operator*(b);
 }

 Type operator%(const Matrix21 &b) const
 {
  return (*this).cross(b);
 }

};

using Vector2f = Vector2<float>;
using Vector2d = Vector2<double>;

}
# 53 "./src/lib/matrix/matrix/Dcm2.hpp" 2

namespace matrix
{

template<typename Type>
class Dcm2 : public SquareMatrix<Type, 2>
{
public:





 Dcm2() : SquareMatrix<Type, 2>(eye<Type, 2>()) {}






 explicit Dcm2(const Type data_[2][2]) : SquareMatrix<Type, 2>(data_)
 {
 }






 explicit Dcm2(const Type data_[4]) : SquareMatrix<Type, 2>(data_)
 {
 }






 Dcm2(const Matrix<Type, 2, 2> &other) : SquareMatrix<Type, 2>(other)
 {
 }
# 103 "./src/lib/matrix/matrix/Dcm2.hpp"
 Dcm2(const Type angle)
 {
  Dcm2 &dcm = *this;
  Type sin_angle = std::sin(angle);
  Type cos_angle = std::cos(angle);

  dcm(0, 0) = cos_angle;
  dcm(0, 1) = -sin_angle;
  dcm(1, 0) = sin_angle;
  dcm(1, 1) = cos_angle;
 }

 void renormalize()
 {

  for (size_t r = 0; r < 2; r++) {
   Vector2<Type> rvec(Matrix<Type, 1, 2>(this->row(r)).transpose());
   this->row(r) = rvec.normalized();
  }
 }
};

using Dcm2f = Dcm2<float>;
using Dcm2d = Dcm2<double>;

}
# 6 "./src/lib/matrix/matrix/math.hpp" 2
# 1 "./src/lib/matrix/matrix/Dual.hpp" 1
# 14 "./src/lib/matrix/matrix/Dual.hpp"
       

# 1 "/usr/include/c++/9/cmath" 1 3
# 39 "/usr/include/c++/9/cmath" 3
       
# 40 "/usr/include/c++/9/cmath" 3
# 17 "./src/lib/matrix/matrix/Dual.hpp" 2

# 1 "./src/lib/matrix/matrix/Scalar.hpp" 1
# 9 "./src/lib/matrix/matrix/Scalar.hpp"
       



namespace matrix
{

template<typename Type>
class Scalar
{
public:
 Scalar() = delete;

 Scalar(const Matrix<Type, 1, 1> &other) :
  _value{other(0, 0)}
 {
 }

 Scalar(Type other) : _value(other)
 {
 }

 operator const Type &()
 {
  return _value;
 }

 operator Matrix<Type, 1, 1>() const
 {
  Matrix<Type, 1, 1> m;
  m(0, 0) = _value;
  return m;
 }

 operator Vector<Type, 1>() const
 {
  Vector<Type, 1> m;
  m(0) = _value;
  return m;
 }

 bool operator==(const float other) const
 {
  return isEqualF(_value, other);
 }

private:
 const Type _value;

};

using Scalarf = Scalar<float>;
using Scalard = Scalar<double>;

}
# 19 "./src/lib/matrix/matrix/Dual.hpp" 2


namespace matrix
{

template <typename Scalar, size_t N>
struct Dual {
 static constexpr size_t WIDTH = N;

 Scalar value {};
 Vector<Scalar, N> derivative;

 Dual() = default;

 explicit Dual(Scalar v, size_t inputDimension = 65535)
 {
  value = v;

  if (inputDimension < N) {
   derivative(inputDimension) = Scalar(1);
  }
 }

 explicit Dual(Scalar v, const Vector<Scalar, N> &d) :
  value(v), derivative(d)
 {}

 Dual<Scalar, N> &operator=(const Scalar &a)
 {
  derivative.setZero();
  value = a;
  return *this;
 }

 Dual<Scalar, N> &operator +=(const Dual<Scalar, N> &a)
 {
  return (*this = *this + a);
 }

 Dual<Scalar, N> &operator *=(const Dual<Scalar, N> &a)
 {
  return (*this = *this * a);
 }

 Dual<Scalar, N> &operator -=(const Dual<Scalar, N> &a)
 {
  return (*this = *this - a);
 }

 Dual<Scalar, N> &operator /=(const Dual<Scalar, N> &a)
 {
  return (*this = *this / a);
 }

 Dual<Scalar, N> &operator +=(Scalar a)
 {
  return (*this = *this + a);
 }

 Dual<Scalar, N> &operator -=(Scalar a)
 {
  return (*this = *this - a);
 }

 Dual<Scalar, N> &operator *=(Scalar a)
 {
  return (*this = *this * a);
 }

 Dual<Scalar, N> &operator /=(Scalar a)
 {
  return (*this = *this / a);
 }

 bool operator==(const Dual<Scalar, N> &other) const
 {
  return isEqualF(value, other.value) && (derivative == other.derivative);
 }

 bool operator!=(const Dual<Scalar, N> &other) const
 {
  const Dual<Scalar, N> &self = *this;
  return !(self == other);
 }
};



template <typename Scalar, size_t N>
Dual<Scalar, N> operator+(const Dual<Scalar, N> &a)
{
 return a;
}

template <typename Scalar, size_t N>
Dual<Scalar, N> operator-(const Dual<Scalar, N> &a)
{
 return Dual<Scalar, N>(-a.value, -a.derivative);
}

template <typename Scalar, size_t N>
Dual<Scalar, N> operator+(const Dual<Scalar, N> &a, const Dual<Scalar, N> &b)
{
 return Dual<Scalar, N>(a.value + b.value, a.derivative + b.derivative);
}

template <typename Scalar, size_t N>
Dual<Scalar, N> operator-(const Dual<Scalar, N> &a, const Dual<Scalar, N> &b)
{
 return a + (-b);
}

template <typename Scalar, size_t N>
Dual<Scalar, N> operator+(const Dual<Scalar, N> &a, Scalar b)
{
 return Dual<Scalar, N>(a.value + b, a.derivative);
}

template <typename Scalar, size_t N>
Dual<Scalar, N> operator-(const Dual<Scalar, N> &a, Scalar b)
{
 return a + (-b);
}

template <typename Scalar, size_t N>
Dual<Scalar, N> operator+(Scalar a, const Dual<Scalar, N> &b)
{
 return Dual<Scalar, N>(a + b.value, b.derivative);
}

template <typename Scalar, size_t N>
Dual<Scalar, N> operator-(Scalar a, const Dual<Scalar, N> &b)
{
 return a + (-b);
}

template <typename Scalar, size_t N>
Dual<Scalar, N> operator*(const Dual<Scalar, N> &a, const Dual<Scalar, N> &b)
{
 return Dual<Scalar, N>(a.value * b.value, a.value * b.derivative + b.value * a.derivative);
}

template <typename Scalar, size_t N>
Dual<Scalar, N> operator*(const Dual<Scalar, N> &a, Scalar b)
{
 return Dual<Scalar, N>(a.value * b, a.derivative * b);
}

template <typename Scalar, size_t N>
Dual<Scalar, N> operator*(Scalar a, const Dual<Scalar, N> &b)
{
 return b * a;
}

template <typename Scalar, size_t N>
Dual<Scalar, N> operator/(const Dual<Scalar, N> &a, const Dual<Scalar, N> &b)
{
 const Scalar inv_b_real = Scalar(1) / b.value;
 return Dual<Scalar, N>(a.value * inv_b_real, a.derivative * inv_b_real -
          a.value * b.derivative * inv_b_real * inv_b_real);
}

template <typename Scalar, size_t N>
Dual<Scalar, N> operator/(const Dual<Scalar, N> &a, Scalar b)
{
 return a * (Scalar(1) / b);
}

template <typename Scalar, size_t N>
Dual<Scalar, N> operator/(Scalar a, const Dual<Scalar, N> &b)
{
 const Scalar inv_b_real = Scalar(1) / b.value;
 return Dual<Scalar, N>(a * inv_b_real, (-inv_b_real * a * inv_b_real) * b.derivative);
}




template <typename Scalar, size_t N>
Dual<Scalar, N> sqrt(const Dual<Scalar, N> &a)
{
 Scalar real = std::sqrt(a.value);
 return Dual<Scalar, N>(real, a.derivative * (Scalar(1) / (Scalar(2) * real)));
}


template <typename Scalar, size_t N>
Dual<Scalar, N> abs(const Dual<Scalar, N> &a)
{
 return a.value >= Scalar(0) ? a : -a;
}


template <typename Scalar, size_t N>
Dual<Scalar, N> ceil(const Dual<Scalar, N> &a)
{
 return Dual<Scalar, N>(std::ceil(a.value));
}


template <typename Scalar, size_t N>
Dual<Scalar, N> floor(const Dual<Scalar, N> &a)
{
 return Dual<Scalar, N>(std::floor(a.value));
}


template <typename Scalar, size_t N>
Dual<Scalar, N> fmod(const Dual<Scalar, N> &a, Scalar mod)
{
 return Dual<Scalar, N>(a.value - Scalar(size_t(a.value / mod)) * mod, a.derivative);
}


template <typename Scalar, size_t N>
Dual<Scalar, N> max(const Dual<Scalar, N> &a, const Dual<Scalar, N> &b)
{
 return a.value >= b.value ? a : b;
}


template <typename Scalar, size_t N>
Dual<Scalar, N> min(const Dual<Scalar, N> &a, const Dual<Scalar, N> &b)
{
 return a.value < b.value ? a : b;
}


template <typename Scalar>
bool IsNan(Scalar a)
{
 return std::isnan(a);
}

template <typename Scalar, size_t N>
bool IsNan(const Dual<Scalar, N> &a)
{
 return IsNan(a.value);
}


template <typename Scalar>
bool IsFinite(Scalar a)
{
 return std::isfinite(a);
}

template <typename Scalar, size_t N>
bool IsFinite(const Dual<Scalar, N> &a)
{
 return IsFinite(a.value);
}


template <typename Scalar>
bool IsInf(Scalar a)
{
 return std::isinf(a);
}

template <typename Scalar, size_t N>
bool IsInf(const Dual<Scalar, N> &a)
{
 return IsInf(a.value);
}




template <typename Scalar, size_t N>
Dual<Scalar, N> sin(const Dual<Scalar, N> &a)
{
 return Dual<Scalar, N>(std::sin(a.value), std::cos(a.value) * a.derivative);
}


template <typename Scalar, size_t N>
Dual<Scalar, N> cos(const Dual<Scalar, N> &a)
{
 return Dual<Scalar, N>(std::cos(a.value), -std::sin(a.value) * a.derivative);
}


template <typename Scalar, size_t N>
Dual<Scalar, N> tan(const Dual<Scalar, N> &a)
{
 Scalar real = std::tan(a.value);
 return Dual<Scalar, N>(real, (Scalar(1) + real * real) * a.derivative);
}


template <typename Scalar, size_t N>
Dual<Scalar, N> asin(const Dual<Scalar, N> &a)
{
 Scalar asin_d = Scalar(1) / std::sqrt(Scalar(1) - a.value * a.value);
 return Dual<Scalar, N>(std::asin(a.value), asin_d * a.derivative);
}


template <typename Scalar, size_t N>
Dual<Scalar, N> acos(const Dual<Scalar, N> &a)
{
 Scalar acos_d = -Scalar(1) / std::sqrt(Scalar(1) - a.value * a.value);
 return Dual<Scalar, N>(std::acos(a.value), acos_d * a.derivative);
}


template <typename Scalar, size_t N>
Dual<Scalar, N> atan(const Dual<Scalar, N> &a)
{
 Scalar atan_d = Scalar(1) / (Scalar(1) + a.value * a.value);
 return Dual<Scalar, N>(std::atan(a.value), atan_d * a.derivative);
}


template <typename Scalar, size_t N>
Dual<Scalar, N> atan2(const Dual<Scalar, N> &a, const Dual<Scalar, N> &b)
{

 Scalar atan_d = Scalar(1) / (a.value * a.value + b.value * b.value);
 return Dual<Scalar, N>(std::atan2(a.value, b.value), (a.derivative * b.value - a.value * b.derivative) * atan_d);
}


template <typename Scalar, size_t M, size_t N>
Matrix<Scalar, M, N> collectDerivatives(const Matrix<Dual<Scalar, N>, M, 1> &input)
{
 Matrix<Scalar, M, N> jac;

 for (size_t i = 0; i < M; i++) {
  jac.row(i) = input(i, 0).derivative;
 }

 return jac;
}


template <typename Scalar, size_t M, size_t N, size_t D>
Matrix<Scalar, M, N> collectReals(const Matrix<Dual<Scalar, D>, M, N> &input)
{
 Matrix<Scalar, M, N> r;

 for (size_t i = 0; i < M; i++) {
  for (size_t j = 0; j < N; j++) {
   r(i, j) = input(i, j).value;
  }
 }

 return r;
}

template<typename OStream, typename Type, size_t N>
OStream &operator<<(OStream &os, const matrix::Dual<Type, N> &dual)
{
 os << "\nValue: " << dual.value << "\nDerivative:" << dual.derivative;
 return os;
}

}
# 7 "./src/lib/matrix/matrix/math.hpp" 2
# 1 "./src/lib/matrix/matrix/Euler.hpp" 1
# 16 "./src/lib/matrix/matrix/Euler.hpp"
       

namespace matrix
{







template<typename Type>
class Euler : public Vector<Type, 3>
{
public:



 Euler() = default;






 Euler(const Vector<Type, 3> &other) :
  Vector<Type, 3>(other)
 {
 }






 Euler(const Matrix<Type, 3, 1> &other) :
  Vector<Type, 3>(other)
 {
 }
# 67 "./src/lib/matrix/matrix/Euler.hpp"
 Euler(Type phi_, Type theta_, Type psi_) : Vector<Type, 3>()
 {
  phi() = phi_;
  theta() = theta_;
  psi() = psi_;
 }
# 84 "./src/lib/matrix/matrix/Euler.hpp"
 Euler(const Dcm<Type> &dcm)
 {
  theta() = std::asin(-dcm(2, 0));

  if ((std::fabs(theta() - Type(
# 88 "./src/lib/matrix/matrix/Euler.hpp" 3 4
                               3.14159265358979323846 
# 88 "./src/lib/matrix/matrix/Euler.hpp"
                                    / 2))) < Type(1.0e-3)) {
   phi() = 0;
   psi() = std::atan2(dcm(1, 2), dcm(0, 2));

  } else if ((std::fabs(theta() + Type(
# 92 "./src/lib/matrix/matrix/Euler.hpp" 3 4
                                      3.14159265358979323846 
# 92 "./src/lib/matrix/matrix/Euler.hpp"
                                           / 2))) < Type(1.0e-3)) {
   phi() = 0;
   psi() = std::atan2(-dcm(1, 2), -dcm(0, 2));

  } else {
   phi() = std::atan2(dcm(2, 1), dcm(2, 2));
   psi() = std::atan2(dcm(1, 0), dcm(0, 0));
  }
 }
# 112 "./src/lib/matrix/matrix/Euler.hpp"
 Euler(const Quaternion<Type> &q) : Vector<Type, 3>(Euler(Dcm<Type>(q)))
 {
 }

 inline Type phi() const
 {
  return (*this)(0);
 }
 inline Type theta() const
 {
  return (*this)(1);
 }
 inline Type psi() const
 {
  return (*this)(2);
 }

 inline Type &phi()
 {
  return (*this)(0);
 }
 inline Type &theta()
 {
  return (*this)(1);
 }
 inline Type &psi()
 {
  return (*this)(2);
 }

};

using Eulerf = Euler<float>;
using Eulerd = Euler<double>;

}
# 8 "./src/lib/matrix/matrix/math.hpp" 2

# 1 "./src/lib/matrix/matrix/LeastSquaresSolver.hpp" 1
# 15 "./src/lib/matrix/matrix/LeastSquaresSolver.hpp"
       



namespace matrix
{

template<typename Type, size_t M, size_t N>
class LeastSquaresSolver
{
public:
# 36 "./src/lib/matrix/matrix/LeastSquaresSolver.hpp"
 LeastSquaresSolver(const Matrix<Type, M, N> &A)
 {
  static_assert(M >= N, "Matrix dimension should be M >= N");


  _A = A;

  for (size_t j = 0; j < N; j++) {
   Type normx = Type(0);

   for (size_t i = j; i < M; i++) {
    normx += _A(i, j) * _A(i, j);
   }

   normx = std::sqrt(normx);
   Type s = _A(j, j) > 0 ? Type(-1) : Type(1);
   Type u1 = _A(j, j) - s * normx;



   if (normx < Type(1e-8)) {
    break;
   }

   Type w[M] = {};
   w[0] = Type(1);

   for (size_t i = j + 1; i < M; i++) {
    w[i - j] = _A(i, j) / u1;
    _A(i, j) = w[i - j];
   }

   _A(j, j) = s * normx;
   _tau(j) = -s * u1 / normx;

   for (size_t k = j + 1; k < N; k++) {
    Type tmp = Type(0);

    for (size_t i = j; i < M; i++) {
     tmp += w[i - j] * _A(i, k);
    }

    for (size_t i = j; i < M; i++) {
     _A(i, k) -= _tau(j) * w[i - j] * tmp;
    }
   }

  }
 }
# 94 "./src/lib/matrix/matrix/LeastSquaresSolver.hpp"
 Vector<Type, M> qtb(const Vector<Type, M> &b)
 {
  Vector<Type, M> qtbv = b;

  for (size_t j = 0; j < N; j++) {
   Type w[M];
   w[0] = Type(1);


   for (size_t i = j + 1; i < M; i++) {
    w[i - j] = _A(i, j);
   }

   Type tmp = Type(0);

   for (size_t i = j; i < M; i++) {
    tmp += w[i - j] * qtbv(i);
   }

   for (size_t i = j; i < M; i++) {
    qtbv(i) -= _tau(j) * w[i - j] * tmp;
   }
  }

  return qtbv;
 }
# 129 "./src/lib/matrix/matrix/LeastSquaresSolver.hpp"
 Vector<Type, N> solve(const Vector<Type, M> &b)
 {
  Vector<Type, M> qtbv = qtb(b);
  Vector<Type, N> x;


  for (size_t i = N - 1; i < N; i--) {
   printf("i %d\n", static_cast<int>(i));
   x(i) = qtbv(i);

   for (size_t r = i + 1; r < N; r++) {
    x(i) -= _A(i, r) * x(r);
   }


   if (isEqualF(_A(i, i), Type(0), Type(1e-8))) {
    for (size_t z = 0; z < N; z++) {
     x(z) = Type(0);
    }

    break;
   }

   x(i) /= _A(i, i);
  }

  return x;
 }

private:
 Matrix<Type, M, N> _A;
 Vector<Type, N> _tau;

};

}
# 10 "./src/lib/matrix/matrix/math.hpp" 2

# 1 "./src/lib/matrix/matrix/PseudoInverse.hpp" 1
# 10 "./src/lib/matrix/matrix/PseudoInverse.hpp"
       




namespace matrix
{







template<typename Type, size_t M, size_t N>
bool geninv(const Matrix<Type, M, N> &G, Matrix<Type, N, M> &res)
{
 size_t rank;

 if (M <= N) {
  SquareMatrix<Type, M> A = G * G.transpose();
  SquareMatrix<Type, M> L = fullRankCholesky(A, rank);

  A = L.transpose() * L;
  SquareMatrix<Type, M> X;

  if (!inv(A, X, rank)) {
   res = Matrix<Type, N, M>();
   return false;
  }


  A = X * X * L.transpose();
  res = G.transpose() * (L * A);

 } else {
  SquareMatrix<Type, N> A = G.transpose() * G;
  SquareMatrix<Type, N> L = fullRankCholesky(A, rank);

  A = L.transpose() * L;
  SquareMatrix<Type, N> X;

  if (!inv(A, X, rank)) {
   res = Matrix<Type, N, M>();
   return false;
  }


  A = X * X * L.transpose();
  res = (L * A) * G.transpose();
 }

 return true;
}


template<typename Type>
Type typeEpsilon();

template<> inline
float typeEpsilon<float>()
{
 return 1.19209289550781250000000000000000000e-7F;
}




template<typename Type, size_t N>
SquareMatrix<Type, N> fullRankCholesky(const SquareMatrix<Type, N> &A,
           size_t &rank)
{

 const Type tol = N * typeEpsilon<Type>() * A.diag().max();

 Matrix<Type, N, N> L;

 size_t r = 0;

 for (size_t k = 0; k < N; k++) {

  if (r == 0) {
   for (size_t i = k; i < N; i++) {
    L(i, r) = A(i, k);
   }

  } else {
   for (size_t i = k; i < N; i++) {

    Type LL = Type();

    for (size_t j = 0; j < r; j++) {
     LL += L(i, j) * L(k, j);
    }

    L(i, r) = A(i, k) - LL;
   }
  }

  if (L(k, r) > tol) {
   L(k, r) = std::sqrt(L(k, r));

   if (k < N - 1) {
    for (size_t i = k + 1; i < N; i++) {
     L(i, r) = L(i, r) / L(k, r);
    }
   }

   r = r + 1;
  }
 }


 rank = r;

 return L;
}

}
# 12 "./src/lib/matrix/matrix/math.hpp" 2
# 1 "./src/lib/matrix/matrix/Quaternion.hpp" 1
# 29 "./src/lib/matrix/matrix/Quaternion.hpp"
       




# 1 "./src/lib/matrix/matrix/Vector4.hpp" 1
# 42 "./src/lib/matrix/matrix/Vector4.hpp"
       



namespace matrix
{

template<typename Type>
class Vector4 : public Vector<Type, 4>
{
public:
 using Matrix41 = Matrix<Type, 4, 1>;

 Vector4() = default;

 Vector4(const Matrix41 &other) :
  Vector<Type, 4>(other)
 {
 }

 explicit Vector4(const Type data_[3]) :
  Vector<Type, 4>(data_)
 {
 }

 Vector4(Type x1, Type x2, Type x3, Type x4)
 {
  Vector4 &v(*this);
  v(0) = x1;
  v(1) = x2;
  v(2) = x3;
  v(3) = x4;
 }

 template<size_t P, size_t Q>
 Vector4(const Slice<Type, 4, 1, P, Q> &slice_in) : Vector<Type, 4>(slice_in)
 {
 }

 template<size_t P, size_t Q>
 Vector4(const Slice<Type, 1, 4, P, Q> &slice_in) : Vector<Type, 4>(slice_in)
 {
 }





 Vector4 operator+(Vector4 other) const
 {
  return Matrix41::operator+(other);
 }

 Vector4 operator+(Type scalar) const
 {
  return Matrix41::operator+(scalar);
 }

 Vector4 operator-(Vector4 other) const
 {
  return Matrix41::operator-(other);
 }

 Vector4 operator-(Type scalar) const
 {
  return Matrix41::operator-(scalar);
 }

 Vector4 operator-() const
 {
  return Matrix41::operator-();
 }

 Vector4 operator*(Type scalar) const
 {
  return Matrix41::operator*(scalar);
 }

 Type operator*(Vector4 b) const
 {
  return Vector<Type, 4>::operator*(b);
 }

};

using Vector4f = Vector4<float>;

}
# 35 "./src/lib/matrix/matrix/Quaternion.hpp" 2

namespace matrix
{

template <typename Type>
class Euler;

template <typename Type>
class AxisAngle;







template<typename Type>
class Quaternion : public Vector4<Type>
{
public:
 using Matrix41 = Matrix<Type, 4, 1>;
 using Matrix31 = Matrix<Type, 3, 1>;






 explicit Quaternion(const Type data_[4]) :
  Vector4<Type>(data_)
 {
 }




 Quaternion()
 {
  Quaternion &q = *this;
  q(0) = 1;
  q(1) = 0;
  q(2) = 0;
  q(3) = 0;
 }






 Quaternion(const Matrix41 &other) :
  Vector4<Type>(other)
 {
 }
# 98 "./src/lib/matrix/matrix/Quaternion.hpp"
 Quaternion(const Dcm<Type> &R)
 {
  Quaternion &q = *this;
  Type t = R.trace();

  if (t > Type(0)) {
   t = std::sqrt(Type(1) + t);
   q(0) = Type(0.5) * t;
   t = Type(0.5) / t;
   q(1) = (R(2, 1) - R(1, 2)) * t;
   q(2) = (R(0, 2) - R(2, 0)) * t;
   q(3) = (R(1, 0) - R(0, 1)) * t;

  } else if (R(0, 0) > R(1, 1) && R(0, 0) > R(2, 2)) {
   t = std::sqrt(Type(1) + R(0, 0) - R(1, 1) - R(2, 2));
   q(1) = Type(0.5) * t;
   t = Type(0.5) / t;
   q(0) = (R(2, 1) - R(1, 2)) * t;
   q(2) = (R(1, 0) + R(0, 1)) * t;
   q(3) = (R(0, 2) + R(2, 0)) * t;

  } else if (R(1, 1) > R(2, 2)) {
   t = std::sqrt(Type(1) - R(0, 0) + R(1, 1) - R(2, 2));
   q(2) = Type(0.5) * t;
   t = Type(0.5) / t;
   q(0) = (R(0, 2) - R(2, 0)) * t;
   q(1) = (R(1, 0) + R(0, 1)) * t;
   q(3) = (R(2, 1) + R(1, 2)) * t;

  } else {
   t = std::sqrt(Type(1) - R(0, 0) - R(1, 1) + R(2, 2));
   q(3) = Type(0.5) * t;
   t = Type(0.5) / t;
   q(0) = (R(1, 0) - R(0, 1)) * t;
   q(1) = (R(0, 2) + R(2, 0)) * t;
   q(2) = (R(2, 1) + R(1, 2)) * t;
  }
 }
# 146 "./src/lib/matrix/matrix/Quaternion.hpp"
 Quaternion(const Euler<Type> &euler)
 {
  Quaternion &q = *this;
  Type cosPhi_2 = Type(std::cos(euler.phi() / Type(2)));
  Type cosTheta_2 = Type(std::cos(euler.theta() / Type(2)));
  Type cosPsi_2 = Type(std::cos(euler.psi() / Type(2)));
  Type sinPhi_2 = Type(std::sin(euler.phi() / Type(2)));
  Type sinTheta_2 = Type(std::sin(euler.theta() / Type(2)));
  Type sinPsi_2 = Type(std::sin(euler.psi() / Type(2)));
  q(0) = cosPhi_2 * cosTheta_2 * cosPsi_2 +
         sinPhi_2 * sinTheta_2 * sinPsi_2;
  q(1) = sinPhi_2 * cosTheta_2 * cosPsi_2 -
         cosPhi_2 * sinTheta_2 * sinPsi_2;
  q(2) = cosPhi_2 * sinTheta_2 * cosPsi_2 +
         sinPhi_2 * cosTheta_2 * sinPsi_2;
  q(3) = cosPhi_2 * cosTheta_2 * sinPsi_2 -
         sinPhi_2 * sinTheta_2 * cosPsi_2;
 }






 Quaternion(const AxisAngle<Type> &aa)
 {
  Quaternion &q = *this;
  Type angle = aa.norm();
  Vector<Type, 3> axis = aa.unit();

  if (angle < Type(1e-10)) {
   q(0) = Type(1);
   q(1) = q(2) = q(3) = 0;

  } else {
   Type magnitude = std::sin(angle / Type(2));
   q(0) = std::cos(angle / Type(2));
   q(1) = axis(0) * magnitude;
   q(2) = axis(1) * magnitude;
   q(3) = axis(2) * magnitude;
  }
 }
# 197 "./src/lib/matrix/matrix/Quaternion.hpp"
 Quaternion(const Vector3<Type> &src, const Vector3<Type> &dst, const Type eps = Type(1e-5))
 {
  Quaternion &q = *this;
  Vector3<Type> cr = src.cross(dst);
  const float dt = src.dot(dst);

  if (cr.norm() < eps && dt < 0) {



   cr = src.abs();

   if (cr(0) < cr(1)) {
    if (cr(0) < cr(2)) {
     cr = Vector3<Type>(1, 0, 0);

    } else {
     cr = Vector3<Type>(0, 0, 1);
    }

   } else {
    if (cr(1) < cr(2)) {
     cr = Vector3<Type>(0, 1, 0);

    } else {
     cr = Vector3<Type>(0, 0, 1);
    }
   }

   q(0) = Type(0);
   cr = src.cross(cr);

  } else {

   q(0) = dt + std::sqrt(src.norm_squared() * dst.norm_squared());
  }

  q(1) = cr(0);
  q(2) = cr(1);
  q(3) = cr(2);
  q.normalize();
 }
# 252 "./src/lib/matrix/matrix/Quaternion.hpp"
 Quaternion(Type a, Type b, Type c, Type d)
 {
  Quaternion &q = *this;
  q(0) = a;
  q(1) = b;
  q(2) = c;
  q(3) = d;
 }







 Quaternion operator*(const Quaternion &p) const
 {
  const Quaternion &q = *this;
  return {
   q(0) *p(0) - q(1) *p(1) - q(2) *p(2) - q(3) *p(3),
   q(1) *p(0) + q(0) *p(1) - q(3) *p(2) + q(2) *p(3),
   q(2) *p(0) + q(3) *p(1) + q(0) *p(2) - q(1) *p(3),
   q(3) *p(0) - q(2) *p(1) + q(1) *p(2) + q(0) *p(3) };
 }






 void operator*=(const Quaternion &other)
 {
  Quaternion &self = *this;
  self = self * other;
 }







 Quaternion operator*(Type scalar) const
 {
  const Quaternion &q = *this;
  return scalar * q;
 }






 void operator*=(Type scalar)
 {
  Quaternion &q = *this;
  q = q * scalar;
 }
# 319 "./src/lib/matrix/matrix/Quaternion.hpp"
 Matrix41 derivative1(const Matrix31 &w) const
 {
  const Quaternion &q = *this;
  Quaternion<Type> v(0, w(0, 0), w(1, 0), w(2, 0));
  return q * v * Type(0.5);
 }
# 334 "./src/lib/matrix/matrix/Quaternion.hpp"
 Matrix41 derivative2(const Matrix31 &w) const
 {
  const Quaternion &q = *this;
  Quaternion<Type> v(0, w(0, 0), w(1, 0), w(2, 0));
  return v * q * Type(0.5);
 }
# 361 "./src/lib/matrix/matrix/Quaternion.hpp"
 static Quaternion expq(const Vector3<Type> &u)
 {
  const Type tol = Type(0.2);
  const Type c2 = Type(1.0 / 2.0);
  const Type c3 = Type(1.0 / 6.0);
  const Type c4 = Type(1.0 / 24.0);
  const Type c5 = Type(1.0 / 120.0);
  const Type c6 = Type(1.0 / 720.0);
  const Type c7 = Type(1.0 / 5040.0);

  Type u_norm = u.norm();
  Type sinc_u, cos_u;

  if (u_norm < tol) {
   Type u2 = u_norm * u_norm;
   Type u4 = u2 * u2;
   Type u6 = u4 * u2;


   sinc_u = Type(1.0) - u2 * c3 + u4 * c5 - u6 * c7;
   cos_u = Type(1.0) - u2 * c2 + u4 * c4 - u6 * c6;

  } else {
   sinc_u = Type(std::sin(u_norm) / u_norm);
   cos_u = Type(std::cos(u_norm));
  }

  Vector<Type, 3> v = sinc_u * u;
  return Quaternion<Type> (cos_u, v(0), v(1), v(2));
 }
# 402 "./src/lib/matrix/matrix/Quaternion.hpp"
 static Dcm<Type> inv_r_jacobian(const Vector3<Type> &u)
 {
  const Type tol = Type(1.0e-4);
  Type u_norm = u.norm();
  Dcm<Type> u_hat = u.hat();

  if (u_norm < tol) {
   return Type(0.5) * (Dcm<Type>() + u_hat + (Type(1.0 / 3.0) + u_norm * u_norm / Type(45.0)) * u_hat * u_hat);

  } else {
   return Type(0.5) * (Dcm<Type>() + u_hat + (Type(1.0) - u_norm * Type(std::cos(u_norm) / std::sin(u_norm))) /
         (u_norm * u_norm) * u_hat * u_hat);
  }
 }




 void invert()
 {
  *this = this->inversed();
 }






 Quaternion inversed() const
 {
  const Quaternion &q = *this;
  Type normSq = q.dot(q);
  return Quaternion(
          q(0) / normSq,
          -q(1) / normSq,
          -q(2) / normSq,
          -q(3) / normSq);
 }




 void canonicalize()
 {
  *this = this->canonical();
 }






 Quaternion canonical() const
 {
  const Quaternion &q = *this;

  for (size_t i = 0; i < 4; i++) {
   if (std::fabs(q(i)) > 1.19209289550781250000000000000000000e-7F) {
    return q * Type(sign(q(i)));
   }
  }

  return q;
 }






 void rotate(const AxisAngle<Type> &vec)
 {
  Quaternion res(vec);
  (*this) = res * (*this);
 }
# 487 "./src/lib/matrix/matrix/Quaternion.hpp"
 Vector3<Type> rotateVector(const Vector3<Type> &vec) const
 {
  const Quaternion &q = *this;
  Quaternion v(Type(0), vec(0), vec(1), vec(2));
  Quaternion res = q * v * q.inversed();
  return Vector3<Type>(res(1), res(2), res(3));
 }
# 504 "./src/lib/matrix/matrix/Quaternion.hpp"
 Vector3<Type> rotateVectorInverse(const Vector3<Type> &vec) const
 {
  const Quaternion &q = *this;
  Quaternion v(Type(0), vec(0), vec(1), vec(2));
  Quaternion res = q.inversed() * v * q;
  return Vector3<Type>(res(1), res(2), res(3));
 }




 Vector3<Type> imag() const
 {
  const Quaternion &q = *this;
  return Vector3<Type>(q(1), q(2), q(3));
 }
# 528 "./src/lib/matrix/matrix/Quaternion.hpp"
 Vector3<Type> dcm_z() const
 {
  const Quaternion &q = *this;
  Vector3<Type> R_z;
  const Type a = q(0);
  const Type b = q(1);
  const Type c = q(2);
  const Type d = q(3);
  R_z(0) = 2 * (a * c + b * d);
  R_z(1) = 2 * (c * d - a * b);
  R_z(2) = a * a - b * b - c * c + d * d;
  return R_z;
 }
};

using Quatf = Quaternion<float>;
using Quaternionf = Quaternion<float>;

using Quatd = Quaternion<double>;
using Quaterniond = Quaternion<double>;

}
# 13 "./src/lib/matrix/matrix/math.hpp" 2


# 1 "./src/lib/matrix/matrix/SparseVector.hpp" 1
# 11 "./src/lib/matrix/matrix/SparseVector.hpp"
       



namespace matrix
{
template<int N> struct force_constexpr_eval {
 static const int value = N;
};



template<typename Type, size_t M, size_t... Idxs>
class SparseVector
{
private:
 static constexpr size_t N = sizeof...(Idxs);
 static constexpr size_t _indices[N] {Idxs...};

 static constexpr bool duplicateIndices()
 {
  for (size_t i = 0; i < N; i++) {
   for (size_t j = 0; j < i; j++) {
    if (_indices[i] == _indices[j]) {
     return true;
    }
   }
  }

  return false;
 }
 static constexpr size_t findMaxIndex()
 {
  size_t maxIndex = 0;

  for (size_t i = 0; i < N; i++) {
   if (maxIndex < _indices[i]) {
    maxIndex = _indices[i];
   }
  }

  return maxIndex;
 }

 static_assert(!duplicateIndices(), "Duplicate indices");
 static_assert(N < M, "More entries than elements, use a dense vector");
 static_assert(N > 0, "A sparse vector needs at least one element");
 static_assert(findMaxIndex() < M, "Largest entry doesn't fit in sparse vector");

 Type _data[N] {};

 static constexpr int findCompressedIndex(size_t index)
 {
  int compressedIndex = -1;

  for (size_t i = 0; i < N; i++) {
   if (index == _indices[i]) {
    compressedIndex = static_cast<int>(i);
   }
  }

  return compressedIndex;
 }

public:
 constexpr size_t non_zeros() const
 {
  return N;
 }

 constexpr size_t index(size_t i) const
 {
  return SparseVector::_indices[i];
 }

 SparseVector() = default;

 SparseVector(const matrix::Vector<Type, M> &data)
 {
  for (size_t i = 0; i < N; i++) {
   _data[i] = data(_indices[i]);
  }
 }

 explicit SparseVector(const Type data[N])
 {
  memcpy(_data, data, sizeof(_data));
 }

 template <size_t i>
 inline Type at() const
 {
  static constexpr int compressed_index = force_constexpr_eval<findCompressedIndex(i)>::value;
  static_assert(compressed_index >= 0, "cannot access unpopulated indices");
  return _data[compressed_index];
 }

 template <size_t i>
 inline Type &at()
 {
  static constexpr int compressed_index = force_constexpr_eval<findCompressedIndex(i)>::value;
  static_assert(compressed_index >= 0, "cannot access unpopulated indices");
  return _data[compressed_index];
 }

 inline Type atCompressedIndex(size_t i) const
 {
  
# 118 "./src/lib/matrix/matrix/SparseVector.hpp" 3 4
 (static_cast <bool> (
# 118 "./src/lib/matrix/matrix/SparseVector.hpp"
 i < N
# 118 "./src/lib/matrix/matrix/SparseVector.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 118 "./src/lib/matrix/matrix/SparseVector.hpp"
 "i < N"
# 118 "./src/lib/matrix/matrix/SparseVector.hpp" 3 4
 , "./src/lib/matrix/matrix/SparseVector.hpp", 118, __extension__ __PRETTY_FUNCTION__))
# 118 "./src/lib/matrix/matrix/SparseVector.hpp"
              ;
  return _data[i];
 }

 inline Type &atCompressedIndex(size_t i)
 {
  
# 124 "./src/lib/matrix/matrix/SparseVector.hpp" 3 4
 (static_cast <bool> (
# 124 "./src/lib/matrix/matrix/SparseVector.hpp"
 i < N
# 124 "./src/lib/matrix/matrix/SparseVector.hpp" 3 4
 ) ? void (0) : __assert_fail (
# 124 "./src/lib/matrix/matrix/SparseVector.hpp"
 "i < N"
# 124 "./src/lib/matrix/matrix/SparseVector.hpp" 3 4
 , "./src/lib/matrix/matrix/SparseVector.hpp", 124, __extension__ __PRETTY_FUNCTION__))
# 124 "./src/lib/matrix/matrix/SparseVector.hpp"
              ;
  return _data[i];
 }

 void setZero()
 {
  for (size_t i = 0; i < N; i++) {
   _data[i] = Type(0);
  }
 }

 Type dot(const matrix::Vector<Type, M> &other) const
 {
  Type accum(0);

  for (size_t i = 0; i < N; i++) {
   accum += _data[i] * other(_indices[i]);
  }

  return accum;
 }

 matrix::Vector<Type, M> operator+(const matrix::Vector<Type, M> &other) const
 {
  matrix::Vector<Type, M> vec = other;

  for (size_t i = 0; i < N; i++) {
   vec(_indices[i]) += _data[i];
  }

  return vec;
 }

 SparseVector &operator+=(Type t)
 {
  for (size_t i = 0; i < N; i++) {
   _data[i] += t;
  }

  return *this;
 }

 Type norm_squared() const
 {
  Type accum(0);

  for (size_t i = 0; i < N; i++) {
   accum += _data[i] * _data[i];
  }

  return accum;
 }

 Type norm() const
 {
  return std::sqrt(norm_squared());
 }

 bool longerThan(Type testVal) const
 {
  return norm_squared() > testVal * testVal;
 }
};

template<typename Type, size_t Q, size_t M, size_t ... Idxs>
matrix::Vector<Type, Q> operator*(const matrix::Matrix<Type, Q, M> &mat,
      const matrix::SparseVector<Type, M, Idxs...> &vec)
{
 matrix::Vector<Type, Q> res;

 for (size_t i = 0; i < Q; i++) {
  const Vector<Type, M> row = mat.row(i);
  res(i) = vec.dot(row);
 }

 return res;
}


template<typename Type, size_t M, size_t ... Idxs>
Type quadraticForm(const matrix::SquareMatrix<Type, M> &A, const matrix::SparseVector<Type, M, Idxs...> &x)
{
 Type res = Type(0);

 for (size_t i = 0; i < x.non_zeros(); i++) {
  Type tmp = Type(0);

  for (size_t j = 0; j < x.non_zeros(); j++) {
   tmp += A(x.index(i), x.index(j)) * x.atCompressedIndex(j);
  }

  res += x.atCompressedIndex(i) * tmp;
 }

 return res;
}

template<typename Type, size_t M, size_t... Idxs>
constexpr size_t SparseVector<Type, M, Idxs...>::_indices[SparseVector<Type, M, Idxs...>::N];

template<size_t M, size_t ... Idxs>
using SparseVectorf = SparseVector<float, M, Idxs...>;

}
# 16 "./src/lib/matrix/matrix/math.hpp" 2
# 52 "./src/lib/battery/battery.h" 2

# 1 "./src/drivers/drv_hrt.h" 1
# 40 "./src/drivers/drv_hrt.h"
       




# 1 "/usr/include/inttypes.h" 1 3 4
# 266 "/usr/include/inttypes.h" 3 4

# 266 "/usr/include/inttypes.h" 3 4
extern "C" {




typedef struct
  {
    long int quot;
    long int rem;
  } imaxdiv_t;
# 290 "/usr/include/inttypes.h" 3 4
extern intmax_t imaxabs (intmax_t __n) throw () __attribute__ ((__const__));


extern imaxdiv_t imaxdiv (intmax_t __numer, intmax_t __denom)
      throw () __attribute__ ((__const__));


extern intmax_t strtoimax (const char *__restrict __nptr,
      char **__restrict __endptr, int __base) throw ();


extern uintmax_t strtoumax (const char *__restrict __nptr,
       char ** __restrict __endptr, int __base) throw ();


extern intmax_t wcstoimax (const wchar_t *__restrict __nptr,
      wchar_t **__restrict __endptr, int __base)
     throw ();


extern uintmax_t wcstoumax (const wchar_t *__restrict __nptr,
       wchar_t ** __restrict __endptr, int __base)
     throw ();
# 432 "/usr/include/inttypes.h" 3 4
}
# 46 "./src/drivers/drv_hrt.h" 2

# 1 "./platforms/common/include/px4_platform_common/time.h" 1
       

# 1 "/usr/include/unistd.h" 1 3 4
# 27 "/usr/include/unistd.h" 3 4
extern "C" {
# 202 "/usr/include/unistd.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/posix_opt.h" 1 3 4
# 203 "/usr/include/unistd.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/environments.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/environments.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/environments.h" 2 3 4
# 207 "/usr/include/unistd.h" 2 3 4
# 226 "/usr/include/unistd.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h" 1 3 4
# 227 "/usr/include/unistd.h" 2 3 4
# 274 "/usr/include/unistd.h" 3 4
typedef __socklen_t socklen_t;
# 287 "/usr/include/unistd.h" 3 4
extern int access (const char *__name, int __type) throw () __attribute__ ((__nonnull__ (1)));




extern int euidaccess (const char *__name, int __type)
     throw () __attribute__ ((__nonnull__ (1)));


extern int eaccess (const char *__name, int __type)
     throw () __attribute__ ((__nonnull__ (1)));






extern int faccessat (int __fd, const char *__file, int __type, int __flag)
     throw () __attribute__ ((__nonnull__ (2))) ;
# 334 "/usr/include/unistd.h" 3 4
extern __off_t lseek (int __fd, __off_t __offset, int __whence) throw ();
# 345 "/usr/include/unistd.h" 3 4
extern __off64_t lseek64 (int __fd, __off64_t __offset, int __whence)
     throw ();






extern int close (int __fd);






extern ssize_t read (int __fd, void *__buf, size_t __nbytes) ;





extern ssize_t write (int __fd, const void *__buf, size_t __n) ;
# 376 "/usr/include/unistd.h" 3 4
extern ssize_t pread (int __fd, void *__buf, size_t __nbytes,
        __off_t __offset) ;






extern ssize_t pwrite (int __fd, const void *__buf, size_t __n,
         __off_t __offset) ;
# 404 "/usr/include/unistd.h" 3 4
extern ssize_t pread64 (int __fd, void *__buf, size_t __nbytes,
   __off64_t __offset) ;


extern ssize_t pwrite64 (int __fd, const void *__buf, size_t __n,
    __off64_t __offset) ;







extern int pipe (int __pipedes[2]) throw () ;




extern int pipe2 (int __pipedes[2], int __flags) throw () ;
# 432 "/usr/include/unistd.h" 3 4
extern unsigned int alarm (unsigned int __seconds) throw ();
# 444 "/usr/include/unistd.h" 3 4
extern unsigned int sleep (unsigned int __seconds);







extern __useconds_t ualarm (__useconds_t __value, __useconds_t __interval)
     throw ();






extern int usleep (__useconds_t __useconds);
# 469 "/usr/include/unistd.h" 3 4
extern int pause (void);



extern int chown (const char *__file, __uid_t __owner, __gid_t __group)
     throw () __attribute__ ((__nonnull__ (1))) ;



extern int fchown (int __fd, __uid_t __owner, __gid_t __group) throw () ;




extern int lchown (const char *__file, __uid_t __owner, __gid_t __group)
     throw () __attribute__ ((__nonnull__ (1))) ;






extern int fchownat (int __fd, const char *__file, __uid_t __owner,
       __gid_t __group, int __flag)
     throw () __attribute__ ((__nonnull__ (2))) ;



extern int chdir (const char *__path) throw () __attribute__ ((__nonnull__ (1))) ;



extern int fchdir (int __fd) throw () ;
# 511 "/usr/include/unistd.h" 3 4
extern char *getcwd (char *__buf, size_t __size) throw () ;





extern char *get_current_dir_name (void) throw ();







extern char *getwd (char *__buf)
     throw () __attribute__ ((__nonnull__ (1))) __attribute__ ((__deprecated__)) ;




extern int dup (int __fd) throw () ;


extern int dup2 (int __fd, int __fd2) throw ();




extern int dup3 (int __fd, int __fd2, int __flags) throw ();



extern char **__environ;

extern char **environ;





extern int execve (const char *__path, char *const __argv[],
     char *const __envp[]) throw () __attribute__ ((__nonnull__ (1, 2)));




extern int fexecve (int __fd, char *const __argv[], char *const __envp[])
     throw () __attribute__ ((__nonnull__ (2)));




extern int execv (const char *__path, char *const __argv[])
     throw () __attribute__ ((__nonnull__ (1, 2)));



extern int execle (const char *__path, const char *__arg, ...)
     throw () __attribute__ ((__nonnull__ (1, 2)));



extern int execl (const char *__path, const char *__arg, ...)
     throw () __attribute__ ((__nonnull__ (1, 2)));



extern int execvp (const char *__file, char *const __argv[])
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern int execlp (const char *__file, const char *__arg, ...)
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern int execvpe (const char *__file, char *const __argv[],
      char *const __envp[])
     throw () __attribute__ ((__nonnull__ (1, 2)));





extern int nice (int __inc) throw () ;




extern void _exit (int __status) __attribute__ ((__noreturn__));





# 1 "/usr/include/x86_64-linux-gnu/bits/confname.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/confname.h" 3 4
enum
  {
    _PC_LINK_MAX,

    _PC_MAX_CANON,

    _PC_MAX_INPUT,

    _PC_NAME_MAX,

    _PC_PATH_MAX,

    _PC_PIPE_BUF,

    _PC_CHOWN_RESTRICTED,

    _PC_NO_TRUNC,

    _PC_VDISABLE,

    _PC_SYNC_IO,

    _PC_ASYNC_IO,

    _PC_PRIO_IO,

    _PC_SOCK_MAXBUF,

    _PC_FILESIZEBITS,

    _PC_REC_INCR_XFER_SIZE,

    _PC_REC_MAX_XFER_SIZE,

    _PC_REC_MIN_XFER_SIZE,

    _PC_REC_XFER_ALIGN,

    _PC_ALLOC_SIZE_MIN,

    _PC_SYMLINK_MAX,

    _PC_2_SYMLINKS

  };


enum
  {
    _SC_ARG_MAX,

    _SC_CHILD_MAX,

    _SC_CLK_TCK,

    _SC_NGROUPS_MAX,

    _SC_OPEN_MAX,

    _SC_STREAM_MAX,

    _SC_TZNAME_MAX,

    _SC_JOB_CONTROL,

    _SC_SAVED_IDS,

    _SC_REALTIME_SIGNALS,

    _SC_PRIORITY_SCHEDULING,

    _SC_TIMERS,

    _SC_ASYNCHRONOUS_IO,

    _SC_PRIORITIZED_IO,

    _SC_SYNCHRONIZED_IO,

    _SC_FSYNC,

    _SC_MAPPED_FILES,

    _SC_MEMLOCK,

    _SC_MEMLOCK_RANGE,

    _SC_MEMORY_PROTECTION,

    _SC_MESSAGE_PASSING,

    _SC_SEMAPHORES,

    _SC_SHARED_MEMORY_OBJECTS,

    _SC_AIO_LISTIO_MAX,

    _SC_AIO_MAX,

    _SC_AIO_PRIO_DELTA_MAX,

    _SC_DELAYTIMER_MAX,

    _SC_MQ_OPEN_MAX,

    _SC_MQ_PRIO_MAX,

    _SC_VERSION,

    _SC_PAGESIZE,


    _SC_RTSIG_MAX,

    _SC_SEM_NSEMS_MAX,

    _SC_SEM_VALUE_MAX,

    _SC_SIGQUEUE_MAX,

    _SC_TIMER_MAX,




    _SC_BC_BASE_MAX,

    _SC_BC_DIM_MAX,

    _SC_BC_SCALE_MAX,

    _SC_BC_STRING_MAX,

    _SC_COLL_WEIGHTS_MAX,

    _SC_EQUIV_CLASS_MAX,

    _SC_EXPR_NEST_MAX,

    _SC_LINE_MAX,

    _SC_RE_DUP_MAX,

    _SC_CHARCLASS_NAME_MAX,


    _SC_2_VERSION,

    _SC_2_C_BIND,

    _SC_2_C_DEV,

    _SC_2_FORT_DEV,

    _SC_2_FORT_RUN,

    _SC_2_SW_DEV,

    _SC_2_LOCALEDEF,


    _SC_PII,

    _SC_PII_XTI,

    _SC_PII_SOCKET,

    _SC_PII_INTERNET,

    _SC_PII_OSI,

    _SC_POLL,

    _SC_SELECT,

    _SC_UIO_MAXIOV,

    _SC_IOV_MAX = _SC_UIO_MAXIOV,

    _SC_PII_INTERNET_STREAM,

    _SC_PII_INTERNET_DGRAM,

    _SC_PII_OSI_COTS,

    _SC_PII_OSI_CLTS,

    _SC_PII_OSI_M,

    _SC_T_IOV_MAX,



    _SC_THREADS,

    _SC_THREAD_SAFE_FUNCTIONS,

    _SC_GETGR_R_SIZE_MAX,

    _SC_GETPW_R_SIZE_MAX,

    _SC_LOGIN_NAME_MAX,

    _SC_TTY_NAME_MAX,

    _SC_THREAD_DESTRUCTOR_ITERATIONS,

    _SC_THREAD_KEYS_MAX,

    _SC_THREAD_STACK_MIN,

    _SC_THREAD_THREADS_MAX,

    _SC_THREAD_ATTR_STACKADDR,

    _SC_THREAD_ATTR_STACKSIZE,

    _SC_THREAD_PRIORITY_SCHEDULING,

    _SC_THREAD_PRIO_INHERIT,

    _SC_THREAD_PRIO_PROTECT,

    _SC_THREAD_PROCESS_SHARED,


    _SC_NPROCESSORS_CONF,

    _SC_NPROCESSORS_ONLN,

    _SC_PHYS_PAGES,

    _SC_AVPHYS_PAGES,

    _SC_ATEXIT_MAX,

    _SC_PASS_MAX,


    _SC_XOPEN_VERSION,

    _SC_XOPEN_XCU_VERSION,

    _SC_XOPEN_UNIX,

    _SC_XOPEN_CRYPT,

    _SC_XOPEN_ENH_I18N,

    _SC_XOPEN_SHM,


    _SC_2_CHAR_TERM,

    _SC_2_C_VERSION,

    _SC_2_UPE,


    _SC_XOPEN_XPG2,

    _SC_XOPEN_XPG3,

    _SC_XOPEN_XPG4,


    _SC_CHAR_BIT,

    _SC_CHAR_MAX,

    _SC_CHAR_MIN,

    _SC_INT_MAX,

    _SC_INT_MIN,

    _SC_LONG_BIT,

    _SC_WORD_BIT,

    _SC_MB_LEN_MAX,

    _SC_NZERO,

    _SC_SSIZE_MAX,

    _SC_SCHAR_MAX,

    _SC_SCHAR_MIN,

    _SC_SHRT_MAX,

    _SC_SHRT_MIN,

    _SC_UCHAR_MAX,

    _SC_UINT_MAX,

    _SC_ULONG_MAX,

    _SC_USHRT_MAX,


    _SC_NL_ARGMAX,

    _SC_NL_LANGMAX,

    _SC_NL_MSGMAX,

    _SC_NL_NMAX,

    _SC_NL_SETMAX,

    _SC_NL_TEXTMAX,


    _SC_XBS5_ILP32_OFF32,

    _SC_XBS5_ILP32_OFFBIG,

    _SC_XBS5_LP64_OFF64,

    _SC_XBS5_LPBIG_OFFBIG,


    _SC_XOPEN_LEGACY,

    _SC_XOPEN_REALTIME,

    _SC_XOPEN_REALTIME_THREADS,


    _SC_ADVISORY_INFO,

    _SC_BARRIERS,

    _SC_BASE,

    _SC_C_LANG_SUPPORT,

    _SC_C_LANG_SUPPORT_R,

    _SC_CLOCK_SELECTION,

    _SC_CPUTIME,

    _SC_THREAD_CPUTIME,

    _SC_DEVICE_IO,

    _SC_DEVICE_SPECIFIC,

    _SC_DEVICE_SPECIFIC_R,

    _SC_FD_MGMT,

    _SC_FIFO,

    _SC_PIPE,

    _SC_FILE_ATTRIBUTES,

    _SC_FILE_LOCKING,

    _SC_FILE_SYSTEM,

    _SC_MONOTONIC_CLOCK,

    _SC_MULTI_PROCESS,

    _SC_SINGLE_PROCESS,

    _SC_NETWORKING,

    _SC_READER_WRITER_LOCKS,

    _SC_SPIN_LOCKS,

    _SC_REGEXP,

    _SC_REGEX_VERSION,

    _SC_SHELL,

    _SC_SIGNALS,

    _SC_SPAWN,

    _SC_SPORADIC_SERVER,

    _SC_THREAD_SPORADIC_SERVER,

    _SC_SYSTEM_DATABASE,

    _SC_SYSTEM_DATABASE_R,

    _SC_TIMEOUTS,

    _SC_TYPED_MEMORY_OBJECTS,

    _SC_USER_GROUPS,

    _SC_USER_GROUPS_R,

    _SC_2_PBS,

    _SC_2_PBS_ACCOUNTING,

    _SC_2_PBS_LOCATE,

    _SC_2_PBS_MESSAGE,

    _SC_2_PBS_TRACK,

    _SC_SYMLOOP_MAX,

    _SC_STREAMS,

    _SC_2_PBS_CHECKPOINT,


    _SC_V6_ILP32_OFF32,

    _SC_V6_ILP32_OFFBIG,

    _SC_V6_LP64_OFF64,

    _SC_V6_LPBIG_OFFBIG,


    _SC_HOST_NAME_MAX,

    _SC_TRACE,

    _SC_TRACE_EVENT_FILTER,

    _SC_TRACE_INHERIT,

    _SC_TRACE_LOG,


    _SC_LEVEL1_ICACHE_SIZE,

    _SC_LEVEL1_ICACHE_ASSOC,

    _SC_LEVEL1_ICACHE_LINESIZE,

    _SC_LEVEL1_DCACHE_SIZE,

    _SC_LEVEL1_DCACHE_ASSOC,

    _SC_LEVEL1_DCACHE_LINESIZE,

    _SC_LEVEL2_CACHE_SIZE,

    _SC_LEVEL2_CACHE_ASSOC,

    _SC_LEVEL2_CACHE_LINESIZE,

    _SC_LEVEL3_CACHE_SIZE,

    _SC_LEVEL3_CACHE_ASSOC,

    _SC_LEVEL3_CACHE_LINESIZE,

    _SC_LEVEL4_CACHE_SIZE,

    _SC_LEVEL4_CACHE_ASSOC,

    _SC_LEVEL4_CACHE_LINESIZE,



    _SC_IPV6 = _SC_LEVEL1_ICACHE_SIZE + 50,

    _SC_RAW_SOCKETS,


    _SC_V7_ILP32_OFF32,

    _SC_V7_ILP32_OFFBIG,

    _SC_V7_LP64_OFF64,

    _SC_V7_LPBIG_OFFBIG,


    _SC_SS_REPL_MAX,


    _SC_TRACE_EVENT_NAME_MAX,

    _SC_TRACE_NAME_MAX,

    _SC_TRACE_SYS_MAX,

    _SC_TRACE_USER_EVENT_MAX,


    _SC_XOPEN_STREAMS,


    _SC_THREAD_ROBUST_PRIO_INHERIT,

    _SC_THREAD_ROBUST_PRIO_PROTECT

  };


enum
  {
    _CS_PATH,


    _CS_V6_WIDTH_RESTRICTED_ENVS,



    _CS_GNU_LIBC_VERSION,

    _CS_GNU_LIBPTHREAD_VERSION,


    _CS_V5_WIDTH_RESTRICTED_ENVS,



    _CS_V7_WIDTH_RESTRICTED_ENVS,



    _CS_LFS_CFLAGS = 1000,

    _CS_LFS_LDFLAGS,

    _CS_LFS_LIBS,

    _CS_LFS_LINTFLAGS,

    _CS_LFS64_CFLAGS,

    _CS_LFS64_LDFLAGS,

    _CS_LFS64_LIBS,

    _CS_LFS64_LINTFLAGS,


    _CS_XBS5_ILP32_OFF32_CFLAGS = 1100,

    _CS_XBS5_ILP32_OFF32_LDFLAGS,

    _CS_XBS5_ILP32_OFF32_LIBS,

    _CS_XBS5_ILP32_OFF32_LINTFLAGS,

    _CS_XBS5_ILP32_OFFBIG_CFLAGS,

    _CS_XBS5_ILP32_OFFBIG_LDFLAGS,

    _CS_XBS5_ILP32_OFFBIG_LIBS,

    _CS_XBS5_ILP32_OFFBIG_LINTFLAGS,

    _CS_XBS5_LP64_OFF64_CFLAGS,

    _CS_XBS5_LP64_OFF64_LDFLAGS,

    _CS_XBS5_LP64_OFF64_LIBS,

    _CS_XBS5_LP64_OFF64_LINTFLAGS,

    _CS_XBS5_LPBIG_OFFBIG_CFLAGS,

    _CS_XBS5_LPBIG_OFFBIG_LDFLAGS,

    _CS_XBS5_LPBIG_OFFBIG_LIBS,

    _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS,


    _CS_POSIX_V6_ILP32_OFF32_CFLAGS,

    _CS_POSIX_V6_ILP32_OFF32_LDFLAGS,

    _CS_POSIX_V6_ILP32_OFF32_LIBS,

    _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS,

    _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS,

    _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS,

    _CS_POSIX_V6_ILP32_OFFBIG_LIBS,

    _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS,

    _CS_POSIX_V6_LP64_OFF64_CFLAGS,

    _CS_POSIX_V6_LP64_OFF64_LDFLAGS,

    _CS_POSIX_V6_LP64_OFF64_LIBS,

    _CS_POSIX_V6_LP64_OFF64_LINTFLAGS,

    _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS,

    _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS,

    _CS_POSIX_V6_LPBIG_OFFBIG_LIBS,

    _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS,


    _CS_POSIX_V7_ILP32_OFF32_CFLAGS,

    _CS_POSIX_V7_ILP32_OFF32_LDFLAGS,

    _CS_POSIX_V7_ILP32_OFF32_LIBS,

    _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS,

    _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS,

    _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS,

    _CS_POSIX_V7_ILP32_OFFBIG_LIBS,

    _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS,

    _CS_POSIX_V7_LP64_OFF64_CFLAGS,

    _CS_POSIX_V7_LP64_OFF64_LDFLAGS,

    _CS_POSIX_V7_LP64_OFF64_LIBS,

    _CS_POSIX_V7_LP64_OFF64_LINTFLAGS,

    _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS,

    _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS,

    _CS_POSIX_V7_LPBIG_OFFBIG_LIBS,

    _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS,


    _CS_V6_ENV,

    _CS_V7_ENV

  };
# 610 "/usr/include/unistd.h" 2 3 4


extern long int pathconf (const char *__path, int __name)
     throw () __attribute__ ((__nonnull__ (1)));


extern long int fpathconf (int __fd, int __name) throw ();


extern long int sysconf (int __name) throw ();



extern size_t confstr (int __name, char *__buf, size_t __len) throw ();




extern __pid_t getpid (void) throw ();


extern __pid_t getppid (void) throw ();


extern __pid_t getpgrp (void) throw ();


extern __pid_t __getpgid (__pid_t __pid) throw ();

extern __pid_t getpgid (__pid_t __pid) throw ();






extern int setpgid (__pid_t __pid, __pid_t __pgid) throw ();
# 660 "/usr/include/unistd.h" 3 4
extern int setpgrp (void) throw ();






extern __pid_t setsid (void) throw ();



extern __pid_t getsid (__pid_t __pid) throw ();



extern __uid_t getuid (void) throw ();


extern __uid_t geteuid (void) throw ();


extern __gid_t getgid (void) throw ();


extern __gid_t getegid (void) throw ();




extern int getgroups (int __size, __gid_t __list[]) throw () ;



extern int group_member (__gid_t __gid) throw ();






extern int setuid (__uid_t __uid) throw () ;




extern int setreuid (__uid_t __ruid, __uid_t __euid) throw () ;




extern int seteuid (__uid_t __uid) throw () ;






extern int setgid (__gid_t __gid) throw () ;




extern int setregid (__gid_t __rgid, __gid_t __egid) throw () ;




extern int setegid (__gid_t __gid) throw () ;





extern int getresuid (__uid_t *__ruid, __uid_t *__euid, __uid_t *__suid)
     throw ();



extern int getresgid (__gid_t *__rgid, __gid_t *__egid, __gid_t *__sgid)
     throw ();



extern int setresuid (__uid_t __ruid, __uid_t __euid, __uid_t __suid)
     throw () ;



extern int setresgid (__gid_t __rgid, __gid_t __egid, __gid_t __sgid)
     throw () ;






extern __pid_t fork (void) throw ();







extern __pid_t vfork (void) throw ();





extern char *ttyname (int __fd) throw ();



extern int ttyname_r (int __fd, char *__buf, size_t __buflen)
     throw () __attribute__ ((__nonnull__ (2))) ;



extern int isatty (int __fd) throw ();




extern int ttyslot (void) throw ();




extern int link (const char *__from, const char *__to)
     throw () __attribute__ ((__nonnull__ (1, 2))) ;




extern int linkat (int __fromfd, const char *__from, int __tofd,
     const char *__to, int __flags)
     throw () __attribute__ ((__nonnull__ (2, 4))) ;




extern int symlink (const char *__from, const char *__to)
     throw () __attribute__ ((__nonnull__ (1, 2))) ;




extern ssize_t readlink (const char *__restrict __path,
    char *__restrict __buf, size_t __len)
     throw () __attribute__ ((__nonnull__ (1, 2))) ;




extern int symlinkat (const char *__from, int __tofd,
        const char *__to) throw () __attribute__ ((__nonnull__ (1, 3))) ;


extern ssize_t readlinkat (int __fd, const char *__restrict __path,
      char *__restrict __buf, size_t __len)
     throw () __attribute__ ((__nonnull__ (2, 3))) ;



extern int unlink (const char *__name) throw () __attribute__ ((__nonnull__ (1)));



extern int unlinkat (int __fd, const char *__name, int __flag)
     throw () __attribute__ ((__nonnull__ (2)));



extern int rmdir (const char *__path) throw () __attribute__ ((__nonnull__ (1)));



extern __pid_t tcgetpgrp (int __fd) throw ();


extern int tcsetpgrp (int __fd, __pid_t __pgrp_id) throw ();






extern char *getlogin (void);







extern int getlogin_r (char *__name, size_t __name_len) __attribute__ ((__nonnull__ (1)));




extern int setlogin (const char *__name) throw () __attribute__ ((__nonnull__ (1)));







# 1 "/usr/include/x86_64-linux-gnu/bits/getopt_posix.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/getopt_posix.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/getopt_core.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/getopt_core.h" 3 4
extern "C" {







extern char *optarg;
# 50 "/usr/include/x86_64-linux-gnu/bits/getopt_core.h" 3 4
extern int optind;




extern int opterr;



extern int optopt;
# 91 "/usr/include/x86_64-linux-gnu/bits/getopt_core.h" 3 4
extern int getopt (int ___argc, char *const *___argv, const char *__shortopts)
       throw () __attribute__ ((__nonnull__ (2, 3)));

}
# 28 "/usr/include/x86_64-linux-gnu/bits/getopt_posix.h" 2 3 4

extern "C" {
# 49 "/usr/include/x86_64-linux-gnu/bits/getopt_posix.h" 3 4
}
# 870 "/usr/include/unistd.h" 2 3 4







extern int gethostname (char *__name, size_t __len) throw () __attribute__ ((__nonnull__ (1)));






extern int sethostname (const char *__name, size_t __len)
     throw () __attribute__ ((__nonnull__ (1))) ;



extern int sethostid (long int __id) throw () ;





extern int getdomainname (char *__name, size_t __len)
     throw () __attribute__ ((__nonnull__ (1))) ;
extern int setdomainname (const char *__name, size_t __len)
     throw () __attribute__ ((__nonnull__ (1))) ;





extern int vhangup (void) throw ();


extern int revoke (const char *__file) throw () __attribute__ ((__nonnull__ (1))) ;







extern int profil (unsigned short int *__sample_buffer, size_t __size,
     size_t __offset, unsigned int __scale)
     throw () __attribute__ ((__nonnull__ (1)));





extern int acct (const char *__name) throw ();



extern char *getusershell (void) throw ();
extern void endusershell (void) throw ();
extern void setusershell (void) throw ();





extern int daemon (int __nochdir, int __noclose) throw () ;






extern int chroot (const char *__path) throw () __attribute__ ((__nonnull__ (1))) ;



extern char *getpass (const char *__prompt) __attribute__ ((__nonnull__ (1)));







extern int fsync (int __fd);





extern int syncfs (int __fd) throw ();






extern long int gethostid (void);


extern void sync (void) throw ();





extern int getpagesize (void) throw () __attribute__ ((__const__));




extern int getdtablesize (void) throw ();
# 991 "/usr/include/unistd.h" 3 4
extern int truncate (const char *__file, __off_t __length)
     throw () __attribute__ ((__nonnull__ (1))) ;
# 1003 "/usr/include/unistd.h" 3 4
extern int truncate64 (const char *__file, __off64_t __length)
     throw () __attribute__ ((__nonnull__ (1))) ;
# 1014 "/usr/include/unistd.h" 3 4
extern int ftruncate (int __fd, __off_t __length) throw () ;
# 1024 "/usr/include/unistd.h" 3 4
extern int ftruncate64 (int __fd, __off64_t __length) throw () ;
# 1035 "/usr/include/unistd.h" 3 4
extern int brk (void *__addr) throw () ;





extern void *sbrk (intptr_t __delta) throw ();
# 1056 "/usr/include/unistd.h" 3 4
extern long int syscall (long int __sysno, ...) throw ();
# 1079 "/usr/include/unistd.h" 3 4
extern int lockf (int __fd, int __cmd, __off_t __len) ;
# 1089 "/usr/include/unistd.h" 3 4
extern int lockf64 (int __fd, int __cmd, __off64_t __len) ;
# 1107 "/usr/include/unistd.h" 3 4
ssize_t copy_file_range (int __infd, __off64_t *__pinoff,
    int __outfd, __off64_t *__poutoff,
    size_t __length, unsigned int __flags);





extern int fdatasync (int __fildes);
# 1124 "/usr/include/unistd.h" 3 4
extern char *crypt (const char *__key, const char *__salt)
     throw () __attribute__ ((__nonnull__ (1, 2)));







extern void swab (const void *__restrict __from, void *__restrict __to,
    ssize_t __n) throw () __attribute__ ((__nonnull__ (1, 2)));
# 1161 "/usr/include/unistd.h" 3 4
int getentropy (void *__buffer, size_t __length) ;
# 1170 "/usr/include/unistd.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/unistd_ext.h" 1 3 4
# 34 "/usr/include/x86_64-linux-gnu/bits/unistd_ext.h" 3 4
extern __pid_t gettid (void) throw ();
# 1171 "/usr/include/unistd.h" 2 3 4

}
# 4 "./platforms/common/include/px4_platform_common/time.h" 2

# 1 "/usr/include/time.h" 1 3 4
# 29 "/usr/include/time.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h" 1 3 4
# 30 "/usr/include/time.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/time.h" 1 3 4
# 73 "/usr/include/x86_64-linux-gnu/bits/time.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/timex.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/bits/timex.h" 3 4
struct timex
{
  unsigned int modes;
  __syscall_slong_t offset;
  __syscall_slong_t freq;
  __syscall_slong_t maxerror;
  __syscall_slong_t esterror;
  int status;
  __syscall_slong_t constant;
  __syscall_slong_t precision;
  __syscall_slong_t tolerance;
  struct timeval time;
  __syscall_slong_t tick;
  __syscall_slong_t ppsfreq;
  __syscall_slong_t jitter;
  int shift;
  __syscall_slong_t stabil;
  __syscall_slong_t jitcnt;
  __syscall_slong_t calcnt;
  __syscall_slong_t errcnt;
  __syscall_slong_t stbcnt;

  int tai;


  int :32; int :32; int :32; int :32;
  int :32; int :32; int :32; int :32;
  int :32; int :32; int :32;
};
# 74 "/usr/include/x86_64-linux-gnu/bits/time.h" 2 3 4

extern "C" {


extern int clock_adjtime (__clockid_t __clock_id, struct timex *__utx) throw ();

}
# 34 "/usr/include/time.h" 2 3 4





# 1 "/usr/include/x86_64-linux-gnu/bits/types/struct_tm.h" 1 3 4






struct tm
{
  int tm_sec;
  int tm_min;
  int tm_hour;
  int tm_mday;
  int tm_mon;
  int tm_year;
  int tm_wday;
  int tm_yday;
  int tm_isdst;


  long int tm_gmtoff;
  const char *tm_zone;




};
# 40 "/usr/include/time.h" 2 3 4
# 48 "/usr/include/time.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/struct_itimerspec.h" 1 3 4







struct itimerspec
  {
    struct timespec it_interval;
    struct timespec it_value;
  };
# 49 "/usr/include/time.h" 2 3 4
struct sigevent;
# 68 "/usr/include/time.h" 3 4
extern "C" {



extern clock_t clock (void) throw ();


extern time_t time (time_t *__timer) throw ();


extern double difftime (time_t __time1, time_t __time0)
     throw () __attribute__ ((__const__));


extern time_t mktime (struct tm *__tp) throw ();





extern size_t strftime (char *__restrict __s, size_t __maxsize,
   const char *__restrict __format,
   const struct tm *__restrict __tp) throw ();




extern char *strptime (const char *__restrict __s,
         const char *__restrict __fmt, struct tm *__tp)
     throw ();






extern size_t strftime_l (char *__restrict __s, size_t __maxsize,
     const char *__restrict __format,
     const struct tm *__restrict __tp,
     locale_t __loc) throw ();



extern char *strptime_l (const char *__restrict __s,
    const char *__restrict __fmt, struct tm *__tp,
    locale_t __loc) throw ();





extern struct tm *gmtime (const time_t *__timer) throw ();



extern struct tm *localtime (const time_t *__timer) throw ();




extern struct tm *gmtime_r (const time_t *__restrict __timer,
       struct tm *__restrict __tp) throw ();



extern struct tm *localtime_r (const time_t *__restrict __timer,
          struct tm *__restrict __tp) throw ();




extern char *asctime (const struct tm *__tp) throw ();


extern char *ctime (const time_t *__timer) throw ();






extern char *asctime_r (const struct tm *__restrict __tp,
   char *__restrict __buf) throw ();


extern char *ctime_r (const time_t *__restrict __timer,
        char *__restrict __buf) throw ();




extern char *__tzname[2];
extern int __daylight;
extern long int __timezone;




extern char *tzname[2];



extern void tzset (void) throw ();



extern int daylight;
extern long int timezone;
# 190 "/usr/include/time.h" 3 4
extern time_t timegm (struct tm *__tp) throw ();


extern time_t timelocal (struct tm *__tp) throw ();


extern int dysize (int __year) throw () __attribute__ ((__const__));
# 205 "/usr/include/time.h" 3 4
extern int nanosleep (const struct timespec *__requested_time,
        struct timespec *__remaining);



extern int clock_getres (clockid_t __clock_id, struct timespec *__res) throw ();


extern int clock_gettime (clockid_t __clock_id, struct timespec *__tp) throw ();


extern int clock_settime (clockid_t __clock_id, const struct timespec *__tp)
     throw ();






extern int clock_nanosleep (clockid_t __clock_id, int __flags,
       const struct timespec *__req,
       struct timespec *__rem);


extern int clock_getcpuclockid (pid_t __pid, clockid_t *__clock_id) throw ();




extern int timer_create (clockid_t __clock_id,
    struct sigevent *__restrict __evp,
    timer_t *__restrict __timerid) throw ();


extern int timer_delete (timer_t __timerid) throw ();


extern int timer_settime (timer_t __timerid, int __flags,
     const struct itimerspec *__restrict __value,
     struct itimerspec *__restrict __ovalue) throw ();


extern int timer_gettime (timer_t __timerid, struct itimerspec *__value)
     throw ();


extern int timer_getoverrun (timer_t __timerid) throw ();





extern int timespec_get (struct timespec *__ts, int __base)
     throw () __attribute__ ((__nonnull__ (1)));
# 274 "/usr/include/time.h" 3 4
extern int getdate_err;
# 283 "/usr/include/time.h" 3 4
extern struct tm *getdate (const char *__string);
# 297 "/usr/include/time.h" 3 4
extern int getdate_r (const char *__restrict __string,
        struct tm *__restrict __resbufp);


}
# 6 "./platforms/common/include/px4_platform_common/time.h" 2
# 1 "/usr/include/pthread.h" 1 3 4
# 22 "/usr/include/pthread.h" 3 4
# 1 "/usr/include/sched.h" 1 3 4
# 29 "/usr/include/sched.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h" 1 3 4
# 30 "/usr/include/sched.h" 2 3 4
# 43 "/usr/include/sched.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/sched.h" 1 3 4
# 76 "/usr/include/x86_64-linux-gnu/bits/sched.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/struct_sched_param.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/types/struct_sched_param.h" 3 4
struct sched_param
{
  int sched_priority;
};
# 77 "/usr/include/x86_64-linux-gnu/bits/sched.h" 2 3 4

extern "C" {



extern int clone (int (*__fn) (void *__arg), void *__child_stack,
    int __flags, void *__arg, ...) throw ();


extern int unshare (int __flags) throw ();


extern int sched_getcpu (void) throw ();


extern int getcpu (unsigned int *, unsigned int *) throw ();


extern int setns (int __fd, int __nstype) throw ();


}
# 44 "/usr/include/sched.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/cpu-set.h" 1 3 4
# 32 "/usr/include/x86_64-linux-gnu/bits/cpu-set.h" 3 4
typedef unsigned long int __cpu_mask;






typedef struct
{
  __cpu_mask __bits[1024 / (8 * sizeof (__cpu_mask))];
} cpu_set_t;
# 115 "/usr/include/x86_64-linux-gnu/bits/cpu-set.h" 3 4
extern "C" {

extern int __sched_cpucount (size_t __setsize, const cpu_set_t *__setp)
     throw ();
extern cpu_set_t *__sched_cpualloc (size_t __count) throw () ;
extern void __sched_cpufree (cpu_set_t *__set) throw ();

}
# 45 "/usr/include/sched.h" 2 3 4






extern "C" {


extern int sched_setparam (__pid_t __pid, const struct sched_param *__param)
     throw ();


extern int sched_getparam (__pid_t __pid, struct sched_param *__param) throw ();


extern int sched_setscheduler (__pid_t __pid, int __policy,
          const struct sched_param *__param) throw ();


extern int sched_getscheduler (__pid_t __pid) throw ();


extern int sched_yield (void) throw ();


extern int sched_get_priority_max (int __algorithm) throw ();


extern int sched_get_priority_min (int __algorithm) throw ();


extern int sched_rr_get_interval (__pid_t __pid, struct timespec *__t) throw ();
# 121 "/usr/include/sched.h" 3 4
extern int sched_setaffinity (__pid_t __pid, size_t __cpusetsize,
         const cpu_set_t *__cpuset) throw ();


extern int sched_getaffinity (__pid_t __pid, size_t __cpusetsize,
         cpu_set_t *__cpuset) throw ();


}
# 23 "/usr/include/pthread.h" 2 3 4




# 1 "/usr/include/x86_64-linux-gnu/bits/setjmp.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/bits/setjmp.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/setjmp.h" 2 3 4




typedef long int __jmp_buf[8];
# 28 "/usr/include/pthread.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 29 "/usr/include/pthread.h" 2 3 4




enum
{
  PTHREAD_CREATE_JOINABLE,

  PTHREAD_CREATE_DETACHED

};



enum
{
  PTHREAD_MUTEX_TIMED_NP,
  PTHREAD_MUTEX_RECURSIVE_NP,
  PTHREAD_MUTEX_ERRORCHECK_NP,
  PTHREAD_MUTEX_ADAPTIVE_NP

  ,
  PTHREAD_MUTEX_NORMAL = PTHREAD_MUTEX_TIMED_NP,
  PTHREAD_MUTEX_RECURSIVE = PTHREAD_MUTEX_RECURSIVE_NP,
  PTHREAD_MUTEX_ERRORCHECK = PTHREAD_MUTEX_ERRORCHECK_NP,
  PTHREAD_MUTEX_DEFAULT = PTHREAD_MUTEX_NORMAL



  , PTHREAD_MUTEX_FAST_NP = PTHREAD_MUTEX_TIMED_NP

};




enum
{
  PTHREAD_MUTEX_STALLED,
  PTHREAD_MUTEX_STALLED_NP = PTHREAD_MUTEX_STALLED,
  PTHREAD_MUTEX_ROBUST,
  PTHREAD_MUTEX_ROBUST_NP = PTHREAD_MUTEX_ROBUST
};





enum
{
  PTHREAD_PRIO_NONE,
  PTHREAD_PRIO_INHERIT,
  PTHREAD_PRIO_PROTECT
};
# 100 "/usr/include/pthread.h" 3 4
enum
{
  PTHREAD_RWLOCK_PREFER_READER_NP,
  PTHREAD_RWLOCK_PREFER_WRITER_NP,
  PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP,
  PTHREAD_RWLOCK_DEFAULT_NP = PTHREAD_RWLOCK_PREFER_READER_NP
};
# 120 "/usr/include/pthread.h" 3 4
enum
{
  PTHREAD_INHERIT_SCHED,

  PTHREAD_EXPLICIT_SCHED

};



enum
{
  PTHREAD_SCOPE_SYSTEM,

  PTHREAD_SCOPE_PROCESS

};



enum
{
  PTHREAD_PROCESS_PRIVATE,

  PTHREAD_PROCESS_SHARED

};
# 155 "/usr/include/pthread.h" 3 4
struct _pthread_cleanup_buffer
{
  void (*__routine) (void *);
  void *__arg;
  int __canceltype;
  struct _pthread_cleanup_buffer *__prev;
};


enum
{
  PTHREAD_CANCEL_ENABLE,

  PTHREAD_CANCEL_DISABLE

};
enum
{
  PTHREAD_CANCEL_DEFERRED,

  PTHREAD_CANCEL_ASYNCHRONOUS

};
# 193 "/usr/include/pthread.h" 3 4
extern "C" {




extern int pthread_create (pthread_t *__restrict __newthread,
      const pthread_attr_t *__restrict __attr,
      void *(*__start_routine) (void *),
      void *__restrict __arg) throw () __attribute__ ((__nonnull__ (1, 3)));





extern void pthread_exit (void *__retval) __attribute__ ((__noreturn__));







extern int pthread_join (pthread_t __th, void **__thread_return);




extern int pthread_tryjoin_np (pthread_t __th, void **__thread_return) throw ();







extern int pthread_timedjoin_np (pthread_t __th, void **__thread_return,
     const struct timespec *__abstime);
# 238 "/usr/include/pthread.h" 3 4
extern int pthread_clockjoin_np (pthread_t __th, void **__thread_return,
                                 clockid_t __clockid,
     const struct timespec *__abstime);






extern int pthread_detach (pthread_t __th) throw ();



extern pthread_t pthread_self (void) throw () __attribute__ ((__const__));


extern int pthread_equal (pthread_t __thread1, pthread_t __thread2)
  throw () __attribute__ ((__const__));







extern int pthread_attr_init (pthread_attr_t *__attr) throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_destroy (pthread_attr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_getdetachstate (const pthread_attr_t *__attr,
     int *__detachstate)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setdetachstate (pthread_attr_t *__attr,
     int __detachstate)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getguardsize (const pthread_attr_t *__attr,
          size_t *__guardsize)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setguardsize (pthread_attr_t *__attr,
          size_t __guardsize)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getschedparam (const pthread_attr_t *__restrict __attr,
           struct sched_param *__restrict __param)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setschedparam (pthread_attr_t *__restrict __attr,
           const struct sched_param *__restrict
           __param) throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_getschedpolicy (const pthread_attr_t *__restrict
     __attr, int *__restrict __policy)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setschedpolicy (pthread_attr_t *__attr, int __policy)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_getinheritsched (const pthread_attr_t *__restrict
      __attr, int *__restrict __inherit)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setinheritsched (pthread_attr_t *__attr,
      int __inherit)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getscope (const pthread_attr_t *__restrict __attr,
      int *__restrict __scope)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setscope (pthread_attr_t *__attr, int __scope)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_getstackaddr (const pthread_attr_t *__restrict
          __attr, void **__restrict __stackaddr)
     throw () __attribute__ ((__nonnull__ (1, 2))) __attribute__ ((__deprecated__));





extern int pthread_attr_setstackaddr (pthread_attr_t *__attr,
          void *__stackaddr)
     throw () __attribute__ ((__nonnull__ (1))) __attribute__ ((__deprecated__));


extern int pthread_attr_getstacksize (const pthread_attr_t *__restrict
          __attr, size_t *__restrict __stacksize)
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern int pthread_attr_setstacksize (pthread_attr_t *__attr,
          size_t __stacksize)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getstack (const pthread_attr_t *__restrict __attr,
      void **__restrict __stackaddr,
      size_t *__restrict __stacksize)
     throw () __attribute__ ((__nonnull__ (1, 2, 3)));




extern int pthread_attr_setstack (pthread_attr_t *__attr, void *__stackaddr,
      size_t __stacksize) throw () __attribute__ ((__nonnull__ (1)));





extern int pthread_attr_setaffinity_np (pthread_attr_t *__attr,
     size_t __cpusetsize,
     const cpu_set_t *__cpuset)
     throw () __attribute__ ((__nonnull__ (1, 3)));



extern int pthread_attr_getaffinity_np (const pthread_attr_t *__attr,
     size_t __cpusetsize,
     cpu_set_t *__cpuset)
     throw () __attribute__ ((__nonnull__ (1, 3)));


extern int pthread_getattr_default_np (pthread_attr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_setattr_default_np (const pthread_attr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));




extern int pthread_getattr_np (pthread_t __th, pthread_attr_t *__attr)
     throw () __attribute__ ((__nonnull__ (2)));







extern int pthread_setschedparam (pthread_t __target_thread, int __policy,
      const struct sched_param *__param)
     throw () __attribute__ ((__nonnull__ (3)));


extern int pthread_getschedparam (pthread_t __target_thread,
      int *__restrict __policy,
      struct sched_param *__restrict __param)
     throw () __attribute__ ((__nonnull__ (2, 3)));


extern int pthread_setschedprio (pthread_t __target_thread, int __prio)
     throw ();




extern int pthread_getname_np (pthread_t __target_thread, char *__buf,
          size_t __buflen)
     throw () __attribute__ ((__nonnull__ (2)));


extern int pthread_setname_np (pthread_t __target_thread, const char *__name)
     throw () __attribute__ ((__nonnull__ (2)));





extern int pthread_getconcurrency (void) throw ();


extern int pthread_setconcurrency (int __level) throw ();







extern int pthread_yield (void) throw ();




extern int pthread_setaffinity_np (pthread_t __th, size_t __cpusetsize,
       const cpu_set_t *__cpuset)
     throw () __attribute__ ((__nonnull__ (3)));


extern int pthread_getaffinity_np (pthread_t __th, size_t __cpusetsize,
       cpu_set_t *__cpuset)
     throw () __attribute__ ((__nonnull__ (3)));
# 470 "/usr/include/pthread.h" 3 4
extern int pthread_once (pthread_once_t *__once_control,
    void (*__init_routine) (void)) __attribute__ ((__nonnull__ (1, 2)));
# 482 "/usr/include/pthread.h" 3 4
extern int pthread_setcancelstate (int __state, int *__oldstate);



extern int pthread_setcanceltype (int __type, int *__oldtype);


extern int pthread_cancel (pthread_t __th);




extern void pthread_testcancel (void);




typedef struct
{
  struct
  {
    __jmp_buf __cancel_jmp_buf;
    int __mask_was_saved;
  } __cancel_jmp_buf[1];
  void *__pad[4];
} __pthread_unwind_buf_t __attribute__ ((__aligned__));
# 516 "/usr/include/pthread.h" 3 4
struct __pthread_cleanup_frame
{
  void (*__cancel_routine) (void *);
  void *__cancel_arg;
  int __do_it;
  int __cancel_type;
};




class __pthread_cleanup_class
{
  void (*__cancel_routine) (void *);
  void *__cancel_arg;
  int __do_it;
  int __cancel_type;

 public:
  __pthread_cleanup_class (void (*__fct) (void *), void *__arg)
    : __cancel_routine (__fct), __cancel_arg (__arg), __do_it (1) { }
  ~__pthread_cleanup_class () { if (__do_it) __cancel_routine (__cancel_arg); }
  void __setdoit (int __newval) { __do_it = __newval; }
  void __defer () { pthread_setcanceltype (PTHREAD_CANCEL_DEFERRED,
        &__cancel_type); }
  void __restore () const { pthread_setcanceltype (__cancel_type, 0); }
};
# 718 "/usr/include/pthread.h" 3 4
struct __jmp_buf_tag;
extern int __sigsetjmp (struct __jmp_buf_tag *__env, int __savemask) throw ();





extern int pthread_mutex_init (pthread_mutex_t *__mutex,
          const pthread_mutexattr_t *__mutexattr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_mutex_destroy (pthread_mutex_t *__mutex)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_mutex_trylock (pthread_mutex_t *__mutex)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_mutex_lock (pthread_mutex_t *__mutex)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_mutex_timedlock (pthread_mutex_t *__restrict __mutex,
        const struct timespec *__restrict
        __abstime) throw () __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutex_clocklock (pthread_mutex_t *__restrict __mutex,
        clockid_t __clockid,
        const struct timespec *__restrict
        __abstime) throw () __attribute__ ((__nonnull__ (1, 3)));



extern int pthread_mutex_unlock (pthread_mutex_t *__mutex)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_mutex_getprioceiling (const pthread_mutex_t *
      __restrict __mutex,
      int *__restrict __prioceiling)
     throw () __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutex_setprioceiling (pthread_mutex_t *__restrict __mutex,
      int __prioceiling,
      int *__restrict __old_ceiling)
     throw () __attribute__ ((__nonnull__ (1, 3)));




extern int pthread_mutex_consistent (pthread_mutex_t *__mutex)
     throw () __attribute__ ((__nonnull__ (1)));

extern int pthread_mutex_consistent_np (pthread_mutex_t *__mutex)
     throw () __attribute__ ((__nonnull__ (1)));
# 789 "/usr/include/pthread.h" 3 4
extern int pthread_mutexattr_init (pthread_mutexattr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_mutexattr_destroy (pthread_mutexattr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_mutexattr_getpshared (const pthread_mutexattr_t *
      __restrict __attr,
      int *__restrict __pshared)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_mutexattr_setpshared (pthread_mutexattr_t *__attr,
      int __pshared)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_mutexattr_gettype (const pthread_mutexattr_t *__restrict
          __attr, int *__restrict __kind)
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern int pthread_mutexattr_settype (pthread_mutexattr_t *__attr, int __kind)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_mutexattr_getprotocol (const pthread_mutexattr_t *
       __restrict __attr,
       int *__restrict __protocol)
     throw () __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutexattr_setprotocol (pthread_mutexattr_t *__attr,
       int __protocol)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_mutexattr_getprioceiling (const pthread_mutexattr_t *
          __restrict __attr,
          int *__restrict __prioceiling)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_mutexattr_setprioceiling (pthread_mutexattr_t *__attr,
          int __prioceiling)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_mutexattr_getrobust (const pthread_mutexattr_t *__attr,
     int *__robustness)
     throw () __attribute__ ((__nonnull__ (1, 2)));

extern int pthread_mutexattr_getrobust_np (const pthread_mutexattr_t *__attr,
        int *__robustness)
     throw () __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutexattr_setrobust (pthread_mutexattr_t *__attr,
     int __robustness)
     throw () __attribute__ ((__nonnull__ (1)));

extern int pthread_mutexattr_setrobust_np (pthread_mutexattr_t *__attr,
        int __robustness)
     throw () __attribute__ ((__nonnull__ (1)));
# 871 "/usr/include/pthread.h" 3 4
extern int pthread_rwlock_init (pthread_rwlock_t *__restrict __rwlock,
    const pthread_rwlockattr_t *__restrict
    __attr) throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_destroy (pthread_rwlock_t *__rwlock)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_rdlock (pthread_rwlock_t *__rwlock)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_tryrdlock (pthread_rwlock_t *__rwlock)
  throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_rwlock_timedrdlock (pthread_rwlock_t *__restrict __rwlock,
           const struct timespec *__restrict
           __abstime) throw () __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_rwlock_clockrdlock (pthread_rwlock_t *__restrict __rwlock,
           clockid_t __clockid,
           const struct timespec *__restrict
           __abstime) throw () __attribute__ ((__nonnull__ (1, 3)));



extern int pthread_rwlock_wrlock (pthread_rwlock_t *__rwlock)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_trywrlock (pthread_rwlock_t *__rwlock)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_rwlock_timedwrlock (pthread_rwlock_t *__restrict __rwlock,
           const struct timespec *__restrict
           __abstime) throw () __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_rwlock_clockwrlock (pthread_rwlock_t *__restrict __rwlock,
           clockid_t __clockid,
           const struct timespec *__restrict
           __abstime) throw () __attribute__ ((__nonnull__ (1, 3)));



extern int pthread_rwlock_unlock (pthread_rwlock_t *__rwlock)
     throw () __attribute__ ((__nonnull__ (1)));





extern int pthread_rwlockattr_init (pthread_rwlockattr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlockattr_destroy (pthread_rwlockattr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlockattr_getpshared (const pthread_rwlockattr_t *
       __restrict __attr,
       int *__restrict __pshared)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_rwlockattr_setpshared (pthread_rwlockattr_t *__attr,
       int __pshared)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlockattr_getkind_np (const pthread_rwlockattr_t *
       __restrict __attr,
       int *__restrict __pref)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_rwlockattr_setkind_np (pthread_rwlockattr_t *__attr,
       int __pref) throw () __attribute__ ((__nonnull__ (1)));







extern int pthread_cond_init (pthread_cond_t *__restrict __cond,
         const pthread_condattr_t *__restrict __cond_attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_cond_destroy (pthread_cond_t *__cond)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_cond_signal (pthread_cond_t *__cond)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_cond_broadcast (pthread_cond_t *__cond)
     throw () __attribute__ ((__nonnull__ (1)));






extern int pthread_cond_wait (pthread_cond_t *__restrict __cond,
         pthread_mutex_t *__restrict __mutex)
     __attribute__ ((__nonnull__ (1, 2)));
# 997 "/usr/include/pthread.h" 3 4
extern int pthread_cond_timedwait (pthread_cond_t *__restrict __cond,
       pthread_mutex_t *__restrict __mutex,
       const struct timespec *__restrict __abstime)
     __attribute__ ((__nonnull__ (1, 2, 3)));
# 1010 "/usr/include/pthread.h" 3 4
extern int pthread_cond_clockwait (pthread_cond_t *__restrict __cond,
       pthread_mutex_t *__restrict __mutex,
       __clockid_t __clock_id,
       const struct timespec *__restrict __abstime)
     __attribute__ ((__nonnull__ (1, 2, 4)));





extern int pthread_condattr_init (pthread_condattr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_condattr_destroy (pthread_condattr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_condattr_getpshared (const pthread_condattr_t *
     __restrict __attr,
     int *__restrict __pshared)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_condattr_setpshared (pthread_condattr_t *__attr,
     int __pshared) throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_condattr_getclock (const pthread_condattr_t *
          __restrict __attr,
          __clockid_t *__restrict __clock_id)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_condattr_setclock (pthread_condattr_t *__attr,
          __clockid_t __clock_id)
     throw () __attribute__ ((__nonnull__ (1)));
# 1056 "/usr/include/pthread.h" 3 4
extern int pthread_spin_init (pthread_spinlock_t *__lock, int __pshared)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_destroy (pthread_spinlock_t *__lock)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_lock (pthread_spinlock_t *__lock)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_trylock (pthread_spinlock_t *__lock)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_unlock (pthread_spinlock_t *__lock)
     throw () __attribute__ ((__nonnull__ (1)));






extern int pthread_barrier_init (pthread_barrier_t *__restrict __barrier,
     const pthread_barrierattr_t *__restrict
     __attr, unsigned int __count)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_barrier_destroy (pthread_barrier_t *__barrier)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_barrier_wait (pthread_barrier_t *__barrier)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_barrierattr_init (pthread_barrierattr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_barrierattr_destroy (pthread_barrierattr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_barrierattr_getpshared (const pthread_barrierattr_t *
        __restrict __attr,
        int *__restrict __pshared)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_barrierattr_setpshared (pthread_barrierattr_t *__attr,
        int __pshared)
     throw () __attribute__ ((__nonnull__ (1)));
# 1123 "/usr/include/pthread.h" 3 4
extern int pthread_key_create (pthread_key_t *__key,
          void (*__destr_function) (void *))
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_key_delete (pthread_key_t __key) throw ();


extern void *pthread_getspecific (pthread_key_t __key) throw ();


extern int pthread_setspecific (pthread_key_t __key,
    const void *__pointer) throw () ;




extern int pthread_getcpuclockid (pthread_t __thread_id,
      __clockid_t *__clock_id)
     throw () __attribute__ ((__nonnull__ (2)));
# 1157 "/usr/include/pthread.h" 3 4
extern int pthread_atfork (void (*__prepare) (void),
      void (*__parent) (void),
      void (*__child) (void)) throw ();
# 1171 "/usr/include/pthread.h" 3 4
}
# 7 "./platforms/common/include/px4_platform_common/time.h" 2


extern "C" {

# 10 "./platforms/common/include/px4_platform_common/time.h"
__EXPORT int px4_clock_gettime(clockid_t clk_id, struct timespec *tp);

# 11 "./platforms/common/include/px4_platform_common/time.h" 3 4
}
# 48 "./src/drivers/drv_hrt.h" 2
# 1 "./platforms/posix/include/queue.h" 1
# 46 "./platforms/posix/include/queue.h"
# 1 "/usr/include/c++/9/cstddef" 1 3
# 42 "/usr/include/c++/9/cstddef" 3
       
# 43 "/usr/include/c++/9/cstddef" 3







# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h" 1 3 4
# 143 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h" 3 4
typedef long int ptrdiff_t;
# 415 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h" 3 4
typedef struct {
  long long __max_align_ll __attribute__((__aligned__(__alignof__(long long))));
  long double __max_align_ld __attribute__((__aligned__(__alignof__(long double))));
# 426 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h" 3 4
} max_align_t;






  typedef decltype(nullptr) nullptr_t;
# 51 "/usr/include/c++/9/cstddef" 2 3

extern "C++"
{

namespace std
{

  using ::max_align_t;
}



namespace std
{




  enum class byte : unsigned char {};

  template<typename _IntegerType> struct __byte_operand { };
  template<> struct __byte_operand<bool> { using __type = byte; };
  template<> struct __byte_operand<char> { using __type = byte; };
  template<> struct __byte_operand<signed char> { using __type = byte; };
  template<> struct __byte_operand<unsigned char> { using __type = byte; };

  template<> struct __byte_operand<wchar_t> { using __type = byte; };




  template<> struct __byte_operand<char16_t> { using __type = byte; };
  template<> struct __byte_operand<char32_t> { using __type = byte; };
  template<> struct __byte_operand<short> { using __type = byte; };
  template<> struct __byte_operand<unsigned short> { using __type = byte; };
  template<> struct __byte_operand<int> { using __type = byte; };
  template<> struct __byte_operand<unsigned int> { using __type = byte; };
  template<> struct __byte_operand<long> { using __type = byte; };
  template<> struct __byte_operand<unsigned long> { using __type = byte; };
  template<> struct __byte_operand<long long> { using __type = byte; };
  template<> struct __byte_operand<unsigned long long> { using __type = byte; };
# 110 "/usr/include/c++/9/cstddef" 3
  template<typename _IntegerType>
    struct __byte_operand<const _IntegerType>
    : __byte_operand<_IntegerType> { };
  template<typename _IntegerType>
    struct __byte_operand<volatile _IntegerType>
    : __byte_operand<_IntegerType> { };
  template<typename _IntegerType>
    struct __byte_operand<const volatile _IntegerType>
    : __byte_operand<_IntegerType> { };

  template<typename _IntegerType>
    using __byte_op_t = typename __byte_operand<_IntegerType>::__type;

  template<typename _IntegerType>
    constexpr __byte_op_t<_IntegerType>&
    operator<<=(byte& __b, _IntegerType __shift) noexcept
    { return __b = byte(static_cast<unsigned char>(__b) << __shift); }

  template<typename _IntegerType>
    constexpr __byte_op_t<_IntegerType>
    operator<<(byte __b, _IntegerType __shift) noexcept
    { return byte(static_cast<unsigned char>(__b) << __shift); }

  template<typename _IntegerType>
    constexpr __byte_op_t<_IntegerType>&
    operator>>=(byte& __b, _IntegerType __shift) noexcept
    { return __b = byte(static_cast<unsigned char>(__b) >> __shift); }

  template<typename _IntegerType>
    constexpr __byte_op_t<_IntegerType>
    operator>>(byte __b, _IntegerType __shift) noexcept
    { return byte(static_cast<unsigned char>(__b) >> __shift); }

  constexpr byte&
  operator|=(byte& __l, byte __r) noexcept
  {
    return __l =
      byte(static_cast<unsigned char>(__l) | static_cast<unsigned char>(__r));
  }

  constexpr byte
  operator|(byte __l, byte __r) noexcept
  {
    return
      byte(static_cast<unsigned char>(__l) | static_cast<unsigned char>(__r));
  }

  constexpr byte&
  operator&=(byte& __l, byte __r) noexcept
  {
   return __l =
     byte(static_cast<unsigned char>(__l) & static_cast<unsigned char>(__r));
  }

  constexpr byte
  operator&(byte __l, byte __r) noexcept
  {
    return
      byte(static_cast<unsigned char>(__l) & static_cast<unsigned char>(__r));
  }

  constexpr byte&
  operator^=(byte& __l, byte __r) noexcept
  {
    return __l =
      byte(static_cast<unsigned char>(__l) ^ static_cast<unsigned char>(__r));
  }

  constexpr byte
  operator^(byte __l, byte __r) noexcept
  {
    return
      byte(static_cast<unsigned char>(__l) ^ static_cast<unsigned char>(__r));
  }

  constexpr byte
  operator~(byte __b) noexcept
  { return byte(~static_cast<unsigned char>(__b)); }

  template<typename _IntegerType>
    constexpr _IntegerType
    to_integer(__byte_op_t<_IntegerType> __b) noexcept
    { return _IntegerType(__b); }


}

}
# 47 "./platforms/posix/include/queue.h" 2
# 75 "./platforms/posix/include/queue.h"

# 75 "./platforms/posix/include/queue.h"
struct sq_entry_s {
 struct sq_entry_s *flink;
};
typedef struct sq_entry_s sq_entry_t;

struct dq_entry_s {
 struct dq_entry_s *flink;
 struct dq_entry_s *blink;
};
typedef struct dq_entry_s dq_entry_t;

struct sq_queue_s {
 sq_entry_t *head;
 sq_entry_t *tail;
};
typedef struct sq_queue_s sq_queue_t;

struct dq_queue_s {
 dq_entry_t *head;
 dq_entry_t *tail;
};
typedef struct dq_queue_s dq_queue_t;







extern "C" {




extern "C" void sq_addfirst( sq_entry_t *node, sq_queue_t *queue);
extern "C" void dq_addfirst( dq_entry_t *node, dq_queue_t *queue);
extern "C" void sq_addlast( sq_entry_t *node, sq_queue_t *queue);
extern "C" void dq_addlast( dq_entry_t *node, dq_queue_t *queue);
extern "C" void sq_addafter( sq_entry_t *prev, sq_entry_t *node,
    sq_queue_t *queue);
extern "C" void dq_addafter( dq_entry_t *prev, dq_entry_t *node,
    dq_queue_t *queue);
extern "C" void dq_addbefore( dq_entry_t *next, dq_entry_t *node,
     dq_queue_t *queue);

extern "C" sq_entry_t *sq_remafter( sq_entry_t *node, sq_queue_t *queue);
extern "C" void sq_rem( sq_entry_t *node, sq_queue_t *queue);
extern "C" void dq_rem( dq_entry_t *node, dq_queue_t *queue);
extern "C" sq_entry_t *sq_remlast(sq_queue_t *queue);
extern "C" dq_entry_t *dq_remlast(dq_queue_t *queue);
extern "C" sq_entry_t *sq_remfirst(sq_queue_t *queue);
extern "C" dq_entry_t *dq_remfirst(dq_queue_t *queue);



}
# 49 "./src/drivers/drv_hrt.h" 2






# 54 "./src/drivers/drv_hrt.h" 3 4
extern "C" {








# 62 "./src/drivers/drv_hrt.h"
typedef uint64_t hrt_abstime;
# 71 "./src/drivers/drv_hrt.h"
typedef void (* hrt_callout)(void *arg);




typedef struct hrt_call {
 struct sq_entry_s link;

 hrt_abstime deadline;
 hrt_abstime period;
 hrt_callout callout;
 void *arg;




} *hrt_call_t;



extern const uint16_t latency_bucket_count;
extern const uint16_t latency_buckets[8];
extern uint32_t latency_counters[8 + 1];

typedef struct latency_info {
 uint16_t bucket;
 uint32_t counter;
} latency_info_t;
# 132 "./src/drivers/drv_hrt.h"
__EXPORT extern hrt_abstime hrt_absolute_time(void);




static inline hrt_abstime ts_to_abstime(const struct timespec *ts)
{
 hrt_abstime result;

 result = (hrt_abstime)(ts->tv_sec) * 1000000;
 result += (hrt_abstime)(ts->tv_nsec / 1000);

 return result;
}




static inline void abstime_to_ts(struct timespec *ts, hrt_abstime abstime)
{
 ts->tv_sec = (typeof(ts->tv_sec))(abstime / 1000000);
 abstime -= (hrt_abstime)(ts->tv_sec) * 1000000;
 ts->tv_nsec = (typeof(ts->tv_nsec))(abstime * 1000);
}







static inline hrt_abstime hrt_elapsed_time(const hrt_abstime *then)
{
 hrt_abstime now = hrt_absolute_time();




 if (*then > now) {
  return 0;
 }

 return now - *then;
}






__EXPORT extern void hrt_store_absolute_time(volatile hrt_abstime *time);
# 199 "./src/drivers/drv_hrt.h"
__EXPORT extern void hrt_call_after(struct hrt_call *entry, hrt_abstime delay, hrt_callout callout, void *arg);




__EXPORT extern void hrt_call_at(struct hrt_call *entry, hrt_abstime calltime, hrt_callout callout, void *arg);







__EXPORT extern void hrt_call_every(struct hrt_call *entry, hrt_abstime delay, hrt_abstime interval,
           hrt_callout callout, void *arg);







__EXPORT extern bool hrt_called(struct hrt_call *entry);




__EXPORT extern void hrt_cancel(struct hrt_call *entry);




__EXPORT extern void hrt_call_init(struct hrt_call *entry);
# 240 "./src/drivers/drv_hrt.h"
__EXPORT extern void hrt_call_delay(struct hrt_call *entry, hrt_abstime delay);




__EXPORT extern void hrt_init(void);




__EXPORT extern void hrt_ioctl_init(void);
# 260 "./src/drivers/drv_hrt.h"
static inline int px4_lockstep_register_component(void) { return 0; }
static inline void px4_lockstep_unregister_component(int component) { (void)component; }
static inline void px4_lockstep_progress(int component) {(void)component; }
static inline void px4_lockstep_wait_for_components(void) { }





static inline uint16_t get_latency_bucket_count(void) { return 8; }



static inline latency_info_t get_latency(uint16_t bucket_idx, uint16_t counter_idx)
{
 latency_info_t ret = {latency_buckets[bucket_idx], latency_counters[counter_idx]};
 return ret;
}

static inline void reset_latency_counters(void)
{
 for (int i = 0; i <= get_latency_bucket_count(); i++) {
  latency_counters[i] = 0;
 }
}
# 295 "./src/drivers/drv_hrt.h"

# 295 "./src/drivers/drv_hrt.h" 3 4
}





# 300 "./src/drivers/drv_hrt.h"
namespace time_literals
{




constexpr hrt_abstime operator ""_s(unsigned long long seconds)
{
 return hrt_abstime(seconds * 1000000ULL);
}

constexpr hrt_abstime operator ""_ms(unsigned long long milliseconds)
{
 return hrt_abstime(milliseconds * 1000ULL);
}

constexpr hrt_abstime operator ""_us(unsigned long long microseconds)
{
 return hrt_abstime(microseconds);
}

}
# 54 "./src/lib/battery/battery.h" 2
# 1 "./src/lib/parameters/param.h" 1
# 55 "./src/lib/battery/battery.h" 2
# 1 "./src/lib/mathlib/math/filter/AlphaFilter.hpp" 1
# 43 "./src/lib/mathlib/math/filter/AlphaFilter.hpp"
       


# 1 "./src/lib/mathlib/math/Functions.hpp" 1
# 40 "./src/lib/mathlib/math/Functions.hpp"
       

# 1 "./src/lib/mathlib/math/Limits.hpp" 1
# 40 "./src/lib/mathlib/math/Limits.hpp"
       


# 1 "/usr/include/c++/9/math.h" 1 3
# 44 "./src/lib/mathlib/math/Limits.hpp" 2






namespace math
{

template<typename _Tp>
constexpr _Tp min(_Tp a, _Tp b)
{
 return (a < b) ? a : b;
}

template<typename _Tp>
constexpr _Tp min(_Tp a, _Tp b, _Tp c)
{
 return min(min(a, b), c);
}

template<typename _Tp>
constexpr _Tp max(_Tp a, _Tp b)
{
 return (a > b) ? a : b;
}

template<typename _Tp>
constexpr _Tp max(_Tp a, _Tp b, _Tp c)
{
 return max(max(a, b), c);
}

template<typename _Tp>
constexpr _Tp constrain(_Tp val, _Tp min_val, _Tp max_val)
{
 return (val < min_val) ? min_val : ((val > max_val) ? max_val : val);
}



constexpr int16_t constrainFloatToInt16(float value)
{
 return (int16_t)math::constrain(value, (float)
# 87 "./src/lib/mathlib/math/Limits.hpp" 3 4
                                              (-32767-1)
# 87 "./src/lib/mathlib/math/Limits.hpp"
                                                       , (float)
# 87 "./src/lib/mathlib/math/Limits.hpp" 3 4
                                                                (32767)
# 87 "./src/lib/mathlib/math/Limits.hpp"
                                                                         );
}

template<typename _Tp>
constexpr bool isInRange(_Tp val, _Tp min_val, _Tp max_val)
{
 return (min_val <= val) && (val <= max_val);
}

template<typename T>
constexpr T radians(T degrees)
{
 return degrees * (static_cast<T>(3.141592653589793238462643383280) / static_cast<T>(180));
}

template<typename T>
constexpr T degrees(T radians)
{
 return radians * (static_cast<T>(180) / static_cast<T>(3.141592653589793238462643383280));
}


inline bool isZero(float val)
{
 return fabsf(val - 0.0f) < 1.19209289550781250000000000000000000e-7F;
}


inline bool isZero(double val)
{
 return fabs(val - 0.0) < double(2.22044604925031308084726333618164062e-16L);
}

}
# 43 "./src/lib/mathlib/math/Functions.hpp" 2




namespace math
{


template<typename T>
int signNoZero(T val)
{
 return (T(0) <= val) - (val < T(0));
}







inline int signFromBool(bool positive)
{
 return positive ? 1 : -1;
}

template<typename T>
T sq(T val)
{
 return val * val;
}
# 83 "./src/lib/mathlib/math/Functions.hpp"
template<typename T>
const T expo(const T &value, const T &e)
{
 T x = constrain(value, (T) - 1, (T) 1);
 T ec = constrain(e, (T) 0, (T) 1);
 return (1 - ec) * x + ec * x * x * x;
}
# 102 "./src/lib/mathlib/math/Functions.hpp"
template<typename T>
const T superexpo(const T &value, const T &e, const T &g)
{
 T x = constrain(value, (T) - 1, (T) 1);
 T gc = constrain(g, (T) 0, (T) 0.99);
 return expo(x, e) * (1 - gc) / (1 - fabsf(x) * gc);
}
# 124 "./src/lib/mathlib/math/Functions.hpp"
template<typename T>
const T deadzone(const T &value, const T &dz)
{
 T x = constrain(value, (T) - 1, (T) 1);
 T dzc = constrain(dz, (T) 0, (T) 0.99);

 T out = (x - matrix::sign(x) * dzc) / (1 - dzc);

 return out * (fabsf(x) > dzc);
}

template<typename T>
const T expo_deadzone(const T &value, const T &e, const T &dz)
{
 return expo(deadzone(value, dz), e);
}
# 151 "./src/lib/mathlib/math/Functions.hpp"
template<typename T>
const T interpolate(const T &value, const T &x_low, const T &x_high, const T &y_low, const T &y_high)
{
 if (value <= x_low) {
  return y_low;

 } else if (value > x_high) {
  return y_high;

 } else {

  T a = (y_high - y_low) / (x_high - x_low);
  T b = y_low - (a * x_low);
  return (a * value) + b;
 }
}
# 180 "./src/lib/mathlib/math/Functions.hpp"
template<typename T, size_t N>
const T interpolateN(const T &value, const T(&y)[N])
{
 size_t index = constrain((int)(value * (N - 1)), 0, (int)(N - 2));
 return interpolate(value, (T)index / (T)(N - 1), (T)(index + 1) / (T)(N - 1), y[index], y[index + 1]);
}
# 200 "./src/lib/mathlib/math/Functions.hpp"
template<typename T, size_t N>
const T interpolateNXY(const T &value, const T(&x)[N], const T(&y)[N])
{
 size_t index = 0;

 while ((value > x[index + 1]) && (index < (N - 2))) {
  index++;
 }

 return interpolate(value, x[index], x[index + 1], y[index], y[index + 1]);
}
# 224 "./src/lib/mathlib/math/Functions.hpp"
template<typename T>
const T sqrt_linear(const T &value)
{
 if (value < static_cast<T>(0)) {
  return static_cast<T>(0);

 } else if (value < static_cast<T>(1)) {
  return sqrtf(value);

 } else {
  return value;
 }
}







template<typename T>
const T lerp(const T &a, const T &b, const T &s)
{
 return (static_cast<T>(1) - s) * a + s * b;
}

template<typename T>
constexpr T negate(T value)
{
 static_assert(sizeof(T) > 2, "implement for T");
 return -value;
}

template<>
constexpr int16_t negate<int16_t>(int16_t value)
{
 if (value == 
# 260 "./src/lib/mathlib/math/Functions.hpp" 3 4
             (32767)
# 260 "./src/lib/mathlib/math/Functions.hpp"
                      ) {
  return 
# 261 "./src/lib/mathlib/math/Functions.hpp" 3 4
        (-32767-1)
# 261 "./src/lib/mathlib/math/Functions.hpp"
                 ;

 } else if (value == 
# 263 "./src/lib/mathlib/math/Functions.hpp" 3 4
                    (-32767-1)
# 263 "./src/lib/mathlib/math/Functions.hpp"
                             ) {
  return 
# 264 "./src/lib/mathlib/math/Functions.hpp" 3 4
        (32767)
# 264 "./src/lib/mathlib/math/Functions.hpp"
                 ;
 }

 return -value;
}






template<typename T>
int countSetBits(T n)
{
 int count = 0;

 while (n) {
  count += n & 1;
  n >>= 1;
 }

 return count;
}

inline bool isFinite(const float &value)
{
 return PX4_ISFINITE(value);
}

inline bool isFinite(const matrix::Vector2f &value)
{
 return value.isAllFinite();
}

inline bool isFinite(const matrix::Vector3f &value)
{
 return value.isAllFinite();
}

}
# 47 "./src/lib/mathlib/math/filter/AlphaFilter.hpp" 2

using namespace math;

template <typename T>
class AlphaFilter
{
public:
 AlphaFilter() = default;
 explicit AlphaFilter(float sample_interval, float time_constant) { setParameters(sample_interval, time_constant); }
 explicit AlphaFilter(float time_constant) : _time_constant(time_constant) {};

 ~AlphaFilter() = default;
# 68 "./src/lib/mathlib/math/filter/AlphaFilter.hpp"
 void setParameters(float sample_interval, float time_constant)
 {
  const float denominator = time_constant + sample_interval;

  if (denominator > 1.19209289550781250000000000000000000e-7F) {
   setAlpha(sample_interval / denominator);
  }

  _time_constant = time_constant;
 }

 bool setCutoffFreq(float sample_freq, float cutoff_freq)
 {
  if ((sample_freq <= 0.f) || (cutoff_freq <= 0.f) || (cutoff_freq >= sample_freq / 2.f)
      || !isFinite(sample_freq) || !isFinite(cutoff_freq)) {


   return false;
  }

  setParameters(1.f / sample_freq, 1.f / (6.28318531f * cutoff_freq));
  return true;
 }

 void setCutoffFreq(float cutoff_freq)
 {
  if (cutoff_freq > 1.19209289550781250000000000000000000e-7F) {
   _time_constant = 1.f / (6.28318531f * cutoff_freq);

  } else {
   _time_constant = 0.f;
  }
 }






 void setAlpha(float alpha) { _alpha = alpha; }






 void reset(const T &sample) { _filter_state = sample; }






 const T &update(const T &sample)
 {
  _filter_state = updateCalculation(sample);
  return _filter_state;
 }

 const T update(const T &sample, float dt)
 {
  setParameters(dt, _time_constant);
  return update(sample);
 }

 const T &getState() const { return _filter_state; }
 float getCutoffFreq() const { return 1.f / (6.28318531f * _time_constant); }

protected:
 T updateCalculation(const T &sample);

 float _time_constant{0.f};
 float _alpha{0.f};
 T _filter_state{};
};

template <typename T>
T AlphaFilter<T>::updateCalculation(const T &sample) { return _filter_state + _alpha * (sample - _filter_state); }






template <> inline
matrix::Quatf AlphaFilter<matrix::Quatf>::updateCalculation(const matrix::Quatf &sample)
{
 matrix::Quatf q_error(_filter_state.inversed() * sample);
 q_error.canonicalize();
 return _filter_state * matrix::Quatf(matrix::AxisAnglef(_alpha * matrix::AxisAnglef(q_error)));
}
# 56 "./src/lib/battery/battery.h" 2
# 1 "./platforms/common/uORB/PublicationMulti.hpp" 1
# 39 "./platforms/common/uORB/PublicationMulti.hpp"
       


# 1 "./src/lib/systemlib/err.h" 1
# 68 "./src/lib/systemlib/err.h"
# 1 "./platforms/common/include/px4_platform_common/log.h" 1
# 39 "./platforms/common/include/px4_platform_common/log.h"
       
# 48 "./platforms/common/include/px4_platform_common/log.h"
static inline void do_nothing(int level, ...)
{
 (void)level;
}


# 53 "./platforms/common/include/px4_platform_common/log.h" 3 4
extern "C" {





# 58 "./platforms/common/include/px4_platform_common/log.h"
__EXPORT extern void px4_log_initialize(void);


# 60 "./platforms/common/include/px4_platform_common/log.h" 3 4
}
# 121 "./platforms/common/include/px4_platform_common/log.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stdarg.h" 1 3 4
# 122 "./platforms/common/include/px4_platform_common/log.h" 2




extern "C" {


# 128 "./platforms/common/include/px4_platform_common/log.h"
__EXPORT extern const char *__px4_log_level_str[4 + 1];
__EXPORT void px4_log_modulename(int level, const char *moduleName, const char *fmt, ...)
__attribute__((format(printf, 3, 4)));
__EXPORT void px4_log_raw(int level, const char *fmt, ...)
__attribute__((format(printf, 2, 3)));
__EXPORT void px4_log_history(FILE *out);



#pragma GCC diagnostic ignored "-Wformat-zero-length"



# 140 "./platforms/common/include/px4_platform_common/log.h" 3 4
}
# 69 "./src/lib/systemlib/err.h" 2


# 1 "/usr/include/c++/9/stdlib.h" 1 3
# 72 "./src/lib/systemlib/err.h" 2

extern "C" {
# 97 "./src/lib/systemlib/err.h"
}
# 43 "./platforms/common/uORB/PublicationMulti.hpp" 2
# 1 "./platforms/common/uORB/uORB.h" 1
# 34 "./platforms/common/uORB/uORB.h"
       
# 45 "./platforms/common/uORB/uORB.h"

# 45 "./platforms/common/uORB/uORB.h"
typedef uint16_t orb_id_size_t;




struct orb_metadata {
 const char *o_name;
 const uint16_t o_size;
 const uint16_t o_size_no_padding;
 uint32_t message_hash;
 orb_id_size_t o_id;
 uint8_t o_queue;

};

typedef const struct orb_metadata *orb_id_t;
# 119 "./platforms/common/uORB/uORB.h"

# 119 "./platforms/common/uORB/uORB.h" 3 4
extern "C" {


# 121 "./platforms/common/uORB/uORB.h"
int uorb_start(void);
int uorb_status(void);
int uorb_top(char **topic_filter, int num_filters);
# 135 "./platforms/common/uORB/uORB.h"
typedef void *orb_advert_t;




extern orb_advert_t orb_advertise(const struct orb_metadata *meta, const void *data) __EXPORT;




extern orb_advert_t orb_advertise_multi(const struct orb_metadata *meta, const void *data, int *instance) __EXPORT;




extern int orb_unadvertise(orb_advert_t handle) __EXPORT;




extern int orb_publish(const struct orb_metadata *meta, orb_advert_t handle, const void *data) __EXPORT;
# 165 "./platforms/common/uORB/uORB.h"
static inline int orb_publish_auto(const struct orb_metadata *meta, orb_advert_t *handle, const void *data,
       int *instance)
{
 if (!*handle) {
  *handle = orb_advertise_multi(meta, data, instance);

  if (*handle) {
   return 0;
  }

 } else {
  return orb_publish(meta, *handle, data);
 }

 return -1;
}




extern int orb_subscribe(const struct orb_metadata *meta) __EXPORT;




extern int orb_subscribe_multi(const struct orb_metadata *meta, unsigned instance) __EXPORT;




extern int orb_unsubscribe(int handle) __EXPORT;




extern int orb_copy(const struct orb_metadata *meta, int handle, void *buffer) __EXPORT;




extern int orb_check(int handle, bool *updated) __EXPORT;




extern int orb_exists(const struct orb_metadata *meta, int instance) __EXPORT;







extern int orb_group_count(const struct orb_metadata *meta) __EXPORT;




extern int orb_set_interval(int handle, unsigned interval) __EXPORT;




extern int orb_get_interval(int handle, unsigned *interval) __EXPORT;





const char *orb_get_c_type(unsigned char short_type);





extern uint8_t orb_get_queue_size(const struct orb_metadata *meta);






void orb_print_message_internal(const struct orb_metadata *meta, const void *data, bool print_topic_name);


# 249 "./platforms/common/uORB/uORB.h" 3 4
}



# 252 "./platforms/common/uORB/uORB.h"
typedef uint8_t arming_state_t;
typedef uint8_t main_state_t;
typedef uint8_t hil_state_t;
typedef uint8_t navigation_state_t;
typedef uint8_t switch_pos_t;
# 44 "./platforms/common/uORB/PublicationMulti.hpp" 2
# 1 "./platforms/common/uORB/uORBDeviceNode.hpp" 1
# 34 "./platforms/common/uORB/uORBDeviceNode.hpp"
       

# 1 "./platforms/common/uORB/uORBCommon.hpp" 1
# 37 "./platforms/common/uORB/uORBCommon.hpp"
# 1 "./src/drivers/drv_orb_dev.h" 1
# 38 "./platforms/common/uORB/uORBCommon.hpp" 2





namespace uORB
{
static constexpr unsigned orb_maxpath = 64;

struct orb_advertdata {
 const struct orb_metadata *meta;
 int *instance;
};

}
# 37 "./platforms/common/uORB/uORBDeviceNode.hpp" 2
# 1 "./platforms/common/uORB/uORBDeviceMaster.hpp" 1
# 34 "./platforms/common/uORB/uORBDeviceMaster.hpp"
       




# 1 "./build/px4_sitl_default/uORB/topics/uORBTopics.hpp" 1
# 35 "./build/px4_sitl_default/uORB/topics/uORBTopics.hpp"
       

# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h" 1 3 4
# 38 "./build/px4_sitl_default/uORB/topics/uORBTopics.hpp" 2



static constexpr size_t ORB_TOPICS_COUNT{302};
static constexpr size_t orb_topics_count() { return ORB_TOPICS_COUNT; }




extern const struct orb_metadata *const *orb_get_topics() __EXPORT;

enum class ORB_ID : orb_id_size_t {
 action_request = 0,
 actuator_armed = 1,
 actuator_controls_status_0 = 2,
 actuator_controls_status_1 = 3,
 actuator_motors = 4,
 actuator_outputs = 5,
 actuator_outputs_debug = 6,
 actuator_outputs_sim = 7,
 actuator_servos = 8,
 actuator_servos_trim = 9,
 actuator_test = 10,
 adc_report = 11,
 airspeed = 12,
 airspeed_validated = 13,
 airspeed_wind = 14,
 arming_check_reply = 15,
 arming_check_request = 16,
 autotune_attitude_control_status = 17,
 aux_global_position = 18,
 battery_info = 19,
 battery_status = 20,
 button_event = 21,
 camera_capture = 22,
 camera_status = 23,
 camera_trigger = 24,
 can_interface_status = 25,
 cellular_status = 26,
 collision_constraints = 27,
 config_control_setpoints = 28,
 config_overrides = 29,
 config_overrides_request = 30,
 control_allocator_status = 31,
 cpuload = 32,
 dataman_request = 33,
 dataman_response = 34,
 debug_array = 35,
 debug_key_value = 36,
 debug_value = 37,
 debug_vect = 38,
 differential_pressure = 39,
 distance_sensor = 40,
 distance_sensor_mode_change_request = 41,
 dronecan_node_status = 42,
 ekf2_timestamps = 43,
 esc_report = 44,
 esc_serial_passthru = 45,
 esc_status = 46,
 estimator_aid_src_airspeed = 47,
 estimator_aid_src_aux_global_position = 48,
 estimator_aid_src_aux_vel = 49,
 estimator_aid_src_baro_hgt = 50,
 estimator_aid_src_drag = 51,
 estimator_aid_src_ev_hgt = 52,
 estimator_aid_src_ev_pos = 53,
 estimator_aid_src_ev_vel = 54,
 estimator_aid_src_ev_yaw = 55,
 estimator_aid_src_fake_hgt = 56,
 estimator_aid_src_fake_pos = 57,
 estimator_aid_src_gnss_hgt = 58,
 estimator_aid_src_gnss_pos = 59,
 estimator_aid_src_gnss_vel = 60,
 estimator_aid_src_gnss_yaw = 61,
 estimator_aid_src_gravity = 62,
 estimator_aid_src_mag = 63,
 estimator_aid_src_optical_flow = 64,
 estimator_aid_src_rng_hgt = 65,
 estimator_aid_src_sideslip = 66,
 estimator_attitude = 67,
 estimator_baro_bias = 68,
 estimator_bias3d = 69,
 estimator_ev_pos_bias = 70,
 estimator_event_flags = 71,
 estimator_global_position = 72,
 estimator_gnss_hgt_bias = 73,
 estimator_gps_status = 74,
 estimator_innovation_test_ratios = 75,
 estimator_innovation_variances = 76,
 estimator_innovations = 77,
 estimator_local_position = 78,
 estimator_odometry = 79,
 estimator_optical_flow_vel = 80,
 estimator_selector_status = 81,
 estimator_sensor_bias = 82,
 estimator_states = 83,
 estimator_status = 84,
 estimator_status_flags = 85,
 estimator_wind = 86,
 event = 87,
 external_ins_attitude = 88,
 external_ins_global_position = 89,
 external_ins_local_position = 90,
 failsafe_flags = 91,
 failure_detector_status = 92,
 figure_eight_status = 93,
 fixed_wing_lateral_guidance_status = 94,
 fixed_wing_lateral_setpoint = 95,
 fixed_wing_lateral_status = 96,
 fixed_wing_longitudinal_setpoint = 97,
 fixed_wing_runway_control = 98,
 flaps_setpoint = 99,
 flight_phase_estimation = 100,
 follow_target = 101,
 follow_target_estimator = 102,
 follow_target_status = 103,
 fuel_tank_status = 104,
 fw_virtual_attitude_setpoint = 105,
 generator_status = 106,
 geofence_result = 107,
 geofence_status = 108,
 gimbal_controls = 109,
 gimbal_device_attitude_status = 110,
 gimbal_device_information = 111,
 gimbal_device_set_attitude = 112,
 gimbal_manager_information = 113,
 gimbal_manager_set_attitude = 114,
 gimbal_manager_set_manual_control = 115,
 gimbal_manager_status = 116,
 gimbal_v1_command = 117,
 goto_setpoint = 118,
 gpio_config = 119,
 gpio_in = 120,
 gpio_out = 121,
 gpio_request = 122,
 gps_dump = 123,
 gps_inject_data = 124,
 gripper = 125,
 health_report = 126,
 heater_status = 127,
 home_position = 128,
 hover_thrust_estimate = 129,
 input_rc = 130,
 internal_combustion_engine_control = 131,
 internal_combustion_engine_status = 132,
 iridiumsbd_status = 133,
 irlock_report = 134,
 landing_gear = 135,
 landing_gear_wheel = 136,
 landing_target_innovations = 137,
 landing_target_pose = 138,
 lateral_control_configuration = 139,
 launch_detection_status = 140,
 led_control = 141,
 log_message = 142,
 logger_status = 143,
 longitudinal_control_configuration = 144,
 mag_worker_data = 145,
 magnetometer_bias_estimate = 146,
 manual_control_input = 147,
 manual_control_setpoint = 148,
 manual_control_switches = 149,
 mavlink_log = 150,
 mavlink_tunnel = 151,
 mc_virtual_attitude_setpoint = 152,
 message_format_request = 153,
 message_format_response = 154,
 mission = 155,
 mission_result = 156,
 mode_completed = 157,
 mount_orientation = 158,
 navigator_mission_item = 159,
 navigator_status = 160,
 neural_control = 161,
 obstacle_distance = 162,
 obstacle_distance_fused = 163,
 offboard_control_mode = 164,
 onboard_computer_status = 165,
 open_drone_id_arm_status = 166,
 open_drone_id_operator_id = 167,
 open_drone_id_self_id = 168,
 open_drone_id_system = 169,
 orb_multitest = 170,
 orb_test = 171,
 orb_test_large = 172,
 orb_test_medium = 173,
 orb_test_medium_multi = 174,
 orb_test_medium_queue = 175,
 orb_test_medium_queue_poll = 176,
 orb_test_medium_wrap_around = 177,
 orbit_status = 178,
 parameter_primary_set_value_request = 179,
 parameter_primary_set_value_response = 180,
 parameter_remote_set_value_request = 181,
 parameter_remote_set_value_response = 182,
 parameter_reset_request = 183,
 parameter_set_used_request = 184,
 parameter_set_value_request = 185,
 parameter_set_value_response = 186,
 parameter_update = 187,
 ping = 188,
 position_controller_landing_status = 189,
 position_controller_status = 190,
 position_setpoint = 191,
 position_setpoint_triplet = 192,
 power_button_state = 193,
 power_monitor = 194,
 pps_capture = 195,
 pure_pursuit_status = 196,
 pwm_input = 197,
 px4io_status = 198,
 qshell_req = 199,
 qshell_retval = 200,
 radio_status = 201,
 rate_ctrl_status = 202,
 rc_channels = 203,
 rc_parameter_map = 204,
 register_ext_component_reply = 205,
 register_ext_component_request = 206,
 rover_attitude_setpoint = 207,
 rover_attitude_status = 208,
 rover_position_setpoint = 209,
 rover_rate_setpoint = 210,
 rover_rate_status = 211,
 rover_speed_setpoint = 212,
 rover_speed_status = 213,
 rover_steering_setpoint = 214,
 rover_throttle_setpoint = 215,
 rpm = 216,
 rtl_status = 217,
 rtl_time_estimate = 218,
 safety_button = 219,
 satellite_info = 220,
 sensor_accel = 221,
 sensor_accel_fifo = 222,
 sensor_airflow = 223,
 sensor_baro = 224,
 sensor_combined = 225,
 sensor_correction = 226,
 sensor_gnss_relative = 227,
 sensor_gnss_status = 228,
 sensor_gps = 229,
 sensor_gyro = 230,
 sensor_gyro_fft = 231,
 sensor_gyro_fifo = 232,
 sensor_hygrometer = 233,
 sensor_mag = 234,
 sensor_optical_flow = 235,
 sensor_preflight_mag = 236,
 sensor_selection = 237,
 sensor_temp = 238,
 sensor_uwb = 239,
 sensors_status_baro = 240,
 sensors_status_imu = 241,
 sensors_status_mag = 242,
 spoilers_setpoint = 243,
 system_power = 244,
 takeoff_status = 245,
 task_stack_info = 246,
 tecs_status = 247,
 telemetry_status = 248,
 tiltrotor_extra_controls = 249,
 timesync_status = 250,
 trajectory_setpoint = 251,
 trajectory_setpoint6dof = 252,
 transponder_report = 253,
 tune_control = 254,
 uavcan_parameter_request = 255,
 uavcan_parameter_value = 256,
 ulog_stream = 257,
 ulog_stream_ack = 258,
 unregister_ext_component = 259,
 vehicle_acceleration = 260,
 vehicle_air_data = 261,
 vehicle_angular_acceleration_setpoint = 262,
 vehicle_angular_velocity = 263,
 vehicle_angular_velocity_groundtruth = 264,
 vehicle_attitude = 265,
 vehicle_attitude_groundtruth = 266,
 vehicle_attitude_setpoint = 267,
 vehicle_command = 268,
 vehicle_command_ack = 269,
 vehicle_command_mode_executor = 270,
 vehicle_constraints = 271,
 vehicle_control_mode = 272,
 vehicle_global_position = 273,
 vehicle_global_position_groundtruth = 274,
 vehicle_gps_position = 275,
 vehicle_imu = 276,
 vehicle_imu_status = 277,
 vehicle_land_detected = 278,
 vehicle_local_position = 279,
 vehicle_local_position_groundtruth = 280,
 vehicle_local_position_setpoint = 281,
 vehicle_magnetometer = 282,
 vehicle_mocap_odometry = 283,
 vehicle_odometry = 284,
 vehicle_optical_flow = 285,
 vehicle_optical_flow_vel = 286,
 vehicle_rates_setpoint = 287,
 vehicle_roi = 288,
 vehicle_status = 289,
 vehicle_thrust_setpoint = 290,
 vehicle_thrust_setpoint_virtual_fw = 291,
 vehicle_thrust_setpoint_virtual_mc = 292,
 vehicle_torque_setpoint = 293,
 vehicle_torque_setpoint_virtual_fw = 294,
 vehicle_torque_setpoint_virtual_mc = 295,
 vehicle_visual_odometry = 296,
 velocity_limits = 297,
 vtol_vehicle_status = 298,
 wheel_encoders = 299,
 wind = 300,
 yaw_estimator_status = 301,

 INVALID
};

const struct orb_metadata *get_orb_meta(ORB_ID id);
# 40 "./platforms/common/uORB/uORBDeviceMaster.hpp" 2

# 1 "./platforms/common/include/px4_platform_common/posix.h" 1
# 40 "./platforms/common/include/px4_platform_common/posix.h"
       


# 1 "./platforms/common/include/px4_platform_common/tasks.h" 1
# 43 "./platforms/common/include/px4_platform_common/tasks.h"
       
# 87 "./platforms/common/include/px4_platform_common/tasks.h"
# 1 "/usr/include/x86_64-linux-gnu/sys/prctl.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/sys/prctl.h" 3 4
# 1 "/usr/include/linux/prctl.h" 1 3 4




# 1 "/usr/include/linux/types.h" 1 3 4




# 1 "/usr/include/x86_64-linux-gnu/asm/types.h" 1 3 4
# 1 "/usr/include/asm-generic/types.h" 1 3 4






# 1 "/usr/include/asm-generic/int-ll64.h" 1 3 4
# 12 "/usr/include/asm-generic/int-ll64.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/asm/bitsperlong.h" 1 3 4
# 11 "/usr/include/x86_64-linux-gnu/asm/bitsperlong.h" 3 4
# 1 "/usr/include/asm-generic/bitsperlong.h" 1 3 4
# 12 "/usr/include/x86_64-linux-gnu/asm/bitsperlong.h" 2 3 4
# 13 "/usr/include/asm-generic/int-ll64.h" 2 3 4








# 20 "/usr/include/asm-generic/int-ll64.h" 3 4
typedef __signed__ char __s8;
typedef unsigned char __u8;

typedef __signed__ short __s16;
typedef unsigned short __u16;

typedef __signed__ int __s32;
typedef unsigned int __u32;


__extension__ typedef __signed__ long long __s64;
__extension__ typedef unsigned long long __u64;
# 8 "/usr/include/asm-generic/types.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/asm/types.h" 2 3 4
# 6 "/usr/include/linux/types.h" 2 3 4



# 1 "/usr/include/linux/posix_types.h" 1 3 4




# 1 "/usr/include/linux/stddef.h" 1 3 4
# 6 "/usr/include/linux/posix_types.h" 2 3 4
# 25 "/usr/include/linux/posix_types.h" 3 4
typedef struct {
 unsigned long fds_bits[1024 / (8 * sizeof(long))];
} __kernel_fd_set;


typedef void (*__kernel_sighandler_t)(int);


typedef int __kernel_key_t;
typedef int __kernel_mqd_t;

# 1 "/usr/include/x86_64-linux-gnu/asm/posix_types.h" 1 3 4






# 1 "/usr/include/x86_64-linux-gnu/asm/posix_types_64.h" 1 3 4
# 11 "/usr/include/x86_64-linux-gnu/asm/posix_types_64.h" 3 4
typedef unsigned short __kernel_old_uid_t;
typedef unsigned short __kernel_old_gid_t;


typedef unsigned long __kernel_old_dev_t;


# 1 "/usr/include/asm-generic/posix_types.h" 1 3 4
# 15 "/usr/include/asm-generic/posix_types.h" 3 4
typedef long __kernel_long_t;
typedef unsigned long __kernel_ulong_t;



typedef __kernel_ulong_t __kernel_ino_t;



typedef unsigned int __kernel_mode_t;



typedef int __kernel_pid_t;



typedef int __kernel_ipc_pid_t;



typedef unsigned int __kernel_uid_t;
typedef unsigned int __kernel_gid_t;



typedef __kernel_long_t __kernel_suseconds_t;



typedef int __kernel_daddr_t;



typedef unsigned int __kernel_uid32_t;
typedef unsigned int __kernel_gid32_t;
# 72 "/usr/include/asm-generic/posix_types.h" 3 4
typedef __kernel_ulong_t __kernel_size_t;
typedef __kernel_long_t __kernel_ssize_t;
typedef __kernel_long_t __kernel_ptrdiff_t;




typedef struct {
 int val[2];
} __kernel_fsid_t;





typedef __kernel_long_t __kernel_off_t;
typedef long long __kernel_loff_t;
typedef __kernel_long_t __kernel_time_t;
typedef long long __kernel_time64_t;
typedef __kernel_long_t __kernel_clock_t;
typedef int __kernel_timer_t;
typedef int __kernel_clockid_t;
typedef char * __kernel_caddr_t;
typedef unsigned short __kernel_uid16_t;
typedef unsigned short __kernel_gid16_t;
# 19 "/usr/include/x86_64-linux-gnu/asm/posix_types_64.h" 2 3 4
# 8 "/usr/include/x86_64-linux-gnu/asm/posix_types.h" 2 3 4
# 37 "/usr/include/linux/posix_types.h" 2 3 4
# 10 "/usr/include/linux/types.h" 2 3 4
# 24 "/usr/include/linux/types.h" 3 4
typedef __u16 __le16;
typedef __u16 __be16;
typedef __u32 __le32;
typedef __u32 __be32;
typedef __u64 __le64;
typedef __u64 __be64;

typedef __u16 __sum16;
typedef __u32 __wsum;
# 47 "/usr/include/linux/types.h" 3 4
typedef unsigned __poll_t;
# 6 "/usr/include/linux/prctl.h" 2 3 4
# 134 "/usr/include/linux/prctl.h" 3 4
struct prctl_mm_map {
 __u64 start_code;
 __u64 end_code;
 __u64 start_data;
 __u64 end_data;
 __u64 start_brk;
 __u64 brk;
 __u64 start_stack;
 __u64 arg_start;
 __u64 arg_end;
 __u64 env_start;
 __u64 env_end;
 __u64 *auxv;
 __u32 auxv_size;
 __u32 exe_fd;
};
# 23 "/usr/include/x86_64-linux-gnu/sys/prctl.h" 2 3 4

extern "C" {


extern int prctl (int __option, ...) throw ();

}
# 88 "./platforms/common/include/px4_platform_common/tasks.h" 2





# 92 "./platforms/common/include/px4_platform_common/tasks.h"
typedef int px4_task_t;

typedef struct {
 int argc;
 char **argv;
} px4_task_args_t;
# 155 "./platforms/common/include/px4_platform_common/tasks.h"
typedef int (*px4_main_t)(int argc, char *argv[]);


# 157 "./platforms/common/include/px4_platform_common/tasks.h" 3 4
extern "C" {



# 160 "./platforms/common/include/px4_platform_common/tasks.h"
__EXPORT px4_task_t px4_task_spawn_cmd(const char *name,
           int scheduler,
           int priority,
           int stack_size,
           px4_main_t entry,
           char *const argv[]);


__EXPORT int px4_task_delete(px4_task_t pid);


__EXPORT int px4_task_kill(px4_task_t pid, int sig);


__EXPORT void px4_task_exit(int ret);


__EXPORT void px4_show_tasks(void);


__EXPORT bool px4_task_is_running(const char *taskname);



__EXPORT int px4_prctl(int option, const char *arg2, px4_task_t pid);



__EXPORT const char *px4_get_taskname(void);


# 190 "./platforms/common/include/px4_platform_common/tasks.h" 3 4
}
# 44 "./platforms/common/include/px4_platform_common/posix.h" 2


# 1 "/usr/include/fcntl.h" 1 3 4
# 28 "/usr/include/fcntl.h" 3 4
extern "C" {






# 1 "/usr/include/x86_64-linux-gnu/bits/fcntl.h" 1 3 4
# 35 "/usr/include/x86_64-linux-gnu/bits/fcntl.h" 3 4
struct flock
  {
    short int l_type;
    short int l_whence;

    __off_t l_start;
    __off_t l_len;




    __pid_t l_pid;
  };


struct flock64
  {
    short int l_type;
    short int l_whence;
    __off64_t l_start;
    __off64_t l_len;
    __pid_t l_pid;
  };



# 1 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h" 1 3 4
# 38 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/struct_iovec.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/types/struct_iovec.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/types/struct_iovec.h" 2 3 4


struct iovec
  {
    void *iov_base;
    size_t iov_len;
  };
# 39 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h" 2 3 4
# 265 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h" 3 4
enum __pid_type
  {
    F_OWNER_TID = 0,
    F_OWNER_PID,
    F_OWNER_PGRP,
    F_OWNER_GID = F_OWNER_PGRP
  };


struct f_owner_ex
  {
    enum __pid_type type;
    __pid_t pid;
  };
# 353 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h" 3 4
# 1 "/usr/include/linux/falloc.h" 1 3 4
# 354 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h" 2 3 4



struct file_handle
{
  unsigned int handle_bytes;
  int handle_type;

  unsigned char f_handle[0];
};
# 392 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h" 3 4
extern "C" {




extern __ssize_t readahead (int __fd, __off64_t __offset, size_t __count)
    throw ();






extern int sync_file_range (int __fd, __off64_t __offset, __off64_t __count,
       unsigned int __flags);






extern __ssize_t vmsplice (int __fdout, const struct iovec *__iov,
      size_t __count, unsigned int __flags);





extern __ssize_t splice (int __fdin, __off64_t *__offin, int __fdout,
    __off64_t *__offout, size_t __len,
    unsigned int __flags);





extern __ssize_t tee (int __fdin, int __fdout, size_t __len,
        unsigned int __flags);






extern int fallocate (int __fd, int __mode, __off_t __offset, __off_t __len);
# 447 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h" 3 4
extern int fallocate64 (int __fd, int __mode, __off64_t __offset,
   __off64_t __len);




extern int name_to_handle_at (int __dfd, const char *__name,
         struct file_handle *__handle, int *__mnt_id,
         int __flags) throw ();





extern int open_by_handle_at (int __mountdirfd, struct file_handle *__handle,
         int __flags);



}
# 61 "/usr/include/x86_64-linux-gnu/bits/fcntl.h" 2 3 4
# 36 "/usr/include/fcntl.h" 2 3 4
# 78 "/usr/include/fcntl.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stat.h" 1 3 4
# 46 "/usr/include/x86_64-linux-gnu/bits/stat.h" 3 4
struct stat
  {
    __dev_t st_dev;




    __ino_t st_ino;







    __nlink_t st_nlink;
    __mode_t st_mode;

    __uid_t st_uid;
    __gid_t st_gid;

    int __pad0;

    __dev_t st_rdev;




    __off_t st_size;



    __blksize_t st_blksize;

    __blkcnt_t st_blocks;
# 91 "/usr/include/x86_64-linux-gnu/bits/stat.h" 3 4
    struct timespec st_atim;
    struct timespec st_mtim;
    struct timespec st_ctim;
# 106 "/usr/include/x86_64-linux-gnu/bits/stat.h" 3 4
    __syscall_slong_t __glibc_reserved[3];
# 115 "/usr/include/x86_64-linux-gnu/bits/stat.h" 3 4
  };



struct stat64
  {
    __dev_t st_dev;

    __ino64_t st_ino;
    __nlink_t st_nlink;
    __mode_t st_mode;






    __uid_t st_uid;
    __gid_t st_gid;

    int __pad0;
    __dev_t st_rdev;
    __off_t st_size;





    __blksize_t st_blksize;
    __blkcnt64_t st_blocks;







    struct timespec st_atim;
    struct timespec st_mtim;
    struct timespec st_ctim;
# 164 "/usr/include/x86_64-linux-gnu/bits/stat.h" 3 4
    __syscall_slong_t __glibc_reserved[3];



  };
# 79 "/usr/include/fcntl.h" 2 3 4
# 148 "/usr/include/fcntl.h" 3 4
extern int fcntl (int __fd, int __cmd, ...);
# 157 "/usr/include/fcntl.h" 3 4
extern int fcntl64 (int __fd, int __cmd, ...);
# 168 "/usr/include/fcntl.h" 3 4
extern int open (const char *__file, int __oflag, ...) __attribute__ ((__nonnull__ (1)));
# 178 "/usr/include/fcntl.h" 3 4
extern int open64 (const char *__file, int __oflag, ...) __attribute__ ((__nonnull__ (1)));
# 192 "/usr/include/fcntl.h" 3 4
extern int openat (int __fd, const char *__file, int __oflag, ...)
     __attribute__ ((__nonnull__ (2)));
# 203 "/usr/include/fcntl.h" 3 4
extern int openat64 (int __fd, const char *__file, int __oflag, ...)
     __attribute__ ((__nonnull__ (2)));
# 214 "/usr/include/fcntl.h" 3 4
extern int creat (const char *__file, mode_t __mode) __attribute__ ((__nonnull__ (1)));
# 224 "/usr/include/fcntl.h" 3 4
extern int creat64 (const char *__file, mode_t __mode) __attribute__ ((__nonnull__ (1)));
# 260 "/usr/include/fcntl.h" 3 4
extern int posix_fadvise (int __fd, off_t __offset, off_t __len,
     int __advise) throw ();
# 272 "/usr/include/fcntl.h" 3 4
extern int posix_fadvise64 (int __fd, off64_t __offset, off64_t __len,
       int __advise) throw ();
# 282 "/usr/include/fcntl.h" 3 4
extern int posix_fallocate (int __fd, off_t __offset, off_t __len);
# 293 "/usr/include/fcntl.h" 3 4
extern int posix_fallocate64 (int __fd, off64_t __offset, off64_t __len);
# 304 "/usr/include/fcntl.h" 3 4
}
# 47 "./platforms/common/include/px4_platform_common/posix.h" 2


# 1 "./platforms/common/include/px4_platform_common/sem.h" 1
# 40 "./platforms/common/include/px4_platform_common/sem.h"
       

# 1 "/usr/include/semaphore.h" 1 3 4
# 28 "/usr/include/semaphore.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/semaphore.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/semaphore.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/semaphore.h" 2 3 4
# 36 "/usr/include/x86_64-linux-gnu/bits/semaphore.h" 3 4
typedef union
{
  char __size[32];
  long int __align;
} sem_t;
# 29 "/usr/include/semaphore.h" 2 3 4


extern "C" {



extern int sem_init (sem_t *__sem, int __pshared, unsigned int __value)
  throw () __attribute__ ((__nonnull__ (1)));


extern int sem_destroy (sem_t *__sem) throw () __attribute__ ((__nonnull__ (1)));


extern sem_t *sem_open (const char *__name, int __oflag, ...)
  throw () __attribute__ ((__nonnull__ (1)));


extern int sem_close (sem_t *__sem) throw () __attribute__ ((__nonnull__ (1)));


extern int sem_unlink (const char *__name) throw () __attribute__ ((__nonnull__ (1)));





extern int sem_wait (sem_t *__sem) __attribute__ ((__nonnull__ (1)));






extern int sem_timedwait (sem_t *__restrict __sem,
     const struct timespec *__restrict __abstime)
  __attribute__ ((__nonnull__ (1, 2)));



extern int sem_clockwait (sem_t *__restrict __sem,
     clockid_t clock,
     const struct timespec *__restrict __abstime)
  __attribute__ ((__nonnull__ (1, 3)));



extern int sem_trywait (sem_t *__sem) throw () __attribute__ ((__nonnull__ (1)));


extern int sem_post (sem_t *__sem) throw () __attribute__ ((__nonnull__ (1)));


extern int sem_getvalue (sem_t *__restrict __sem, int *__restrict __sval)
  throw () __attribute__ ((__nonnull__ (1, 2)));


}
# 43 "./platforms/common/include/px4_platform_common/sem.h" 2
# 55 "./platforms/common/include/px4_platform_common/sem.h"
extern "C" {


# 57 "./platforms/common/include/px4_platform_common/sem.h"
typedef struct {
 pthread_mutex_t lock;
 pthread_cond_t wait;
 int value;
} px4_sem_t;

__EXPORT int px4_sem_init(px4_sem_t *s, int pshared, unsigned value);
__EXPORT int px4_sem_setprotocol(px4_sem_t *s, int protocol);
__EXPORT int px4_sem_wait(px4_sem_t *s);
__EXPORT int px4_sem_trywait(px4_sem_t *sem);
__EXPORT int px4_sem_timedwait(px4_sem_t *sem, const struct timespec *abstime);
__EXPORT int px4_sem_post(px4_sem_t *s);
__EXPORT int px4_sem_getvalue(px4_sem_t *s, int *sval);
__EXPORT int px4_sem_destroy(px4_sem_t *s);


# 72 "./platforms/common/include/px4_platform_common/sem.h" 3 4
}
# 50 "./platforms/common/include/px4_platform_common/posix.h" 2
# 84 "./platforms/common/include/px4_platform_common/posix.h"
extern "C" {


# 86 "./platforms/common/include/px4_platform_common/posix.h"
typedef short px4_pollevent_t;

typedef struct {

 int fd;
 px4_pollevent_t events;
 px4_pollevent_t revents;


 px4_sem_t *sem;
 void *priv;
} px4_pollfd_struct_t;
# 116 "./platforms/common/include/px4_platform_common/posix.h"
__EXPORT int px4_open(const char *path, int flags, ...);
__EXPORT int px4_close(int fd);
__EXPORT ssize_t px4_read(int fd, void *buffer, size_t buflen);
__EXPORT ssize_t px4_write(int fd, const void *buffer, size_t buflen);
__EXPORT int px4_ioctl(int fd, int cmd, unsigned long arg);
__EXPORT int px4_poll(px4_pollfd_struct_t *fds, unsigned int nfds, int timeout);
__EXPORT int px4_access(const char *pathname, int mode);
__EXPORT px4_task_t px4_getpid(void);


# 125 "./platforms/common/include/px4_platform_common/posix.h" 3 4
}
# 136 "./platforms/common/include/px4_platform_common/posix.h"
extern "C" {


# 138 "./platforms/common/include/px4_platform_common/posix.h"
__EXPORT void px4_show_files(void);


# 140 "./platforms/common/include/px4_platform_common/posix.h" 3 4
}
# 42 "./platforms/common/uORB/uORBDeviceMaster.hpp" 2


# 43 "./platforms/common/uORB/uORBDeviceMaster.hpp"
namespace uORB
{
class DeviceNode;
class DeviceMaster;
class Manager;
}


# 1 "/usr/include/c++/9/stdlib.h" 1 3
# 52 "./platforms/common/uORB/uORBDeviceMaster.hpp" 2

# 1 "./src/include/containers/IntrusiveSortedList.hpp" 1
# 40 "./src/include/containers/IntrusiveSortedList.hpp"
       

# 1 "/usr/include/c++/9/stdlib.h" 1 3
# 43 "./src/include/containers/IntrusiveSortedList.hpp" 2

template<class T>
class IntrusiveSortedListNode
{
public:
 void setSortedSibling(T sibling) { _sorted_list_node_sibling = sibling; }
 const T getSortedSibling() const { return _sorted_list_node_sibling; }
protected:
 T _sorted_list_node_sibling{nullptr};
};

template<class T>
class IntrusiveSortedList
{
public:

 void add(T newNode)
 {
  if (_head == nullptr) {

   _head = newNode;
   return;

  } else {
   if (*newNode <= *_head) {
    newNode->setSortedSibling(_head);
    _head = newNode;
    return;
   }


   T node = _head;

   while (node != nullptr && node->getSortedSibling() != nullptr) {

    if (*newNode <= *node->getSortedSibling()) {

     newNode->setSortedSibling(node->getSortedSibling());
     node->setSortedSibling(newNode);
     return;
    }

    node = node->getSortedSibling();
   }


   node->setSortedSibling(newNode);
  }
 }

 bool remove(T removeNode)
 {
  if (removeNode == nullptr) {
   return false;
  }


  if (removeNode == _head) {
   if (_head != nullptr) {
    _head = _head->getSortedSibling();
   }

   removeNode->setSortedSibling(nullptr);

   return true;
  }

  for (T node = _head; node != nullptr; node = node->getSortedSibling()) {

   if (node->getSortedSibling() == removeNode) {

    if (node->getSortedSibling() != nullptr) {
     node->setSortedSibling(node->getSortedSibling()->getSortedSibling());

    } else {
     node->setSortedSibling(nullptr);
    }

    removeNode->setSortedSibling(nullptr);

    return true;
   }
  }

  return false;
 }

 struct Iterator {
  T node;
  explicit Iterator(T v) : node(v) {}

  operator T() const { return node; }
  operator T &() { return node; }
  const T &operator* () const { return node; }
  Iterator &operator++ ()
  {
   if (node) {
    node = node->getSortedSibling();
   }

   return *this;
  }
 };

 Iterator begin() { return Iterator(_head); }
 Iterator end() { return Iterator(nullptr); }

 bool empty() const { return _head == nullptr; }

 size_t size() const
 {
  size_t sz = 0;

  for (T node = _head; node != nullptr; node = node->getSortedSibling()) {
   sz++;
  }

  return sz;
 }

 void deleteNode(T node)
 {
  if (remove(node)) {

   delete node;
  }
 }

 void clear()
 {
  T node = _head;

  while (node != nullptr) {
   T next = node->getSortedSibling();
   delete node;
   node = next;
  }

  _head = nullptr;
 }

protected:

 T _head{nullptr};
};
# 54 "./platforms/common/uORB/uORBDeviceMaster.hpp" 2
# 1 "./platforms/common/include/px4_platform_common/atomic_bitset.h" 1
# 34 "./platforms/common/include/px4_platform_common/atomic_bitset.h"
       

# 1 "./platforms/common/include/px4_platform_common/atomic.h" 1
# 54 "./platforms/common/include/px4_platform_common/atomic.h"
       
# 65 "./platforms/common/include/px4_platform_common/atomic.h"
namespace px4
{

template <typename T>
class atomic
{
public:




 static_assert(__atomic_always_lock_free(sizeof(T), 0), "atomic is not lock-free for the given type T");


 atomic() = default;
 explicit atomic(T value) : _value(value) {}




 inline T load() const
 {
# 97 "./platforms/common/include/px4_platform_common/atomic.h"
  {
   return __atomic_load_n(&_value, 5);
  }
 }




 inline void store(T value)
 {
# 116 "./platforms/common/include/px4_platform_common/atomic.h"
  {
   __atomic_store(&_value, &value, 5);
  }
 }





 inline T fetch_add(T num)
 {
# 138 "./platforms/common/include/px4_platform_common/atomic.h"
  {
   return __atomic_fetch_add(&_value, num, 5);
  }
 }





 inline T fetch_sub(T num)
 {
# 160 "./platforms/common/include/px4_platform_common/atomic.h"
  {
   return __atomic_fetch_sub(&_value, num, 5);
  }
 }





 inline T fetch_and(T num)
 {
# 182 "./platforms/common/include/px4_platform_common/atomic.h"
  {
   return __atomic_fetch_and(&_value, num, 5);
  }
 }





 inline T fetch_xor(T num)
 {
# 204 "./platforms/common/include/px4_platform_common/atomic.h"
  {
   return __atomic_fetch_xor(&_value, num, 5);
  }
 }





 inline T fetch_or(T num)
 {
# 226 "./platforms/common/include/px4_platform_common/atomic.h"
  {
   return __atomic_fetch_or(&_value, num, 5);
  }
 }





 inline T fetch_nand(T num)
 {
# 248 "./platforms/common/include/px4_platform_common/atomic.h"
  {
   return __atomic_fetch_nand(&_value, num, 5);
  }
 }
# 261 "./platforms/common/include/px4_platform_common/atomic.h"
 inline bool compare_exchange(T *expected, T desired)
 {
# 281 "./platforms/common/include/px4_platform_common/atomic.h"
  {
   return __atomic_compare_exchange(&_value, expected, &desired, false, 5, 5);
  }
 }

private:
 T _value {};
};

using atomic_int = atomic<int>;
using atomic_int32_t = atomic<int32_t>;
using atomic_bool = atomic<bool>;

}
# 37 "./platforms/common/include/px4_platform_common/atomic_bitset.h" 2

namespace px4
{

template <size_t N>
class AtomicBitset
{
public:

 AtomicBitset() = default;

 size_t count() const
 {
  size_t total = 0;

  for (const auto &x : _data) {
   uint32_t y = x.load();

   while (y) {
    total += y & 1;
    y >>= 1;
   }
  }

  return total;
 }

 size_t size() const { return N; }

 bool operator[](size_t position) const
 {
  return _data[array_index(position)].load() & element_mask(position);
 }

 void set(size_t pos, bool val = true)
 {
  const uint32_t bitmask = element_mask(pos);

  if (val) {
   _data[array_index(pos)].fetch_or(biIn file included from ./platforms/common/include/px4_platform_common/px4_config.h:51,
                 from ./src/lib/cdev/CDev.hpp:43,
                 from ./platforms/common/uORB/uORBDeviceNode.hpp:39,
                 from ./platforms/common/uORB/PublicationMulti.hpp:44,
                 from ./src/lib/battery/battery.h:56,
                 from src/modules/simulation/battery_simulator/BatterySimulator.hpp:36,
                 from src/modules/simulation/battery_simulator/BatterySimulator.cpp:34:
./platforms/common/include/px4_platform_common/micro_hal.h:40:10: fatal error: px4_arch/micro_hal.h: No such file or directory
   40 | #include <px4_arch/micro_hal.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
tmask);

  } else {
   _data[array_index(pos)].fetch_and(~bitmask);
  }
 }

 void reset()
 {

  for (auto &d : _data) {
   d.store(0);
  }
 }

private:
 static constexpr uint8_t BITS_PER_ELEMENT = 32;
 static constexpr size_t ARRAY_SIZE = ((N % BITS_PER_ELEMENT) == 0) ? (N / BITS_PER_ELEMENT) :
          (N / BITS_PER_ELEMENT + 1);
 static constexpr size_t ALLOCATED_BITS = ARRAY_SIZE * BITS_PER_ELEMENT;

 size_t array_index(size_t position) const { return position / BITS_PER_ELEMENT; }
 uint32_t element_mask(size_t position) const { return (1 << (position % BITS_PER_ELEMENT)); }

 px4::atomic<uint32_t> _data[ARRAY_SIZE];
};

}
# 55 "./platforms/common/uORB/uORBDeviceMaster.hpp" 2

using px4::AtomicBitset;







class uORB::DeviceMaster
{
public:

 int advertise(const struct orb_metadata *meta, bool is_advertiser, int *instance);





 uORB::DeviceNode *getDeviceNode(const char *node_name);
 uORB::DeviceNode *getDeviceNode(const struct orb_metadata *meta, const uint8_t instance)
 {
  if (meta == nullptr) {
   return nullptr;
  }

  if (!deviceNodeExists(static_cast<ORB_ID>(meta->o_id), instance)) {
   return nullptr;
  }

  lock();
  uORB::DeviceNode *node = getDeviceNodeLocked(meta, instance);
  unlock();



  return node;

 }

 bool deviceNodeExists(ORB_ID id, const uint8_t instance)
 {
  if ((id == ORB_ID::INVALID) || (instance > 10 - 1)) {
   return false;
  }

  return _node_exists[instance][(orb_id_size_t)id];
 }




 void printStatistics();
# 116 "./platforms/common/uORB/uORBDeviceMaster.hpp"
 void showTop(char **topic_filter, int num_filters);

private:

 DeviceMaster();
 ~DeviceMaster();

 struct DeviceNodeStatisticsData {
  DeviceNode *node;
  unsigned int last_pub_msg_count;
  unsigned int pub_msg_delta;
  DeviceNodeStatisticsData *next = nullptr;
 };

 int addNewDeviceNodes(DeviceNodeStatisticsData **first_node, int &num_topics, size_t &max_topic_name_length,
         char **topic_filter, int num_filters);

 friend class uORB::Manager;






 uORB::DeviceNode *getDeviceNodeLocked(const struct orb_metadata *meta, const uint8_t instance);

 IntrusiveSortedList<uORB::DeviceNode *> _node_list;
 AtomicBitset<ORB_TOPICS_COUNT> _node_exists[10];

 px4_sem_t _lock;

 void lock() { do {} while (px4_sem_wait(&_lock) != 0); }
 void unlock() { px4_sem_post(&_lock); }
};
# 38 "./platforms/common/uORB/uORBDeviceNode.hpp" 2

# 1 "./src/lib/cdev/CDev.hpp" 1
# 43 "./src/lib/cdev/CDev.hpp"
# 1 "./platforms/common/include/px4_platform_common/px4_config.h" 1
# 40 "./platforms/common/include/px4_platform_common/px4_config.h"
       
# 51 "./platforms/common/include/px4_platform_common/px4_config.h"
# 1 "./platforms/common/include/px4_platform_common/micro_hal.h" 1
# 33 "./platforms/common/include/px4_platform_common/micro_hal.h"
       