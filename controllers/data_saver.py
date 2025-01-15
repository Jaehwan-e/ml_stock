import asyncio
import os
import pytz
from datetime import datetime
from utils.db_queries import execute_insert_query, connect_to_database
from controllers.data_fetcher import (
    inquire_price_data,
    inquire_ccnl_data,
    inquire_asking_price_exp_ccn_data,
    inquire_investor_data,
    inquire_member_data,
)
from utils.email_sender import send_email


async def save_price_data(connection, token, stock_codes):
    """
    주식 가격 데이터를 데이터베이스에 저장
    """
    try:
        price_data = await inquire_price_data(token, stock_codes)
        if not price_data:
            return

        query = """
        INSERT INTO price (
            yyyymmdd, min, code, iscd_stat_cls_code, marg_rate, 
            rprs_mrkt_kor_name, new_hgpr_lwpr_cls_code, bstp_kor_isnm, temp_stop_yn, oprc_rang_cont_yn, 
            clpr_rang_cont_yn, crdt_able_yn, grmn_rate_cls_code, elw_pblc_yn, stck_prpr,
            prdy_vrss, prdy_vrss_sign, prdy_ctrt, acml_tr_pbmn, acml_vol, 
            prdy_vrss_vol_rate, stck_oprc, stck_hgpr, stck_lwpr, stck_mxpr, 
            stck_llam, stck_sdpr, wghn_avrg_stck_prc, hts_frgn_ehrt, frgn_ntby_qty, 
            pgtr_ntby_qty, pvt_scnd_dmrs_prc, pvt_frst_dmrs_prc, pvt_pont_val, pvt_frst_dmsp_prc, 
            pvt_scnd_dmsp_prc, dmrs_val, dmsp_val, cpfn, rstc_wdth_prc, 
            stck_fcam, stck_sspr, aspr_unit, hts_deal_qty_unit_val, lstn_stcn, 
            hts_avls, per, pbr, stac_month, vol_tnrt, 
            eps, bps, d250_hgpr, d250_hgpr_date, d250_hgpr_vrss_prpr_rate, 
            d250_lwpr, d250_lwpr_date, d250_lwpr_vrss_prpr_rate, stck_dryy_hgpr, dryy_hgpr_vrss_prpr_rate, 
            dryy_hgpr_date, stck_dryy_lwpr, dryy_lwpr_vrss_prpr_rate, dryy_lwpr_date, w52_hgpr, 
            w52_hgpr_vrss_prpr_ctrt, w52_hgpr_date, w52_lwpr, w52_lwpr_vrss_prpr_ctrt, w52_lwpr_date, 
            whol_loan_rmnd_rate, ssts_yn, stck_shrn_iscd, fcam_cnnm, cpfn_cnnm, 
            apprch_rate, frgn_hldn_qty, vi_cls_code, ovtm_vi_cls_code, last_ssts_cntg_qty, 
            invt_caful_yn, mrkt_warn_cls_code, short_over_yn, sltr_yn
        ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 
                %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 
                %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 
                %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,
                %s, %s, %s, %s)
        """
        values = [
            (
                item.get("yyyymmdd"), item.get("min"), item.get("code"), item.get("iscd_stat_cls_code"),item.get("marg_rate"), 
                item.get("rprs_mrkt_kor_name"), item.get("new_hgpr_lwpr_cls_code"), item.get("bstp_kor_isnm"), item.get("temp_stop_yn"), item.get("oprc_rang_cont_yn"), 
                item.get("clpr_rang_cont_yn"), item.get("crdt_able_yn"), item.get("grmn_rate_cls_code"), item.get("elw_pblc_yn"), item.get("stck_prpr"), 
                item.get("prdy_vrss"), item.get("prdy_vrss_sign"), item.get("prdy_ctrt"), item.get("acml_tr_pbmn"), item.get("acml_vol"), 
                item.get("prdy_vrss_vol_rate"), item.get("stck_oprc"), item.get("stck_hgpr"), item.get("stck_lwpr"), item.get("stck_mxpr"), 
                item.get("stck_llam"), item.get("stck_sdpr"), item.get("wghn_avrg_stck_prc"), item.get("hts_frgn_ehrt"), item.get("frgn_ntby_qty"), 
                item.get("pgtr_ntby_qty"), item.get("pvt_scnd_dmrs_prc"), item.get("pvt_frst_dmrs_prc"), item.get("pvt_pont_val"), item.get("pvt_frst_dmsp_prc"), 
                item.get("pvt_scnd_dmsp_prc"), item.get("dmrs_val"), item.get("dmsp_val"), item.get("cpfn"), item.get("rstc_wdth_prc"), 
                item.get("stck_fcam"), item.get("stck_sspr"), item.get("aspr_unit"), item.get("hts_deal_qty_unit_val"), item.get("lstn_stcn"), 
                item.get("hts_avls"), item.get("per"), item.get("pbr"), item.get("stac_month"), item.get("vol_tnrt"), 
                item.get("eps"), item.get("bps"), item.get("d250_hgpr"), item.get("d250_hgpr_date"), item.get("d250_hgpr_vrss_prpr_rate"), 
                item.get("d250_lwpr"), item.get("d250_lwpr_date"), item.get("d250_lwpr_vrss_prpr_rate"), item.get("stck_dryy_hgpr"), item.get("dryy_hgpr_vrss_prpr_rate"), 
                item.get("dryy_hgpr_date"), item.get("stck_dryy_lwpr"), item.get("dryy_lwpr_vrss_prpr_rate"), item.get("dryy_lwpr_date"), item.get("w52_hgpr"), 
                item.get("w52_hgpr_vrss_prpr_ctrt"), item.get("w52_hgpr_date"), item.get("w52_lwpr"), item.get("w52_lwpr_vrss_prpr_ctrt"), item.get("w52_lwpr_date"), 
                item.get("whol_loan_rmnd_rate"), item.get("ssts_yn"), item.get("stck_shrn_iscd"), item.get("fcam_cnnm"), item.get("cpfn_cnnm"), 
                item.get("apprch_rate"), item.get("frgn_hldn_qty"), item.get("vi_cls_code"), item.get("ovtm_vi_cls_code"), item.get("last_ssts_cntg_qty"), 
                item.get("invt_caful_yn"), item.get("mrkt_warn_cls_code"), item.get("short_over_yn"), item.get("sltr_yn")
            )
            for item in price_data
        ]
        execute_insert_query(connection, query, values)

    except Exception as e:
        message = f"Error in save_price_data: {e}"
        log_message(message)
        send_email("Error in save_price_data()", message)



async def save_ccnl_data(connection, token, stock_codes):
    """
    주식 체결 데이터를 데이터베이스에 저장
    """
    try:
        ccnl_data = await inquire_ccnl_data(token, stock_codes)
        if not ccnl_data:
            return

        query = """
        INSERT INTO ccnl (
            yyyymmdd, min, code, stck_cntg_hour, stck_prpr, prdy_vrss, prdy_vrss_sign, 
            cntg_vol, tday_rltv, prdy_ctrt
        ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """
        values = [
            (
                item.get("yyyymmdd"), item.get("min"), item.get("code"), item.get("stck_cntg_hour"),
                item.get("stck_prpr"), item.get("prdy_vrss"), item.get("prdy_vrss_sign"),
                item.get("cntg_vol"), item.get("tday_rltv"), item.get("prdy_ctrt")
            )
            for item in ccnl_data
        ]
        execute_insert_query(connection, query, values)

    except Exception as e:
        message = f"Error in save_ccnl_data: {e}"
        log_message(message)
        send_email("Error in save_ccnl_data()", message)

async def save_asking_price_exp_ccn_data(connection, token, stock_codes):
    """
    주식 호가 데이터를 데이터베이스에 저장
    """
    try:
        asking_data = await inquire_asking_price_exp_ccn_data(token, stock_codes)
        if not asking_data:
            return
        
        query = """
        INSERT INTO asking_price_exp_ccn (
            yyyymmdd, min, code, aspr_acpt_hour, askp1, askp2, askp3, askp4, askp5, 
            askp6, askp7, askp8, askp9, askp10, bidp1, bidp2, bidp3, bidp4, bidp5, 
            bidp6, bidp7, bidp8, bidp9, bidp10, askp_rsqn1, askp_rsqn2, askp_rsqn3, 
            askp_rsqn4, askp_rsqn5, askp_rsqn6, askp_rsqn7, askp_rsqn8, askp_rsqn9, 
            askp_rsqn10, bidp_rsqn1, bidp_rsqn2, bidp_rsqn3, bidp_rsqn4, bidp_rsqn5, 
            bidp_rsqn6, bidp_rsqn7, bidp_rsqn8, bidp_rsqn9, bidp_rsqn10, 
            total_askp_rsqn, total_bidp_rsqn
        ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 
                %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 
                %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """
        values = [
            (
                item.get("yyyymmdd"), item.get("min"), item.get("code"), item.get("aspr_acpt_hour"),
                item.get("askp1"), item.get("askp2"), item.get("askp3"), item.get("askp4"),
                item.get("askp5"), item.get("askp6"), item.get("askp7"), item.get("askp8"),
                item.get("askp9"), item.get("askp10"), item.get("bidp1"), item.get("bidp2"),
                item.get("bidp3"), item.get("bidp4"), item.get("bidp5"), item.get("bidp6"),
                item.get("bidp7"), item.get("bidp8"), item.get("bidp9"), item.get("bidp10"),
                item.get("askp_rsqn1"), item.get("askp_rsqn2"), item.get("askp_rsqn3"),
                item.get("askp_rsqn4"), item.get("askp_rsqn5"), item.get("askp_rsqn6"),
                item.get("askp_rsqn7"), item.get("askp_rsqn8"), item.get("askp_rsqn9"),
                item.get("askp_rsqn10"), item.get("bidp_rsqn1"), item.get("bidp_rsqn2"),
                item.get("bidp_rsqn3"), item.get("bidp_rsqn4"), item.get("bidp_rsqn5"),
                item.get("bidp_rsqn6"), item.get("bidp_rsqn7"), item.get("bidp_rsqn8"),
                item.get("bidp_rsqn9"), item.get("bidp_rsqn10"), item.get("total_askp_rsqn"),
                item.get("total_bidp_rsqn")
            )
            for item in asking_data
        ]
        execute_insert_query(connection, query, values)
        
    except Exception as e:
        message = f"Error in save_asking_price_exp_ccn_data: {e}"
        log_message(message)
        send_email("Error in save_asking_price_exp_ccn_data()", message)



async def save_investor_data(connection, token, stock_codes):
    """
    투자자 데이터를 데이터베이스에 저장
    """
    try:
        investor_data = await inquire_investor_data(token, stock_codes)
        if not investor_data:
            return
        
        query = """
        INSERT INTO investor (
            yyyymmdd, min, code, stck_bsop_date, stck_clpr, prdy_vrss, prdy_vrss_sign,
            prsn_ntby_qty, frgn_ntby_qty, orgn_ntby_qty, prsn_ntby_tr_pbmn,
            frgn_ntby_tr_pbmn, orgn_ntby_tr_pbmn, prsn_shnu_vol, frgn_shnu_vol,
            orgn_shnu_vol, prsn_shnu_tr_pbmn, frgn_shnu_tr_pbmn, orgn_shnu_tr_pbmn,
            prsn_seln_vol, frgn_seln_vol, orgn_seln_vol, prsn_seln_tr_pbmn,
            frgn_seln_tr_pbmn, orgn_seln_tr_pbmn
        ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,
                %s, %s, %s, %s, %s, %s, %s, %s)
        """
        values = [
            (
                item.get("yyyymmdd"), item.get("min"), item.get("code"), item.get("stck_bsop_date"),
                item.get("stck_clpr"), item.get("prdy_vrss"), item.get("prdy_vrss_sign"),
                item.get("prsn_ntby_qty"), item.get("frgn_ntby_qty"), item.get("orgn_ntby_qty"),
                item.get("prsn_ntby_tr_pbmn"), item.get("frgn_ntby_tr_pbmn"),
                item.get("orgn_ntby_tr_pbmn"), item.get("prsn_shnu_vol"),
                item.get("frgn_shnu_vol"), item.get("orgn_shnu_vol"), item.get("prsn_shnu_tr_pbmn"),
                item.get("frgn_shnu_tr_pbmn"), item.get("orgn_shnu_tr_pbmn"),
                item.get("prsn_seln_vol"), item.get("frgn_seln_vol"),
                item.get("orgn_seln_vol"), item.get("prsn_seln_tr_pbmn"),
                item.get("frgn_seln_tr_pbmn"), item.get("orgn_seln_tr_pbmn")
            )
            for item in investor_data
        ]
        execute_insert_query(connection, query, values)

    except Exception as e:
        message = f"Error in save_investor_data: {e}"
        log_message(message)
        send_email("Error in save_investor_data()", message)


async def save_member_data(connection, token, stock_codes):
    """
    회원사 데이터를 데이터베이스에 저장
    """
    try:    
        member_data = await inquire_member_data(token, stock_codes)
        if not member_data:
            return
        
        query = """
        INSERT INTO member (
            yyyymmdd, min, code, seln_mbcr_no1, seln_mbcr_no2, seln_mbcr_no3, seln_mbcr_no4,
            seln_mbcr_no5, seln_mbcr_name1, seln_mbcr_name2, seln_mbcr_name3, seln_mbcr_name4,
            seln_mbcr_name5, total_seln_qty1, total_seln_qty2, total_seln_qty3, total_seln_qty4,
            total_seln_qty5, seln_mbcr_rlim1, seln_mbcr_rlim2, seln_mbcr_rlim3, seln_mbcr_rlim4,
            seln_mbcr_rlim5, seln_qty_icdc1, seln_qty_icdc2, seln_qty_icdc3, seln_qty_icdc4,
            seln_qty_icdc5, shnu_mbcr_no1, shnu_mbcr_no2, shnu_mbcr_no3, shnu_mbcr_no4,
            shnu_mbcr_no5, shnu_mbcr_name1, shnu_mbcr_name2, shnu_mbcr_name3, shnu_mbcr_name4,
            shnu_mbcr_name5, total_shnu_qty1, total_shnu_qty2, total_shnu_qty3, total_shnu_qty4,
            total_shnu_qty5, shnu_mbcr_rlim1, shnu_mbcr_rlim2, shnu_mbcr_rlim3, shnu_mbcr_rlim4,
            shnu_mbcr_rlim5
        ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,
                %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,
                %s, %s, %s, %s, %s, %s, %s, %s)
        """
        values = [
            (
                item.get("yyyymmdd"), item.get("min"), item.get("code"), item.get("seln_mbcr_no1"),
                item.get("seln_mbcr_no2"), item.get("seln_mbcr_no3"), item.get("seln_mbcr_no4"),
                item.get("seln_mbcr_no5"), item.get("seln_mbcr_name1"), item.get("seln_mbcr_name2"),
                item.get("seln_mbcr_name3"), item.get("seln_mbcr_name4"), item.get("seln_mbcr_name5"),
                item.get("total_seln_qty1"), item.get("total_seln_qty2"), item.get("total_seln_qty3"),
                item.get("total_seln_qty4"), item.get("total_seln_qty5"), item.get("seln_mbcr_rlim1"),
                item.get("seln_mbcr_rlim2"), item.get("seln_mbcr_rlim3"), item.get("seln_mbcr_rlim4"),
                item.get("seln_mbcr_rlim5"), item.get("seln_qty_icdc1"), item.get("seln_qty_icdc2"),
                item.get("seln_qty_icdc3"), item.get("seln_qty_icdc4"), item.get("seln_qty_icdc5"),
                item.get("shnu_mbcr_no1"), item.get("shnu_mbcr_no2"), item.get("shnu_mbcr_no3"),
                item.get("shnu_mbcr_no4"), item.get("shnu_mbcr_no5"), item.get("shnu_mbcr_name1"),
                item.get("shnu_mbcr_name2"), item.get("shnu_mbcr_name3"), item.get("shnu_mbcr_name4"),
                item.get("shnu_mbcr_name5"), item.get("total_shnu_qty1"), item.get("total_shnu_qty2"),
                item.get("total_shnu_qty3"), item.get("total_shnu_qty4"), item.get("total_shnu_qty5"),
                item.get("shnu_mbcr_rlim1"), item.get("shnu_mbcr_rlim2"), item.get("shnu_mbcr_rlim3"),
                item.get("shnu_mbcr_rlim4"), item.get("shnu_mbcr_rlim5")
            )
            for item in member_data
        ]
        execute_insert_query(connection, query, values)
        
    except Exception as e:
        message = f"Error in save_member_data: {e}"
        log_message(message)
        send_email("Error in save_member_data()", message)



log_file = "log.txt"

def log_message(message, log_file = "log.txt"):
    """
    로그 메시지를 파일에 기록하고 출력합니다.
    
    Args:
        message (str): 기록할 메시지
        log_file (str): 로그를 저장할 파일 경로
    """
    seoul_tz = pytz.timezone("Asia/Seoul")  # 서울 타임존
    timestamp = datetime.now(seoul_tz).strftime("%Y-%m-%d %H:%M:%S")  # 현재 시간 (서울)
    full_message = f"[{timestamp}] {message}\n"
    
    print(full_message)  # 콘솔에도 출력
    with open(log_file, "a") as log:
        log.write(full_message)

# 로그 파일이 없으면 생성
if not os.path.exists(log_file):
    log_message("Log file created.")


async def save_all_data(token, stock_codes):
    """
    모든 데이터를 1초에 n개씩 처리하고 데이터베이스에 저장
    """
    connection = connect_to_database()
    if connection is None:
        print("데이터베이스 연결 실패")
        send_email("Error in save_all_data()", "데이터베이스 연결 실패")
        return
        
    try:
        # n개씩 끊어서 처리
        delay = 1
        max = 3
        for i in range(0, len(stock_codes), max):
            batch = stock_codes[i:i + max]  # n개씩 나누기

            try:
                # 각 데이터를 배치 처리
                await save_price_data(connection, token, batch)
                await save_ccnl_data(connection, token, batch)
                await save_asking_price_exp_ccn_data(connection, token, batch)
                await save_investor_data(connection, token, batch)
                await save_member_data(connection, token, batch)


            except Exception as e:
                # 예외 발생 시 로그를 파일에 기록
                log_message(f"Error processing batch {batch}: {e}")
                raise e  # 예외를 다시 발생시켜 외부에서 처리하도록 함

            # 호출 제한 준수를 위해 1초 대기
            if i + max < len(stock_codes):
                await asyncio.sleep(delay)
        
        log_message("All data saved successfully.")

    except Exception as e:
        # 전체적으로 예외 처리
        log_message(f"Unexpected error in save_all_data: {e}")
        send_email("Error in save_all_data()", f"Unexpected error: {e}")

    finally:
        connection.close()
