/*!40101 SET NAMES utf8mb4 */;

DROP DATABASE IF EXISTS stock;
CREATE DATABASE stock;
use stock;


-- 한국 주식 코드 테이블
CREATE TABLE korean_stocks (
    name VARCHAR(50) NOT NULL UNIQUE,
    code VARCHAR(6) NOT NULL PRIMARY KEY
);

-- 주식 현재가 시세 테이블
CREATE TABLE price (
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
    pvt_scnd_dmrs_prc      VARCHAR(10),          -- 피벗 2차 디저항 가격
    pvt_frst_dmrs_prc      VARCHAR(10),          -- 피벗 1차 디저항 가격
    pvt_pont_val           VARCHAR(10),          -- 피벗 포인트 값
    pvt_frst_dmsp_prc      VARCHAR(10),          -- 피벗 1차 디지지 가격
    pvt_scnd_dmsp_prc      VARCHAR(10),          -- 피벗 2차 디지지 가격
    dmrs_val               VARCHAR(10),          -- 디저항 값
    dmsp_val               VARCHAR(10),          -- 디지지 값
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
    ssts_yn                CHAR(1),              -- 공매도가능여부
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
    sltr_yn                CHAR(1),              -- 정리매매여부
    FOREIGN KEY (code) REFERENCES korean_stocks(code)
);


-- 주식 현재가 체결 테이블
CREATE TABLE ccnl (
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
    prdy_ctrt      VARCHAR(82),            -- 전일 대비율
    FOREIGN KEY (code) REFERENCES korean_stocks(code)
);

-- 주식 현재가 호가/예상체결 테이블
CREATE TABLE asking_price_exp_ccn (
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
    new_mkop_cls_code      VARCHAR(2),             -- 신 장운영 구분 코드
    FOREIGN KEY (code) REFERENCES korean_stocks(code)
);

-- 주식 현재가 투자자 테이블
CREATE TABLE investor (
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
    orgn_seln_tr_pbmn       VARCHAR(18),           -- 기관계 매도 거래 대금
    FOREIGN KEY (code) REFERENCES korean_stocks(code)
);

-- 주식 현재가 회원사 테이블
CREATE TABLE member (
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
    acml_vol              VARCHAR(18),           -- 누적 거래량
    FOREIGN KEY (code) REFERENCES korean_stocks(code)
);






INSERT INTO korean_stocks (name, code) VALUES ('삼성전자', '005930');
INSERT INTO korean_stocks (name, code) VALUES ('SK하이닉스', '000660');
INSERT INTO korean_stocks (name, code) VALUES ('LG에너지솔루션', '373220');
INSERT INTO korean_stocks (name, code) VALUES ('삼성바이오로직스', '207940');
INSERT INTO korean_stocks (name, code) VALUES ('현대차', '005380');
INSERT INTO korean_stocks (name, code) VALUES ('기아', '000270');
INSERT INTO korean_stocks (name, code) VALUES ('셀트리온', '068270');
INSERT INTO korean_stocks (name, code) VALUES ('삼성전자우', '005935');
INSERT INTO korean_stocks (name, code) VALUES ('KB금융', '105560');
INSERT INTO korean_stocks (name, code) VALUES ('NAVER', '035420');
INSERT INTO korean_stocks (name, code) VALUES ('HD현대중공업', '329180');
INSERT INTO korean_stocks (name, code) VALUES ('신한지주', '055550');
INSERT INTO korean_stocks (name, code) VALUES ('현대모비스', '012330');
INSERT INTO korean_stocks (name, code) VALUES ('POSCO홀딩스', '005490');
INSERT INTO korean_stocks (name, code) VALUES ('삼성물산', '028260');
INSERT INTO korean_stocks (name, code) VALUES ('메리츠금융지주', '138040');
INSERT INTO korean_stocks (name, code) VALUES ('SK이노베이션', '096770');
INSERT INTO korean_stocks (name, code) VALUES ('삼성생명', '032830');
INSERT INTO korean_stocks (name, code) VALUES ('고려아연', '010130');
INSERT INTO korean_stocks (name, code) VALUES ('LG화학', '051910');
INSERT INTO korean_stocks (name, code) VALUES ('한화에어로스페이스', '012450');
INSERT INTO korean_stocks (name, code) VALUES ('HD한국조선해양', '009540');
INSERT INTO korean_stocks (name, code) VALUES ('하나금융지주', '086790');
INSERT INTO korean_stocks (name, code) VALUES ('삼성화재', '000810');
INSERT INTO korean_stocks (name, code) VALUES ('HMM', '011200');
INSERT INTO korean_stocks (name, code) VALUES ('카카오', '035720');
INSERT INTO korean_stocks (name, code) VALUES ('삼성SDI', '006400');
INSERT INTO korean_stocks (name, code) VALUES ('크래프톤', '259960');
INSERT INTO korean_stocks (name, code) VALUES ('HD현대일렉트릭', '267260');
INSERT INTO korean_stocks (name, code) VALUES ('LG전자', '066570');
INSERT INTO korean_stocks (name, code) VALUES ('한화오션', '042660');
INSERT INTO korean_stocks (name, code) VALUES ('KT&G', '033780');
INSERT INTO korean_stocks (name, code) VALUES ('한국전력', '015760');
INSERT INTO korean_stocks (name, code) VALUES ('두산에너빌리티', '034020');
INSERT INTO korean_stocks (name, code) VALUES ('SK스퀘어', '402340');
INSERT INTO korean_stocks (name, code) VALUES ('SK텔레콤', '017670');
INSERT INTO korean_stocks (name, code) VALUES ('포스코퓨처엠', '003670');
INSERT INTO korean_stocks (name, code) VALUES ('기업은행', '024110');
INSERT INTO korean_stocks (name, code) VALUES ('LG', '003550');
INSERT INTO korean_stocks (name, code) VALUES ('우리금융지주', '316140');
INSERT INTO korean_stocks (name, code) VALUES ('KT', '030200');
INSERT INTO korean_stocks (name, code) VALUES ('한미반도체', '042700');
INSERT INTO korean_stocks (name, code) VALUES ('삼성중공업', '010140');
INSERT INTO korean_stocks (name, code) VALUES ('유한양행', '000100');
INSERT INTO korean_stocks (name, code) VALUES ('SK', '034730');
INSERT INTO korean_stocks (name, code) VALUES ('카카오뱅크', '323410');
INSERT INTO korean_stocks (name, code) VALUES ('삼성에스디에스', '018260');
INSERT INTO korean_stocks (name, code) VALUES ('현대글로비스', '086280');
INSERT INTO korean_stocks (name, code) VALUES ('삼성전기', '009150');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX CD금리액티브(합성)', '459580');
INSERT INTO korean_stocks (name, code) VALUES ('SK바이오팜', '326030');
INSERT INTO korean_stocks (name, code) VALUES ('하이브', '352820');
INSERT INTO korean_stocks (name, code) VALUES ('대한항공', '003490');
INSERT INTO korean_stocks (name, code) VALUES ('포스코인터내셔널', '047050');
INSERT INTO korean_stocks (name, code) VALUES ('HD현대마린솔루션', '443060');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER 미국S&P500', '360750');
INSERT INTO korean_stocks (name, code) VALUES ('DB손해보험', '005830');
INSERT INTO korean_stocks (name, code) VALUES ('S-Oil', '010950');
INSERT INTO korean_stocks (name, code) VALUES ('아모레퍼시픽', '090430');
INSERT INTO korean_stocks (name, code) VALUES ('HD현대', '267250');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER CD금리투자KIS(합성)', '357870');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 200', '069500');
INSERT INTO korean_stocks (name, code) VALUES ('현대로템', '064350');
INSERT INTO korean_stocks (name, code) VALUES ('SKC', '011790');
-- INSERT INTO korean_stocks (name, code) VALUES ('현대차2우B', '005387');
INSERT INTO korean_stocks (name, code) VALUES ('삼양식품', '003230');
INSERT INTO korean_stocks (name, code) VALUES ('HD현대미포', '010620');
INSERT INTO korean_stocks (name, code) VALUES ('LS ELECTRIC', '010120');
INSERT INTO korean_stocks (name, code) VALUES ('에코프로머티', '450080');
INSERT INTO korean_stocks (name, code) VALUES ('코웨이', '021240');
INSERT INTO korean_stocks (name, code) VALUES ('한진칼', '180640');
INSERT INTO korean_stocks (name, code) VALUES ('한국항공우주', '047810');
INSERT INTO korean_stocks (name, code) VALUES ('맥쿼리인프라', '088980');
INSERT INTO korean_stocks (name, code) VALUES ('한국타이어앤테크놀로지', '161390');
INSERT INTO korean_stocks (name, code) VALUES ('LIG넥스원', '079550');
INSERT INTO korean_stocks (name, code) VALUES ('두산', '000150');
INSERT INTO korean_stocks (name, code) VALUES ('LG생활건강', '051900');
INSERT INTO korean_stocks (name, code) VALUES ('미래에셋증권', '006800');
INSERT INTO korean_stocks (name, code) VALUES ('LG디스플레이', '034220');
INSERT INTO korean_stocks (name, code) VALUES ('삼성카드', '029780');
INSERT INTO korean_stocks (name, code) VALUES ('LG유플러스', '032640');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER 미국나스닥100', '133690');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 머니마켓액티브', '488770');
INSERT INTO korean_stocks (name, code) VALUES ('넷마블', '251270');
INSERT INTO korean_stocks (name, code) VALUES ('한화시스템', '272210');
INSERT INTO korean_stocks (name, code) VALUES ('NH투자증권', '005940');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX KOFR금리액티브(합성)', '423160');
INSERT INTO korean_stocks (name, code) VALUES ('두산밥캣', '241560');
INSERT INTO korean_stocks (name, code) VALUES ('한국금융지주', '071050');
INSERT INTO korean_stocks (name, code) VALUES ('두산로보틱스', '454910');
INSERT INTO korean_stocks (name, code) VALUES ('엔씨소프트', '036570');
INSERT INTO korean_stocks (name, code) VALUES ('SK바이오사이언스', '302440');
INSERT INTO korean_stocks (name, code) VALUES ('오리온', '271560');
INSERT INTO korean_stocks (name, code) VALUES ('효성중공업', '298040');
INSERT INTO korean_stocks (name, code) VALUES ('삼성증권', '016360');
INSERT INTO korean_stocks (name, code) VALUES ('LG이노텍', '011070');
INSERT INTO korean_stocks (name, code) VALUES ('현대오토에버', '307950');
INSERT INTO korean_stocks (name, code) VALUES ('현대차우', '005385');
INSERT INTO korean_stocks (name, code) VALUES ('CJ제일제당', '097950');
INSERT INTO korean_stocks (name, code) VALUES ('시프트업', '462870');
INSERT INTO korean_stocks (name, code) VALUES ('카카오페이', '377300');
INSERT INTO korean_stocks (name, code) VALUES ('GS', '078930');
INSERT INTO korean_stocks (name, code) VALUES ('강원랜드', '035250');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 미국S&P500TR', '379800');
INSERT INTO korean_stocks (name, code) VALUES ('삼성E&A', '028050');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER KOFR금리액티브(합성)', '449170');
INSERT INTO korean_stocks (name, code) VALUES ('한미약품', '128940');
INSERT INTO korean_stocks (name, code) VALUES ('BNK금융지주', '138930');
INSERT INTO korean_stocks (name, code) VALUES ('한국가스공사', '036460');
INSERT INTO korean_stocks (name, code) VALUES ('JB금융지주', '175330');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER 미국테크TOP10 INDXX', '381170');
INSERT INTO korean_stocks (name, code) VALUES ('LS', '006260');
INSERT INTO korean_stocks (name, code) VALUES ('한화솔루션', '009830');
INSERT INTO korean_stocks (name, code) VALUES ('키움증권', '039490');
INSERT INTO korean_stocks (name, code) VALUES ('포스코DX', '022100');
INSERT INTO korean_stocks (name, code) VALUES ('엘앤에프', '066970');
INSERT INTO korean_stocks (name, code) VALUES ('현대제철', '004020');
INSERT INTO korean_stocks (name, code) VALUES ('현대건설', '000720');
INSERT INTO korean_stocks (name, code) VALUES ('CJ', '001040');
INSERT INTO korean_stocks (name, code) VALUES ('한온시스템', '018880');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 종합채권(AA-이상)액티브', '273130');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER 미국필라델피아반도체나스닥', '381180');
INSERT INTO korean_stocks (name, code) VALUES ('금호석유', '011780');
INSERT INTO korean_stocks (name, code) VALUES ('롯데케미칼', '011170');
INSERT INTO korean_stocks (name, code) VALUES ('휠라홀딩스', '081660');
INSERT INTO korean_stocks (name, code) VALUES ('동서', '026960');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 200TR', '278530');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 레버리지', '122630');
INSERT INTO korean_stocks (name, code) VALUES ('현대해상', '001450');
-- INSERT INTO korean_stocks (name, code) VALUES ('RISE 머니마켓액티브', '455890');
INSERT INTO korean_stocks (name, code) VALUES ('에스원', '012750');
INSERT INTO korean_stocks (name, code) VALUES ('대한전선', '001440');
INSERT INTO korean_stocks (name, code) VALUES ('롯데지주', '004990');
INSERT INTO korean_stocks (name, code) VALUES ('한전기술', '052690');
INSERT INTO korean_stocks (name, code) VALUES ('농심', '004370');
INSERT INTO korean_stocks (name, code) VALUES ('KCC', '002380');
INSERT INTO korean_stocks (name, code) VALUES ('F&F', '383220');
INSERT INTO korean_stocks (name, code) VALUES ('한화생명', '088350');
INSERT INTO korean_stocks (name, code) VALUES ('한올바이오파마', '009420');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER MSCI Korea TR', '310970');
INSERT INTO korean_stocks (name, code) VALUES ('아시아나항공', '020560');
INSERT INTO korean_stocks (name, code) VALUES ('한화', '000880');
INSERT INTO korean_stocks (name, code) VALUES ('산일전기', '062040');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER 200', '102110');
INSERT INTO korean_stocks (name, code) VALUES ('SK가스', '018670');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER 미국배당다우존스', '458730');
INSERT INTO korean_stocks (name, code) VALUES ('에이피알', '278470');
INSERT INTO korean_stocks (name, code) VALUES ('한미사이언스', '008930');
INSERT INTO korean_stocks (name, code) VALUES ('제일기획', '030000');
INSERT INTO korean_stocks (name, code) VALUES ('HL만도', '204320');
INSERT INTO korean_stocks (name, code) VALUES ('녹십자', '006280');
INSERT INTO korean_stocks (name, code) VALUES ('CJ대한통운', '000120');
INSERT INTO korean_stocks (name, code) VALUES ('현대엘리베이', '017800');
INSERT INTO korean_stocks (name, code) VALUES ('한전KPS', '051600');
INSERT INTO korean_stocks (name, code) VALUES ('한화엔진', '082740');
INSERT INTO korean_stocks (name, code) VALUES ('아모레G', '002790');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX CD1년금리플러스액티브(합성)', '481050');
INSERT INTO korean_stocks (name, code) VALUES ('코스모신소재', '005070');
INSERT INTO korean_stocks (name, code) VALUES ('이마트', '139480');
INSERT INTO korean_stocks (name, code) VALUES ('팬오션', '028670');
-- INSERT INTO korean_stocks (name, code) VALUES ('ACE 미국30년국채액티브(H)', '453850');
INSERT INTO korean_stocks (name, code) VALUES ('SK아이이테크놀로지', '361610');
INSERT INTO korean_stocks (name, code) VALUES ('영원무역', '111770');
INSERT INTO korean_stocks (name, code) VALUES ('더존비즈온', '012510');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 코스닥150레버리지', '233740');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 미국나스닥100TR', '379810');
INSERT INTO korean_stocks (name, code) VALUES ('BGF리테일', '282330');
INSERT INTO korean_stocks (name, code) VALUES ('씨에스윈드', '112610');
INSERT INTO korean_stocks (name, code) VALUES ('이수페타시스', '007660');
INSERT INTO korean_stocks (name, code) VALUES ('한화인더스트리얼솔루션즈', '489790');
-- INSERT INTO korean_stocks (name, code) VALUES ('ACE 미국S&P500', '360200');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER 차이나전기차SOLACTIVE', '371460');
INSERT INTO korean_stocks (name, code) VALUES ('코스맥스', '192820');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 단기채권PLUS', '214980');
INSERT INTO korean_stocks (name, code) VALUES ('한국앤컴퍼니', '000240');
INSERT INTO korean_stocks (name, code) VALUES ('코리안리', '003690');
INSERT INTO korean_stocks (name, code) VALUES ('오뚜기', '007310');
INSERT INTO korean_stocks (name, code) VALUES ('GS건설', '006360');
INSERT INTO korean_stocks (name, code) VALUES ('DB하이텍', '000990');
INSERT INTO korean_stocks (name, code) VALUES ('호텔신라', '008770');
INSERT INTO korean_stocks (name, code) VALUES ('OCI홀딩스', '010060');
INSERT INTO korean_stocks (name, code) VALUES ('롯데쇼핑', '023530');
INSERT INTO korean_stocks (name, code) VALUES ('대웅제약', '069620');
INSERT INTO korean_stocks (name, code) VALUES ('에스디바이오센서', '137310');
INSERT INTO korean_stocks (name, code) VALUES ('풍산', '103140');
INSERT INTO korean_stocks (name, code) VALUES ('경동나비엔', '009450');
INSERT INTO korean_stocks (name, code) VALUES ('에스엘', '005850');
INSERT INTO korean_stocks (name, code) VALUES ('DGB금융지주', '139130');
INSERT INTO korean_stocks (name, code) VALUES ('GS리테일', '007070');
INSERT INTO korean_stocks (name, code) VALUES ('하이트진로', '000080');
INSERT INTO korean_stocks (name, code) VALUES ('HD현대인프라코어', '042670');
INSERT INTO korean_stocks (name, code) VALUES ('금호타이어', '073240');
INSERT INTO korean_stocks (name, code) VALUES ('대우건설', '047040');
-- INSERT INTO korean_stocks (name, code) VALUES ('RISE 종합채권(A-이상)액티브', '385540');
INSERT INTO korean_stocks (name, code) VALUES ('한국콜마', '161890');
INSERT INTO korean_stocks (name, code) VALUES ('일진전기', '103590');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER 25-10 회사채(A+이상)액티브', '453540');
INSERT INTO korean_stocks (name, code) VALUES ('금양', '001570');
-- INSERT INTO korean_stocks (name, code) VALUES ('ACE 미국나스닥100', '367380');
INSERT INTO korean_stocks (name, code) VALUES ('SK리츠', '395400');
INSERT INTO korean_stocks (name, code) VALUES ('신세계', '004170');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 코스닥150', '229200');
INSERT INTO korean_stocks (name, code) VALUES ('DL이앤씨', '375500');
INSERT INTO korean_stocks (name, code) VALUES ('동원산업', '006040');
INSERT INTO korean_stocks (name, code) VALUES ('대웅', '003090');
INSERT INTO korean_stocks (name, code) VALUES ('종근당', '185750');
INSERT INTO korean_stocks (name, code) VALUES ('신영증권', '001720');
INSERT INTO korean_stocks (name, code) VALUES ('LG화학우', '051915');
INSERT INTO korean_stocks (name, code) VALUES ('HD현대건설기계', '267270');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 200선물인버스2X', '252670');
INSERT INTO korean_stocks (name, code) VALUES ('동원시스템즈', '014820');
INSERT INTO korean_stocks (name, code) VALUES ('한솔케미칼', '014680');
INSERT INTO korean_stocks (name, code) VALUES ('LS에코에너지', '229640');
INSERT INTO korean_stocks (name, code) VALUES ('이수스페셜티케미컬', '457190');
INSERT INTO korean_stocks (name, code) VALUES ('HDC현대산업개발', '294870');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER 미국30년국채커버드콜액티브(H)', '476550');
INSERT INTO korean_stocks (name, code) VALUES ('두산퓨얼셀', '336260');
INSERT INTO korean_stocks (name, code) VALUES ('롯데에너지머티리얼즈', '020150');
INSERT INTO korean_stocks (name, code) VALUES ('영원무역홀딩스', '009970');
INSERT INTO korean_stocks (name, code) VALUES ('DN오토모티브', '007340');
INSERT INTO korean_stocks (name, code) VALUES ('세방전지', '004490');
INSERT INTO korean_stocks (name, code) VALUES ('한샘', '009240');
INSERT INTO korean_stocks (name, code) VALUES ('현대위아', '011210');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER 25-12 금융채(AA-이상)', '494900');
-- INSERT INTO korean_stocks (name, code) VALUES ('RISE 200', '148020');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER CD1년금리액티브(합성)', '475630');
-- INSERT INTO korean_stocks (name, code) VALUES ('메리츠 KIS CD금리투자 ETN', '610063');
INSERT INTO korean_stocks (name, code) VALUES ('더블유게임즈', '192080');
INSERT INTO korean_stocks (name, code) VALUES ('롯데렌탈', '089860');
INSERT INTO korean_stocks (name, code) VALUES ('한일시멘트', '300720');
INSERT INTO korean_stocks (name, code) VALUES ('현대백화점', '069960');
INSERT INTO korean_stocks (name, code) VALUES ('DI동일', '001530');
INSERT INTO korean_stocks (name, code) VALUES ('롯데정밀화학', '004000');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 삼성그룹', '102780');
INSERT INTO korean_stocks (name, code) VALUES ('롯데칠성', '005300');
INSERT INTO korean_stocks (name, code) VALUES ('LX인터내셔널', '001120');
INSERT INTO korean_stocks (name, code) VALUES ('효성티앤씨', '298020');
INSERT INTO korean_stocks (name, code) VALUES ('롯데웰푸드', '280360');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 2차전지산업', '305720');
INSERT INTO korean_stocks (name, code) VALUES ('솔루엠', '248070');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 25-12 은행채(AAA)액티브', '491080');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 25-11 은행채(AA-이상)PLUS액티브', '476810');
INSERT INTO korean_stocks (name, code) VALUES ('LX세미콘', '108320');
INSERT INTO korean_stocks (name, code) VALUES ('ESR켄달스퀘어리츠', '365550');
INSERT INTO korean_stocks (name, code) VALUES ('미래에셋생명', '085620');
INSERT INTO korean_stocks (name, code) VALUES ('SK네트웍스', '001740');
INSERT INTO korean_stocks (name, code) VALUES ('오리온홀딩스', '001800');
INSERT INTO korean_stocks (name, code) VALUES ('KB발해인프라', '415640');
-- INSERT INTO korean_stocks (name, code) VALUES ('RISE 미국나스닥100', '368590');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER 미국배당다우존스타겟커버드콜2호', '458760');
INSERT INTO korean_stocks (name, code) VALUES ('프레스티지바이오파마', '950210');
INSERT INTO korean_stocks (name, code) VALUES ('HD현대마린엔진', '071970');
INSERT INTO korean_stocks (name, code) VALUES ('파라다이스', '034230');
INSERT INTO korean_stocks (name, code) VALUES ('보령', '003850');
-- INSERT INTO korean_stocks (name, code) VALUES ('RISE CD금리액티브(합성)', '477080');
INSERT INTO korean_stocks (name, code) VALUES ('롯데리츠', '330590');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER 2차전지테마', '305540');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX MSCI Korea TR', '278540');
INSERT INTO korean_stocks (name, code) VALUES ('CJ CGV', '079160');
INSERT INTO korean_stocks (name, code) VALUES ('하나투어', '039130');
INSERT INTO korean_stocks (name, code) VALUES ('삼성화재우', '000815');
INSERT INTO korean_stocks (name, code) VALUES ('미원상사', '002840');
INSERT INTO korean_stocks (name, code) VALUES ('HS효성첨단소재', '298050');
-- INSERT INTO korean_stocks (name, code) VALUES ('SOL 종합채권(AA-이상)액티브', '436140');
INSERT INTO korean_stocks (name, code) VALUES ('대덕전자', '353200');
INSERT INTO korean_stocks (name, code) VALUES ('다우기술', '023590');
INSERT INTO korean_stocks (name, code) VALUES ('대신증권', '003540');
INSERT INTO korean_stocks (name, code) VALUES ('SK오션플랜트', '100090');
INSERT INTO korean_stocks (name, code) VALUES ('빙그레', '005180');
INSERT INTO korean_stocks (name, code) VALUES ('쿠쿠홀딩스', '192400');
-- INSERT INTO korean_stocks (name, code) VALUES ('RISE 미국S&P500', '379780');
INSERT INTO korean_stocks (name, code) VALUES ('한화투자증권', '003530');
-- INSERT INTO korean_stocks (name, code) VALUES ('SOL 미국배당다우존스', '446720');
INSERT INTO korean_stocks (name, code) VALUES ('TCC스틸', '002710');
INSERT INTO korean_stocks (name, code) VALUES ('세아제강지주', '003030');
-- INSERT INTO korean_stocks (name, code) VALUES ('하나 CD금리투자 ETN', '700026');
INSERT INTO korean_stocks (name, code) VALUES ('KG모빌리티', '003620');
INSERT INTO korean_stocks (name, code) VALUES ('효성', '004800');
INSERT INTO korean_stocks (name, code) VALUES ('코오롱인더', '120110');
INSERT INTO korean_stocks (name, code) VALUES ('HDC', '012630');
INSERT INTO korean_stocks (name, code) VALUES ('이노션', '214320');
INSERT INTO korean_stocks (name, code) VALUES ('녹십자홀딩스', '005250');
INSERT INTO korean_stocks (name, code) VALUES ('덴티움', '145720');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER 단기통안채', '157450');
-- INSERT INTO korean_stocks (name, code) VALUES ('ACE 테슬라밸류체인액티브', '457480');
-- INSERT INTO korean_stocks (name, code) VALUES ('ACE 종합채권(AA-이상)KIS액티브', '356540');
INSERT INTO korean_stocks (name, code) VALUES ('동양생명', '082640');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX Top5PlusTR', '315930');
-- INSERT INTO korean_stocks (name, code) VALUES ('N2 KIS CD금리투자 ETN', '550082');
-- INSERT INTO korean_stocks (name, code) VALUES ('케이씨텍', '281820');
INSERT INTO korean_stocks (name, code) VALUES ('현대지에프홀딩스', '005440');
INSERT INTO korean_stocks (name, code) VALUES ('SK케미칼', '285130');
-- INSERT INTO korean_stocks (name, code) VALUES ('KOSEF 200TR', '294400');
INSERT INTO korean_stocks (name, code) VALUES ('영풍', '000670');
INSERT INTO korean_stocks (name, code) VALUES ('태영건설', '009410');
INSERT INTO korean_stocks (name, code) VALUES ('한국단자', '025540');
INSERT INTO korean_stocks (name, code) VALUES ('GKL', '114090');
INSERT INTO korean_stocks (name, code) VALUES ('코스모화학', '005420');
INSERT INTO korean_stocks (name, code) VALUES ('LG전자우', '066575');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER 인도니프티50', '453870');
INSERT INTO korean_stocks (name, code) VALUES ('TKG휴켐스', '069260');
INSERT INTO korean_stocks (name, code) VALUES ('신한알파리츠', '293940');
INSERT INTO korean_stocks (name, code) VALUES ('미원에스씨', '268280');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 단기채권', '153130');
INSERT INTO korean_stocks (name, code) VALUES ('태광산업', '003240');
INSERT INTO korean_stocks (name, code) VALUES ('SK디스커버리', '006120');
-- INSERT INTO korean_stocks (name, code) VALUES ('NICE평가정보', '030190');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER 종합채권(AA-이상)액티브', '451540');
-- INSERT INTO korean_stocks (name, code) VALUES ('세아베스틸지주', '001430');
INSERT INTO korean_stocks (name, code) VALUES ('SNT다이내믹스', '003570');
INSERT INTO korean_stocks (name, code) VALUES ('대상', '001680');
INSERT INTO korean_stocks (name, code) VALUES ('DL', '000210');
INSERT INTO korean_stocks (name, code) VALUES ('롯데손해보험', '000400');
-- INSERT INTO korean_stocks (name, code) VALUES ('ACE KRX금현물', '411060');
-- INSERT INTO korean_stocks (name, code) VALUES ('삼성 레버리지 WTI원유 선물 ETN', '530031');
INSERT INTO korean_stocks (name, code) VALUES ('한국카본', '017960');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER 미국달러단기채권액티브', '329750');
-- INSERT INTO korean_stocks (name, code) VALUES ('동아쏘시오홀딩스', '000640');
INSERT INTO korean_stocks (name, code) VALUES ('NHN', '181710');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER 미국30년국채스트립액티브(합성 H)', '458250');
-- INSERT INTO korean_stocks (name, code) VALUES ('솔루스첨단소재', '336370');
INSERT INTO korean_stocks (name, code) VALUES ('한화리츠', '451800');
INSERT INTO korean_stocks (name, code) VALUES ('교보증권', '030610');
INSERT INTO korean_stocks (name, code) VALUES ('아이에스동서', '010780');
-- INSERT INTO korean_stocks (name, code) VALUES ('케이카', '381970');
INSERT INTO korean_stocks (name, code) VALUES ('가온전선', '000500');
INSERT INTO korean_stocks (name, code) VALUES ('전진건설로봇', '079900');
-- INSERT INTO korean_stocks (name, code) VALUES ('카프로', '006380');
-- INSERT INTO korean_stocks (name, code) VALUES ('N2 코스피 변동성 매칭형 양매도 ETN', '550057');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 미국빅테크10(H)', '314250');
INSERT INTO korean_stocks (name, code) VALUES ('롯데관광개발', '032350');
-- INSERT INTO korean_stocks (name, code) VALUES ('ACE 미국빅테크TOP7 Plus', '465580');
-- INSERT INTO korean_stocks (name, code) VALUES ('일진하이솔루스', '271940');
-- INSERT INTO korean_stocks (name, code) VALUES ('SNT모티브', '064960');
INSERT INTO korean_stocks (name, code) VALUES ('HJ중공업', '097230');
INSERT INTO korean_stocks (name, code) VALUES ('제주항공', '089590');
-- INSERT INTO korean_stocks (name, code) VALUES ('ACE 미국배당다우존스', '402970');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER Fn반도체TOP10', '396500');
-- INSERT INTO korean_stocks (name, code) VALUES ('비에이치', '090460');
INSERT INTO korean_stocks (name, code) VALUES ('KG스틸', '016380');
INSERT INTO korean_stocks (name, code) VALUES ('티웨이항공', '091810');
INSERT INTO korean_stocks (name, code) VALUES ('KCC글라스', '344820');
INSERT INTO korean_stocks (name, code) VALUES ('신풍제약', '019170');
INSERT INTO korean_stocks (name, code) VALUES ('넥센타이어', '002350');
INSERT INTO korean_stocks (name, code) VALUES ('지누스', '013890');
-- INSERT INTO korean_stocks (name, code) VALUES ('PLUS 200', '152100');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER 리츠부동산인프라', '329200');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER 미국나스닥100타겟데일리커버드콜', '486290');
INSERT INTO korean_stocks (name, code) VALUES ('율촌화학', '008730');
INSERT INTO korean_stocks (name, code) VALUES ('동원F&B', '049770');
INSERT INTO korean_stocks (name, code) VALUES ('OCI', '456040');
INSERT INTO korean_stocks (name, code) VALUES ('명신산업', '009900');
-- INSERT INTO korean_stocks (name, code) VALUES ('DS단석', '017860');
-- INSERT INTO korean_stocks (name, code) VALUES ('JW중외제약', '001060');
-- INSERT INTO korean_stocks (name, code) VALUES ('화승엔터프라이즈', '241590');
-- INSERT INTO korean_stocks (name, code) VALUES ('대한해운', '005880');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER TOP10', '292150');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER 미국달러SOFR금리액티브(합성)', '456610');
-- INSERT INTO korean_stocks (name, code) VALUES ('대한유화', '006650');
INSERT INTO korean_stocks (name, code) VALUES ('PI첨단소재', '178920');
-- INSERT INTO korean_stocks (name, code) VALUES ('미래에셋증권2우B', '00680K');
INSERT INTO korean_stocks (name, code) VALUES ('한세실업', '105630');
INSERT INTO korean_stocks (name, code) VALUES ('삼양홀딩스', '000070');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER 200 IT', '139260');
INSERT INTO korean_stocks (name, code) VALUES ('후성', '093370');
INSERT INTO korean_stocks (name, code) VALUES ('STX엔진', '077970');
INSERT INTO korean_stocks (name, code) VALUES ('쏘카', '403550');
INSERT INTO korean_stocks (name, code) VALUES ('동아에스티', '170900');
INSERT INTO korean_stocks (name, code) VALUES ('삼아알미늄', '006110');
-- INSERT INTO korean_stocks (name, code) VALUES ('SOL 조선TOP3플러스', '466920');
INSERT INTO korean_stocks (name, code) VALUES ('파미셀', '005690');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER 차이나항셍테크', '371160');
-- INSERT INTO korean_stocks (name, code) VALUES ('제이알글로벌리츠', '348950');
INSERT INTO korean_stocks (name, code) VALUES ('유안타증권', '003470');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 반도체', '091160');
INSERT INTO korean_stocks (name, code) VALUES ('드림텍', '192650');
INSERT INTO korean_stocks (name, code) VALUES ('세진중공업', '075580');
INSERT INTO korean_stocks (name, code) VALUES ('현대홈쇼핑', '057050');
-- INSERT INTO korean_stocks (name, code) VALUES ('SOL 초단기채권액티브', '469830');
-- INSERT INTO korean_stocks (name, code) VALUES ('디아이', '003160');
-- INSERT INTO korean_stocks (name, code) VALUES ('바이오노트', '377740');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER 단기채권액티브', '272580');
-- INSERT INTO korean_stocks (name, code) VALUES ('신한 레버리지 WTI원유 선물 ETN(H)', '500019');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 미국반도체MV', '390390');
INSERT INTO korean_stocks (name, code) VALUES ('LX홀딩스', '383800');
-- INSERT INTO korean_stocks (name, code) VALUES ('KB KIS CD금리투자 ETN', '580058');
INSERT INTO korean_stocks (name, code) VALUES ('아세아', '002030');
INSERT INTO korean_stocks (name, code) VALUES ('진에어', '272450');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 인버스', '114800');
-- INSERT INTO korean_stocks (name, code) VALUES ('유니드', '014830');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 자동차', '091180');
INSERT INTO korean_stocks (name, code) VALUES ('현대그린푸드', '453340');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 미국30년국채타겟커버드콜(합성 H)', '481060');
INSERT INTO korean_stocks (name, code) VALUES ('SNT에너지', '100840');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 국고채30년액티브', '439870');
-- INSERT INTO korean_stocks (name, code) VALUES ('퍼시스', '016800');
INSERT INTO korean_stocks (name, code) VALUES ('한화손해보험', '000370');
INSERT INTO korean_stocks (name, code) VALUES ('두산우', '000155');
-- INSERT INTO korean_stocks (name, code) VALUES ('삼양사', '145990');
INSERT INTO korean_stocks (name, code) VALUES ('지역난방공사', '071320');
INSERT INTO korean_stocks (name, code) VALUES ('엠앤씨솔루션', '484870');
-- INSERT INTO korean_stocks (name, code) VALUES ('F&F홀딩스', '007700');
INSERT INTO korean_stocks (name, code) VALUES ('더본코리아', '475560');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 인도Nifty50', '453810');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 국고채3년', '114260');
INSERT INTO korean_stocks (name, code) VALUES ('E1', '017940');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER 미국테크TOP10타겟커버드콜', '474220');
INSERT INTO korean_stocks (name, code) VALUES ('LF', '093050');
INSERT INTO korean_stocks (name, code) VALUES ('고려제강', '002240');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 미국달러SOFR금리액티브(합성)', '455030');
INSERT INTO korean_stocks (name, code) VALUES ('SBS', '034120');
-- INSERT INTO korean_stocks (name, code) VALUES ('PLUS 고배당주', '161510');
INSERT INTO korean_stocks (name, code) VALUES ('쿠쿠홈시스', '284740');
INSERT INTO korean_stocks (name, code) VALUES ('SK이터닉스', '475150');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER 2차전지소재Fn', '462010');
-- INSERT INTO korean_stocks (name, code) VALUES ('1Q 머니마켓액티브', '479080');
-- INSERT INTO korean_stocks (name, code) VALUES ('해성디에스', '195870');
INSERT INTO korean_stocks (name, code) VALUES ('SPC삼립', '005610');
-- INSERT INTO korean_stocks (name, code) VALUES ('키움 CD금리투자 ETN', '760009');
-- INSERT INTO korean_stocks (name, code) VALUES ('한일홀딩스', '003300');
INSERT INTO korean_stocks (name, code) VALUES ('풀무원', '017810');
INSERT INTO korean_stocks (name, code) VALUES ('GS피앤엘', '499790');
-- INSERT INTO korean_stocks (name, code) VALUES ('RISE 단기통안채', '196230');
INSERT INTO korean_stocks (name, code) VALUES ('동국제강', '460860');
INSERT INTO korean_stocks (name, code) VALUES ('남양유업', '003920');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 코스피', '226490');
INSERT INTO korean_stocks (name, code) VALUES ('삼성FN리츠', '448730');
INSERT INTO korean_stocks (name, code) VALUES ('흥아해운', '003280');
-- INSERT INTO korean_stocks (name, code) VALUES ('HANARO 200', '293180');
INSERT INTO korean_stocks (name, code) VALUES ('현대퓨처넷', '126560');
INSERT INTO korean_stocks (name, code) VALUES ('한국쉘석유', '002960');
-- INSERT INTO korean_stocks (name, code) VALUES ('NICE', '034310');
-- INSERT INTO korean_stocks (name, code) VALUES ('대신증권우', '003545');
-- INSERT INTO korean_stocks (name, code) VALUES ('코람코라이프인프라리츠', '357120');
INSERT INTO korean_stocks (name, code) VALUES ('아세아시멘트', '183190');
INSERT INTO korean_stocks (name, code) VALUES ('KB스타리츠', '432320');
-- INSERT INTO korean_stocks (name, code) VALUES ('KODEX 선진국MSCI World', '251350');
INSERT INTO korean_stocks (name, code) VALUES ('사조대림', '003960');
INSERT INTO korean_stocks (name, code) VALUES ('영진약품', '003520');
-- INSERT INTO korean_stocks (name, code) VALUES ('ACE 글로벌반도체TOP4 Plus SOLACTIVE', '446770');
INSERT INTO korean_stocks (name, code) VALUES ('풍산홀딩스', '005810');
-- INSERT INTO korean_stocks (name, code) VALUES ('신도리코', '029530');
-- INSERT INTO korean_stocks (name, code) VALUES ('현대차3우B', '005389');
-- INSERT INTO korean_stocks (name, code) VALUES ('KOSEF 국고채10년', '148070');
INSERT INTO korean_stocks (name, code) VALUES ('신세계인터내셔날', '031430');
-- INSERT INTO korean_stocks (name, code) VALUES ('세아홀딩스', '058650');
-- INSERT INTO korean_stocks (name, code) VALUES ('맵스리얼티1', '094800');
-- INSERT INTO korean_stocks (name, code) VALUES ('TIGER 미국나스닥100커버드콜(합성)', '441680');
-- INSERT INTO korean_stocks (name, code) VALUES ('ACE 200', '105190');
-- INSERT INTO korean_stocks (name, code) VALUES ('RISE 미국30년국채엔화노출(합성 H)', '472870');