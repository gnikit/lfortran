module template_01_m
    implicit none
    private
    public :: op_t

    requirement semigroup(t, combine)
        type, deferred :: t
    end requirement

  contains
    
    subroutine test_template()
    end subroutine
    
  end module
    
  program template_01
  use template_01_m
  implicit none
  
  end program template_01