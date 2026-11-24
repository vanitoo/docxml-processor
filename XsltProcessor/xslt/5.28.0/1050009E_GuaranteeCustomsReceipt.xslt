<?xml version="1.0" encoding="utf-8"?>
<!--до версии АФ 5.14.4 Бланк регламентируется приказом Минфин России №86н от 09.06.2017, приложение №1 -->
<!-- Приказ ФТС России от 08.02.2019 г. № 212 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:grn_cr="urn:customs.ru:Information:GuaranteeDocuments:GuaranteeCustomsReceipt:5.24.0">
	<xsl:include href="SumInWords.xslt"/>
	<!-- Шаблон для типа GuaranteeCustomsReceiptType -->
	<xsl:template match="grn_cr:GuaranteeCustomsReceipt">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									}

									div.page {
									width: 190mm;
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

									table.border tr td
									{
									border: 1px solid gray;
									}

									.graph {
									font-family: Verdana;
									font-size: 8pt;
									font-weight: bold;
									}

									.graph_under {
									font-family: Verdana;
									font-size: 8pt;
									}

									.sign {
									font-family: Verdana;
									font-size: 10pt;
									font-style: italic;
									font-weight: normal;
									}

									.value
									{
									border-bottom: solid 1px black;
									}

									div.title, tr.title td { font-weight:bold;  }
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
								</style>
			</head>
			<body>
				<div class="page">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain graph">
									<font size="4">
										<b>Таможенная расписка</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td class="graph" style="border: 1px solid gray;width:50%;">
									1. Регистрационный номер<br/>
									<span class="sign">
										<xsl:apply-templates select="grn_cr:CustomsReceiptRegNumber"/>
									</span>
									<br/>
									<br/>
									<xsl:if test="not(grn_cr:CustomsReceiptRegNumber) and grn_cr:DTRegNumber">
										<xsl:text>Рег.номер ДТ </xsl:text>
										<span class="sign">
											<xsl:apply-templates select="grn_cr:DTRegNumber"/>
										</span>
									</xsl:if>
								</td>
								<td class="graph" style="border: 1px solid gray;width:50%;">
									<table>
										<tbody>
											<tr valign="top">
												<td class="graph" style="border-right:1px solid gray;width:50%">
													2. Способ обеспечения<br/>
													<xsl:for-each select="grn_cr:WayEnsure">
														<span class="sign">
															<!--xsl:apply-templates select="grn_crWayEnsureCode"/>
															<xsl:text> </xsl:text-->
															<xsl:apply-templates select="grn_cr:WayEnsureName"/>
														</span>
													</xsl:for-each>
												</td>
												<td class="graph" style="width:50%" valign="top">
													3. Генеральное обеспечение<br/>
													<span class="sign">
														<xsl:choose>
															<xsl:when test="grn_cr:GeneralEnsure">
																<xsl:if test="grn_cr:GeneralEnsure != '0'">
																	<!--xsl:apply-templates select="grn_cr:GeneralEnsure"/-->
																	<xsl:value-of select="'ГО'"/>
																</xsl:if>
															</xsl:when>
															<xsl:otherwise>
																<!--&#8212;--> -
															</xsl:otherwise>
														</xsl:choose>
													</span>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="graph" style="border-left: 1px solid gray;">
									4. Декларант / Плательщик
								</td>
								<td class="graph" style="border: 1px solid gray;">
									4.1. Статус плательщика 
									<span class="sign">
										<xsl:if test="grn_cr:PayerDutiesAndTaxes/grn_cr:PersonModeCode='Ф'">Ф</xsl:if>
										<xsl:if test="grn_cr:PayerDutiesAndTaxes/grn_cr:PersonModeCode='О'">О</xsl:if>
									</span>
								</td>
							</tr>
							<tr>
								<td class="graph" colspan="2" style="border-left: 1px solid gray;border-right:1px solid gray; border-bottom: 1px solid gray;">
									<span class="sign">
										<xsl:apply-templates select="grn_cr:PayerDutiesAndTaxes"/>
									</span>
								</td>
							</tr>
							<tr>
								<td class="graph" colspan="2" style="border-left: 1px solid gray;border-right:1px solid gray; border-bottom: 1px solid gray;">
									5. Лицо, предоставившее обеспечение
									<br/>
									<span class="sign">
										<xsl:apply-templates select="grn_cr:PersonEnsuring"/>
									</span>
								</td>
							</tr>
							<tr>
								<td class="graph" colspan="2" style="border-left: 1px solid gray;border-right:1px solid gray; border-bottom: 1px solid gray;">
									6. Гарант / поручитель / залогодатель
									<br/>
									<span class="sign">
										<xsl:apply-templates select="grn_cr:Guarantor"/>
									</span>
								</td>
							</tr>
							<tr>
								<td class="graph" colspan="2" style="border-left: 1px solid gray;border-right:1px solid gray; border-bottom: 1px solid gray;">
									7. Информация / сведения о документах
									<br/>
									<span class="sign">
										<xsl:for-each select="grn_cr:DetailsEnsure/grn_cr:RecDetailsEnsure/grn_cr:DetailsDocuments">
											<xsl:apply-templates select="cat_ru:PrDocumentName"/>
											<xsl:text> № </xsl:text>
											<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
											<xsl:text> от </xsl:text>
											<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
											<!--xsl:text> сумма </xsl:text>
											<xsl:apply-templates select="grn_crDocAmount"/-->
											<br/>
										</xsl:for-each>
										<!--xsl:for-each select="grn_cr:PresentedDocuments">
											<xsl:apply-templates select="cat_ru:PrDocumentName"/>
											<xsl:if test="cat_ru:PrDocumentNumber">
												<xsl:text> № </xsl:text>
												<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
											</xsl:if>
											<xsl:if test="cat_ru:PrDocumentDate">
												<xsl:text> от </xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:text> </xsl:text>
											<xsl:if test="grn_cr:DocCode">
												<xsl:value-of select="concat('(',grn_cr:DocCode,')')"/>
											</xsl:if>
											<xsl:text> </xsl:text>
											<xsl:choose>
												<xsl:when test="grn_cr:DocumentKind='0'">ДТ</xsl:when>
												<xsl:when test="grn_cr:DocumentKind='1'">Обязательство о подаче ДТ</xsl:when>
												<xsl:when test="grn_cr:DocumentKind='2'">Заявление на условный выпуск</xsl:when>
												<xsl:when test="grn_cr:DocumentKind='3'">Разрешение на временное хранение в иных местах</xsl:when>
												<xsl:when test="grn_cr:DocumentKind='4'">Акт отбора проб и образцов</xsl:when>
											</xsl:choose>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each-->
									</span>
								</td>
							</tr>
							<tr>
								<td class="graph" colspan="2" style="border-left: 1px solid gray;border-right:1px solid gray; border-bottom: 1px solid gray;">
									8. Сведения о принятом обеспечении<br/>
									<br/>
									<table>
										<tbody>
											<tr>
												<td class="graph" width="40%" style="border-top:1px solid gray;border-right:1px solid gray;border-bottom:1px solid gray;" valign="top" align="center">Вид<br/>платежа</td>
												<td class="graph" width="60%" style="border-top:1px solid gray;border-bottom:1px solid gray;" valign="top" align="center">Сумма</td>
												<!--td class="graph" width="10%" style="border-right:1px solid gray;" valign="top" align="center">Вид<br/>платежа</td>
												<td class="graph" width="20%" style="border-right:1px solid gray;" valign="top" align="center">Сумма</td>
												<td class="graph" width="10%" style="border-right:1px solid gray;" valign="top" align="center">Способ<br/>платежа</td>
												<td class="graph" width="60%" valign="top" align="center">Реквизиты документов обеспечения</td-->
											</tr>
											<xsl:for-each select="grn_cr:DetailsEnsure/grn_cr:RecDetailsEnsure">
												<tr>
													<td class="sign" style="border-top:1px solid gray; border-right:1px solid gray;" valign="top" align="center">
														<xsl:apply-templates select="grn_cr:PaymentModeCode"/>
													</td>
													<td class="sign" style="border-top:1px solid gray;" valign="top" align="right">
														<xsl:apply-templates mode="format_number_2" select="grn_cr:PaymentAmount"/>
													</td>
													<!--td class="sign" style="border-top:1px solid gray; border-right:1px solid gray;" valign="top" align="center">
														<xsl:apply-templates select="grn_crPaymentMethodCode"/>
													</td>
													<td class="sign" style="border-top:1px solid gray;" valign="top">
														<xsl:for-each select="grn_cr:DetailsDocuments">
															<xsl:apply-templates select="cat_ru:PrDocumentName"/>
															<xsl:text> № </xsl:text>
															<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
															<xsl:text> от </xsl:text>
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
															</xsl:call-template>
															<xsl:text> сумма </xsl:text>
															<xsl:apply-templates select="grn_crDocAmount"/>
														</xsl:for-each>
													</td-->
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="graph" colspan="2" style="border-left: 1px solid gray;border-right:1px solid gray; border-bottom: 1px solid gray;">
									<table>
										<tbody>
											<tr>
												<td class="graph" width="40%" style="border-right:1px solid gray;" valign="top" align="left">Сумма прописью:</td>
												<td class="sign" width="60%" valign="top" align="center">
													<span class="sign">
														<xsl:variable name="splittedSum">
															<xsl:value-of select="translate(grn_cr:DetailsEnsure/grn_cr:TotalAmount,'.',',')"/>
														</xsl:variable>
														<xsl:variable name="integerPart">
															<xsl:choose>
																<xsl:when test="substring-before($splittedSum,',')!=''">
																	<xsl:value-of select="substring-before($splittedSum,',')"/>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:value-of select="$splittedSum"/>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:variable>
														<xsl:variable name="fractionalPart" select="substring-after($splittedSum,',')"/>
														<xsl:choose>
															<xsl:when test="$integerPart!='0'">
																<xsl:call-template name="RecurseSumWords">
																	<xsl:with-param name="Value" select="$integerPart"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>0</xsl:otherwise>
														</xsl:choose>
														<xsl:text> руб. </xsl:text>
														<xsl:if test="$fractionalPart!=''">
															<xsl:value-of select="substring(concat($fractionalPart,'00'),1,2)"/>
															<xsl:text> коп.</xsl:text>
														</xsl:if>
													</span>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="graph" style="border:1px solid gray;" valign="top" colspan="2">
									9. Отметки таможенного органа <br/>
									<table width="100%">
										<col width="30%" align="left" valign="top"/>
										<col width="5%" align="left" valign="top"/>
										<col width="65%" align="left" valign="top"/>
										<tbody>
											<tr>
												<td class="sign">
													<table width="100%">
														<tbody>
															<tr>
																<td class="sign" align="center">
																	<xsl:choose>
																		<xsl:when test="grn_cr:CustomsReceiptOfficialMark">
																			<xsl:apply-templates select="grn_cr:CustomsReceiptOfficialMark/grn_cr:CustomsReceiptCompletDateTime" mode="russian_date"/>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="substring(grn_cr:CustomsReceiptOfficialMark/grn_cr:CustomsReceiptCompletDateTime, 12, 8)"/>
																		</xsl:when>
																		<xsl:otherwise>
																			<br/>
																		</xsl:otherwise>
																	</xsl:choose>
																</td>
															</tr>
															<tr>
																<td class="graph_under" style="border-top: solid 1px black;" align="center">
																	<text>(дата, время)</text>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td rowspan="2"/>
												<td rowspan="2" class="sign">
													<xsl:apply-templates select="grn_cr:CustomsReceiptOfficialMark/grn_cr:CustomsPerson/cat_ru:PersonName"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="grn_cr:CustomsReceiptOfficialMark/grn_cr:CustomsPerson/cat_ru:LNP"/>
													<xsl:if test="grn_cr:CustomsReceiptOfficialMark/grn_cr:CustomsPerson/cat_ru:CustomsCode">
														<xsl:text> (код ТО: </xsl:text>
														<xsl:apply-templates select="grn_cr:CustomsReceiptOfficialMark/grn_cr:CustomsPerson/cat_ru:CustomsCode"/>
														<xsl:text>)</xsl:text>
													</xsl:if>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<!--td class="graph" style="border-right:1px solid gray;border-bottom:1px solid gray;" valign="top" width="50%">
									10. Признак корректировки <br/>
									<table width="100%">
										<col width="50%" align="left" valign="top"/>
										<col width="5%" align="left" valign="top"/>
										<col width="45%" align="left" valign="top"/>
										<tbody>
											<tr>
												<td valign="top">
													<table width="100%">
														<tbody>
															<tr>
																<td class="sign" width="50%" valign="top">
																	<xsl:choose>
																		<xsl:when test="grn_cr:CustomsReceiptCorrectMark/grn_cr:LastCorrectDateTime">
																			<xsl:call-template name="russian_date">
																				<xsl:with-param name="dateIn" select="grn_cr:CustomsReceiptCorrectMark/grn_cr:LastCorrectDateTime"/>
																			</xsl:call-template>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="substring(grn_cr:CustomsReceiptCorrectMark/grn_cr:LastCorrectDateTime,12,8)"/>
																		</xsl:when>
																		<xsl:otherwise><br/></xsl:otherwise>
																	</xsl:choose>
																</td>
															</tr>
															<tr>
																<td class="graph_under" width="50%" style="border-top: solid 1px black;" align="center">
																	<text>(дата, время)</text>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td></td>
												<td class="sign" valign="top">
													<table align="left">
														<tbody>
															<tr style="height:4mm;" align="center">
																<td class="graph" style="width:5mm;">да</td>
																<td class="graph" style="width:4mm;border:1px solid gray;font-family:Arial;">
																	<xsl:if test="grn_cr:CustomsReceiptCorrectMark/grn_cr:CorrectSign='t' or grn_cr:CustomsReceiptCorrectMark/grn_cr:CorrectSign='true' or grn_cr:CustomsReceiptCorrectMark/grn_cr:CorrectSign='1'">
																		<xsl:text>v</xsl:text>
																	</xsl:if>
																</td>
																<td class="graph" style="width:5mm;"></td>
																<td class="graph" style="width:5mm;">нет</td>
																<td class="graph" style="width:4mm;border:1px solid gray;font-family:Arial;">
																	<xsl:if test="grn_cr:CustomsReceiptCorrectMark/grn_cr:CorrectSign='f' or grn_cr:CustomsReceiptCorrectMark/grn_cr:CorrectSign='false' or grn_cr:CustomsReceiptCorrectMark/grn_cr:CorrectSign='0'">
																		<xsl:text>v</xsl:text>
																	</xsl:if>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="sign" valign="top">
													<xsl:apply-templates select="grn_cr:CustomsReceiptCorrectMark/grn_cr:CustomsPerson/cat_ru:PersonName"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="grn_cr:CustomsReceiptCorrectMark/grn_cr:CustomsPerson/cat_ru:LNP"/>
													<xsl:if test="grn_cr:CustomsReceiptCorrectMark/grn_cr:CustomsPerson/cat_ru:CustomsCode">
														<xsl:text> (код ТО: </xsl:text>
														<xsl:apply-templates select="grn_cr:CustomsReceiptCorrectMark/grn_cr:CustomsPerson/cat_ru:CustomsCode"/>
														<xsl:text>)</xsl:text>
													</xsl:if>
												</td>
											</tr>

										</tbody>
									</table>
								</td-->
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="grn_cr:PayerDutiesAndTaxes|grn_cr:PersonEnsuring|grn_cr:Guarantor">
		<!-- для граф 3, 4, 5-->
		<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
		<xsl:if test="RUScat_ru:ShortName and not(RUScat_ru:OrganizationName)">
			<xsl:apply-templates select="RUScat_ru:ShortName"/>
		</xsl:if>
		<xsl:if test="grn_cr:OrganizationForm">
			<br/>
			Организационно-правовая форма: <xsl:apply-templates select="grn_crOrganizationForm"/>
		</xsl:if>
		<xsl:if test="grn_cr:Address">
			<br/>
			Адрес: <xsl:apply-templates select="grn_cr:Address"/>
		</xsl:if>
		<xsl:if test="grn_cr:FactAddress">
			<br/>
			Место нахождения: <xsl:apply-templates select="grn_cr:FactAddress"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:RFOrganizationFeatures">
			<br/>
			<xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="grn_cr:OKPOID">
			<br/>
			ОКПО: <xsl:apply-templates select="grn_crOKPOID"/>
		</xsl:if>
		<xsl:if test="grn_cr:BirthDate">
			<br/>
			Дата рождения: 
			<xsl:apply-templates select="grn_cr:BirthDate" mode="russian_date"/>
		</xsl:if>
		<xsl:if test="grn_cr:IdentityCard">
			<br/>
			Документ, удостоверяющий личность: <xsl:apply-templates select="grn_cr:IdentityCard"/>
		</xsl:if>
		<!--xsl:if test="grn_cr:ResidentRFSign">
			<xsl:if test="grn_cr:ResidentRFSign='true' or grn_cr:ResidentRFSign='1' or grn_cr:ResidentRFSign='t' or grn_cr:ResidentRFSign=true or grn_cr:ResidentRFSign='false' or grn_cr:ResidentRFSign='0' or grn_cr:ResidentRFSign='f' or grn_cr:ResidentRFSign=false">
				<br/>
				Резидент: 
				<xsl:if test="grn_cr:ResidentRFSign='true' or grn_cr:ResidentRFSign='1' or grn_cr:ResidentRFSign='t' or grn_cr:ResidentRFSign=true">Да</xsl:if>
				<xsl:if test="grn_cr:ResidentRFSign='false' or grn_cr:ResidentRFSign='0' or grn_cr:ResidentRFSign='f' or grn_cr:ResidentRFSign=false">Нет</xsl:if>
			</xsl:if>	
		</xsl:if-->
		<xsl:if test="grn_cr:RegCountry">
			<br/>
			Страна регистрации / гражданство: <xsl:apply-templates select="grn_crRegCountry"/>
		</xsl:if>
		<xsl:if test="grn_cr:AddressRFForForeign">
			<br/>
			Место жительства в РФ: <xsl:apply-templates select="grn_cr:AddressRFForForeign"/>
		</xsl:if>
		<xsl:if test="grn_cr:UITN">
			<br/>
			<xsl:apply-templates mode="UITN" select="grn_cr:UITN"/>
		</xsl:if>
		<xsl:if test="grn_cr:Contact">
			<br/>
			Контакты: <xsl:apply-templates select="grn_cr:Contact"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="grn_cr:Contact">
		<xsl:if test="cat_ru:Phone">
			<xsl:text>тел.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:text> факс: </xsl:text>
			<xsl:apply-templates select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:text> телекс: </xsl:text>
			<xsl:apply-templates select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:text> e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="grn_cr:IdentityCard">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="contains(local-name(.),'Date')">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="UITN" match="*">
			УИТН: <xsl:apply-templates select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">&#160;(<xsl:apply-templates select="RUScat_ru:CountryCode"/>)</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			ОГРН: <xsl:apply-templates select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text> </xsl:text>
			ИНН: <xsl:apply-templates select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> </xsl:text>
			КПП: <xsl:apply-templates select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="grn_cr:Address|grn_cr:FactAddress|grn_cr:AddressRFForForeign">
		<xsl:for-each select="*">
			<xsl:apply-templates select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="russian_date_gdt">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="grn_cr:CustomsReceiptRegNumber|grn_cr:DTRegNumber">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date_gtd"/>
		<xsl:text>/</xsl:text>
		<xsl:if test="grn_cr:DocNumberPrefix">
			<xsl:apply-templates select="grn_cr:DocNumberPrefix"/>
			<xsl:text>-</xsl:text>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template match="//*[local-name()='GuaranteeCustomsReceipt']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
	<xsl:template name="get_xpath">
		<xsl:param name="node" select="."/>
		<xsl:variable name="xpath">
			<xsl:for-each select="$node/ancestor-or-self::*">
				<xsl:variable name="name">
					<xsl:value-of select="name()"/>
				</xsl:variable>
				<xsl:variable name="pos">
					<xsl:value-of select="count(node()/parent::*/preceding-sibling::*[name()=$name])"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="position()=last()">
						<xsl:value-of select="concat($name,'[',$pos,']')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($name,'[',$pos,']','/')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:value-of select="$xpath"/>
	</xsl:template>
	<xsl:template match="*" mode="russian_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="russian_date_gtd">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="russian_date_gtd">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_gtd">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
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
	<xsl:template match="*" mode="format_number_2">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="format-number(.,'0.00')"/>
		</element>
	</xsl:template>
</xsl:stylesheet>
