<?xml version="1.0" encoding="utf-8"?>
<!--Приказ ФТС России от 08.02.2019 г. № 211
Приложение 1 (OrderType=0, DocumentType=0) - Поручение таможенного органа на бесспорное взыскание 
Приложение 2 (OrderType=2, DocumentType=0) - Поручение таможенного органа на перевод электронных денежных средств
Приложение 3 (OrderType=1, DocumentType=0) - Поручение таможенного органа на продажу иностранной валюты
Приложение 4 (OrderType=0, DocumentType=2) - Решение таможенного органа об отзыве поручения таможенного органа на бесспорное взыскание
Приложение 5 (OrderType=2, DocumentType=2) - Решение таможенного органа об отзыве инкассового поручения (поручения таможенного органа на перевод электронных денежных средств)
Письмо ФТС России от 12.09.2018 № 05-62/57789, Федеральный закон от 03.08.2018 г. № 289-ФЗ ст.75 п.13 (без НПА для формы):
(OrderType=3, DocumentType=0) - Поручение на перечисление денежных средств с депозитного счета на расчетный (текущий) счет плательщика (лица, несущего солидарную обязанность)
Письмо ГУИТ ФТС России от 10.10.2018 № 09-126/64177, Федеральный закон от 03.08.2018 г. № 289-ФЗ ст.75 п.13 (без НПА для формы):
(OrderType=4, DocumentType=0) - Поручение на продажу драгоценных металлов и перечисление денежных средств от продажи драгоценных металлов на расчетный (текущий) счет плательщика (лица, несущего солидарную обязанность))
С 01.01.2025 вступают в силу положения Федерального закона от 24.07.2023 № 340-ФЗ «О внесении изменений в отдельные законодательные акты Российской Федерации» (далее – Федеральный закон № 340) в части взыскания таможенных платежей, пеней за счет цифровых рублей, учитываемых на счете цифрового рубля плательщика (лица, несущего солидарную обязанность)»
OrderType=5, DocumentType=0 - Поручение таможенного органа на списание цифровых рублей
OrderType=5, DocumentType=2 - Решение об отзыве поручения таможенного органа на списание цифровых рублей
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:diac="urn:customs.ru:Information:CommercialFinanceDocuments:DebtIncashANDCommission:5.24.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="diac:DebtIncashANDCommission">
		<html>
			<head>
				<title>
					<xsl:text>Решение таможенного органа об отзыве инкассового поручения</xsl:text>
				</title>
				<style>
									body {
									background: #cccccc;
									font-family: Arial;
									}

									div
									{
									white-space: nowrap;
									}

									div.page{
									width: 180mm;
									margin: 10px;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm 30mm 10mm 20mm;
									background: #ffffff;
									border: solid 1pt #000000;
									}

									.marg-top
									{
									margin-top:5mm;
									}

									table
									{
									width: 100%;
									border: 0;
									empty-cells: show;
									border-collapse: collapse;
									margin-top: 1px;
									}

									table.border tr td
									{
									border: 1px solid black;
									}

									.graphMain {
									font-family: Arial;
									font-size: 11pt;
									}

									.value
									{
									font-family: Arial;
									font-size: 11pt;
									font-style: Italic;
									}

									.value_line
									{
									font-family: Arial;
									font-size: 11pt;
									font-style: Italic;
									border-bottom: 1px solid black;
									}	

									div.title, tr.title td { font-weight:bold; }
									.bordered { border-collapse: collapse; }
									td.bordered
									{
									border: solid 1px windowtext;
									}

									td.graphMain
									{
									vertical-align:top;
									}
									td.value.graphMain
									{
									vertical-align:bottom;
									}

									td {
									padding: 4px 5px 4px 2px;
									}

									.graphHeader
									{
									font-family: Arial;
									font-size: 11pt;
									font-weight:bold;
									}

									.graphLittle {
									font-family: Arial;
									font-size: 7pt;
									}

									.underwrite{
									font-family: Arial;
									font-size: 7pt;
									}
									
									.delim {
										height: 7pt;
									}

									.underlined {
									border-bottom: 1px solid black;
									}

									.delim_3 {
										height: 3pt;
									}
 </style>
			</head>
			<body>
				<div class="page">
					<xsl:choose>
						<xsl:when test="(diac:DocumentInfo/diac:DocumentType = 0 and diac:DocumentInfo/diac:OrderType = 0) or (diac:DocumentInfo/diac:DocumentType = 0 and diac:DocumentInfo/diac:OrderType = 2)" ><!-- or (diac:DocumentInfo/diac:DocumentType = 0 and diac:DocumentInfo/diac:OrderType = 3)  or (diac:DocumentInfo/diac:DocumentType = 0 and diac:DocumentInfo/diac:OrderType = 4) -->
							<table width="100%" class="graphMain">
								<tbody>
									<tr>
										<td width="2%"/>
										<td width="17%"/>
										<td width="9%"/>
										<td width="3%"/>
										<td width="4%"/>
										<td width="4%"/>
										<td width="5%"/>
										<td width="5%"/>
										<td width="6%"/>
										<td width="4%"/>
										<td width="6%"/>
										<td width="12%"/>
										<td width="7%"/>
										<td width="6%"/>
										<td width="5%"/>
										<td width="5%"/>
									</tr>
									<tr>
										<td colspan="16">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="underlined" colspan="6"/>
										<td/>
										<td class="underlined" colspan="6"/>
										<td colspan="3"/>
									</tr>
									<tr>
										<td valign="middle" colspan="6">
											<xsl:text>Поступило в банк плательщика</xsl:text>
											<br/>
											&#160;
										</td>
										<td/>
										<td valign="middle" colspan="6">
											<xsl:text>Списано со счета плательщика</xsl:text>
											<br/>
											&#160;
										</td>
										<td colspan="3"/>
									</tr>
									<tr>
										<td colspan="16">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" colspan="16">
											<xsl:choose>
												<xsl:when test="diac:DocumentInfo/diac:DocumentType = 0 and diac:DocumentInfo/diac:OrderType = 0">
													<xsl:text>Поручение таможенного органа на бесспорное взыскание</xsl:text>
													<br/>
													<br/>
													&#160;
												</xsl:when>
												<xsl:when test="diac:DocumentInfo/diac:DocumentType = 0 and diac:DocumentInfo/diac:OrderType = 2">
													<xsl:text>Поручение таможенного органа на перевод электронных денежных средств</xsl:text>
													<br/>
													<br/>
													&#160;
												</xsl:when>
												<!--xsl:when test="diac:DocumentInfo/diac:DocumentType = 0 and diac:DocumentInfo/diac:OrderType = 3">
													<xsl:text>Поручение таможенного органа на перечисление денежных средств с депозитного счета на расчетный (текущий) счет плательщика (лица, несущего солидарную обязанность)</xsl:text>
													<br/>
													<br/>
													&#160;
												</xsl:when>
												<xsl:when test="diac:DocumentInfo/diac:DocumentType = 0 and diac:DocumentInfo/diac:OrderType = 4">
													<xsl:text>Поручение на продажу драгоценных металлов и перечисление денежных средств от продажи драгоценных металлов на расчетный (текущий) счет плательщика</xsl:text>
													<br/>
													<br/>
													&#160;
												</xsl:when-->
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>№ </xsl:text>
										</td>
										<td align="center" class="value underlined">
											<xsl:value-of select="diac:DocumentInfo/diac:RequisitesDocument/cat_ru:PrDocumentNumber"/>
										</td>
										<td/>
										<td align="center" colspan="5" class="value underlined">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="diac:DocumentInfo/diac:RequisitesDocument/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</td>
										<td colspan="3"/>
										<td class="value underlined" colspan="2" align="center">
											<xsl:for-each select="diac:DocumentInfo/diac:TransFerfunds/diac:TransFerReqs/diac:TypePayment">
												<xsl:choose>
													<xsl:when test=".='0'"></xsl:when>
													<xsl:when test=".='4'">срочно</xsl:when>
													<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
												</xsl:choose>
											</xsl:for-each>
										</td>
										<td/>
										<td valign="top" align="left" rowspan="2" colspan="2" class="bordered">
											<!--sup>
												<xsl:text>1</xsl:text>
											</sup-->
											<span class="value">
												<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:TransFerReqs/diac:Order101"/>
											</span>
										</td>
									</tr>
									<tr>
										<td colspan="3"/>
										<td align="center" colspan="5">
											<xsl:text>Дата</xsl:text>
										</td>
										<td colspan="3"/>
										<td align="center" colspan="2">
											<xsl:text>Вид платежа</xsl:text>
										</td>
										<td/>
									</tr>
									<tr>
										<td colspan="16">
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td style="border-right: solid 1px black;" class="underlined" colspan="2">
											<xsl:text>Сумма</xsl:text>
											<br>
												<xsl:text>прописью</xsl:text>
											</br>
										</td>
										<td colspan="14" class="value underlined">
											<br/>
											<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:Amount/diac:PaymentAmountText"/>
										</td>
									</tr>
									<tr>
										<td colspan="4" valign="bottom" class="underlined" style="border-right: solid 1px black;">
											<xsl:text>ИНН </xsl:text>
											<span class="value">
												<xsl:value-of select="diac:DocumentInfo/diac:PayerInfo/diac:INN"/>
											</span>
										</td>
										<td colspan="5" class="underlined">
											<xsl:text>КПП </xsl:text>
											<span class="value">
												<xsl:value-of select="diac:DocumentInfo/diac:PayerInfo/diac:KPP"/>
											</span>
										</td>
										<td rowspan="2" colspan="2" valign="top" class="bordered">
											<xsl:text>Сумма</xsl:text>
										</td>
										<td rowspan="2" colspan="5" class="value underlined" valign="top">
											<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:Amount/diac:PaymentAmount"/>
										</td>
									</tr>
									<tr>
										<td colspan="9" class="value">
											<xsl:value-of select="diac:DocumentInfo/diac:PayerInfo/diac:OrganizationName"/>
											<xsl:if test="diac:DocumentInfo/diac:PayerInfo/diac:ShortName">
												<xsl:if test="string-length(diac:DocumentInfo/diac:PayerInfo/diac:OrganizationName) &gt; 0"> (</xsl:if>
												<xsl:value-of select="diac:DocumentInfo/diac:PayerInfo/diac:ShortName"/>
												<xsl:if test="string-length(diac:DocumentInfo/diac:PayerInfo/diac:OrganizationName) &gt; 0">)</xsl:if>
											</xsl:if>
											&#160;
										</td>
									</tr>
									<tr>
										<td class="underlined" colspan="9">
											&#160;
											<br/>
											<xsl:text>Плательщик</xsl:text>
										</td>
										<td class="bordered" colspan="2">
											<xsl:choose>
												<xsl:when test="diac:DocumentInfo/diac:DocumentType = 0 and diac:DocumentInfo/diac:OrderType = 0">
													<xsl:text>Сч. N</xsl:text>
												</xsl:when>
												<xsl:when test="diac:DocumentInfo/diac:DocumentType = 0 and diac:DocumentInfo/diac:OrderType = 2">
													<xsl:text>Ид.</xsl:text>
													<br>
														<xsl:text>КЭСП</xsl:text>
													</br>
												</xsl:when>
												<xsl:when test="diac:DocumentInfo/diac:DocumentType = 0 and diac:DocumentInfo/diac:OrderType = 3">
													<xsl:text>Сч. N</xsl:text>
												</xsl:when>
												<xsl:when test="diac:DocumentInfo/diac:DocumentType = 0 and diac:DocumentInfo/diac:OrderType = 4">
													<xsl:text>Сч. N</xsl:text>
												</xsl:when>
											</xsl:choose>
										</td>
										<td colspan="5" class="value">
											&#160;
											<xsl:choose>
												<xsl:when test="diac:DocumentInfo/diac:DocumentType = 0 and diac:DocumentInfo/diac:OrderType = 0">
													<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:AccountPayer"/>
												</xsl:when>
												<xsl:when test="diac:DocumentInfo/diac:DocumentType = 0 and diac:DocumentInfo/diac:OrderType = 2">
													<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:CorporatePayer"/>
												</xsl:when>
												<xsl:when test="diac:DocumentInfo/diac:DocumentType = 0 and diac:DocumentInfo/diac:OrderType = 3">
													<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:AccountPayer"/>
												</xsl:when>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td class="value" colspan="9">
											<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:OrganizationName"/>
											<xsl:if test="diac:DocumentInfo/diac:PayerBankInfo/diac:ShortName">
												<xsl:if test="string-length(diac:DocumentInfo/diac:PayerBankInfo/diac:OrganizationName) &gt; 0"> (</xsl:if>
												<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:ShortName"/>
												<xsl:if test="string-length(diac:DocumentInfo/diac:PayerBankInfo/diac:OrganizationName) &gt; 0">)</xsl:if>
											</xsl:if>
											&#160;
										</td>
										<td class="bordered" colspan="2">
											<xsl:text>БИК</xsl:text>
										</td>
										<td colspan="5" class="value">
											&#160;
											<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:BICBankPayer"/>
										</td>
									</tr>
									<tr>
										<td class="underlined" colspan="9">
											&#160;
											<br/>
											<xsl:text>Банк плательщика</xsl:text>
										</td>
										<td class="bordered" colspan="2">
											<xsl:text>Сч. N</xsl:text>
										</td>
										<td colspan="5" class="value underlined">
											&#160;
											<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:TransFerReqs/diac:sKorAccountBankPayer"/>
										</td>
									</tr>
									<tr>
										<td class="value" colspan="9">
											<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:TransFerReqs/diac:BankInfoRecipient"/>
											&#160;
										</td>
										<td class="bordered" colspan="2">
											<xsl:text>БИК</xsl:text>
										</td>
										<td colspan="5" class="value">
											&#160;
											<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:TransFerReqs/diac:BICBankRecipient"/>
										</td>
									</tr>
									<tr>
										<td class="underlined" colspan="9">
											&#160;
											<br/>
											<xsl:text>Банк получателя</xsl:text>
										</td>
										<td class="bordered" colspan="2">
											<xsl:text>Сч. N</xsl:text>
										</td>
										<td colspan="5" class="value underlined">
											&#160;
											<br/>
											<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:TransFerReqs/diac:sKorAccountBankRecipient"/>
										</td>
									</tr>
									<tr>
										<td colspan="4" class="underlined" style="border-right: solid 1px black;">
											<xsl:text>ИНН </xsl:text>
											<span class="value">
												<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:TransFerReqs/diac:RecipientINN"/>
											</span>
										</td>
										<td colspan="5" class="underlined">
											<xsl:text>КПП </xsl:text>
											<span class="value">
												<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:TransFerReqs/diac:RecipientKPP"/>
											</span>
										</td>
										<td valign="top" rowspan="3" colspan="2" class="bordered">
											<xsl:text>Сч. N</xsl:text>
										</td>
										<td valign="top" rowspan="3" colspan="5" class="value underlined">
											<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:TransFerReqs/diac:AccountRecipient"/>
										</td>
									</tr>
									<tr>
										<td colspan="9" class="value">
											<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:TransFerReqs/diac:RecipientName"/>
											&#160;
										</td>
									</tr>
									<tr>
										<td rowspan="4" valign="top" colspan="9"/>
									</tr>
									<tr>
										<td colspan="2" class="bordered">
											<xsl:text>Вид оп.</xsl:text>
										</td>
										<td class="value">
											<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:TransFerReqs/diac:TypeOfOperation"/>
										</td>
										<td rowspan="2" valign="top" colspan="2" class="bordered">
											<xsl:text>Очер.</xsl:text>
											<br>
												<xsl:text>плат.</xsl:text>
											</br>
										</td>
										<td rowspan="2" colspan="2" valign="top" class="value underlined">
											<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:TransFerReqs/diac:PriorityPayment"/>
										</td>
									</tr>
									<tr>
										<td class="bordered" rowspan="2" colspan="2">
											<xsl:text>Наз.</xsl:text>
											<br/>
											<xsl:text>пл.</xsl:text>
										</td>
										<td rowspan="2">
											<!--xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:TransFerReqs/diac:PurposePayment"/-->
										</td>
									</tr>
									<tr>
										<td class="bordered" rowspan="2" colspan="2">
											<xsl:text>Рез. поле</xsl:text>
											<br/>
											&#160;
										</td>
										<td rowspan="2" colspan="2"/>
									</tr>
									<tr>
										<td colspan="9" valign="bottom">
											<xsl:text>Получатель</xsl:text>
										</td>
										<td colspan="2" class="bordered">
											<xsl:text>Код</xsl:text>
											<br/>
											&#160;
										</td>
										<td class="value">
											<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:TransFerReqs/diac:PaymentCode"/>
										</td>
									</tr>
									<tr>
										<td class="value bordered" colspan="3" valign="top">
											<!--sup>2</sup-->
											<!--xsl:variable select="diac:DocumentInfo/diac:DocumentPaymentReqs/diac:TransFerfunds/diac:Amount/diac:PaymentKBK" name="KBK"/>
											<xsl:for-each select="diac:DocumentInfo/diac:DocumentPaymentReqs/diac:TransFerfunds/diac:Amount[not(./diac:PaymentKBK = preceding-sibling::diac:Amount/diac:PaymentKBK)]">
												<br/>
												<xsl:value-of select="diac:PaymentKBK"/>
											</xsl:for-each-->
											<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:Amount/diac:PaymentKBK"/>
										</td>
										<td class="value bordered" colspan="2" valign="top">
											<!--sup>3</sup>
											<br/-->
											<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:TransFerReqs/diac:Order105"/>
										</td>
										<td class="value bordered" colspan="3" valign="top">
											<!--sup>4</sup>
											<br/-->
											<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:TransFerReqs/diac:Order106"/>
										</td>
										<td class="value bordered" colspan="3" valign="top">
											<!--sup>5</sup>
											<br/-->
											<xsl:value-of select="diac:DocumentInfo/diac:CustomsOffice/cat_ru:Code"/>
										</td>
										<td class="value bordered" colspan="1" valign="top">
											<!--sup>6</sup>
											<br/-->
											<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:TransFerReqs/diac:Order108"/>
										</td>
										<td class="value bordered" colspan="2" valign="top">
											<!--sup>7</sup>
											<br/-->
											&#160;
											<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:TransFerReqs/diac:Order109"/>
										</td>
										<td class="value bordered" colspan="3" valign="top">
											<!--sup>8</sup>
											<br/-->
											&#160;
											<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:TransFerReqs/diac:Order110"/>
										</td>
									</tr>
									<tr>
										<td colspan="16">
											<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:TransFerReqs/diac:PurposePayment"/>
										</td>
									</tr>
									<tr>
										<td colspan="16">
											<xsl:text>Назначение платежа</xsl:text>
										</td>
									</tr>
									<tr>
										<td rowspan="2" colspan="5">
											<xsl:text/>
										</td>
										<td colspan="6" valign="top" align="center">
											<xsl:text>Подписи</xsl:text>
											<br/>
											<br/>
										</td>
										<td rowspan="3" colspan="1"/>
										<td rowspan="3" colspan="5" align="center" valign="top">
											<xsl:text>Отметки банка получателя</xsl:text>
										</td>
									</tr>
									<tr>
										<td colspan="6" class="value underlined">
											&#160;
										</td>
									</tr>
									<tr>
										<td colspan="5" align="center">
											<xsl:text>М.П.</xsl:text>
										</td>
										<td colspan="6" class="value underlined">
											&#160;
										</td>
									</tr>
									<tr>
										<td colspan="16">
											<br/>
										</td>
									</tr>
									<tr>
										<td colspan="16">
											<table class="graphMain" width="100%">
												<tbody>
													<tr>
														<td class="underlined" width="8%"/>
														<td class="underlined" width="10%"/>
														<td class="underlined" width="14%"/>
														<td class="underlined" width="13%"/>
														<td class="underlined" width="14%"/>
														<td class="underlined" width="15%"/>
														<td width="26%"/>
													</tr>
													<tr>
														<td align="center" style="border-right: solid 1px black;" class="underlined">
															<xsl:text>N ч. плат.</xsl:text>
														</td>
														<td align="center" style="border-right: solid 1px black;" class="underlined">
															<xsl:text>N плат. ордера</xsl:text>
														</td>
														<td align="center" style="border-right: solid 1px black;" class="underlined">
															<xsl:text>Дата плат. ордера</xsl:text>
														</td>
														<td align="center" style="border-right: solid 1px black;" class="underlined">
															<xsl:text>Сумма частичного платежа</xsl:text>
														</td>
														<td align="center" style="border-right: solid 1px black;" class="underlined">
															<xsl:text>Сумма остатка платежа</xsl:text>
														</td>
														<td align="center" class="underlined">
															<xsl:text>Подпись</xsl:text>
														</td>
														<td align="center">
															<xsl:text>Дата помещения в картотеку</xsl:text>
															<br/><br/>
														</td>
													</tr>
													<tr>
														<td style="border-right: solid 1px black;"/>
														<td style="border-right: solid 1px black;"/>
														<td style="border-right: solid 1px black;"/>
														<td style="border-right: solid 1px black;"/>
														<td style="border-left: solid 1px black;"/>
														<td style="border-left: solid 1px black;"/>
														<td align="center">
															<xsl:text>Отметки банка плательщика</xsl:text>
															<br/><br/>
														</td>
													</tr>
													<tr>
														<td colspan="7">
															<br/>
															<br/>
															<br/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:when test="diac:DocumentInfo/diac:DocumentType = 0 and diac:DocumentInfo/diac:OrderType = 1">
							<table width="100%" class="graphMain">
								<tbody>
									<tr>
										<td align="center">
											<font size="4">
												<b>
													<xsl:text>Поручение таможенного органа на продажу иностранной валюты</xsl:text>
												</b>
											</font>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="delim_3">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="diac:DocumentInfo/diac:RequisitesDocument/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> N </xsl:text>
											<span class="value_line">
												<xsl:text>&#160;</xsl:text>
												<xsl:value-of select="diac:DocumentInfo/diac:RequisitesDocument/cat_ru:PrDocumentNumber"/>
												<xsl:text>&#160;</xsl:text>
											</span>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="value_line">
											<xsl:apply-templates select="diac:DocumentInfo/diac:CustomsOffice"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(наименование таможенного органа)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>поручает банку</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value_line">
											<xsl:apply-templates select="diac:DocumentInfo/diac:PayerBankInfo" mode="organization"/>
											<xsl:if test="diac:DocumentInfo/diac:PayerBankInfo/diac:BICBankPayer">
												<xsl:text>, БИК: </xsl:text>
												<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:BICBankPayer"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(полное наименование, банковский идентификационный код)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>осуществить продажу иностранной валюты, находящейся на счете </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value_line">
											<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:AccountTypePayer"/>
											<xsl:if test="diac:DocumentInfo/diac:PayerBankInfo/diac:AccountPayer">
												<xsl:if test="diac:DocumentInfo/diac:PayerBankInfo/diac:AccountTypePayer">
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:AccountPayer"/>
											</xsl:if>
											&#160;
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(указывается вид и номер счета плательщика)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>открытом</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td class="value_line" width="99%">
															<xsl:apply-templates select="diac:DocumentInfo/diac:PayerInfo" mode="organization2"/>
														</td>
														<td width="1%" valign="bottom">
															<xsl:text>, </xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(полное фирменное наименование организации или фамилия, имя, отчество (при наличии) индивидуального предпринимателя, идентификационный номер налогоплательщика)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>в соответствии с поручением таможенного органа на бесспорное взыскание (поручением таможенного органа на перевод электронных денежных средств на счет плательщика (лица, несущего солидарную обязанность) от </xsl:text>
											<xsl:choose>
												<xsl:when test="diac:DocumentInfo/diac:BaseDocument/diac:DecisInconGR/diac:PrDocumentDate">
													<span class="value_line">
														<xsl:call-template name="russian_date">
															<xsl:with-param select="diac:DocumentInfo/diac:BaseDocument/diac:DecisInconGR/diac:PrDocumentDate" name="dateIn"/>
														</xsl:call-template>
													</span>
												</xsl:when>
												<xsl:when test="diac:DocumentInfo/diac:BaseDocument/diac:Indocrn/cat_ru:PrDocumentDate">
													<span class="value_line">
														<xsl:call-template name="russian_date">
															<xsl:with-param select="diac:DocumentInfo/diac:BaseDocument/diac:Indocrn/cat_ru:PrDocumentDate" name="dateIn"/>
														</xsl:call-template>
													</span>
												</xsl:when>
												<xsl:otherwise>______</xsl:otherwise>
											</xsl:choose>
											<xsl:text> N </xsl:text>
											<xsl:choose>
												<xsl:when test="diac:DocumentInfo/diac:BaseDocument/diac:DecisInconGR/diac:PrDocumentNumber">
													<span class="value_line">
														<xsl:text>&#160;</xsl:text>
														<xsl:value-of select="diac:DocumentInfo/diac:BaseDocument/diac:DecisInconGR/diac:PrDocumentNumber"/>
														<xsl:text>&#160;</xsl:text>
													</span>
												</xsl:when>
												<xsl:when test="diac:DocumentInfo/diac:BaseDocument/diac:Indocrn/cat_ru:PrDocumentNumber">
													<span class="value_line">
														<xsl:text>&#160;</xsl:text>
														<xsl:value-of select="diac:DocumentInfo/diac:BaseDocument/diac:Indocrn/cat_ru:PrDocumentNumber"/>
														<xsl:text>&#160;</xsl:text>
													</span>
												</xsl:when>
												<xsl:otherwise>___</xsl:otherwise>
											</xsl:choose>
											<xsl:text> , а также зачислить эквивалентную сумму в рублях на счет, указанный в таком поручении.</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates select="diac:DocumentInfo/diac:DocumentSignature/diac:CustChiefSignature" mode="ChiefSignature"/>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates select="diac:DocumentInfo/diac:DocumentSignature/diac:ExecutiveSignature" mode="ExecutiveSignature"/>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:when test="diac:DocumentInfo/diac:DocumentType = 0 and diac:DocumentInfo/diac:OrderType = 3">
							<table width="100%" class="graphMain">
								<tbody>
									<tr>
										<td align="center">
											<font size="4">
												<b>
													Поручение на перечисление денежных средств с депозитного счета на расчетный (текущий) счет плательщика (лица, несущего солидарную обязанность)
												</b>
											</font>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="delim_3">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="diac:DocumentInfo/diac:RequisitesDocument/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> N </xsl:text>
											<span class="value_line">
												<xsl:text>&#160;</xsl:text>
												<xsl:value-of select="diac:DocumentInfo/diac:RequisitesDocument/cat_ru:PrDocumentNumber"/>
												<xsl:text>&#160;</xsl:text>
											</span>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="value_line">
											<xsl:apply-templates select="diac:DocumentInfo/diac:CustomsOffice"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(наименование таможенного органа)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>поручает банку</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value_line">
											<xsl:apply-templates select="diac:DocumentInfo/diac:PayerBankInfo" mode="organization"/>
											<xsl:if test="diac:DocumentInfo/diac:PayerBankInfo/diac:BICBankPayer">
												<xsl:text>, БИК: </xsl:text>
												<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:BICBankPayer"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(полное наименование, банковский идентификационный код)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>осуществить перечисление денежных средств </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value_line">
											<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:AccountTypePayer"/>
											<xsl:if test="diac:DocumentInfo/diac:PayerBankInfo/diac:AccountPayer">
												<xsl:if test="diac:DocumentInfo/diac:PayerBankInfo/diac:AccountTypePayer">
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:AccountPayer"/>
											</xsl:if>
											&#160;
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(указывается вид и номер счета плательщика)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>открытом</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td class="value_line" width="99%">
															<xsl:apply-templates select="diac:DocumentInfo/diac:PayerInfo" mode="organization2"/>
														</td>
														<td width="1%" valign="bottom">
															<xsl:text>, </xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(полное фирменное наименование организации или фамилия, имя, отчество (при наличии) индивидуального предпринимателя, идентификационный номер налогоплательщика)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>с депозитного счета </xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td class="value_line" width="99%">
															<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:AccountPayer"/>
															<xsl:if test="diac:DocumentInfo/diac:PayerBankInfo/diac:CodeAccountCurrencyPayer">
																<xsl:text>, </xsl:text>
																<xsl:apply-templates select="diac:DocumentInfo/diac:PayerBankInfo/diac:CodeAccountCurrencyPayer" mode="val_name"/>
															</xsl:if>
															<xsl:if test="diac:DocumentInfo/diac:PayerBankInfo/diac:AccountTypePayer">
																<xsl:text>, </xsl:text>
																<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:AccountTypePayer"/>
															</xsl:if>
														</td>
														<td width="1%" valign="bottom">
															<!--xsl:text>, </xsl:text-->
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(номер счета, валюта счета, вид счета, с которого должен быть осуществлен перевод)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>на расчетный счет </xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td class="value_line" width="99%">
															<xsl:if test="diac:DocumentInfo/diac:BaseDocument/diac:DecisInconGR/diac:AccountPayer">
																<xsl:value-of select="diac:DocumentInfo/diac:BaseDocument/diac:DecisInconGR/diac:AccountPayer"/>
																<xsl:text>, RUB</xsl:text>
																<xsl:text>, РАСЧЕТНЫЙ</xsl:text>
															</xsl:if>
															<!--xsl:text>, </xsl:text>
															<xsl:apply-templates select="diac:DocumentInfo/diac:TransFerfunds/diac:TransFerReqs/diac:CodeAccountCurrency" mode="val_name"/>
															<xsl:if test="diac:DocumentInfo/diac:TransFerfunds/diac:TransFerReqs/diac:AccountRecipient">
																<xsl:text>, РАСЧЕТНЫЙ</xsl:text>
															</xsl:if-->
														</td>
														<td width="1%" valign="bottom">
															<!--xsl:text>, </xsl:text-->
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(номер счета, валюта счета, вид счета, на который должен быть осуществлен перевод)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<!--tr>
										<td style="text-align: justify">
											<xsl:text>в размере </xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td class="value_line" width="99%" align="center">
															<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:Amount/diac:PaymentAmount"/>
														</td>
														<td width="1%" valign="bottom">
															<xsl:text>, </xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(сумма)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr-->
									<tr>
										<td style="text-align: justify">
											<xsl:text>в соответствии с поручением  таможенного органа на бесспорное взыскания</xsl:text>
											<xsl:text> № </xsl:text>
											<xsl:choose>
												<xsl:when test="diac:DocumentInfo/diac:BaseDocument/diac:DecisInconGR/diac:PrDocumentNumber">
													<span class="value_line">
														<xsl:text>&#160;</xsl:text>
														<xsl:value-of select="diac:DocumentInfo/diac:BaseDocument/diac:DecisInconGR/diac:PrDocumentNumber"/>
														<xsl:text>&#160;</xsl:text>
													</span>
												</xsl:when>
												<xsl:when test="diac:DocumentInfo/diac:BaseDocument/diac:Indocrn/cat_ru:PrDocumentNumber">
													<span class="value_line">
														<xsl:text>&#160;</xsl:text>
														<xsl:value-of select="diac:DocumentInfo/diac:BaseDocument/diac:Indocrn/cat_ru:PrDocumentNumber"/>
														<xsl:text>&#160;</xsl:text>
													</span>
												</xsl:when>
												<xsl:otherwise>___</xsl:otherwise>
											</xsl:choose>
											<xsl:text> от </xsl:text>
											<xsl:choose>
												<xsl:when test="diac:DocumentInfo/diac:BaseDocument/diac:DecisInconGR/diac:PrDocumentDate">
													<span class="value_line">
														<xsl:call-template name="text_date">
															<xsl:with-param select="diac:DocumentInfo/diac:BaseDocument/diac:DecisInconGR/diac:PrDocumentDate" name="date"/>
														</xsl:call-template>
													</span>
												</xsl:when>
												<xsl:when test="diac:DocumentInfo/diac:BaseDocument/diac:Indocrn/cat_ru:PrDocumentDate">
													<span class="value_line">
														<xsl:call-template name="text_date">
															<xsl:with-param select="diac:DocumentInfo/diac:BaseDocument/diac:Indocrn/cat_ru:PrDocumentDate" name="date"/>
														</xsl:call-template>
													</span>
												</xsl:when>
												<xsl:otherwise>______</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates select="diac:DocumentInfo/diac:DocumentSignature/diac:CustChiefSignature" mode="ChiefSignature"/>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value_line" align="center">
											Нет
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">специальное звание начальника таможенного органа (или лица, им уполномоченного)</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates select="diac:DocumentInfo/diac:DocumentSignature/diac:ExecutiveSignature" mode="ExecutiveSignature"/>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:when test="diac:DocumentInfo/diac:DocumentType = 0 and diac:DocumentInfo/diac:OrderType = 4">
							<table width="100%" class="graphMain">
								<tbody>
									<tr>
										<td align="center">
											<font size="4">
												<b>
													Поручение на продажу драгоценных металлов со счета (вклада)<br/>в драгоценных металлах налогоплательщика<br/>(плательщика сбора, плательщика страховых взносов,<br/>налогового агента) и перечисление денежных средств<br/>от продажи драгоценных металлов
												</b>
											</font>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="delim_3">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="diac:DocumentInfo/diac:RequisitesDocument/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> N </xsl:text>
											<span class="value_line">
												<xsl:text>&#160;</xsl:text>
												<xsl:value-of select="diac:DocumentInfo/diac:RequisitesDocument/cat_ru:PrDocumentNumber"/>
												<xsl:text>&#160;</xsl:text>
											</span>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="value_line">
											<xsl:apply-templates select="diac:DocumentInfo/diac:CustomsOffice"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(наименование таможенного органа)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>поручает банку</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value_line">
											<xsl:apply-templates select="diac:DocumentInfo/diac:PayerBankInfo" mode="organization"/>
											<xsl:if test="diac:DocumentInfo/diac:PayerBankInfo/diac:BICBankPayer">
												<xsl:text>, БИК: </xsl:text>
												<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:BICBankPayer"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(полное наименование, банковский идентификационный код)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>осуществить продажу драгоценных металлов, находящихся на счете </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value_line">
											<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:AccountTypePayer"/>
											<xsl:if test="diac:DocumentInfo/diac:PayerBankInfo/diac:AccountPayer">
												<xsl:if test="diac:DocumentInfo/diac:PayerBankInfo/diac:AccountTypePayer">
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:AccountPayer"/>
											</xsl:if>
											&#160;
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(указывается вид и номер счета плательщика)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>открытом</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td class="value_line" width="99%">
															<xsl:apply-templates select="diac:DocumentInfo/diac:PayerInfo" mode="organization2"/>
														</td>
														<td width="1%" valign="bottom">
															<xsl:text>, </xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(полное фирменное наименование организации или фамилия, имя, отчество (при наличии) индивидуального предпринимателя, идентификационный номер налогоплательщика)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>а также перечислить денежные средства от продажи драгоценных металлов на расчетный счет </xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td class="value_line" width="99%">
															<xsl:if test="diac:DocumentInfo/diac:BaseDocument/diac:DecisInconGR/diac:AccountPayer">
																<xsl:value-of select="diac:DocumentInfo/diac:BaseDocument/diac:DecisInconGR/diac:AccountPayer"/>
																<xsl:text>, РАСЧЕТНЫЙ</xsl:text>
															</xsl:if>
															<!--xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:TransFerReqs/diac:AccountRecipient"/>
															<xsl:if test="diac:DocumentInfo/diac:TransFerfunds/diac:TransFerReqs/diac:AccountRecipient">
																<xsl:text>, РАСЧЕТНЫЙ</xsl:text>
															</xsl:if-->
														</td>
														<td width="1%" valign="bottom">
															<!--xsl:text>, </xsl:text-->
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(указывается вид и номер расчетного счета,  на который должен быть осуществлен перевод)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<!--tr>
										<td style="text-align: justify">
											<xsl:text>в размере </xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td class="value_line" width="99%" align="center">
															<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:Amount/diac:PaymentAmount"/>
														</td>
														<td width="1%" valign="bottom">
															<xsl:text>, </xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(сумма)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr-->
									<tr>
										<td style="text-align: justify">
											<xsl:text>в соответствии с поручением  таможенного органа на бесспорное взыскания</xsl:text>
											<xsl:text> № </xsl:text>
											<xsl:choose>
												<xsl:when test="diac:DocumentInfo/diac:BaseDocument/diac:DecisInconGR/diac:PrDocumentNumber">
													<span class="value_line">
														<xsl:text>&#160;</xsl:text>
														<xsl:value-of select="diac:DocumentInfo/diac:BaseDocument/diac:DecisInconGR/diac:PrDocumentNumber"/>
														<xsl:text>&#160;</xsl:text>
													</span>
												</xsl:when>
												<xsl:when test="diac:DocumentInfo/diac:BaseDocument/diac:Indocrn/cat_ru:PrDocumentNumber">
													<span class="value_line">
														<xsl:text>&#160;</xsl:text>
														<xsl:value-of select="diac:DocumentInfo/diac:BaseDocument/diac:Indocrn/cat_ru:PrDocumentNumber"/>
														<xsl:text>&#160;</xsl:text>
													</span>
												</xsl:when>
												<xsl:otherwise>___</xsl:otherwise>
											</xsl:choose>
											<xsl:text> от </xsl:text>
											<xsl:choose>
												<xsl:when test="diac:DocumentInfo/diac:BaseDocument/diac:DecisInconGR/diac:PrDocumentDate">
													<span class="value_line">
														<xsl:call-template name="text_date">
															<xsl:with-param select="diac:DocumentInfo/diac:BaseDocument/diac:DecisInconGR/diac:PrDocumentDate" name="date"/>
														</xsl:call-template>
													</span>
												</xsl:when>
												<xsl:when test="diac:DocumentInfo/diac:BaseDocument/diac:Indocrn/cat_ru:PrDocumentDate">
													<span class="value_line">
														<xsl:call-template name="text_date">
															<xsl:with-param select="diac:DocumentInfo/diac:BaseDocument/diac:Indocrn/cat_ru:PrDocumentDate" name="date"/>
														</xsl:call-template>
													</span>
												</xsl:when>
												<xsl:otherwise>______</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates select="diac:DocumentInfo/diac:DocumentSignature/diac:CustChiefSignature" mode="ChiefSignature"/>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates select="diac:DocumentInfo/diac:DocumentSignature/diac:ExecutiveSignature" mode="ExecutiveSignature"/>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:when test="diac:DocumentInfo/diac:DocumentType = 2 and diac:DocumentInfo/diac:OrderType = 0">
							<table width="100%" class="graphMain">
								<tbody>
									<tr>
										<td align="center">
											<font size="4">
												<b>
													<xsl:text>Решение таможенного органа об отзыве поручения таможенного органа на бесспорное взыскание</xsl:text>
												</b>
											</font>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="delim_3">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="diac:DocumentInfo/diac:RequisitesDocument/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> N </xsl:text>
											<span class="value_line">
												<xsl:text>&#160;</xsl:text>
												<xsl:value-of select="diac:DocumentInfo/diac:RequisitesDocument/cat_ru:PrDocumentNumber"/>
												<xsl:text>&#160;</xsl:text>
											</span>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="value_line">
											<xsl:apply-templates select="diac:DocumentInfo/diac:CustomsOffice"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(наименование таможенного органа)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>в связи с исполнением (прекращением) обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней принимает решение:</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%">
											<xsl:text>Отозвать из банка:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value_line">
											<xsl:apply-templates select="diac:DocumentInfo/diac:PayerBankInfo" mode="organization"/>
											<xsl:if test="diac:DocumentInfo/diac:PayerBankInfo/diac:BICBankPayer">
												<xsl:text>, БИК: </xsl:text>
												<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:BICBankPayer"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(полное наименование, банковский идентификационный код)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>неисполненное поручение таможенного органа на бесспорное взыскание</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table class="graphMain" width="100%">
												<tbody>
													<tr align="center">
														<td width="4%" valign="bottom">
															<xsl:text>от </xsl:text>
														</td>
														<td width="26%" class="value_line" valign="bottom">
															<xsl:call-template name="russian_date">
																<xsl:with-param select="diac:DocumentInfo/diac:BaseDocument/diac:DecisInconGR/diac:PrDocumentDate" name="dateIn"/>
															</xsl:call-template>
														</td>
														<td width="4%" valign="bottom">
															<xsl:text>N </xsl:text>
														</td>
														<td width="26%" class="value_line" valign="bottom">
															<xsl:value-of select="diac:DocumentInfo/diac:BaseDocument/diac:DecisInconGR/diac:PrDocumentNumber"/>
														</td>
														<td width="13%" valign="bottom">
															<xsl:text> на сумму </xsl:text>
														</td>
														<td width="20%" class="value_line" valign="bottom">
															<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:Amount/diac:PaymentAmount"/>
														</td>
														<td width="7%" valign="bottom">
															<xsl:text> рублей, </xsl:text>
														</td>
													</tr>
													<tr>
														<td/>
														<td align="center" valign="top" class="graphLittle">
															<xsl:text>(дата поручения) </xsl:text>
														</td>
														<td/>
														<td align="center" valign="top" class="graphLittle">
															<xsl:text>(номер поручения) </xsl:text>
														</td>
														<td/>
														<td/>
														<td/>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>выставленное к счету</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value_line">
											<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:AccountTypePayer"/>
											<xsl:if test="diac:DocumentInfo/diac:PayerBankInfo/diac:AccountPayer">
												<xsl:if test="diac:DocumentInfo/diac:PayerBankInfo/diac:AccountTypePayer">
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:AccountPayer"/>
											</xsl:if>
											&#160;
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(указывается вид и номер счета плательщика)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>открытому</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value_line">
											<xsl:apply-templates select="diac:DocumentInfo/diac:PayerInfo" mode="organization2"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(полное фирменное наименование организации или фамилия, имя, отчество (при наличии) индивидуального предпринимателя, идентификационный номер налогоплательщика)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates select="diac:DocumentInfo/diac:DocumentSignature/diac:CustChiefSignature" mode="ChiefSignature"/>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates select="diac:DocumentInfo/diac:DocumentSignature/diac:ExecutiveSignature" mode="ExecutiveSignature"/>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:when test="diac:DocumentInfo/diac:DocumentType = 2 and diac:DocumentInfo/diac:OrderType = 2">
							<table width="100%" class="graphMain">
								<tbody>
									<tr>
										<td align="center">
											<font size="4">
												<b>
													<xsl:text>Решение таможенного органа об отзыве инкассового поручения (поручения таможенного органа на перевод электронных денежных средств)</xsl:text>
												</b>
											</font>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="delim_3">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="diac:DocumentInfo/diac:RequisitesDocument/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> N </xsl:text>
											<span class="value_line">
												<xsl:text>&#160;</xsl:text>
												<xsl:value-of select="diac:DocumentInfo/diac:RequisitesDocument/cat_ru:PrDocumentNumber"/>
												<xsl:text>&#160;</xsl:text>
											</span>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="value_line">
											<xsl:apply-templates select="diac:DocumentInfo/diac:CustomsOffice"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(наименование таможенного органа)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>в связи с исполнением (прекращением) обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней принимает решение:</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%">
											<xsl:text>Отозвать из банка:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value_line">
											<xsl:apply-templates select="diac:DocumentInfo/diac:PayerBankInfo" mode="organization"/>
											<xsl:if test="diac:DocumentInfo/diac:PayerBankInfo/diac:BICBankPayer">
												<xsl:text>, БИК: </xsl:text>
												<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:BICBankPayer"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(полное наименование, банковский идентификационный код)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>поручение таможенного органа на перевод электронных денежных средств на счет плательщика (лица, несущего солидарную обязанность) </xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table class="graphMain" width="100%">
												<tbody>
													<tr align="center">
														<td valign="bottom" width="4%">
															<xsl:text>от </xsl:text>
														</td>
														<td width="13%" class="value_line" valign="bottom">
															<xsl:call-template name="russian_date">
																<xsl:with-param select="diac:DocumentInfo/diac:BaseDocument/diac:Indocrn/cat_ru:PrDocumentDate" name="dateIn"/>
															</xsl:call-template>
														</td>
														<td width="4%" valign="bottom">
															<xsl:text>N </xsl:text>
														</td>
														<td width="26%" class="value_line" valign="bottom">
															<xsl:value-of select="diac:DocumentInfo/diac:BaseDocument/diac:Indocrn/cat_ru:PrDocumentNumber"/>
														</td>
														<td width="13%" valign="bottom">
															<xsl:text> на сумму </xsl:text>
														</td>
														<td width="20%" valign="bottom" class="value_line">
															<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:Amount/diac:PaymentAmount"/>
														</td>
														<td width="20%" valign="bottom">
															<xsl:text> рублей со счета</xsl:text>
														</td>
													</tr>
													<tr>
														<td/>
														<td align="center" valign="top" class="graphLittle">
															<xsl:text>(дата поручения) </xsl:text>
														</td>
														<td/>
														<td align="center" class="graphLittle" valign="top">
															<xsl:text>(номер поручения) </xsl:text>
														</td>
														<td/>
														<td/>
														<td/>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="value_line">
											<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:CorporatePayer"/>
											&#160;
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(указываются реквизиты корпоративного электронного средства платежа плательщика (лица, несущего солидарную обязанность)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>открытого</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value_line">
											<xsl:apply-templates select="diac:DocumentInfo/diac:PayerInfo" mode="organization2"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(полное фирменное наименование организации или фамилия, имя, отчество (при наличии) индивидуального предпринимателя, идентификационный номер налогоплательщика)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates select="diac:DocumentInfo/diac:DocumentSignature/diac:CustChiefSignature" mode="ChiefSignature"/>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates select="diac:DocumentInfo/diac:DocumentSignature/diac:ExecutiveSignature" mode="ExecutiveSignature"/>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:when test="diac:DocumentInfo/diac:DocumentType = 0 and diac:DocumentInfo/diac:OrderType = 5">
							<table width="100%" class="graphMain">
								<tbody>
									<tr>
										<td align="center">
											<font size="4">
												<b>
													<xsl:text>Поручение таможенного органа на списание цифровых рублей</xsl:text>
												</b>
											</font>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="delim_3">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="diac:DocumentInfo/diac:RequisitesDocument/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> N </xsl:text>
											<span class="value_line">
												<xsl:text>&#160;</xsl:text>
												<xsl:value-of select="diac:DocumentInfo/diac:RequisitesDocument/cat_ru:PrDocumentNumber"/>
												<xsl:text>&#160;</xsl:text>
											</span>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="value_line">
											<xsl:apply-templates select="diac:DocumentInfo/diac:CustomsOffice"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(наименование таможенного органа)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>поручает банку</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value_line">
											<xsl:apply-templates select="diac:DocumentInfo/diac:PayerBankInfo" mode="organization"/>
											<xsl:if test="diac:DocumentInfo/diac:PayerBankInfo/diac:BICBankPayer">
												<xsl:text>, БИК: </xsl:text>
												<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:BICBankPayer"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(полное наименование, банковский идентификационный код)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>осуществить списание цифровых рублей, находящихся на счете </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value_line">
											<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:AccountTypePayer"/>
											<xsl:if test="diac:DocumentInfo/diac:PayerBankInfo/diac:AccountPayer">
												<xsl:if test="diac:DocumentInfo/diac:PayerBankInfo/diac:AccountTypePayer">
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:AccountPayer"/>
											</xsl:if>
											&#160;
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(указывается вид и номер счета плательщика)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>открытом</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td class="value_line" width="99%">
															<xsl:apply-templates select="diac:DocumentInfo/diac:PayerInfo" mode="organization2"/>
														</td>
														<td width="1%" valign="bottom">
															<xsl:text>, </xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(полное фирменное наименование организации или фамилия, имя, отчество (при наличии) индивидуального предпринимателя, идентификационный номер налогоплательщика)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>на расчетный счет </xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td class="value_line" width="99%">
															<xsl:if test="diac:DocumentInfo/diac:TransFerfunds/diac:TransFerReqs/diac:AccountRecipient">
																<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:TransFerReqs/diac:AccountRecipient"/>
																<xsl:text>, RUB</xsl:text>
															</xsl:if>
														</td>
														<td width="1%" valign="bottom">
															<!--xsl:text>, </xsl:text-->
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(номер и валюта счета, на который должен быть осуществлен перевод)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>в соответствии с поручением таможенного органа на бесспорное взыскание (поручением таможенного органа на перевод электронных денежных средств на счет плательщика (лица, несущего солидарную обязанность) от </xsl:text>
											<xsl:choose>
												<xsl:when test="diac:DocumentInfo/diac:BaseDocument/diac:DecisInconGR/diac:PrDocumentDate">
													<span class="value_line">
														<xsl:call-template name="russian_date">
															<xsl:with-param select="diac:DocumentInfo/diac:BaseDocument/diac:DecisInconGR/diac:PrDocumentDate" name="dateIn"/>
														</xsl:call-template>
													</span>
												</xsl:when>
												<xsl:when test="diac:DocumentInfo/diac:BaseDocument/diac:Indocrn/cat_ru:PrDocumentDate">
													<span class="value_line">
														<xsl:call-template name="russian_date">
															<xsl:with-param select="diac:DocumentInfo/diac:BaseDocument/diac:Indocrn/cat_ru:PrDocumentDate" name="dateIn"/>
														</xsl:call-template>
													</span>
												</xsl:when>
												<xsl:otherwise>______</xsl:otherwise>
											</xsl:choose>
											<xsl:text> N </xsl:text>
											<xsl:choose>
												<xsl:when test="diac:DocumentInfo/diac:BaseDocument/diac:DecisInconGR/diac:PrDocumentNumber">
													<span class="value_line">
														<xsl:text>&#160;</xsl:text>
														<xsl:value-of select="diac:DocumentInfo/diac:BaseDocument/diac:DecisInconGR/diac:PrDocumentNumber"/>
														<xsl:text>&#160;</xsl:text>
													</span>
												</xsl:when>
												<xsl:when test="diac:DocumentInfo/diac:BaseDocument/diac:Indocrn/cat_ru:PrDocumentNumber">
													<span class="value_line">
														<xsl:text>&#160;</xsl:text>
														<xsl:value-of select="diac:DocumentInfo/diac:BaseDocument/diac:Indocrn/cat_ru:PrDocumentNumber"/>
														<xsl:text>&#160;</xsl:text>
													</span>
												</xsl:when>
												<xsl:otherwise>___</xsl:otherwise>
											</xsl:choose>
											<xsl:text> , а также зачислить эквивалентную сумму в рублях на счет, указанный в таком поручении.</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates select="diac:DocumentInfo/diac:DocumentSignature/diac:CustChiefSignature" mode="ChiefSignature"/>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates select="diac:DocumentInfo/diac:DocumentSignature/diac:ExecutiveSignature" mode="ExecutiveSignature"/>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:when test="diac:DocumentInfo/diac:DocumentType = 2 and diac:DocumentInfo/diac:OrderType = 5">
							<table width="100%" class="graphMain">
								<tbody>
									<tr>
										<td align="center">
											<font size="4">
												<b>
													<xsl:text>Решение об отзыве поручения таможенного органа на списание цифровых рублей</xsl:text>
												</b>
											</font>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="delim_3">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="diac:DocumentInfo/diac:RequisitesDocument/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> N </xsl:text>
											<span class="value_line">
												<xsl:text>&#160;</xsl:text>
												<xsl:value-of select="diac:DocumentInfo/diac:RequisitesDocument/cat_ru:PrDocumentNumber"/>
												<xsl:text>&#160;</xsl:text>
											</span>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="value_line">
											<xsl:apply-templates select="diac:DocumentInfo/diac:CustomsOffice"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(наименование таможенного органа)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>в связи с исполнением (прекращением) обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней принимает решение:</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%">
											<xsl:text>Отозвать из банка:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value_line">
											<xsl:apply-templates select="diac:DocumentInfo/diac:PayerBankInfo" mode="organization"/>
											<xsl:if test="diac:DocumentInfo/diac:PayerBankInfo/diac:BICBankPayer">
												<xsl:text>, БИК: </xsl:text>
												<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:BICBankPayer"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(полное наименование, банковский идентификационный код)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>поручение таможенного органа на списание цифровых рублей </xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table class="graphMain" width="100%">
												<tbody>
													<tr align="center">
														<td valign="bottom" width="4%">
															<xsl:text>от </xsl:text>
														</td>
														<td width="13%" class="value_line" valign="bottom">
															<xsl:call-template name="russian_date">
																<xsl:with-param select="diac:DocumentInfo/diac:BaseDocument/diac:Indocrn/cat_ru:PrDocumentDate" name="dateIn"/>
															</xsl:call-template>
														</td>
														<td width="4%" valign="bottom">
															<xsl:text>N </xsl:text>
														</td>
														<td width="26%" class="value_line" valign="bottom">
															<xsl:value-of select="diac:DocumentInfo/diac:BaseDocument/diac:Indocrn/cat_ru:PrDocumentNumber"/>
														</td>
														<td width="13%" valign="bottom">
															<xsl:text> на сумму </xsl:text>
														</td>
														<td width="20%" valign="bottom" class="value_line">
															<xsl:value-of select="diac:DocumentInfo/diac:TransFerfunds/diac:Amount/diac:PaymentAmount"/>
														</td>
														<td width="20%" valign="bottom">
															<xsl:text> рублей</xsl:text>
														</td>
													</tr>
													<tr>
														<td/>
														<td align="center" valign="top" class="graphLittle">
															<xsl:text>(дата поручения) </xsl:text>
														</td>
														<td/>
														<td align="center" class="graphLittle" valign="top">
															<xsl:text>(номер поручения) </xsl:text>
														</td>
														<td/>
														<td/>
														<td/>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="value_line">
											<xsl:value-of select="diac:DocumentInfo/diac:PayerBankInfo/diac:CorporatePayer"/>
											&#160;
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(указываются реквизиты корпоративного электронного средства платежа плательщика (лица, несущего солидарную обязанность)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>открытого</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value_line">
											<xsl:apply-templates select="diac:DocumentInfo/diac:PayerInfo" mode="organization2"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(полное фирменное наименование организации или фамилия, имя, отчество (при наличии) индивидуального предпринимателя, идентификационный номер налогоплательщика)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates select="diac:DocumentInfo/diac:DocumentSignature/diac:CustChiefSignature" mode="ChiefSignature"/>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates select="diac:DocumentInfo/diac:DocumentSignature/diac:ExecutiveSignature" mode="ExecutiveSignature"/>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
					</xsl:choose>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template mode="organization2" match="*">
		<xsl:if test="not(diac:FIO)">
			<xsl:if test="diac:OrganizationName">
				<xsl:value-of select="diac:OrganizationName"/>
			</xsl:if>
			<xsl:if test="not(diac:OrganizationName) and diac:ShortName">
				<!--xsl:if test="string-length(diac:OrganizationName) &gt; 0"> (</xsl:if-->
				<xsl:value-of select="diac:ShortName"/>
				<!--xsl:if test="string-length(diac:OrganizationName) &gt; 0">)</xsl:if-->
			</xsl:if>
		</xsl:if>
		<xsl:if test="diac:FIO">
			<xsl:for-each select="diac:FIO/*">
				<xsl:if test="position()!=1"><xsl:text> </xsl:text></xsl:if>
				<xsl:value-of select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="diac:INN">,&#032;ИНН:&#032;<xsl:value-of select="diac:INN"/>
		</xsl:if>
		<!--xsl:if test="diac:KPP">,&#032;КПП:&#032;<xsl:value-of select="diac:KPP"/>
		</xsl:if-->
		<!--xsl:if test="diac:OKPOID">,&#032;ОКПО:&#032;<xsl:value-of select="diac:OKPOID"/>
		</xsl:if-->
		<!--xsl:if test="diac:ITN">,&#032;ИТН:&#032;<xsl:value-of select="diac:ITN"/>
		</xsl:if-->
		<!--xsl:if test="diac:OKATOCode">,&#032;ОКАТО:&#032;<xsl:value-of select="diac:OKATOCode"/>
		</xsl:if-->
	</xsl:template>
	<xsl:template mode="organization" match="*">
		<xsl:if test="diac:OrganizationName">
			<xsl:value-of select="diac:OrganizationName"/>
		</xsl:if>
		<xsl:if test="diac:ShortName">
			<xsl:if test="string-length(diac:OrganizationName) &gt; 0"> (</xsl:if>
			<xsl:value-of select="diac:ShortName"/>
			<xsl:if test="string-length(diac:OrganizationName) &gt; 0">)</xsl:if>
		</xsl:if>
		<!--xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures and (cat_ru:OrganizationName or cat_ru:ShortName)">&#032;<xsl:apply-templates select="cat_ru:RFOrganizationFeatures" mode="RFOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		</xsl:if-->
		<!--xsl:if test="diac:INN">,&#032;ИНН:&#032;<xsl:value-of select="diac:INN"/>
		</xsl:if>
		<xsl:if test="diac:KPP">,&#032;КПП:&#032;<xsl:value-of select="diac:KPP"/>
		</xsl:if>
		<xsl:if test="diac:OGRN">,&#032;ОГРН:&#032;<xsl:value-of select="diac:OGRN"/>
		</xsl:if-->
		<xsl:if test="diac:OKPOID">,&#032;ОКПО:&#032;<xsl:value-of select="diac:OKPOID"/>
		</xsl:if>
		<xsl:if test="diac:ITN">,&#032;ИТН:&#032;<xsl:value-of select="diac:ITN"/>
		</xsl:if>
		<xsl:if test="diac:Address">,&#032;Адрес:&#032;<xsl:for-each select="cat_ru:Address">
				<xsl:for-each select="*">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">
						<xsl:text>, </xsl:text>
					</xsl:if>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="diac:OKATOCode">,&#032;ОКАТО:&#032;<xsl:value-of select="cat_ru:OKATOCode"/>
		</xsl:if>
		<xsl:if test="diac:Contact">,&#032;<xsl:for-each select="cat_ru:Contact">
				<xsl:call-template name="Contact"/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="RFOrganizationFeatures">
		<xsl:if test="*[local-name() = 'INN'] or *[local-name() = 'KPP']">
			<span class="normal">,&#032;</span>
			<span class="italic">
				<xsl:if test="*[local-name() = 'INN']">
					<span class="italic">ИНН</span>
				</xsl:if>
				<xsl:if test="*[local-name() = 'INN'] and *[local-name() = 'KPP']">
					<span class="normal">/</span>
				</xsl:if>
				<xsl:if test="*[local-name() = 'KPP']">
					<span class="italic">КПП</span>
				</xsl:if>
				<span class="normal">:&#032;</span>
			</span>
		</xsl:if>
		<xsl:if test="*[local-name() = 'INN']">
			<xsl:value-of select="*[local-name() = 'INN']"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'KPP']">
			<xsl:if test="*[local-name() = 'INN']">
				<span class="normal">&#032;/&#032;</span>
			</xsl:if>
			<xsl:value-of select="*[local-name() = 'KPP']"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			<span class="normal">,&#032;</span>
			<span class="italic">ОГРН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span class="normal">,&#032;</span>
			<span class="italic">БИН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal">&#032;/&#032;</span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				<span class="normal">,&#032;</span>
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<span class="normal">,&#032;</span>
			<span class="italic">ИТН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:CategoryCode"/>
			<span class="normal">&#032;/&#032;</span>
			<xsl:value-of select="cat_ru:KATOCode"/>
			<xsl:if test="cat_ru:RNN">
				<span class="normal">&#032;/&#032;</span>
				<xsl:value-of select="cat_ru:RNN"/>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal">&#032;/&#032;</span>
				<xsl:value-of select="cat_ru:ITNReserv"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span class="normal">,&#032;</span>
			<span class="italic">УНП</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span class="normal">,&#032;</span>
			<span class="italic">ИНФЛ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<span class="normal">,&#032;</span>
			<span class="italic">УНН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<span class="normal">,&#032;</span>
			<span class="italic">НЗОУ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<span class="normal">,&#032;</span>
			<span class="italic">N справки об отсутв. НЗОУ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<span class="italic">, ИНН(ПИН)</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<span class="italic">, ОКПО</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="Contact" match="*">
		<xsl:if test="cat_ru:Phone"> Тел: <xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>,&#032;</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">Факс: <xsl:value-of select="cat_ru:Fax"/>,&#032;</xsl:if>
		<xsl:if test="cat_ru:Telex">Телекс: <xsl:value-of select="cat_ru:Telex"/>,&#032;</xsl:if>
		<xsl:if test="cat_ru:E_mail">Email: <xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">,&#032;</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="diac:DocumentInfo/diac:CustomsOffice">
		<xsl:value-of select="cat_ru:OfficeName"/>
		<!--xsl:if test="cat_ru:OfficeName">
			<xsl:text> (</xsl:text>
		</xsl:if>
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text>)</xsl:text>
		</xsl:if-->
	</xsl:template>
	<xsl:template mode="ExecutiveSignature" match="*">
		<table class="graphMain" width="100%">
			<tbody>
				<tr valign="bottom">
					<td width="16%">Исполнитель</td>
					<td width="45%" class="value_line" align="center">
						<!--xsl:value-of select="diac:PersonPost"/>
						<xsl:text> </xsl:text-->
						<xsl:apply-templates mode="personBase" select="."/>
					</td>
					<td width="16%" align="center">Телефон</td>
					<td width="23%" class="value_line" align="center">
						<xsl:value-of select="diac:Phone"/>
					</td>
				</tr>
				<tr align="center" valign="top">
					<td/>
					<td class="graphLittle">(фамилия, инициалы)</td>
					<td/>
					<td/>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template mode="ChiefSignature" match="*">
		<table width="100%" class="graphMain">
			<tbody>
				<tr align="center" valign="bottom">
					<td width="42%" align="left">Начальник таможенного органа<br/>(или лицо, им уполномоченное)</td>
					<td width="4%"/>
					<td class="value_line" width="12%"/>
					<td width="5%"/>
					<td class="value_line" width="37%">
						<!--xsl:value-of select="diac:PersonPost"/-->
						&#160;
						<xsl:apply-templates mode="personBase" select="."/>
						&#160;
					</td>
				</tr>
				<tr align="center">
					<td class="graphLittle"/>
					<td/>
					<td class="graphLittle">(подпись)</td>
					<td/>
					<td class="graphLittle">(фамилия, инициалы)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="text_date">
		<xsl:param name="date"/>«<span class="value_line">&#160;<xsl:choose>
				<xsl:when test="substring($date,9,2)">
					<xsl:value-of select="substring($date,9,2)"/>
				</xsl:when>
				<xsl:otherwise>
					&#160;&#160;&#160;
				</xsl:otherwise>
			</xsl:choose>&#160;</span>
		<xsl:variable name="month" select="substring($date, 6, 2)"/>»&#160;<span class="value_line">&#160;<xsl:choose>
				<xsl:when test="$month=1">января</xsl:when>
				<xsl:when test="$month=2">февраля</xsl:when>
				<xsl:when test="$month=3">марта</xsl:when>
				<xsl:when test="$month=4">апреля</xsl:when>
				<xsl:when test="$month=5">мая</xsl:when>
				<xsl:when test="$month=6">июня</xsl:when>
				<xsl:when test="$month=7">июля</xsl:when>
				<xsl:when test="$month=8">августа</xsl:when>
				<xsl:when test="$month=9">сентября</xsl:when>
				<xsl:when test="$month=10">октября</xsl:when>
				<xsl:when test="$month=11">ноября</xsl:when>
				<xsl:when test="$month=12">декабря</xsl:when>
				<xsl:otherwise>
					&#160;&#160;&#160;
					&#160;&#160;&#160;
					&#160;&#160;&#160;
				</xsl:otherwise>
			</xsl:choose>&#160;</span>&#160;<xsl:choose>
			<xsl:when test="substring($date,1,2)">
				<xsl:value-of select="substring($date,1,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>20</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<span class="value_line">
			<xsl:choose>
				<xsl:when test="substring($date,3,2)">
					<xsl:value-of select="substring($date,3,2)"/>
				</xsl:when>
				<xsl:otherwise>
					&#160;&#160;&#160;
				</xsl:otherwise>
			</xsl:choose>
		</span> г.</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="personBase">
		<xsl:value-of select="diac:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="concat(substring(diac:PersonName, 1, 1), '.')"/>
		<xsl:text></xsl:text>
		<xsl:if test="diac:PersonMiddleName">
			<xsl:value-of select="concat(substring(diac:PersonMiddleName, 1, 1), '.')"/>
			<xsl:text> </xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="val_name">
		<xsl:choose>
			<xsl:when test=".='944'">
				<xsl:value-of select="'AZN'"/>
			</xsl:when>
			<xsl:when test=".='051'">
				<xsl:value-of select="'AMD'"/>
			</xsl:when>
			<xsl:when test=".='933'">
				<xsl:value-of select="'BYN'"/>
			</xsl:when>
			<xsl:when test=".='840'">
				<xsl:value-of select="'USD'"/>
			</xsl:when>
			<xsl:when test=".='978'">
				<xsl:value-of select="'EUR'"/>
			</xsl:when>
			<xsl:when test=".='643'">
				<xsl:value-of select="'RUB'"/>
			</xsl:when>
			<xsl:when test=".='398'">
				<xsl:value-of select="'KZT'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
