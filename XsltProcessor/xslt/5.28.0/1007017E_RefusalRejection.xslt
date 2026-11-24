<?xml version="1.0" encoding="utf-8"?>
<!--
            rr:DocKind = 1 - Уведомление об отказе в выдаче разрешения на переработку
        rr:DocInfomation/rr:AppInfomation/rr:ProcessingProcedureCode = 21 - переработка вне ТТ
Проект приказа Минфина России "Порядок выдачи разрешений на переработку товаров вне таможенной территории, отзыва, 
аннулирования разрешений на переработку товаров вне таможенной территории, восстановления 
действия разрешений на переработку товаров вне таможенной территории."
        rr:DocInfomation/rr:AppInfomation/rr:ProcessingProcedureCode = 51 - переработка на ТТ
Проект приказа Минфина России "Порядок выдачи разрешений на переработку товаров на таможенной территории, передачи разрешений на переработку товаров 
на таможенной территории иному лицу, отзыва, аннулирования разрешений на переработку товаров на таможенной территории и 
восстановления действия разрешений на переработку товаров на таможенной территории"
        rr:DocInfomation/rr:AppInfomation/rr:ProcessingProcedureCode = 91 - переработка для внутреннего потребления
Проект приказа Минфина России "Об утверждении порядка выдачи разрешений на переработку товаров для внутреннего потребления,
отзыва (аннулирования) разрешений на переработку товаров для внутреннего потребления, восстановления действия
разрешений на переработку товаров для внутреннего потребления, форму заявления о внесении изменений в разрешение 
на переработку товаров для внутреннего потребления, форму отказа таможенного органа во внесении изменений в 
разрешение на переработку товаров для внутреннего потребления
======
            rr:DocKind = 2 - Отказ на внесение изменений в Разрешение на переработку
        rr:DocInfomation/rr:PermitNumber/catProc_ru:ProcessingProcedureCode = 21 - переработка вне ТТ
Приложение 5 к вне (3).docx
        rr:DocInfomation/rr:PermitNumber/catProc_ru:ProcessingProcedureCode = 51 - переработка на ТТ
Приложение № 6 к приказу Переработка на (3).docx
        rr:DocInfomation/rr:PermitNumber/catProc_ru:ProcessingProcedureCode = 91 - переработка для внутреннего потребления
Приложение 5 для (3).docx
======
            rr:DocKind = 3 - Уведомление об отказе в передаче Разрешения иному лицу
        rr:DocInfomation/rr:PermitNumber/catProc_ru:ProcessingProcedureCode = 51 - переработка на ТТ
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:catProc_ru="urn:customs.ru:Information:ProcessingDocuments:ProcessingCommonAggregateTypes:5.28.0" xmlns:rr="urn:customs.ru:Information:ProcessingDocuments:RefusalRejection:5.28.0">
	<!-- Шаблон для типа PermitProcessingGoodsType -->
	<xsl:template match="rr:RefusalRejection">
		<xsl:param name="w" select="180"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  }

                  div
                  {
                  white-space: normal;
                  }

                  div.page {
                  margin: 10px auto;
                  margin-top: 6pt;
                  margin-bottom: 6pt;
                  padding: 10mm 10mm 10mm 20mm;
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

                  table.int
                  {
                  width: 96%;
                  margin-left: 5px;
                  margin-right: 5px;
                  table-layout: fixed;
                  }

                  table.ext_border
                  {
                  width: 100%;
                  border: 1px solid windowtext;
                  border-collapse: separate;
                  table-layout: fixed;
                  }
                  
                  table.border tr td
                  {
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  vertical-align:bottom;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  vertical-align:bottom;
                  }

                  .annot_t
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  vertical-align:top;
                  }

                  .underline
                  {
                  font-family: Arial;
                  font-size: 7pt;
                  vertical-align:top;
                  text-align: center;
                  }

                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }

                  .bordered { border-collapse: collapse; }
                  td.bordered
                  {
                  border: solid 1px windowtext;
                  }

                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<xsl:variable name="cnt_ri" select="count(rr:ReasonInfo)"/>
					<br/>
					<xsl:choose>
						<!-- ************************************************************************************************************************************************************************************************** -->
						<!-- ************* Уведомление об отказе в выдаче разрешения на переработку ******************************************************************************************************** -->
						<!-- ************************************************************************************************************************************************************************************************** -->
						<xsl:when test="rr:DocKind='1'">
							<table>
								<tbody>
									<tr>
										<td align="center" class="title">
											<font size="4">
												<b>
													<xsl:choose>
														<xsl:when test="rr:DocInfomation/rr:AppInfomation/rr:ProcessingProcedureCode = '21'">
															<xsl:text>Уведомление об отказе в выдаче разрешения на переработку товаров вне таможенной территории</xsl:text>
														</xsl:when>
														<xsl:when test="rr:DocInfomation/rr:AppInfomation/rr:ProcessingProcedureCode = '51'">
															<xsl:text>Уведомление об отказе в выдаче разрешения на переработку товаров на таможенной территории</xsl:text>
														</xsl:when>
														<xsl:when test="rr:DocInfomation/rr:AppInfomation/rr:ProcessingProcedureCode = '91'">
															<xsl:text>Уведомление об отказе в выдаче разрешения на переработку товаров для внутреннего потребления</xsl:text>
														</xsl:when>
													</xsl:choose>
												</b>
											</font>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr>
										<td width="65%" class="value"><xsl:value-of select="rr:CustomsAdministration"/></td>
										<td width="2%" class="annot"/>
										<td width="33%" class="annot"><xsl:text>таможенное управление</xsl:text></td>
									</tr>
									<tr>
										<td class="underline" align="center"><xsl:text>(наименование регионального таможенного управления)</xsl:text></td>
										<td class="annot" colspan="2"/>
									</tr>
									<tr>
										<td class="value">
											<xsl:for-each select="rr:Customs">
												<xsl:if test="cat_ru:OfficeName">
													<xsl:text>(</xsl:text>
												</xsl:if>
												<xsl:value-of select="cat_ru:Code"/>
												<xsl:if test="cat_ru:OfficeName">
													<xsl:text>) </xsl:text>
													<xsl:value-of select="cat_ru:OfficeName"/>
												</xsl:if>
											</xsl:for-each>
										</td>
										<td class="annot"/>
										<td class="annot"><xsl:text>таможня</xsl:text></td>
									</tr>
									<tr>
										<td class="underline" align="center"><xsl:text>(наименование таможни)</xsl:text></td>
										<td class="annot" colspan="2"/>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot">
										<p style="text-indent: 5%;text-align: justify;">
											<xsl:text>Рассмотрев заявление на переработку товаров </xsl:text>
											<xsl:choose>
												<xsl:when test="rr:DocInfomation/rr:AppInfomation/rr:ProcessingProcedureCode = '21'">
													<xsl:text>вне таможенной территории</xsl:text>
												</xsl:when>
												<xsl:when test="rr:DocInfomation/rr:AppInfomation/rr:ProcessingProcedureCode = '51'">
													<xsl:text>на таможенной территории</xsl:text>
												</xsl:when>
												<xsl:when test="rr:DocInfomation/rr:AppInfomation/rr:ProcessingProcedureCode = '91'">
													<xsl:text>для внутреннего потребления</xsl:text>
												</xsl:when>
											</xsl:choose>
										</p>
									</td>
								</tr>
							</table>
							<table>
								<tr>
									<td class="value" width="99%">
										<xsl:apply-templates select="rr:ApplicantInfomation"/>
										<br/>
									</td>
									<td class="annot" width="1%" align="right">
										<xsl:text>,</xsl:text>
									</td>
								</tr>
							</table>
							<table>
								<tr>
									<td class="underline">
										<xsl:choose>
											<xsl:when test="rr:DocInfomation/rr:AppInfomation/rr:ProcessingProcedureCode = '21'">
												<xsl:text>(указывается наименование лица, подавшего заявление на переработку товаров вне таможенной территории)</xsl:text>
											</xsl:when>
											<xsl:when test="rr:DocInfomation/rr:AppInfomation/rr:ProcessingProcedureCode = '51'">
												<xsl:text>(указываются наименование лица, подавшего заявление на переработку товаров на таможенной территории,</xsl:text>
											</xsl:when>
											<xsl:when test="rr:DocInfomation/rr:AppInfomation/rr:ProcessingProcedureCode = '91'">
												<xsl:text>(указывается наименование лица, подавшего заявление на переработку товаров для внутреннего потребления,</xsl:text>
											</xsl:when>
										</xsl:choose>
									</td>
								</tr>
								<xsl:if test="rr:DocInfomation/rr:AppInfomation/rr:ProcessingProcedureCode = '51' or rr:DocInfomation/rr:AppInfomation/rr:ProcessingProcedureCode = '91'">
									<tr>
										<td class="value">
											<xsl:if test="not(rr:DocInfomation/rr:AppInfomation/cat_ru:PrDocumentName)">
												<xsl:text>Заявление на переработку товаров: </xsl:text>
											</xsl:if>
											<xsl:apply-templates mode="doc" select="rr:DocInfomation/rr:AppInfomation"/>
											<br/>
										</td>
									</tr>
									<tr>
										<td class="underline">
											<xsl:choose>
												<xsl:when test="rr:DocInfomation/rr:AppInfomation/rr:ProcessingProcedureCode = '51'">
													<xsl:text>исходящий номер и дата заявления на переработку товаров на таможенной территории)</xsl:text>
												</xsl:when>
												<xsl:when test="rr:DocInfomation/rr:AppInfomation/rr:ProcessingProcedureCode = '91'">
													<xsl:text>и входящий регистрационный номер его заявления)</xsl:text>
												</xsl:when>
											</xsl:choose>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td class="annot">
										<p style="text-align: justify;">
											<xsl:choose>
												<xsl:when test="rr:DocInfomation/rr:AppInfomation/rr:ProcessingProcedureCode = '21'">
													<xsl:text>уведомляем об отказе в выдаче разрешения на переработку товаров вне таможенной территории по следующим основаниям.</xsl:text>
												</xsl:when>
												<xsl:when test="rr:DocInfomation/rr:AppInfomation/rr:ProcessingProcedureCode = '51'">
													<xsl:text>уведомляем об отказе в выдаче разрешения на переработку товаров на  таможенной территории по следующим основаниям.</xsl:text>
												</xsl:when>
												<xsl:when test="rr:DocInfomation/rr:AppInfomation/rr:ProcessingProcedureCode = '91'">
													<xsl:text>уведомляем об отказе в выдаче разрешения на переработку товаров для внутреннего потребления по следующим основаниям.</xsl:text>
												</xsl:when>
											</xsl:choose>
										</p>
									</td>
								</tr>
							</table>
							<br/>
							<table class="ext_border"> <!--таблица в таблице для красивого отступа от внешних границ-->
								<tr>
									<td align="center">
										<table class="int">
											<tr>
												<td class="annot">
													<p style="text-indent: 5%;text-align:justify;">
														<xsl:text>Причина(-ы) отказа в выдаче разрешения на переработку: </xsl:text>
														<!--xsl:choose>
															<xsl:when test="rr:DocInfomation/rr:AppInfomation/rr:ProcessingProcedureCode = '21'">
																<xsl:text>Причина (причины) отказа в выдаче разрешения на переработку товаров вне таможенной территории и ее (их) обоснование с указанием ссылок </xsl:text>
																<xsl:text>на положения нормативных правовых актов, составляющих право Евразийского экономического союза и законодательства </xsl:text>
																<xsl:text>Российской Федерации в области таможенного регулирования.</xsl:text>
															</xsl:when>
															<xsl:when test="rr:DocInfomation/rr:AppInfomation/rr:ProcessingProcedureCode = '51'">
																<xsl:text>Причина (причины) отказа в выдаче разрешения на переработку и их обоснование с указанием ссылок </xsl:text>
																<xsl:text>на положения актов, составляющих право Евразийского экономического союза, и законодательства </xsl:text>
																<xsl:text>Российской Федерации в области таможенного регулирования.</xsl:text>
															</xsl:when>
															<xsl:when test="rr:DocInfomation/rr:AppInfomation/rr:ProcessingProcedureCode = '91'">
																<xsl:text>Причина (причины) отказа в выдаче разрешения на переработку для внутреннего потребления и их обоснование с указанием ссылок </xsl:text>
																<xsl:text>на положения нормативных правовых актов, составляющих право Евразийского экономического союза и законодательства </xsl:text>
																<xsl:text>Российской Федерации в области таможенного регулирования.</xsl:text>
															</xsl:when>
														</xsl:choose-->
													</p>
												</td>
											</tr>
											<xsl:for-each select="rr:ReasonInfo">
												<tr>
													<td class="value">
														<xsl:if test="$cnt_ri &gt; 1"><xsl:value-of select="position()"/><xsl:text>. </xsl:text></xsl:if>
														<xsl:apply-templates select="."/>
													</td>
												</tr>
											</xsl:for-each>
										</table>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot">
										<xsl:variable name="descr_align">
												<xsl:choose>
													<xsl:when test="rr:DocInfomation/rr:AppInfomation/rr:ProcessingProcedureCode = '21'">left</xsl:when>
													<xsl:when test="rr:DocInfomation/rr:AppInfomation/rr:ProcessingProcedureCode = '51'">center</xsl:when>
													<xsl:when test="rr:DocInfomation/rr:AppInfomation/rr:ProcessingProcedureCode = '91'">center</xsl:when>
												</xsl:choose>
										</xsl:variable>
										<xsl:apply-templates select="rr:PersonSignature">
											<xsl:with-param name="fio_descr" select="'Фамилия, имя, отчество (при наличии) начальника таможни (лица, его замещающего)'"/>
											<xsl:with-param name="fio_descr_align" select="$descr_align"/>
										</xsl:apply-templates>
									</td>
								</tr>
								<tr>
									<td class="underline"> <br/></td>
								</tr>
							</table>
						</xsl:when>
						<!-- ************************************************************************************************************************************************************************************************** -->
						<!-- ************* Отказ на внесение изменений в Разрешение на переработку ********************************************************************************************************** -->
						<!-- ************************************************************************************************************************************************************************************************** -->
						<xsl:when test="rr:DocKind='2'">
							<table>
								<tbody>
									<tr>
										<td align="center" class="title">
											<font size="4">
												<b>
													<xsl:choose>
														<xsl:when test="rr:DocInfomation/rr:PermitNumber/catProc_ru:ProcessingProcedureCode = '21'">
															<xsl:text>Отказ во внесении изменений</xsl:text><br/><xsl:text>в разрешение на переработку товаров вне таможенной территории</xsl:text>
														</xsl:when>
														<xsl:when test="rr:DocInfomation/rr:PermitNumber/catProc_ru:ProcessingProcedureCode = '51'">
															<xsl:text>Отказ таможенного органа во внесении изменений (дополнений) в разрешение на переработку товаров на таможенной территории</xsl:text>
														</xsl:when>
														<xsl:when test="rr:DocInfomation/rr:PermitNumber/catProc_ru:ProcessingProcedureCode = '91'">
															<xsl:text>Отказ во внесении изменений в разрешение на переработку товаров для внутреннего потребления</xsl:text>
														</xsl:when>
													</xsl:choose>
												</b>
											</font>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr>
										<td width="65%" class="value"><xsl:value-of select="rr:CustomsAdministration"/></td>
										<td width="2%" class="annot"/>
										<td width="33%" class="annot"><xsl:text>таможенное управление</xsl:text></td>
									</tr>
									<tr>
										<td class="underline" align="center"><xsl:text>(наименование регионального таможенного управления)</xsl:text></td>
										<td class="annot" colspan="2"/>
									</tr>
									<tr>
										<td class="value">
											<xsl:for-each select="rr:Customs">
												<xsl:if test="cat_ru:OfficeName">
													<xsl:text>(</xsl:text>
												</xsl:if>
												<xsl:value-of select="cat_ru:Code"/>
												<xsl:if test="cat_ru:OfficeName">
													<xsl:text>) </xsl:text>
													<xsl:value-of select="cat_ru:OfficeName"/>
												</xsl:if>
											</xsl:for-each>
										</td>
										<td class="annot"/>
										<td class="annot"><xsl:text>таможня</xsl:text></td>
									</tr>
									<tr>
										<td class="underline" align="center"><xsl:text>(наименование таможни)</xsl:text></td>
										<td class="annot" colspan="2"/>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot">
										<p style="text-indent: 5%;text-align: justify;">
											<xsl:choose>
												<xsl:when test="rr:DocInfomation/rr:PermitNumber/catProc_ru:ProcessingProcedureCode = '21'">
													<xsl:text>Рассмотрев заявление о внесении изменений в разрешение на переработку товаров вне таможенной территории №</xsl:text>
												</xsl:when>
												<xsl:when test="rr:DocInfomation/rr:PermitNumber/catProc_ru:ProcessingProcedureCode = '51'">
													<xsl:text>Рассмотрев заявление о внесении изменений (дополнений) в разрешение на переработку товаров на таможенной территории №</xsl:text>
												</xsl:when>
												<xsl:when test="rr:DocInfomation/rr:PermitNumber/catProc_ru:ProcessingProcedureCode = '91'">
													<xsl:text>Рассмотрев заявление о внесении изменений в разрешение на переработку товаров для внутреннего потребления №</xsl:text>
												</xsl:when>
											</xsl:choose>
											<xsl:text>&#160;</xsl:text>
											<u>
												<xsl:text>&#160;&#160;</xsl:text>
												<xsl:apply-templates select="rr:DocInfomation/rr:PermitNumber"/>
												<xsl:text>&#160;&#160;</xsl:text>
											</u>
											<xsl:text>, выданное</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<table>
								<tr>
									<td class="value" width="99%">
										<xsl:apply-templates select="rr:ApplicantInfomation"/>
										<br/>
									</td>
									<td class="annot" width="1%" align="right">
										<xsl:text>,</xsl:text>
									</td>
								</tr>
							</table>
							<table>
								<tr>
									<td class="underline">
										<xsl:choose>
											<xsl:when test="rr:DocInfomation/rr:PermitNumber/catProc_ru:ProcessingProcedureCode = '21'">
												<xsl:text>(указывается полное наименование, идентификационный номер налогоплательщика лица, получившего разрешение на переработку товаров вне таможенной территории)</xsl:text>
											</xsl:when>
											<xsl:when test="rr:DocInfomation/rr:PermitNumber/catProc_ru:ProcessingProcedureCode = '51'">
												<xsl:text>(указывается наименование лица, подавшего заявление о внесении изменений (или дополнений) в полученное разрешение на переработку товаров на таможенной территории) </xsl:text>
											</xsl:when>
											<xsl:when test="rr:DocInfomation/rr:PermitNumber/catProc_ru:ProcessingProcedureCode = '91'">
												<xsl:text>(указывается наименование, идентификационный номер налогоплательщика лица, подавшего заявление о внесении изменений в разрешение на переработку товаров для внутреннего потребления)</xsl:text>
											</xsl:when>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td class="annot">
										<p style="text-align: justify;">
											<xsl:choose>
												<xsl:when test="rr:DocInfomation/rr:PermitNumber/catProc_ru:ProcessingProcedureCode = '21'">
													<xsl:text>уведомляем об отказе во внесении изменений в разрешение на переработку товаров вне таможенной территории по следующим основаниям.</xsl:text>
												</xsl:when>
												<xsl:when test="rr:DocInfomation/rr:PermitNumber/catProc_ru:ProcessingProcedureCode = '51'">
													<xsl:text>уведомляем об отказе во внесении изменений (или дополнений) в разрешение на переработку товаров на таможенной территории по следующим основаниям.</xsl:text>
												</xsl:when>
												<xsl:when test="rr:DocInfomation/rr:PermitNumber/catProc_ru:ProcessingProcedureCode = '91'">
													<xsl:text>уведомляем об отказе во внесении изменений в разрешение на переработку товаров для внутреннего потребления по следующим основаниям.</xsl:text>
												</xsl:when>
											</xsl:choose>
										</p>
									</td>
								</tr>
							</table>
							<br/>
							<table class="ext_border"> <!--таблица в таблице для красивого отступа от внешних границ-->
								<tr>
									<td align="center">
										<table class="int">
											<tr>
												<td class="annot">
													<p style="text-indent: 5%;text-align:justify;">
														<xsl:text>Причина(-ы) отказа во внесении изменений в разрешение на переработку товаров: </xsl:text>
														<!--xsl:choose>
															<xsl:when test="rr:DocInfomation/rr:PermitNumber/catProc_ru:ProcessingProcedureCode = '21'">
																<xsl:text>Причина (причины) отказа во внесении изменений в разрешение на переработку товаров вне таможенной </xsl:text>
																<xsl:text>территории и ее (их) обоснование с указанием ссылок </xsl:text>
																<xsl:text>на положения нормативных правовых актов, составляющих право Евразийского экономического союза и законодательства </xsl:text>
																<xsl:text>Российской Федерации о таможенном регулировании.</xsl:text>
															</xsl:when>
															<xsl:when test="rr:DocInfomation/rr:PermitNumber/catProc_ru:ProcessingProcedureCode = '51'">
																<xsl:text>Причина (причины) отказа во внесении изменений в разрешение на переработку товаров на таможенной территории и их обоснование с указанием ссылок </xsl:text>
																<xsl:text>на положения актов, составляющих право Евразийского экономического союза и законодательство </xsl:text>
																<xsl:text>Российской Федерации в области таможенного регулирования.</xsl:text>
															</xsl:when>
															<xsl:when test="rr:DocInfomation/rr:PermitNumber/catProc_ru:ProcessingProcedureCode = '91'">
																<xsl:text>Причина (причины) отказа во внесении изменений в разрешение на переработку товаров для внутреннего потребления </xsl:text>
																<xsl:text>и их обоснование с указанием ссылок </xsl:text>
																<xsl:text>на положения нормативных правовых актов, составляющих право Евразийского экономического союза и законодательства </xsl:text>
																<xsl:text>Российской Федерации в области таможенного регулирования.</xsl:text>
															</xsl:when>
														</xsl:choose-->
													</p>
												</td>
											</tr>
											<xsl:for-each select="rr:ReasonInfo">
												<tr>
													<td class="value">
														<xsl:if test="$cnt_ri &gt; 1"><xsl:value-of select="position()"/><xsl:text>. </xsl:text></xsl:if>
														<xsl:apply-templates select="."/>
													</td>
												</tr>
											</xsl:for-each>
										</table>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot">
										<xsl:variable name="descr_align2">
												<xsl:choose>
													<xsl:when test="rr:DocInfomation/rr:PermitNumber/catProc_ru:ProcessingProcedureCode = '21'">left</xsl:when>
													<xsl:when test="rr:DocInfomation/rr:PermitNumber/catProc_ru:ProcessingProcedureCode = '51'">center</xsl:when>
													<xsl:when test="rr:DocInfomation/rr:PermitNumber/catProc_ru:ProcessingProcedureCode = '91'">center</xsl:when>
												</xsl:choose>
										</xsl:variable>
										<xsl:apply-templates select="rr:PersonSignature">
											<xsl:with-param name="fio_descr" select="'Фамилия, имя, отчество (при наличии) начальника таможни (либо лица, его замещающего)'"/>
											<xsl:with-param name="fio_descr_align" select="$descr_align2"/>
										</xsl:apply-templates>
									</td>
								</tr>
								<tr>
									<td class="underline"> <br/></td>
								</tr>
							</table>
						</xsl:when>
						<!-- ************************************************************************************************************************************************************************************************** -->
						<!-- ************* Уведомление об отказе в передаче Разрешения иному лицу ************************************************************************************************************************* -->
						<!-- ************************************************************************************************************************************************************************************************** -->
						<xsl:when test="rr:DocKind='3'">
							<xsl:if test="rr:DocInfomation/rr:PermitNumber/catProc_ru:ProcessingProcedureCode = '51'"> <!-- возможно только для "на таможенной территории" -->
								<table>
									<tbody>
										<tr>
											<td align="center" class="title">
												<font size="4">
													<b>
														<xsl:text>Уведомление об отказе в передаче разрешения на переработку товаров на таможенной территории</xsl:text>
													</b>
												</font>
											</td>
										</tr>
									</tbody>
								</table>
								<br/>
								<table>
									<tbody>
										<tr>
											<td width="65%" class="value"><xsl:value-of select="rr:CustomsAdministration"/></td>
											<td width="2%" class="annot"/>
											<td width="33%" class="annot"><xsl:text>таможенное управление</xsl:text></td>
										</tr>
										<tr>
											<td class="underline" align="center"><xsl:text>(наименование регионального таможенного управления)</xsl:text></td>
											<td class="annot" colspan="2"/>
										</tr>
										<tr>
											<td class="value">
												<xsl:for-each select="rr:Customs">
													<xsl:if test="cat_ru:OfficeName">
														<xsl:text>(</xsl:text>
													</xsl:if>
													<xsl:value-of select="cat_ru:Code"/>
													<xsl:if test="cat_ru:OfficeName">
														<xsl:text>) </xsl:text>
														<xsl:value-of select="cat_ru:OfficeName"/>
													</xsl:if>
												</xsl:for-each>
											</td>
											<td class="annot"/>
											<td class="annot"><xsl:text>таможня</xsl:text></td>
										</tr>
										<tr>
											<td class="underline" align="center"><xsl:text>(наименование таможни)</xsl:text></td>
											<td class="annot" colspan="2"/>
										</tr>
									</tbody>
								</table>
								<br/>
								<table>
									<tr>
										<td class="annot">
											<p style="text-indent: 5%;text-align: justify;">
												<xsl:text>Рассмотрев заявление на передачу разрешения на переработку товаров на таможенной территории №</xsl:text>
												<xsl:text>&#160;</xsl:text>
												<u>
													<xsl:text>&#160;&#160;</xsl:text>
													<xsl:apply-templates select="rr:DocInfomation/rr:PermitNumber"/>
													<xsl:text>&#160;&#160;</xsl:text>
												</u>
												<xsl:text>, выданного</xsl:text>
											</p>
										</td>
									</tr>
								</table>
								<table>
									<tr>
										<td class="value" width="99%">
											<xsl:apply-templates select="rr:ApplicantInfomation"/>
											<br/>
										</td>
										<td class="annot" width="1%" align="right">
											<xsl:text>,</xsl:text>
										</td>
									</tr>
								</table>
								<table>
									<tr>
										<td class="underline">
											<xsl:text>(указывается наименование лица, получившего разрешение на переработку товаров на таможенной территории)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="annot">
											<p style="text-align: justify;">
												<xsl:text>уведомляем об отказе в осуществлении передачи указанного разрешения на переработку товаров на таможенной территории иному лицу по следующим основаниям.</xsl:text>
											</p>
										</td>
									</tr>
								</table>
								<br/>
								<table class="ext_border"> <!--таблица в таблице для красивого отступа от внешних границ-->
									<tr>
										<td align="center">
											<table class="int">
												<tr>
													<td class="annot">
														<p style="text-indent: 5%;text-align:justify;">
															<xsl:text>Причина(-ы) отказа: </xsl:text>
															<!--xsl:text>Причина (причины) отказа лицу, получившему разрешение на переработку товаров на таможенной территории, </xsl:text>
															<xsl:text>в передаче иному лицу такого разрешения на переработку товаров и их обоснование с указанием ссылок на положения, </xsl:text>
															<xsl:text>актов, составляющих право Евразийского экономического союза, и законодательства Российской Федерации </xsl:text>
															<xsl:text>в области таможенного регулирования.</xsl:text-->
														</p>
													</td>
												</tr>
												<xsl:for-each select="rr:ReasonInfo">
													<tr>
														<td class="value">
															<xsl:if test="$cnt_ri &gt; 1"><xsl:value-of select="position()"/><xsl:text>. </xsl:text></xsl:if>
															<xsl:apply-templates select="."/>
														</td>
													</tr>
												</xsl:for-each>
											</table>
										</td>
									</tr>
								</table>
								<br/>
								<table>
									<tr>
										<td class="annot">
											<xsl:apply-templates select="rr:PersonSignature">
												<xsl:with-param name="fio_descr" select="'Фамилия, имя, отчество (при наличии) начальника таможни (либо лица его замещающего)'"/>
											</xsl:apply-templates>
										</td>
									</tr>
									<tr>
										<td class="underline"> <br/></td>
									</tr>
								</table>
							</xsl:if>
						</xsl:when>
					</xsl:choose>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="*" mode="doc">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="rr:ArticleNumber">
			<xsl:text>, статья </xsl:text>
			<xsl:value-of select="rr:ArticleNumber"/>
		</xsl:if>
		<xsl:if test="rr:PartNumber">
			<xsl:text>, часть </xsl:text>
			<xsl:value-of select="rr:PartNumber"/>
		</xsl:if>
		<xsl:if test="rr:ClauseNumber">
			<xsl:text>, пункт </xsl:text>
			<xsl:value-of select="rr:ClauseNumber"/>
		</xsl:if>
	</xsl:template>
	<!--Шаблон для типа rr:ReasonInfoType-->
	<xsl:template match="rr:ReasonInfo">
		<xsl:apply-templates select="rr:Reason"/>
		<br/>
		<xsl:choose>
			<xsl:when test="count(rr:LawDocuments)=1"><xsl:text>Ссылка на правовой(-ые) акт(-ы): </xsl:text></xsl:when>
			<xsl:otherwise><xsl:text>Ссылки на правовые акты:</xsl:text></xsl:otherwise>
		</xsl:choose>
		<br/>
		<xsl:for-each select="rr:LawDocuments">
			<xsl:apply-templates select="." mode="doc"/>
			<xsl:if test="position()!=last()"><xsl:text>; </xsl:text></xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!--Шаблон для типа rr:ApplicantInfomationType-->
	<xsl:template match="rr:ApplicantInfomation">
		<xsl:value-of select="rr:OrganizationName"/>
		<xsl:if test="rr:ShortName">
			<xsl:if test="rr:OrganizationName">
				<xsl:text> (</xsl:text>
			</xsl:if>
			<xsl:value-of select="rr:ShortName"/>
			<xsl:if test="rr:OrganizationName">
				<xsl:text>)</xsl:text>
			</xsl:if>
		</xsl:if>
		<xsl:if test="(rr:OrganizationName or rr:ShortName) and rr:INN">
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="rr:INN">
			<xsl:text>ИНН </xsl:text>
			<xsl:value-of select="rr:INN"/>
		</xsl:if>
	</xsl:template>
	<!-- cat_ru:PersonSignatureType -->
	<xsl:template match="rr:PersonSignature">
		<xsl:param name="fio_descr" select="''"/>
		<xsl:param name="fio_descr_align" select="'center'"/>
		<table>
			<tbody>
				<tr>
					<td class="value" width="50%" align="center">
						<xsl:if test="cat_ru:PersonPost">
							<xsl:value-of select="cat_ru:PersonPost"/>
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:value-of select="cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonName"/>
						<xsl:if test="cat_ru:PersonMiddleName">
							<xsl:text> </xsl:text>
							<xsl:value-of select="cat_ru:PersonMiddleName"/>
						</xsl:if>
					</td>
					<td class="annot" width="3%"/>
					<td class="value" width="24%"/>
					<td class="annot" width="3%"/>
					<td class="value" width="20%" align="center">
						<xsl:if test="cat_ru:IssueDate">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
							</xsl:call-template>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td class="underline" style="text-align:{$fio_descr_align};">
						<xsl:value-of select="$fio_descr"/>
					</td>
					<td class="underline"/>
					<td class="underline" align="center">
						<xsl:text>(подпись)</xsl:text>
					</td>
					<td class="underline"/>
					<td class="underline" align="center">
						<xsl:text>(дата)</xsl:text>
					</td>
				</tr>
				<tr>
					<td class="underline" colspan="5"> <br/></td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа catProc_ru:PermitNumberType -->
	<xsl:template match="rr:PermitNumber">
		<xsl:value-of select="catProc_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="catProc_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="catProc_ru:ProcessingProcedureCode"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="catProc_ru:Number"/>
	</xsl:template>
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
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
