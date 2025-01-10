/*!40101 SET NAMES utf8mb4 */;

DROP DATABASE IF EXISTS stock;
CREATE DATABASE stock;
use stock;

-- 주식 현재가 시세 테이블
CREATE TABLE inquire_price (
    yyyymmdd               CHAR(8),              -- 일시 (YYYYMMDD)
    min                    CHAR(4),              -- 날짜별 시퀀스
    code                   CHAR(6),              -- 주식 코드
    PRIMARY KEY (yyyymmdd, min, code),           -- 복합 기본 키 설정
    iscd_stat_cls_code     VARCHAR(3),           -- 종목 상태 구분 코드
    marg_rate              VARCHAR(12),          -- 증거금 비율
    rprs_mrkt_kor_name     VARCHAR(40),          -- 대표 시장 한글 명
    new_hgpr_lwpr_cls_code VARCHAR(10),          -- 신 고가 저가 구분 코드
    bstp_kor_isnm          VARCHAR(40),          -- 업종 한글 종목명
    temp_stop_yn           CHAR(1),              -- 임시 정지 여부
    oprc_rang_cont_yn      CHAR(1),              -- 시가 범위 연장 여부
    clpr_rang_cont_yn      CHAR(1),              -- 종가 범위 연장 여부
    crdt_able_yn           CHAR(1),              -- 신용 가능 여부
    grmn_rate_cls_code     VARCHAR(3),           -- 보증금 비율 구분 코드
    elw_pblc_yn            CHAR(1),              -- ELW 발행 여부
    stck_prpr              VARCHAR(10),          -- 주식 현재가
    prdy_vrss              VARCHAR(10),          -- 전일 대비
    prdy_vrss_sign         CHAR(1),              -- 전일 대비 부호
    prdy_ctrt              VARCHAR(10),          -- 전일 대비율
    acml_tr_pbmn           VARCHAR(18),          -- 누적 거래 대금
    acml_vol               VARCHAR(18),          -- 누적 거래량
    prdy_vrss_vol_rate     VARCHAR(12),          -- 전일 대비 거래량 비율
    stck_oprc              VARCHAR(10),          -- 주식 시가
    stck_hgpr              VARCHAR(10),          -- 주식 최고가
    stck_lwpr              VARCHAR(10),          -- 주식 최저가
    stck_mxpr              VARCHAR(10),          -- 주식 상한가
    stck_llam              VARCHAR(10),          -- 주식 하한가
    stck_sdpr              VARCHAR(10),          -- 주식 기준가
    wghn_avrg_stck_prc     VARCHAR(21),          -- 가중 평균 주식 가격
    hts_frgn_ehrt          VARCHAR(82),          -- HTS 외국인 소진율
    frgn_ntby_qty          VARCHAR(12),          -- 외국인 순매수 수량
    pgtr_ntby_qty          VARCHAR(18),          -- 프로그램매매 순매수 수량
    cpfn                   VARCHAR(22),          -- 자본금
    rstc_wdth_prc          VARCHAR(10),          -- 제한 폭 가격
    stck_fcam              VARCHAR(11),          -- 주식 액면가
    stck_sspr              VARCHAR(10),          -- 주식 대용가
    aspr_unit              VARCHAR(10),          -- 호가단위
    hts_deal_qty_unit_val  VARCHAR(10),          -- HTS 매매 수량 단위 값
    lstn_stcn              VARCHAR(18),          -- 상장 주수
    hts_avls               VARCHAR(18),          -- HTS 시가총액
    per                    VARCHAR(10),          -- PER
    pbr                    VARCHAR(10),          -- PBR
    stac_month             CHAR(2),              -- 결산 월
    vol_tnrt               VARCHAR(10),          -- 거래량 회전율
    eps                    VARCHAR(13),          -- EPS
    bps                    VARCHAR(13),          -- BPS
    d250_hgpr              VARCHAR(10),          -- 250일 최고가
    d250_hgpr_date         VARCHAR(8),           -- 250일 최고가 일자
    d250_hgpr_vrss_prpr_rate VARCHAR(12),        -- 250일 최고가 대비 현재가 비율
    d250_lwpr              VARCHAR(10),          -- 250일 최저가
    d250_lwpr_date         VARCHAR(8),           -- 250일 최저가 일자
    d250_lwpr_vrss_prpr_rate VARCHAR(12),        -- 250일 최저가 대비 현재가 비율
    stck_dryy_hgpr         VARCHAR(10),          -- 주식 연중 최고가
    dryy_hgpr_vrss_prpr_rate VARCHAR(12),        -- 연중 최고가 대비 현재가 비율
    dryy_hgpr_date         VARCHAR(8),           -- 연중 최고가 일자
    stck_dryy_lwpr         VARCHAR(10),          -- 주식 연중 최저가
    dryy_lwpr_vrss_prpr_rate VARCHAR(12),        -- 연중 최저가 대비 현재가 비율
    dryy_lwpr_date         VARCHAR(8),           -- 연중 최저가 일자
    w52_hgpr               VARCHAR(10),          -- 52주일 최고가
    w52_hgpr_vrss_prpr_ctrt VARCHAR(10),         -- 52주일 최고가 대비 현재가 대비
    w52_hgpr_date          VARCHAR(8),           -- 52주일 최고가 일자
    w52_lwpr               VARCHAR(10),          -- 52주일 최저가
    w52_lwpr_vrss_prpr_ctrt VARCHAR(10),         -- 52주일 최저가 대비 현재가 대비
    w52_lwpr_date          VARCHAR(8),           -- 52주일 최저가 일자
    whol_loan_rmnd_rate    VARCHAR(12),          -- 전체 융자 잔고 비율
    ssts_yn                CHAR(1),              -- 공매도 가능 여부
    stck_shrn_iscd         VARCHAR(9),           -- 주식 단축 종목코드
    fcam_cnnm              VARCHAR(20),          -- 액면가 통화명
    cpfn_cnnm              VARCHAR(20),          -- 자본금 통화명
    apprch_rate            VARCHAR(13),          -- 접근도
    frgn_hldn_qty          VARCHAR(18),          -- 외국인 보유 수량
    vi_cls_code            CHAR(1),              -- VI적용구분코드
    ovtm_vi_cls_code       CHAR(1),              -- 시간외단일가VI적용구분코드
    last_ssts_cntg_qty     VARCHAR(12),          -- 최종 공매도 체결 수량
    invt_caful_yn          CHAR(1),              -- 투자유의여부
    mrkt_warn_cls_code     VARCHAR(2),           -- 시장경고코드
    short_over_yn          CHAR(1),              -- 단기과열여부
    sltr_yn                CHAR(1)               -- 정리매매여부
);

-- 주식 현재가 체결 테이블
CREATE TABLE inquire_ccnl (
    yyyymmdd               CHAR(8),              -- 일시 (YYYYMMDD)
    min                    CHAR(4),              -- 날짜별 시퀀스
    code                   CHAR(6),              -- 주식 코드
    PRIMARY KEY (yyyymmdd, min, code),           -- 복합 기본 키 설정
    stck_cntg_hour VARCHAR(6),            -- 주식 체결 시간
    stck_prpr      VARCHAR(10),           -- 주식 현재가
    prdy_vrss      VARCHAR(10),           -- 전일 대비
    prdy_vrss_sign CHAR(1),               -- 전일 대비 부호
    cntg_vol       VARCHAR(18),           -- 체결 거래량
    tday_rltv      VARCHAR(13),           -- 당일 체결강도
    prdy_ctrt      VARCHAR(82)            -- 전일 대비율
);

-- 주식 현재가 호가/예상체결 테이블
CREATE TABLE inquire_asking_price_exp_ccn (
    yyyymmdd               CHAR(8),              -- 일시 (YYYYMMDD)
    min                    CHAR(4),              -- 날짜별 시퀀스
    code                   CHAR(6),              -- 주식 코드
    PRIMARY KEY (yyyymmdd, min, code),           -- 복합 기본 키 설정
    aspr_acpt_hour         VARCHAR(6),            -- 호가 접수 시간
    askp1                  VARCHAR(10),           -- 매도호가1
    askp2                  VARCHAR(10),           -- 매도호가2
    askp3                  VARCHAR(10),           -- 매도호가3
    askp4                  VARCHAR(10),           -- 매도호가4
    askp5                  VARCHAR(10),           -- 매도호가5
    askp6                  VARCHAR(10),           -- 매도호가6
    askp7                  VARCHAR(10),           -- 매도호가7
    askp8                  VARCHAR(10),           -- 매도호가8
    askp9                  VARCHAR(10),           -- 매도호가9
    askp10                 VARCHAR(10),           -- 매도호가10
    bidp1                  VARCHAR(10),           -- 매수호가1
    bidp2                  VARCHAR(10),           -- 매수호가2
    bidp3                  VARCHAR(10),           -- 매수호가3
    bidp4                  VARCHAR(10),           -- 매수호가4
    bidp5                  VARCHAR(10),           -- 매수호가5
    bidp6                  VARCHAR(10),           -- 매수호가6
    bidp7                  VARCHAR(10),           -- 매수호가7
    bidp8                  VARCHAR(10),           -- 매수호가8
    bidp9                  VARCHAR(10),           -- 매수호가9
    bidp10                 VARCHAR(10),           -- 매수호가10
    askp_rsqn1             VARCHAR(12),           -- 매도호가 잔량1
    askp_rsqn2             VARCHAR(12),           -- 매도호가 잔량2
    askp_rsqn3             VARCHAR(12),           -- 매도호가 잔량3
    askp_rsqn4             VARCHAR(12),           -- 매도호가 잔량4
    askp_rsqn5             VARCHAR(12),           -- 매도호가 잔량5
    askp_rsqn6             VARCHAR(12),           -- 매도호가 잔량6
    askp_rsqn7             VARCHAR(12),           -- 매도호가 잔량7
    askp_rsqn8             VARCHAR(12),           -- 매도호가 잔량8
    askp_rsqn9             VARCHAR(12),           -- 매도호가 잔량9
    askp_rsqn10            VARCHAR(12),           -- 매도호가 잔량10
    bidp_rsqn1             VARCHAR(12),           -- 매수호가 잔량1
    bidp_rsqn2             VARCHAR(12),           -- 매수호가 잔량2
    bidp_rsqn3             VARCHAR(12),           -- 매수호가 잔량3
    bidp_rsqn4             VARCHAR(12),           -- 매수호가 잔량4
    bidp_rsqn5             VARCHAR(12),           -- 매수호가 잔량5
    bidp_rsqn6             VARCHAR(12),           -- 매수호가 잔량6
    bidp_rsqn7             VARCHAR(12),           -- 매수호가 잔량7
    bidp_rsqn8             VARCHAR(12),           -- 매수호가 잔량8
    bidp_rsqn9             VARCHAR(12),           -- 매수호가 잔량9
    bidp_rsqn10            VARCHAR(12),           -- 매수호가 잔량10
    askp_rsqn_icdc1        VARCHAR(10),           -- 매도호가 잔량 증감1
    askp_rsqn_icdc2        VARCHAR(10),           -- 매도호가 잔량 증감2
    askp_rsqn_icdc3        VARCHAR(10),           -- 매도호가 잔량 증감3
    askp_rsqn_icdc4        VARCHAR(10),           -- 매도호가 잔량 증감4
    askp_rsqn_icdc5        VARCHAR(10),           -- 매도호가 잔량 증감5
    askp_rsqn_icdc6        VARCHAR(10),           -- 매도호가 잔량 증감6
    askp_rsqn_icdc7        VARCHAR(10),           -- 매도호가 잔량 증감7
    askp_rsqn_icdc8        VARCHAR(10),           -- 매도호가 잔량 증감8
    askp_rsqn_icdc9        VARCHAR(10),           -- 매도호가 잔량 증감9
    askp_rsqn_icdc10       VARCHAR(10),           -- 매도호가 잔량 증감10
    bidp_rsqn_icdc1        VARCHAR(10),           -- 매수호가 잔량 증감1
    bidp_rsqn_icdc2        VARCHAR(10),           -- 매수호가 잔량 증감2
    bidp_rsqn_icdc3        VARCHAR(10),           -- 매수호가 잔량 증감3
    bidp_rsqn_icdc4        VARCHAR(10),           -- 매수호가 잔량 증감4
    bidp_rsqn_icdc5        VARCHAR(10),           -- 매수호가 잔량 증감5
    bidp_rsqn_icdc6        VARCHAR(10),           -- 매수호가 잔량 증감6
    bidp_rsqn_icdc7        VARCHAR(10),           -- 매수호가 잔량 증감7
    bidp_rsqn_icdc8        VARCHAR(10),           -- 매수호가 잔량 증감8
    bidp_rsqn_icdc9        VARCHAR(10),           -- 매수호가 잔량 증감9
    bidp_rsqn_icdc10       VARCHAR(10),           -- 매수호가 잔량 증감10
    total_askp_rsqn        VARCHAR(12),           -- 총 매도호가 잔량
    total_bidp_rsqn        VARCHAR(12),           -- 총 매수호가 잔량
    total_askp_rsqn_icdc   VARCHAR(10),           -- 총 매도호가 잔량 증감
    total_bidp_rsqn_icdc   VARCHAR(10),           -- 총 매수호가 잔량 증감
    ovtm_total_askp_icdc   VARCHAR(10),           -- 시간외 총 매도호가 증감
    ovtm_total_bidp_icdc   VARCHAR(10),           -- 시간외 총 매수호가 증감
    ovtm_total_askp_rsqn   VARCHAR(12),           -- 시간외 총 매도호가 잔량
    ovtm_total_bidp_rsqn   VARCHAR(12),           -- 시간외 총 매수호가 잔량
    ntby_aspr_rsqn         VARCHAR(12),           -- 순매수 호가 잔량
    new_mkop_cls_code      VARCHAR(2)             -- 신 장운영 구분 코드
);

-- 주식 현재가 투자자 테이블
CREATE TABLE inquire_investor (
    yyyymmdd               CHAR(8),              -- 일시 (YYYYMMDD)
    min                    CHAR(4),              -- 날짜별 시퀀스
    code                   CHAR(6),              -- 주식 코드
    PRIMARY KEY (yyyymmdd, min, code),           -- 복합 기본 키 설정
    stck_bsop_date          VARCHAR(8),           -- 주식 영업 일자
    stck_clpr               VARCHAR(10),          -- 주식 종가
    prdy_vrss               VARCHAR(10),          -- 전일 대비
    prdy_vrss_sign          CHAR(1),              -- 전일 대비 부호
    prsn_ntby_qty           VARCHAR(12),          -- 개인 순매수 수량
    frgn_ntby_qty           VARCHAR(12),          -- 외국인 순매수 수량
    orgn_ntby_qty           VARCHAR(18),          -- 기관계 순매수 수량
    prsn_ntby_tr_pbmn       VARCHAR(18),          -- 개인 순매수 거래 대금
    frgn_ntby_tr_pbmn       VARCHAR(18),          -- 외국인 순매수 거래 대금
    orgn_ntby_tr_pbmn       VARCHAR(18),          -- 기관계 순매수 거래 대금
    prsn_shnu_vol           VARCHAR(18),          -- 개인 매수2 거래량
    frgn_shnu_vol           VARCHAR(18),          -- 외국인 매수2 거래량
    orgn_shnu_vol           VARCHAR(18),          -- 기관계 매수2 거래량
    prsn_shnu_tr_pbmn       VARCHAR(18),          -- 개인 매수2 거래 대금
    frgn_shnu_tr_pbmn       VARCHAR(18),          -- 외국인 매수2 거래 대금
    orgn_shnu_tr_pbmn       VARCHAR(18),          -- 기관계 매수2 거래 대금
    prsn_seln_vol           VARCHAR(18),          -- 개인 매도 거래량
    frgn_seln_vol           VARCHAR(18),          -- 외국인 매도 거래량
    orgn_seln_vol           VARCHAR(18),          -- 기관계 매도 거래량
    prsn_seln_tr_pbmn       VARCHAR(18),          -- 개인 매도 거래 대금
    frgn_seln_tr_pbmn       VARCHAR(18),          -- 외국인 매도 거래 대금
    orgn_seln_tr_pbmn       VARCHAR(18)           -- 기관계 매도 거래 대금
);

-- 주식 현재가 회원사 테이블
CREATE TABLE inquire_member (
    yyyymmdd               CHAR(8),              -- 일시 (YYYYMMDD)
    min                    CHAR(4),              -- 날짜별 시퀀스
    code                   CHAR(6),              -- 주식 코드
    PRIMARY KEY (yyyymmdd, min, code),           -- 복합 기본 키 설정
    seln_mbcr_no1          VARCHAR(5),           -- 매도 회원사 번호1
    seln_mbcr_no2          VARCHAR(5),           -- 매도 회원사 번호2
    seln_mbcr_no3          VARCHAR(5),           -- 매도 회원사 번호3
    seln_mbcr_no4          VARCHAR(5),           -- 매도 회원사 번호4
    seln_mbcr_no5          VARCHAR(5),           -- 매도 회원사 번호5
    seln_mbcr_name1        VARCHAR(40),          -- 매도 회원사 명1
    seln_mbcr_name2        VARCHAR(40),          -- 매도 회원사 명2
    seln_mbcr_name3        VARCHAR(40),          -- 매도 회원사 명3
    seln_mbcr_name4        VARCHAR(40),          -- 매도 회원사 명4
    seln_mbcr_name5        VARCHAR(40),          -- 매도 회원사 명5
    total_seln_qty1        VARCHAR(18),          -- 총 매도 수량1
    total_seln_qty2        VARCHAR(18),          -- 총 매도 수량2
    total_seln_qty3        VARCHAR(18),          -- 총 매도 수량3
    total_seln_qty4        VARCHAR(18),          -- 총 매도 수량4
    total_seln_qty5        VARCHAR(18),          -- 총 매도 수량5
    seln_mbcr_rlim1        VARCHAR(9),           -- 매도 회원사 비중1
    seln_mbcr_rlim2        VARCHAR(9),           -- 매도 회원사 비중2
    seln_mbcr_rlim3        VARCHAR(9),           -- 매도 회원사 비중3
    seln_mbcr_rlim4        VARCHAR(9),           -- 매도 회원사 비중4
    seln_mbcr_rlim5        VARCHAR(9),           -- 매도 회원사 비중5
    seln_qty_icdc1         VARCHAR(10),          -- 매도 수량 증감1
    seln_qty_icdc2         VARCHAR(10),          -- 매도 수량 증감2
    seln_qty_icdc3         VARCHAR(10),          -- 매도 수량 증감3
    seln_qty_icdc4         VARCHAR(10),          -- 매도 수량 증감4
    seln_qty_icdc5         VARCHAR(10),          -- 매도 수량 증감5
    shnu_mbcr_no1          VARCHAR(5),           -- 매수2 회원사 번호1
    shnu_mbcr_no2          VARCHAR(5),           -- 매수2 회원사 번호2
    shnu_mbcr_no3          VARCHAR(5),           -- 매수2 회원사 번호3
    shnu_mbcr_no4          VARCHAR(5),           -- 매수2 회원사 번호4
    shnu_mbcr_no5          VARCHAR(5),           -- 매수2 회원사 번호5
    shnu_mbcr_name1        VARCHAR(40),          -- 매수2 회원사 명1
    shnu_mbcr_name2        VARCHAR(40),          -- 매수2 회원사 명2
    shnu_mbcr_name3        VARCHAR(40),          -- 매수2 회원사 명3
    shnu_mbcr_name4        VARCHAR(40),          -- 매수2 회원사 명4
    shnu_mbcr_name5        VARCHAR(40),          -- 매수2 회원사 명5
    total_shnu_qty1        VARCHAR(18),          -- 총 매수2 수량1
    total_shnu_qty2        VARCHAR(18),          -- 총 매수2 수량2
    total_shnu_qty3        VARCHAR(18),          -- 총 매수2 수량3
    total_shnu_qty4        VARCHAR(18),          -- 총 매수2 수량4
    total_shnu_qty5        VARCHAR(18),          -- 총 매수2 수량5
    shnu_mbcr_rlim1        VARCHAR(9),           -- 매수2 회원사 비중1
    shnu_mbcr_rlim2        VARCHAR(9),           -- 매수2 회원사 비중2
    shnu_mbcr_rlim3        VARCHAR(9),           -- 매수2 회원사 비중3
    shnu_mbcr_rlim4        VARCHAR(9),           -- 매수2 회원사 비중4
    shnu_mbcr_rlim5        VARCHAR(9),           -- 매수2 회원사 비중5
    shnu_qty_icdc1         VARCHAR(10),          -- 매수2 수량 증감1
    shnu_qty_icdc2         VARCHAR(10),          -- 매수2 수량 증감2
    shnu_qty_icdc3         VARCHAR(10),          -- 매수2 수량 증감3
    shnu_qty_icdc4         VARCHAR(10),          -- 매수2 수량 증감4
    shnu_qty_icdc5         VARCHAR(10),          -- 매수2 수량 증감5
    glob_total_seln_qty    VARCHAR(18),          -- 외국계 총 매도 수량
    glob_seln_rlim         VARCHAR(9),           -- 외국계 매도 비중
    glob_ntby_qty          VARCHAR(12),          -- 외국계 순매수 수량
    glob_total_shnu_qty    VARCHAR(18),          -- 외국계 총 매수2 수량
    glob_shnu_rlim         VARCHAR(9),           -- 외국계 매수2 비중
    seln_mbcr_glob_yn_1    CHAR(1),              -- 매도 회원사 외국계 여부1
    seln_mbcr_glob_yn_2    CHAR(1),              -- 매도 회원사 외국계 여부2
    seln_mbcr_glob_yn_3    CHAR(1),              -- 매도 회원사 외국계 여부3
    seln_mbcr_glob_yn_4    CHAR(1),              -- 매도 회원사 외국계 여부4
    seln_mbcr_glob_yn_5    CHAR(1),              -- 매도 회원사 외국계 여부5
    shnu_mbcr_glob_yn_1    CHAR(1),              -- 매수2 회원사 외국계 여부1
    shnu_mbcr_glob_yn_2    CHAR(1),              -- 매수2 회원사 외국계 여부2
    shnu_mbcr_glob_yn_3    CHAR(1),              -- 매수2 회원사 외국계 여부3
    shnu_mbcr_glob_yn_4    CHAR(1),              -- 매수2 회원사 외국계 여부4
    shnu_mbcr_glob_yn_5    CHAR(1),              -- 매수2 회원사 외국계 여부5
    glob_total_seln_qty_icdc VARCHAR(10),        -- 외국계 총 매도 수량 증감
    glob_total_shnu_qty_icdc VARCHAR(10),        -- 외국계 총 매수2 수량 증감
    acml_vol              VARCHAR(18)           -- 누적 거래량
);
