program intrinsics_179
    use iso_fortran_env, only: sp => real32
    real :: aa(4, 5)
    real :: aaa(4, 5, 6)
    real :: aaaa(4, 5, 6, 7)
    logical :: mask(4, 5, 6, 7)
    integer :: dim, i, j, k, l
    integer :: s_aa(1)
    integer :: s_aaa(2)
    integer :: s_aaaa(3)

    real :: res_aa_1(5)
    real :: res_aa_2(4)

    real :: res_aaa_1(5, 6)
    real :: res_aaa_2(4, 6)
    real :: res_aaa_3(4, 5)

    real :: res_aaaa_1(5, 6, 7)
    real :: res_aaaa_2(4, 6, 7)
    real :: res_aaaa_3(4, 5, 7)
    real :: res_aaaa_4(4, 5, 6)

    real :: exp_res_aa_1(5)
    real :: exp_res_aa_2(4)

    real :: exp_res_aaa_1(5, 6)
    real :: exp_res_aaa_2(4, 6)
    real :: exp_res_aaa_3(4, 5)

    real :: exp_res_aaaa_1(5, 6, 7)
    real :: exp_res_aaaa_2(4, 6, 7)
    real :: exp_res_aaaa_3(4, 5, 7)
    real :: exp_res_aaaa_4(4, 5, 6)

    aa = 1.0
    ! TODO: Uncomment after https://github.com/lfortran/lfortran/issues/7412 is fixed.
    ! mask = .true.
    do i = lbound(mask, 1), ubound(mask, 1)
    do j = lbound(mask, 2), ubound(mask, 2)
    do k = lbound(mask, 3), ubound(mask, 3)
    do l = lbound(mask, 4), ubound(mask, 4)
    mask(i, j, k, l) = .true.
    end do
    end do
    end do
    end do

    do i = 1, 4
        do j = 1, 5
            do k = 1, 6
                aaa(i, j, k) = modulo(i * j - k, 12)
            end do
        end do
    end do

    do i = 1, 4
        do j = 1, 5
            do k = 1, 6
                do l = 1, 7
                    aaaa(i, j, k, l) = (i + j / k * l + 21.04) * 1e-6
                end do
            end do
        end do
    end do

    exp_res_aa_1 = 4.0
    exp_res_aa_2 = 5.0

    exp_res_aaa_1 = reshape([6.00000000, 16.0000000, 26.0000000, 24.0000000, &
    22.0000000, 14.0000000, 12.0000000, 22.0000000, 20.0000000, 18.0000000, &
    22.0000000, 20.0000000, 18.0000000, 16.0000000, 14.0000000, 30.0000000, &
    16.0000000, 26.0000000, 12.0000000, 22.0000000, 38.0000000, 24.0000000, &
    22.0000000, 32.0000000, 18.0000000, 34.0000000, 20.0000000, 18.0000000, &
    28.0000000, 26.0000000], shape(exp_res_aaa_1))


    exp_res_aaaa_1 = reshape([9.81600024E-05, 1.02160004E-04, 1.06160005E-04, &
    1.10159999E-04, 1.14160001E-04, 9.41600010E-05, 9.81600024E-05, 9.81600024E-05, &
    1.02160004E-04, 1.02160004E-04, 9.41600010E-05, 9.41600010E-05, 9.81600024E-05, &
    9.81600024E-05, 9.81600024E-05, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 9.81600024E-05, &
    9.81600024E-05, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 9.81600024E-05, &
    9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 1.02160004E-04, &
    1.10159999E-04, 1.18160002E-04, 1.26159997E-04, 1.34160000E-04, 9.41600010E-05, 1.02160004E-04, &
    1.02160004E-04, 1.10159999E-04, 1.10159999E-04, 9.41600010E-05, 9.41600010E-05, 1.02160004E-04, &
    1.02160004E-04, 1.02160004E-04, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 1.02160004E-04, &
    1.02160004E-04, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 1.02160004E-04, &
    9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 1.06160005E-04, &
    1.18160002E-04, 1.30159999E-04, 1.42160003E-04, 1.54160007E-04, 9.41600010E-05, 1.06160005E-04, &
    1.06160005E-04, 1.18160002E-04, 1.18160002E-04, 9.41600010E-05, 9.41600010E-05, 1.06160005E-04, &
    1.06160005E-04, 1.06160005E-04, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 1.06160005E-04, &
    1.06160005E-04, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 1.06160005E-04, &
    9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 1.10159999E-04, &
    1.26159997E-04, 1.42160003E-04, 1.58160008E-04, 1.74159999E-04, 9.41600010E-05, 1.10159999E-04, &
    1.10159999E-04, 1.26159997E-04, 1.26159997E-04, 9.41600010E-05, 9.41600010E-05, 1.10159999E-04, &
    1.10159999E-04, 1.10159999E-04, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 1.10159999E-04, &
    1.10159999E-04, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 1.10159999E-04, &
    9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 1.14160001E-04, &
    1.34160000E-04, 1.54160007E-04, 1.74159999E-04, 1.94160006E-04, 9.41600010E-05, 1.14160001E-04, &
    1.14160001E-04, 1.34160000E-04, 1.34160000E-04, 9.41600010E-05, 9.41600010E-05, 1.14160001E-04, &
    1.14160001E-04, 1.14160001E-04, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 1.14160001E-04, &
    1.14160001E-04, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 1.14160001E-04, &
    9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 1.18160002E-04, &
    1.42160003E-04, 1.66159996E-04, 1.90160004E-04, 2.14159998E-04, 9.41600010E-05, 1.18160002E-04, &
    1.18160002E-04, 1.42160003E-04, 1.42160003E-04, 9.41600010E-05, 9.41600010E-05, 1.18160002E-04, &
    1.18160002E-04, 1.18160002E-04, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 1.18160002E-04, &
    1.18160002E-04, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 1.18160002E-04, &
    9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 1.22159996E-04, &
    1.50160005E-04, 1.78160000E-04, 2.06159995E-04, 2.34160019E-04, 9.41600010E-05, 1.22159996E-04, &
    1.22159996E-04, 1.50160005E-04, 1.50160005E-04, 9.41600010E-05, 9.41600010E-05, 1.22159996E-04, &
    1.22159996E-04, 1.22159996E-04, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 1.22159996E-04, &
    1.22159996E-04, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 1.22159996E-04, &
    9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05, 9.41600010E-05], shape(exp_res_aaaa_1))

    exp_res_aaa_2 = reshape([10.0000000, 25.0000000, 28.0000000, 31.0000000, 17.0000000, 20.0000000, &
    23.0000000, 26.0000000, 24.0000000, 27.0000000, 18.0000000, 21.0000000, 31.0000000, 22.0000000, &
    37.0000000, 16.0000000, 38.0000000, 29.0000000, 32.0000000, 35.0000000, 45.0000000, 24.0000000, &
    27.0000000, 30.0000000], shape(exp_res_aaa_2))

    exp_res_aaaa_2 = reshape([1.25200007E-04, 1.30200002E-04, 1.35200011E-04, 1.40200005E-04, 1.16199997E-04, &
    1.21200006E-04, 1.26200001E-04, 1.31200009E-04, 1.13200003E-04, 1.18199998E-04, 1.23200007E-04, 1.28200001E-04, &
    1.12200010E-04, 1.17199990E-04, 1.22200014E-04, 1.27199994E-04, 1.11200003E-04, 1.16199997E-04, 1.21200006E-04, &
    1.26200001E-04, 1.10200010E-04, 1.15200004E-04, 1.20199998E-04, 1.25200007E-04, 1.40199991E-04, 1.45200000E-04, &
    1.50200009E-04, 1.55200003E-04, 1.22199999E-04, 1.27200008E-04, 1.32200003E-04, 1.37199997E-04, 1.16199997E-04, &
    1.21200006E-04, 1.26200001E-04, 1.31200009E-04, 1.14199996E-04, 1.19200005E-04, 1.24200000E-04, 1.29200009E-04, &
    1.12200010E-04, 1.17200005E-04, 1.22199999E-04, 1.27200008E-04, 1.10200010E-04, 1.15200004E-04, 1.20199998E-04, &
    1.25200007E-04, 1.55200003E-04, 1.60200012E-04, 1.65200006E-04, 1.70200001E-04, 1.28200001E-04, 1.33199996E-04, &
    1.38200005E-04, 1.43199999E-04, 1.19200005E-04, 1.24200000E-04, 1.29200009E-04, 1.34200003E-04, 1.16200012E-04, &
    1.21199992E-04, 1.26200015E-04, 1.31199995E-04, 1.13200003E-04, 1.18199998E-04, 1.23200007E-04, 1.28200001E-04, &
    1.10200010E-04, 1.15200004E-04, 1.20199998E-04, 1.25200007E-04, 1.70200001E-04, 1.75199995E-04, 1.80200004E-04, &
    1.85199999E-04, 1.34200003E-04, 1.39199998E-04, 1.44199992E-04, 1.49200001E-04, 1.22199999E-04, 1.27200008E-04, &
    1.32200003E-04, 1.37199997E-04, 1.18199998E-04, 1.23200007E-04, 1.28200001E-04, 1.33199996E-04, 1.14200011E-04, &
    1.19200005E-04, 1.24200000E-04, 1.29200009E-04, 1.10200010E-04, 1.15200004E-04, 1.20199998E-04, 1.25200007E-04, &
    1.85199999E-04, 1.90200008E-04, 1.95200002E-04, 2.00200011E-04, 1.40200005E-04, 1.45200000E-04, 1.50200009E-04, &
    1.55200003E-04, 1.25200007E-04, 1.30200002E-04, 1.35199996E-04, 1.40200005E-04, 1.20200013E-04, 1.25199993E-04, &
    1.30200002E-04, 1.35199996E-04, 1.15200004E-04, 1.20199998E-04, 1.25200007E-04, 1.30200002E-04, 1.10200010E-04, &
    1.15200004E-04, 1.20199998E-04, 1.25200007E-04, 2.00200011E-04, 2.05200005E-04, 2.10200000E-04, 2.15199994E-04, &
    1.46200007E-04, 1.51200002E-04, 1.56199996E-04, 1.61200005E-04, 1.28200001E-04, 1.33199996E-04, 1.38200005E-04, &
    1.43199999E-04, 1.22199999E-04, 1.27199994E-04, 1.32200003E-04, 1.37199997E-04, 1.16200004E-04, 1.21199999E-04, &
    1.26200001E-04, 1.31200009E-04, 1.10200010E-04, 1.15200004E-04, 1.20199998E-04, 1.25200007E-04, 2.15200009E-04, &
    2.20199989E-04, 2.25199998E-04, 2.30200007E-04, 1.52199995E-04, 1.57200004E-04, 1.62199998E-04, 1.67199993E-04, &
    1.31200009E-04, 1.36200004E-04, 1.41199998E-04, 1.46200007E-04, 1.24200000E-04, 1.29199994E-04, 1.34200003E-04, &
    1.39199998E-04, 1.17200005E-04, 1.22199999E-04, 1.27200008E-04, 1.32200003E-04, 1.10200010E-04, 1.15200004E-04, &
    1.20199998E-04, 1.25200007E-04], shape(exp_res_aaaa_2))

    exp_res_aaa_3 = reshape([45.0000000, 39.0000000, 33.0000000, 27.0000000, 39.0000000, 27.0000000, 15.0000000, &
    27.0000000, 33.0000000, 15.0000000, 33.0000000, 51.0000000, 27.0000000, 27.0000000, 51.0000000, 27.0000000, &
    21.0000000, 39.0000000, 33.0000000, 27.0000000], shape(exp_res_aaa_3))

    exp_res_aaaa_3 = reshape([1.33240013E-04, 1.39240015E-04, 1.45239988E-04, 1.51240019E-04, 1.35240014E-04, &
    1.41240016E-04, 1.47239989E-04, 1.53240020E-04, 1.37240000E-04, 1.43240017E-04, 1.49239990E-04, 1.55240021E-04, &
    1.40240008E-04, 1.46240011E-04, 1.52239998E-04, 1.58240015E-04, 1.42240009E-04, 1.48239997E-04, 1.54240013E-04, &
    1.60240001E-04, 1.34240006E-04, 1.40240008E-04, 1.46239996E-04, 1.52240013E-04, 1.38240008E-04, 1.44240010E-04, &
    1.50239997E-04, 1.56240014E-04, 1.42240009E-04, 1.48240011E-04, 1.54239999E-04, 1.60240015E-04, 1.48239997E-04, &
    1.54240013E-04, 1.60239986E-04, 1.66240017E-04, 1.52239998E-04, 1.58240015E-04, 1.64239987E-04, 1.70240019E-04, &
    1.35240014E-04, 1.41240016E-04, 1.47239989E-04, 1.53240020E-04, 1.41240016E-04, 1.47240018E-04, 1.53239991E-04, &
    1.59240008E-04, 1.47240004E-04, 1.53240006E-04, 1.59239993E-04, 1.65240010E-04, 1.56239999E-04, 1.62240001E-04, &
    1.68240003E-04, 1.74240005E-04, 1.62240001E-04, 1.68240003E-04, 1.74240005E-04, 1.80240007E-04, 1.36240007E-04, &
    1.42240009E-04, 1.48239997E-04, 1.54240013E-04, 1.44240010E-04, 1.50240012E-04, 1.56239985E-04, 1.62240016E-04, &
    1.52239998E-04, 1.58240015E-04, 1.64239987E-04, 1.70240004E-04, 1.64239987E-04, 1.70240019E-04, 1.76239992E-04, &
    1.82240008E-04, 1.72239990E-04, 1.78240021E-04, 1.84239994E-04, 1.90240011E-04, 1.37240015E-04, 1.43240017E-04, &
    1.49239990E-04, 1.55240021E-04, 1.47240004E-04, 1.53240006E-04, 1.59239993E-04, 1.65240010E-04, 1.57240007E-04, &
    1.63240009E-04, 1.69239996E-04, 1.75240013E-04, 1.72240005E-04, 1.78240007E-04, 1.84239994E-04, 1.90240011E-04, &
    1.82240008E-04, 1.88239996E-04, 1.94239998E-04, 2.00240000E-04, 1.38240008E-04, 1.44240010E-04, 1.50239997E-04, &
    1.56240014E-04, 1.50239997E-04, 1.56240014E-04, 1.62239987E-04, 1.68240018E-04, 1.62240001E-04, 1.68240003E-04, &
    1.74239991E-04, 1.80240007E-04, 1.80239993E-04, 1.86240009E-04, 1.92239997E-04, 1.98240014E-04, 1.92239997E-04, &
    1.98240014E-04, 2.04240001E-04, 2.10239989E-04, 1.39240015E-04, 1.45240017E-04, 1.51239990E-04, 1.57240007E-04, &
    1.53240006E-04, 1.59240008E-04, 1.65239995E-04, 1.71240012E-04, 1.67239996E-04, 1.73240012E-04, 1.79240000E-04, &
    1.85240016E-04, 1.88239996E-04, 1.94240012E-04, 2.00240000E-04, 2.06240016E-04, 2.02240015E-04, 2.08240002E-04, &
    2.14239990E-04, 2.20240006E-04], shape(exp_res_aaaa_3))

    exp_res_aaaa_4 = reshape([ 1.82280011E-04, 1.89280006E-04, 1.96280016E-04, 2.03280011E-04, 2.10279992E-04, &
    2.17280001E-04, 2.24280011E-04, 2.31279992E-04, 2.38280001E-04, 2.45280011E-04, 2.52280006E-04, 2.59280001E-04, &
    2.66279996E-04, 2.73279991E-04, 2.80280015E-04, 2.87280011E-04, 2.94280006E-04, 3.01280001E-04, 3.08279996E-04, &
    3.15280020E-04, 1.54280002E-04, 1.61280012E-04, 1.68279992E-04, 1.75280016E-04, 1.82280011E-04, 1.89280006E-04, &
    1.96280016E-04, 2.03280011E-04, 1.82280011E-04, 1.89280006E-04, 1.96280016E-04, 2.03280011E-04, 2.10279992E-04, &
    2.17280001E-04, 2.24280011E-04, 2.31279992E-04, 2.10279992E-04, 2.17280001E-04, 2.24280011E-04, 2.31279992E-04, &
    1.54280002E-04, 1.61280012E-04, 1.68279992E-04, 1.75280016E-04, 1.54280002E-04, 1.61280012E-04, 1.68279992E-04, &
    1.75280016E-04, 1.82280011E-04, 1.89280006E-04, 1.96280016E-04, 2.03280011E-04, 1.82280011E-04, 1.89280006E-04, &
    1.96280016E-04, 2.03280011E-04, 1.82280011E-04, 1.89280006E-04, 1.96280016E-04, 2.03280011E-04, 1.54280002E-04, &
    1.61280012E-04, 1.68279992E-04, 1.75280016E-04, 1.54280002E-04, 1.61280012E-04, 1.68279992E-04, 1.75280016E-04, &
    1.54280002E-04, 1.61280012E-04, 1.68279992E-04, 1.75280016E-04, 1.82280011E-04, 1.89280006E-04, 1.96280016E-04, &
    2.03280011E-04, 1.82280011E-04, 1.89280006E-04, 1.96280016E-04, 2.03280011E-04, 1.54280002E-04, 1.61280012E-04, &
    1.68279992E-04, 1.75280016E-04, 1.54280002E-04, 1.61280012E-04, 1.68279992E-04, 1.75280016E-04, 1.54280002E-04, &
    1.61280012E-04, 1.68279992E-04, 1.75280016E-04, 1.54280002E-04, 1.61280012E-04, 1.68279992E-04, 1.75280016E-04, &
    1.82280011E-04, 1.89280006E-04, 1.96280016E-04, 2.03280011E-04, 1.54280002E-04, 1.61280012E-04, 1.68279992E-04, &
    1.75280016E-04, 1.54280002E-04, 1.61280012E-04, 1.68279992E-04, 1.75280016E-04, 1.54280002E-04, 1.61280012E-04, &
    1.68279992E-04, 1.75280016E-04, 1.54280002E-04, 1.61280012E-04, 1.68279992E-04, 1.75280016E-04, 1.54280002E-04, &
    1.61280012E-04, 1.68279992E-04, 1.75280016E-04], shape(exp_res_aaaa_4))

    dim = 1
    res_aa_1 = sum(aa, dim)
    print *, sum(res_aa_1)
    if (abs(sum(res_aa_1) - 20.0) > 1e-8) error stop
    s_aa = shape(sum(aa, dim))
    print *, s_aa
    if (s_aa(1) /= 5) error stop
    do i = 1, 5
        if (abs(res_aa_1(i) - exp_res_aa_1(i)) > 1e-8) error stop
    end do

    res_aaa_1 = sum(aaa, dim)
    print *, sum(sum(aaa, dim))
    if (abs(sum(sum(aaa, dim)) - 636.0) > 1e-8) error stop
    s_aaa = shape(sum(aaa, dim))
    print *, s_aaa
    if (s_aaa(1) /= 5 .or. s_aaa(2) /= 6) error stop
    do i = 1, 5
        do j = 1, 6
            if (abs(res_aaa_1(i, j) - exp_res_aaa_1(i, j)) > 1e-8) error stop
        end do
    end do

    res_aaaa_1 = sum(aaaa, dim)
    print *, sum(sum(aaaa, dim))
    if (abs(sum(sum(aaaa, dim)) - 2.27976274e-02) > 1e-8) error stop
    s_aaaa = shape(sum(aaaa, dim))
    print *, s_aaaa
    if (s_aaaa(1) /= 5 .or. s_aaaa(2) /= 6 .or. s_aaaa(3) /= 7) error stop
    do i = 1, 5
        do j = 1, 6
            do k = 1, 7
                if (abs(res_aaaa_1(i, j, k) - exp_res_aaaa_1(i, j, k)) > 1e-8) error stop
            end do
        end do
    end do

    dim = 2
    res_aa_2 = sum(aa, dim)
    if (abs(sum(sum(aa, dim)) - 20.0) > 1e-8) error stop
    s_aa = shape(sum(aa, dim))
    print *, s_aa
    if (s_aa(1) /= 4) error stop
    do i = 1, 4
        if (abs(res_aa_2(i) - exp_res_aa_2(i)) > 1e-8) error stop
    end do

    res_aaa_2 = sum(aaa, dim)
    print *, sum(sum(aaa, dim))
    if (abs(sum(sum(aaa, dim)) - 636.0) > 1e-8) error stop
    s_aaa = shape(sum(aaa, dim))
    print *, s_aaa
    if (s_aaa(1) /= 4 .or. s_aaa(2) /= 6) error stop
    do i = 1, 4
        do j = 1, 6
            if (abs(res_aaa_2(i, j) - exp_res_aaa_2(i, j)) > 1e-8) error stop
        end do
    end do

    res_aaaa_2 = sum(aaaa, dim)
    print *, sum(sum(aaaa, dim))
    if (abs(sum(sum(aaaa, dim)) - 2.27976013e-02) > 1e-8) error stop
    s_aaaa = shape(sum(aaaa, dim))
    print *, s_aaaa
    if (s_aaaa(1) /= 4 .or. s_aaaa(2) /= 6 .or. s_aaaa(3) /= 7) error stop
    do i = 1, 4
        do j = 1, 6
            do k = 1, 7
                if (abs(res_aaaa_2(i, j, k) - exp_res_aaaa_2(i, j, k)) > 1e-8) error stop
            end do
        end do
    end do

    dim = 3
    res_aaa_3 = sum(aaa, dim)
    print *, sum(sum(aaa, dim))
    if (abs(sum(sum(aaa, dim)) - 636.0) > 1e-8) error stop
    s_aaa = shape(sum(aaa, dim))
    print *, s_aaa
    if (s_aaa(1) /= 4 .or. s_aaa(2) /= 5) error stop
    do i = 1, 4
        do j = 1, 5
            if (abs(res_aaa_3(i, j) - exp_res_aaa_3(i, j)) > 1e-8) error stop
        end do
    end do

    res_aaaa_3 = sum(aaaa, dim)
    print *, sum(sum(aaaa, dim))
    if (abs(sum(sum(aaaa, dim)) - 2.27976032e-02) > 1e-8) error stop
    s_aaaa = shape(sum(aaaa, dim))
    print *, s_aaaa
    if (s_aaaa(1) /= 4 .or. s_aaaa(2) /= 5 .or. s_aaaa(3) /= 7) error stop
    do i = 1, 4
        do j = 1, 5
            do k = 1, 7
                if (abs(res_aaaa_3(i, j, k) - exp_res_aaaa_3(i, j, k)) > 1e-8) error stop
            end do
        end do
    end do

    dim = 4
    res_aaaa_4 = sum(aaaa, dim)
    print *, sum(sum(aaaa, dim))
    if (abs(sum(sum(aaaa, dim)) - 2.27976087e-02) > 1e-8) error stop
    s_aaaa = shape(sum(aaaa, dim))
    print *, s_aaaa
    if (s_aaaa(1) /= 4 .or. s_aaaa(2) /= 5 .or. s_aaaa(3) /= 6) error stop
    do i = 1, 4
        do j = 1, 5
            do k = 1, 6
                if (abs(res_aaaa_4(i, j, k) - exp_res_aaaa_4(i, j, k)) > 1e-8) error stop
            end do
        end do
    end do

    print *, sum(sum(aaaa, dim, mask))
    if (abs(sum(sum(aaaa, dim, mask)) - 2.27976032e-02) > 1e-8) error stop
    ! TODO: Uncomment after https://github.com/lfortran/lfortran/issues/7412 is fixed.
    ! mask = .false.
    do i = lbound(mask, 1), ubound(mask, 1)
    do j = lbound(mask, 2), ubound(mask, 2)
    do k = lbound(mask, 3), ubound(mask, 3)
    do l = lbound(mask, 4), ubound(mask, 4)
    mask(i, j, k, l) = .false.
    end do
    end do
    end do
    end do
    print *, sum(sum(aaaa, dim, mask))
    if (abs(sum(sum(aaaa, dim, mask)) - 0.0) > 1e-8) error stop
    mask(1, 1, :, :) = .true.
    print *, sum(sum(aaaa, dim, mask))
    if (abs(sum(sum(aaaa, dim, mask)) - 9.53679963e-04) > 1e-8) error stop
end program
