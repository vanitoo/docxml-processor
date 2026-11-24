<?xml version="1.0" encoding="utf-8"?>
<!-- Приказ ФТС России от 21.11.2018 г. № 1876 "Об утверждении форм документов, применяемых таможенными органами в целях обеспечения взыскания таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней за счет имущества и обращения взыскания на товары"
Приложение 1 (DocumentType =0, OrderType = 0) - Решение таможенного органа о наложении ареста на имущество
Приложение 2 (DocumentType =0, OrderType = 1) - Решение таможенного органа на пользование и распоряжение имуществом, на которое наложен арест
Приложение 7 (DocumentType =1, OrderType = 0) - Решение таможенного органа об отмене ареста имущества
Приложение 8 (DocumentType =0, OrderType = 2) - Решение таможенного органа о наложении ареста на товары
Приложение 9 (DocumentType =0, OrderType = 3) - Решение таможенного органа об обращении взыскания на товары
Приложение 11 (DocumentType =1, OrderType = 2) - Решение таможенного органа об отмене ареста товаров
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:imar="urn:customs.ru:Information:CustomsAuditDocuments:ImpositionArrest:5.28.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ImpositionArrestType -->
	<xsl:template match="imar:ImpositionArrest">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					font-family: Arial;}

					div
					{
					/*white-space: nowrap;*/
					}

					div.page {
					width: 180mm;
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
					font-family: Arial;
					font-size: 10pt;
					}

					.value
					{
					border-bottom: solid 1px black;
					font-style: italic;
					text-align: center;
					}

					div.title, tr.title td { font-weight:bold;  }
					.bordered { border-collapse: collapse; }
					td.bordered
					{
					border: solid 1px windowtext;
					}

					.delim_3 {
					height: 3pt;
					}

					td.graphMain
					{
					vertical-align:top;
					}
					td.value.graphMain
					{
					vertical-align:bottom;
					}
					.graph8{
					font-size:8pt;
					}
					div.cellwidener {
					margin-top: 0pt;
					margin-left: 0pt;
					margin-bottom: 0pt;
					margin-right: 5pt;
					}
					.indent{
					 text-indent: 1.5em;
					}	
					underline 
					{ text-decoration: underline; }
				</style>
			</head>
			<body>
				<div class="page">
					<xsl:choose>
						<!--Приложение 1 - Решение таможенного органа о наложении ареста на имущество-->
						<xsl:when test="imar:DocumentInfo/imar:DocumentType='0' and imar:DocumentInfo/imar:OrderType='0'">
							<table width="100%">
								<tbody>
									<tr valign="top">
										<td width="50%"/>
										<td width="50%"/>
									</tr>
									<tr valign="top">
										<td/>
										<td align="center">САНКЦИОНИРУЮ</td>
									</tr>
									<tr valign="top">
										<td class="delim_3" colspan="2"/>
									</tr>
									<tr valign="top">
										<td align="right">Прокурор</td>
										<td class="value">
											<xsl:value-of select="imar:DocumentInfo/imar:ProsecutorPerson/imar:ProsecutorOffice"/>
										</td>
									</tr>
									<tr valign="top">
										<td/>
										<td align="center" class="graph8">(наименование органа прокуратуры)</td>
									</tr>
									<tr valign="top">
										<td/>
										<td class="value">
											<xsl:apply-templates select="imar:DocumentInfo/imar:ProsecutorPerson" mode="personBase"/>
											<xsl:value-of select="imar:DocumentInfo/imar:ProsecutorPerson/imar:ClassRank"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr valign="top">
										<td/>
										<td align="center" class="graph8">(фамилия, имя, отчество (при наличии), классный чин)</td>
									</tr>
									<tr valign="top">
										<td/>
										<td class="value">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr valign="top">
										<td/>
										<td align="center" class="graph8">(подпись, печать)</td>
									</tr>
									<tr valign="top">
										<td/>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td colspan="2" align="right">
											<xsl:call-template name="text_date">
												<xsl:with-param select="imar:DocumentInfo/imar:ProsecutorPerson/cat_ru:IssueDate" name="date"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td class="delim_3" colspan="2">
											<br/>
										</td>
									</tr>
									<tr align="center" valign="top">
										<td colspan="2">
											<b>
												<xsl:text>Решение таможенного органа о наложении ареста на имущество   </xsl:text>
												<br> № <span class="value">&#160;  <xsl:value-of select="imar:DocumentInfo/imar:RequisitesDocument/cat_ru:PrDocumentNumber"/>&#160;  </span>
												</br>
											</b>
										</td>
									</tr>
									<tr>
										<td class="delim_3" colspan="2">
											<br/>
										</td>
									</tr>
								</tbody>
							</table>
							<table width="100%">
								<tbody>
									<tr>
										<td class="value" width="35%">
											<xsl:value-of select="imar:DocumentInfo/imar:CustomsOffice/imar:City"/>
										</td>
										<td width="30%"/>
										<td align="right" width="35%">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="imar:DocumentInfo/imar:RequisitesDocument/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td align="center" class="graph8">(населенный пункт)</td>
										<td colspan="2"/>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:apply-templates select="imar:DocumentInfo/imar:CustomsOffice"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(наименование таможенного органа)</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>в связи с неисполнением (ненадлежащим исполнением) плательщиком (лицом, несущим солидарную обязанность </xsl:text>
											<xsl:text>с плательщиком по уплате таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней) обязанности </xsl:text>
											<xsl:text>по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней в срок, </xsl:text>
											<xsl:text>установленный правом Евразийского экономического союза и (или) законодательством Российской Федерации о таможенном </xsl:text>
											<xsl:text>регулировании, исчисленных (начисленных):</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr valign="top" align="center">
														<td class="bordered" width="10%">№ п/п</td>
														<td class="bordered" width="50%">Реквизиты уведомления (уточнения к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней</td>
														<td class="bordered" width="40%">Срок исполнения обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней</td>
													</tr>
													<xsl:for-each select="imar:DocumentInfo/imar:GroundsArrests/imar:NotificationOrCorrDeclDocument">
														<tr align="center">
															<td class="bordered">
																<xsl:value-of select="imar:SerialNumber"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="imar:PrDocumentNumber"/>
																<xsl:if test="imar:PrDocumentDate">
																	<xsl:text> от </xsl:text>
																	<xsl:apply-templates mode="russian_date" select="imar:PrDocumentDate"/>
																</xsl:if>
															</td>
															<td class="bordered">
																<xsl:apply-templates mode="russian_date" select="imar:DocDatePeriodExecution"/>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>на основании части 9 статьи 78 Федерального закона от 3 августа 2018 г. №&#160;289-ФЗ "О таможенном регулировании </xsl:text>
											<xsl:text>в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации", принимает решение:</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify; text-indent:5%;">
											<xsl:text>В обеспечение полноты взыскания подлежащих уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней в сумме </xsl:text>
											<span class="value">&#160;&#160;&#160;<xsl:value-of select="imar:DocumentInfo/imar:GroundsArrests/imar:Amount/imar:PaymentAmount"/>&#160;&#160;&#160;</span>
											<xsl:text> рублей, в том числе: таможенные платежи, специальные, антидемпинговые, компенсационные пошлины </xsl:text>
											<span class="value">&#160;&#160;&#160;<xsl:value-of select="imar:DocumentInfo/imar:GroundsArrests/imar:Amount/imar:FeesPaymentAmount"/>&#160;&#160;&#160;</span>
											<xsl:text> рублей,  пени </xsl:text>
											<span class="value">&#160;&#160;&#160;<xsl:value-of select="imar:DocumentInfo/imar:GroundsArrests/imar:Amount/imar:FinePaymentAmount"/>&#160;&#160;&#160;</span>
											<xsl:text> рублей, проценты </xsl:text>
											<span class="value">&#160;&#160;&#160;<xsl:value-of select="imar:DocumentInfo/imar:GroundsArrests/imar:Amount/imar:PercentPaymentAmount"/>&#160;&#160;&#160;</span>
											<xsl:text> рублей, наложить арест на имущество </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="imar:DocumentInfo/imar:Organization"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(сведения о лице, на имущество которого налагается арест: для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика; для индивидуального предпринимателя - фамлия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер налогоплательщика)<span>
												<!--sup>1</sup-->
											</span>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>находящееся по адресу:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td class="value" width="99%">
															<xsl:value-of select="imar:DocumentInfo/imar:LocationInformation"/>
														</td>
														<td width="1%">
															<xsl:text>,</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td align="center" class="graph8">
											<xsl:text>(сведения о местонахождении имущества)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>включающее:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr valign="top" align="center">
														<td class="bordered" width="10%">№ п/п</td>
														<td class="bordered" width="40%">Наименование</td>
														<td class="bordered" width="15%">Количество (ед. изм)</td>
														<td class="bordered" width="35%">Индивидуальные признаки</td>
													</tr>
													<xsl:for-each select="imar:DocumentInfo/imar:ListArrest">
														<tr align="center">
															<td class="bordered">
																<xsl:value-of select="imar:SerialNumber"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="imar:NameProperty"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="imar:Quantitypoint"/>&#160;<xsl:if test="imar:MeasureUnitOperation">
																	<xsl:value-of select="imar:MeasureUnitOperation"/>
																</xsl:if>
																<xsl:if test="imar:MeasureUnitOperationCode">
													(<xsl:value-of select="imar:MeasureUnitOperationCode"/>)
													</xsl:if>
															</td>
															<td class="bordered">
																<xsl:value-of select="imar:Characteristics"/>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="imar:DocumentInfo/imar:DocumentSignature/imar:CustChiefSignature"/>
							<br/>
							<xsl:apply-templates select="imar:DocumentInfo/imar:DocumentSignature/imar:ExecutiveSignature"/>
							<br/>
							<br/>
							<!--table width="100%">
								<tbody>
									<tr>
										<td width="30%" class="value"/>
										<td width="70%"/>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>1 </sup>
											<xsl:text>Указывается для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика, основной государственный регистрационный номер налогоплательщика (если известен);</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<xsl:text>указывается для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер налогоплательщика (индивидуального предпринимателя), основной государственный регистрационный номер предпринимателя (если известен)</xsl:text>
										</td>
									</tr>
								</tbody>
							</table-->
						</xsl:when>
						<!--Приложение 2 - Решение таможенного органа на пользование и распоряжение имуществом, на которое наложен арест-->
						<xsl:when test="imar:DocumentInfo/imar:DocumentType='0' and imar:DocumentInfo/imar:OrderType='1'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td colspan="3">
											<br/>
											<br/>
											<b>
												<xsl:text>Разрешение таможенного органа Российскоф Федерации</xsl:text>
												<br/>
												<xsl:text>на пользование и распоряжение имуществом, на которое наложен арест </xsl:text>
												<br> № <span class="value">&#160;  <xsl:value-of select="imar:DocumentInfo/imar:RequisitesDocument/cat_ru:PrDocumentNumber"/>&#160;  </span>
												</br>
											</b>
										</td>
									</tr>
									<tr>
										<td class="delim_3" colspan="3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value" width="35%">
											<xsl:value-of select="imar:DocumentInfo/imar:CustomsOffice/imar:City"/>
										</td>
										<td width="30%"/>
										<td align="right" width="35%">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="imar:DocumentInfo/imar:RequisitesDocument/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td align="center" class="graph8">(населенный пункт)</td>
										<td colspan="2"/>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr valign="top" align="center">
														<td width="99%" class="value">
															<xsl:apply-templates select="imar:DocumentInfo/imar:CustomsOffice"/>
														</td>
														<td width="1%">
															<xsl:text>,</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(наименование таможенного органа Российской Федерации)</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>рассмотрев заявление</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="imar:DocumentInfo/imar:Organization"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(сведения о заявителе, на имущество которого наложен арест: для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика; для индивидуального предпринимателя - фамилия, имя, отвчество (при наличии), адрес (место нахождения), идентификационный номер налогоплательщика)<span>
												<!--sup>1</sup-->
											</span>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="imar:DocumentInfo/imar:BaseDocument/imar:AdvancedBaseDocument/imar:Statement/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> № </xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="imar:DocumentInfo/imar:BaseDocument/imar:AdvancedBaseDocument/imar:Statement/cat_ru:PrDocumentNumber"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<xsl:text> на владение, пользование и распоряжение имуществом, в отношении которого принято решение таможенного органа Российской Федерации о наложении ареста на имущество от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="imar:DocumentInfo/imar:BaseDocument/imar:AdvancedBaseDocument/imar:Indocrn/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> № </xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="imar:DocumentInfo/imar:BaseDocument/imar:AdvancedBaseDocument/imar:Indocrn/cat_ru:PrDocumentNumber"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<xsl:text> , на основании части 5 статьи 78 Федерального закона от 3 августа 2018 г. №&#160;289-ФЗ "О таможенном регулировании в Российской Федерации и </xsl:text>
											<xsl:text>о внесении изменений в отдельные законодательные акты Российской Федерации", принимает решение: </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify; text-indent:5%;">
											<xsl:text>Разрешить в период с </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="imar:DocumentInfo/imar:BaseDocument/imar:AdvancedBaseDocument/imar:StartDateAct" name="date"/>
											</xsl:call-template>
											<xsl:text> по </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="imar:DocumentInfo/imar:BaseDocument/imar:AdvancedBaseDocument/imar:EndDateAct" name="date"/>
											</xsl:call-template>
											<xsl:text> совершать следующие действия: </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:value-of select="imar:DocumentInfo/imar:BaseDocument/imar:AdvancedBaseDocument/imar:ActionsProp"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(действия по пользованию и распоряжению имуществом, разрешенные таможенным органом)</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>в отношении арестованного имущества:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr valign="top" align="center">
														<td class="bordered" width="10%">№ п/п</td>
														<td class="bordered" width="40%">Наименование</td>
														<td class="bordered" width="15%">Количество (ед. изм)</td>
														<td class="bordered" width="35%">Индивидуальные признаки</td>
													</tr>
													<xsl:for-each select="imar:DocumentInfo/imar:ListArrest">
														<tr align="center">
															<td class="bordered">
																<xsl:value-of select="imar:SerialNumber"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="imar:NameProperty"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="imar:Quantitypoint"/>&#160;<xsl:if test="imar:MeasureUnitOperation">
																	<xsl:value-of select="imar:MeasureUnitOperation"/>
																</xsl:if>
																<xsl:if test="imar:MeasureUnitOperationCode">
													(<xsl:value-of select="imar:MeasureUnitOperationCode"/>)
													</xsl:if>
															</td>
															<td class="bordered">
																<xsl:value-of select="imar:Characteristics"/>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>Имущество должно находиться:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="imar:DocumentInfo/imar:BaseDocument/imar:AdvancedBaseDocument/imar:Organization"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(сведения о лице, которому передано на хранение имущество<!--sup>2</sup-->: для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номре налогоплательщика; для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер налогоплательщика; адрес и место хранения имущества)</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="imar:DocumentInfo/imar:DocumentSignature/imar:CustChiefSignature"/>
							<br/>
							<xsl:apply-templates select="imar:DocumentInfo/imar:DocumentSignature/imar:ExecutiveSignature"/>
							<br/>
							<br/>
							<!--table width="100%">
								<tbody>
									<tr>
										<td width="30%" class="value"/>
										<td width="70%"/>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>1 </sup>
											<xsl:text>Указывается для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика, </xsl:text>
											<xsl:text>основной государственный регистрационный номер налогоплательщика (если известен);</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<xsl:text>указывается для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер </xsl:text>
											<xsl:text>налогоплательщика (индивидуального предпринимателя), основной государственный регистрационный номер предпринимателя (если известен).</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>2 </sup>
											<xsl:text>Указывается для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика, </xsl:text>
											<xsl:text>основной государственный регистрационный номер налогоплательщика (если известен);</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<xsl:text>указывается для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер </xsl:text>
											<xsl:text>налогоплательщика (индивидуального предпринимателя), основной государственный регистрационный номер предпринимателя (если известен).</xsl:text>
										</td>
									</tr>
								</tbody>
							</table-->
						</xsl:when>
						<!--Приложение 7 - Решение таможенного органа об отмене ареста имущества-->
						<xsl:when test="imar:DocumentInfo/imar:DocumentType='1' and imar:DocumentInfo/imar:OrderType='0'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td colspan="3">
											<br/>
											<br/>
											<b>
												<xsl:text>Решение таможенного органа Российской Федерации</xsl:text>
												<br/>
												<xsl:text>об отмене ареста имущества </xsl:text>
												<br> № <span class="value">&#160;  <xsl:value-of select="imar:DocumentInfo/imar:RequisitesDocument/cat_ru:PrDocumentNumber"/>&#160;  </span>
												</br>
											</b>
										</td>
									</tr>
									<tr>
										<td class="delim_3" colspan="2">
											<br/>
										</td>
									</tr>
								</tbody>
							</table>
							<table width="100%">
								<tbody>
									<tr>
										<td class="value" width="35%">
											<xsl:value-of select="imar:DocumentInfo/imar:CustomsOffice/imar:City"/>
										</td>
										<td width="30%"/>
										<td align="right" width="35%">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="imar:DocumentInfo/imar:RequisitesDocument/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td align="center" class="graph8">(населенный пункт)</td>
										<td colspan="2"/>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:apply-templates select="imar:DocumentInfo/imar:CustomsOffice"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(наименование таможенного органа)</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>на основании подпункта "</xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="imar:DocumentInfo/imar:BaseCancellation"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<xsl:text>" части 41 статьи 78 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" принимает решение:</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify; text-indent:5%;">
											<xsl:text>Отменить решение таможенного органа о наложении ареста на имущество от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="imar:DocumentInfo/imar:BaseDocument/imar:ForeclosureGoods/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> № </xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="imar:DocumentInfo/imar:BaseDocument/imar:ForeclosureGoods/cat_ru:PrDocumentNumber"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<xsl:text> и снять наложенный в отношении имущества </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="imar:DocumentInfo/imar:Organization"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(сведения о лице, на имущество которого наложен арест: для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика; для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер налогоплательщика)<span>
												<!--sup>1</sup-->
											</span>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>арест имущества, находящегося по адресу </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td class="value" width="99%">
															<xsl:value-of select="imar:DocumentInfo/imar:LocationInformation"/>
														</td>
														<td width="1%">
															<xsl:text>,</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td align="center" class="graph8">
											<xsl:text>(сведения о местонахождении арестованного имущества)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>включающего:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr valign="top" align="center">
														<td class="bordered" width="10%">№ п/п</td>
														<td class="bordered" width="40%">Наименование</td>
														<td class="bordered" width="15%">Количество (ед. изм)</td>
														<td class="bordered" width="35%">Индивидуальные признаки</td>
													</tr>
													<xsl:for-each select="imar:DocumentInfo/imar:ListArrest">
														<tr align="center">
															<td class="bordered">
																<xsl:value-of select="imar:SerialNumber"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="imar:NameProperty"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="imar:Quantitypoint"/>&#160;<xsl:if test="imar:MeasureUnitOperation">
																	<xsl:value-of select="imar:MeasureUnitOperation"/>
																</xsl:if>
																<xsl:if test="imar:MeasureUnitOperationCode">
													(<xsl:value-of select="imar:MeasureUnitOperationCode"/>)
													</xsl:if>
															</td>
															<td class="bordered">
																<xsl:value-of select="imar:Characteristics"/>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="imar:DocumentInfo/imar:DocumentSignature/imar:CustChiefSignature"/>
							<br/>
							<xsl:apply-templates select="imar:DocumentInfo/imar:DocumentSignature/imar:ExecutiveSignature"/>
							<br/>
							<br/>
							<table width="100%">
								<tbody>
									<tr>
										<td width="30%" class="value"/>
										<td width="70%"/>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>1 </sup>
											<xsl:text>Указывается для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика, основной государственный регистрационный номер налогоплательщика (если известен);</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<xsl:text>указывается для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер налогоплательщика (индивидуального предпринимателя), основной государственный регистрационный номер предпринимателя (если известен)</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<!--Приложение 8 - Решение таможенного органа о наложении ареста на товары-->
						<xsl:when test="imar:DocumentInfo/imar:DocumentType='0' and imar:DocumentInfo/imar:OrderType='2'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td colspan="3">
											<br/>
											<br/>
											<b>
												<xsl:text>Решение таможенного органа Российской Федерации</xsl:text>
												<br/>
												<xsl:text>о наложении ареста на товары</xsl:text>
												<br> № <span class="value">&#160;  <xsl:value-of select="imar:DocumentInfo/imar:RequisitesDocument/cat_ru:PrDocumentNumber"/>&#160;  </span>
												</br>
											</b>
										</td>
									</tr>
									<tr>
										<td class="delim_3" colspan="3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value" width="35%">
											<xsl:value-of select="imar:DocumentInfo/imar:CustomsOffice/imar:City"/>
										</td>
										<td width="30%"/>
										<td align="right" width="35%">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="imar:DocumentInfo/imar:RequisitesDocument/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td align="center" class="graph8">(населенный пункт)</td>
										<td colspan="2"/>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:apply-templates select="imar:DocumentInfo/imar:CustomsOffice"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(наименование таможенного органа)</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>в связи с неисполнением (ненадлежащим исполнением) плательщиком обязанности по уплате таможенных платежей, </xsl:text>
											<xsl:text>специальных, антидемпинговых, компенсационных пошлин, процентов и пеней в срок, установленный правом Евразийского экономического союза и </xsl:text>
											<xsl:text>(или) законодательством Российской Федерации о таможенном регулировании, исчисленных (начисленных) в:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr valign="top" align="center">
														<td class="bordered" width="10%">№ п/п</td>
														<td class="bordered" width="50%">Реквизиты корректировки декларации на товары, корректировки декларации на товары электронной торговли расчета таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин, корректировки таможенного приходного ордера либо заявления, предусмотренного пунктом 4 статьи 277 Таможенного кодекса Евразийского экономического союза<sup>1</sup><span class="graph8">
																<sup>1</sup>
															</span>
														</td>
														<td class="bordered" width="40%">Срок исполнения обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней</td>
													</tr>
													<xsl:for-each select="imar:DocumentInfo/imar:GroundsArrests/imar:NotificationOrCorrDeclDocument">
														<tr align="center">
															<td class="bordered">
																<xsl:value-of select="imar:SerialNumber"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="imar:PrDocumentNumber"/>
																<xsl:if test="imar:PrDocumentDate">
																	<xsl:text> от </xsl:text>
																	<xsl:apply-templates mode="russian_date" select="imar:PrDocumentDate"/>
																</xsl:if>
															</td>
															<td class="bordered">
																<xsl:apply-templates mode="russian_date" select="imar:DocDatePeriodExecution"/>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>на основании части 14 статьи 78 Федерального закона от 3 августа 2018 г. №&#160;289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" принимает решение:</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify; text-indent:5%;">
											<xsl:text>В обеспечение полноты взыскания подлежащих уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней в сумме </xsl:text>
											<span class="value">&#160;&#160;&#160;<xsl:value-of select="imar:DocumentInfo/imar:GroundsArrests/imar:Amount/imar:PaymentAmount"/>&#160;&#160;&#160;</span>
											<xsl:text> рублей, в том числе: таможенные платежи, специальные, антидемпинговые, компенсационные пошлины </xsl:text>
											<span class="value">&#160;&#160;&#160;<xsl:value-of select="imar:DocumentInfo/imar:GroundsArrests/imar:Amount/imar:FeesPaymentAmount"/>&#160;&#160;&#160;</span>
											<xsl:text> рублей,  пеней </xsl:text>
											<span class="value">&#160;&#160;&#160;<xsl:value-of select="imar:DocumentInfo/imar:GroundsArrests/imar:Amount/imar:FinePaymentAmount"/>&#160;&#160;&#160;</span>
											<xsl:text> рублей, проценты </xsl:text>
											<span class="value">&#160;&#160;&#160;<xsl:value-of select="imar:DocumentInfo/imar:GroundsArrests/imar:Amount/imar:PercentPaymentAmount"/>&#160;&#160;&#160;</span>
											<xsl:text> , в соответствии с принятым решением об обращении взыскания на товары от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="imar:DocumentInfo/imar:BaseDocument/imar:ForeclosureGoods/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> № </xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="imar:DocumentInfo/imar:BaseDocument/imar:ForeclosureGoods/cat_ru:PrDocumentNumber"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<span class="graph8">
												<sup>2</sup>
											</span>
											<xsl:text> наложить арест на товары</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="97%" class="value" align="center">
															<xsl:choose>
																<xsl:when test="string-length(imar:DocumentInfo/imar:Organization) &gt; 0">
																	<xsl:apply-templates mode="organization" select="imar:DocumentInfo/imar:Organization"/>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:text>сведения о плательщике отсутствуют</xsl:text>
																</xsl:otherwise>
															</xsl:choose>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td valign="bottom" width="3%">
															<xsl:text>, </xsl:text>
															<span class="graph8">
																<sup>3</sup>
															</span>
														</td>
													</tr>
													<tr align="center">
														<td class="graph8">(сведения о лице, на товары которого налагается арест: для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика; для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер налогоплательщика)<span>
																<!--sup>4</sup-->
															</span>
														</td>
														<td/>
													</tr>
													<tr>
														<td colspan="2" class="delim_3"/>
													</tr>
													<tr>
														<td colspan="2" style="text-align: justify">
															<xsl:text>находящиеся по адресу:</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="value">
															<xsl:value-of select="imar:DocumentInfo/imar:LocationInformation"/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td valign="bottom" width="1%">
															<xsl:text>, </xsl:text>
														</td>
													</tr>
													<tr>
														<td align="center" class="graph8">(сведения о местонахождении товаров)</td>
														<td/>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>включающие:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr valign="top" align="center">
														<td class="bordered" width="10%">№ п/п</td>
														<td class="bordered" width="40%">Наименование</td>
														<td class="bordered" width="15%">Количество (ед. изм)</td>
														<td class="bordered" width="35%">Индивидуальные признаки</td>
													</tr>
													<xsl:for-each select="imar:DocumentInfo/imar:ListArrest">
														<tr align="center">
															<td class="bordered">
																<xsl:value-of select="imar:SerialNumber"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="imar:NameProperty"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="imar:Quantitypoint"/>&#160;<xsl:if test="imar:MeasureUnitOperation">
																	<xsl:value-of select="imar:MeasureUnitOperation"/>
																</xsl:if>
																<xsl:if test="imar:MeasureUnitOperationCode">
													(<xsl:value-of select="imar:MeasureUnitOperationCode"/>)
													</xsl:if>
															</td>
															<td class="bordered">
																<xsl:value-of select="imar:Characteristics"/>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="imar:DocumentInfo/imar:DocumentSignature/imar:CustChiefSignature"/>
							<br/>
							<xsl:apply-templates select="imar:DocumentInfo/imar:DocumentSignature/imar:ExecutiveSignature"/>
							<br/>
							<br/>
							<table width="100%">
								<tbody>
									<tr>
										<td width="30%" class="value"/>
										<td width="70%"/>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>1 </sup>
											<xsl:text>Является обязательным для Российской Федерации в соответствии с Договором о Таможенном кодексе Евразийского экономического союза от 11 апреля 2017 г., вступившим в силу для Российской Федерации 1 января 2018г., ратифицированным Федеральным законом от 14 ноября 2017 г. № 317-ФЗ "О ратификации Договора о Таможенном кодексе Евразийского экономического союза". Вступил в силу для Российской Федерации 1 января 2018г.</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>2 </sup>
											<xsl:text>При наличии такого решения;</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>3 </sup>
											<xsl:text>При отсутствии сведений о плательщике таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней указывается: </xsl:text>
											<xsl:text>"сведения о плательщике отсутствуют";</xsl:text>
										</td>
									</tr>
									<!--tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>4 </sup>
											<xsl:text>Указывается для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика, </xsl:text>
											<xsl:text>основной государственный регистрационный номер налогоплательщика (если известен);</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<xsl:text>указывается для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер </xsl:text>
											<xsl:text>налогоплательщика (индивидуального предпринимателя), основной государственный регистрационный номер предпринимателя (если известен).</xsl:text>
										</td>
									</tr-->
								</tbody>
							</table>
						</xsl:when>
						<!--Приложение 9 - Решение таможенного органа об обращении взыскания на товары-->
						<xsl:when test="imar:DocumentInfo/imar:DocumentType='0' and imar:DocumentInfo/imar:OrderType='3'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td colspan="3">
											<br/>
											<br/>
											<b>
												<xsl:text>Решение таможенного органа Российской Федерации</xsl:text>
												<br/>
												<xsl:text>об обращении взыскания на товары</xsl:text>
												<br> № <span class="value">&#160;  <xsl:value-of select="imar:DocumentInfo/imar:RequisitesDocument/cat_ru:PrDocumentNumber"/>&#160;  </span>
												</br>
											</b>
										</td>
									</tr>
									<tr>
										<td class="delim_3" colspan="3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value" width="35%">
											<xsl:value-of select="imar:DocumentInfo/imar:CustomsOffice/imar:City"/>
										</td>
										<td width="30%"/>
										<td align="right" width="35%">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="imar:DocumentInfo/imar:RequisitesDocument/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td align="center" class="graph8">(населенный пункт)</td>
										<td colspan="2"/>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:apply-templates select="imar:DocumentInfo/imar:CustomsOffice"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(наименование таможенного органа)</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>в связи с неисполнением (ненадлежащим исполнением) обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней</xsl:text>
											<xsl:text> в размере </xsl:text>
											<span style="display: inline-block; width: 40mm; border-bottom: 1px solid black;"></span>
											<xsl:text> рублей</xsl:text>
											<xsl:text> в срок, установленный международными договорами и актами в сфере таможенного регулирования, законодательством Российской Федерации о таможенном регулировании, исчисленных (начисленных) в:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr valign="top" align="center">
														<td class="bordered" width="10%">№ п/п</td>
														<td class="bordered" width="50%">Реквизиты корректировки декларации на товары, корректировки декларации на товарым электронной торговли или расчета таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин, корректировки таможенного приходного ордера либо заявления, предусмотренного пунктом 4 статьи 277 Таможенного кодекса Евразийского экономического союза<span class="graph8">
																<sup>1</sup>
															</span>
														</td>
														<td class="bordered" width="40%">Срок исполнения обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней</td>
													</tr>
													<xsl:for-each select="imar:DocumentInfo/imar:GroundsArrests/imar:NotificationOrCorrDeclDocument">
														<tr align="center">
															<td class="bordered">
																<xsl:value-of select="imar:SerialNumber"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="imar:PrDocumentNumber"/>
																<xsl:if test="imar:PrDocumentDate">
																	<xsl:text> от </xsl:text>
																	<xsl:apply-templates mode="russian_date" select="imar:PrDocumentDate"/>
																</xsl:if>
															</td>
															<td class="bordered">
																<xsl:apply-templates mode="russian_date" select="imar:DocDatePeriodExecution"/>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<xsl:choose>
										<xsl:when test="imar:DocumentInfo/imar:CalcDebtDoc">
											<tr>
												<td style="text-align: justify">
													<xsl:text>при неисполнении в установленный срок уведомления(ий) (уточнения(ий) к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней:</xsl:text>
												</td>
											</tr>
											<tr>
												<td class="delim_3"/>
											</tr>
											<tr>
												<td>
													<table width="100%">
														<tbody>
															<tr valign="top" align="center">
																<td class="bordered" width="10%" rowspan="2">№ п/п</td>
																<td class="bordered" width="90%" colspan="3">Уведомление (уточнение к уведомлению) о не уплаченных в установленный срок таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней</td>
															</tr>
															<tr valign="top" align="center">
																<td class="bordered" width="40%">регистрационный номер</td>
																<td class="bordered" width="25%">дата</td>
																<td class="bordered" width="25%">срок исполнения</td>
															</tr>
															<xsl:for-each select="imar:DocumentInfo/imar:CalcDebtDoc">
																<tr align="center">
																	<td class="bordered">
																		<xsl:value-of select="imar:SerialNumber"/>
																	</td>
																	<td class="bordered">
																		<xsl:value-of select="imar:PrDocumentNumber"/>
																	</td>
																	<td class="bordered">
																		<xsl:apply-templates mode="russian_date" select="imar:PrDocumentDate"/>
																	</td>
																	<td class="bordered">
																		<xsl:apply-templates mode="russian_date" select="imar:DocDatePeriodExecution"/>
																	</td>
																</tr>
															</xsl:for-each>
														</tbody>
													</table>
												</td>
											</tr>
										</xsl:when>
										<xsl:otherwise>
											<tr>
												<td style="text-align: justify">
													<xsl:text>в случаях, предусмотренных частью 2 статьи 79 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" при которых уведомление(я) (уточнение(я) к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней, не направлялось(лись)</xsl:text>
												</td>
											</tr>
										</xsl:otherwise>
									</xsl:choose>
									<tr>
										<td style="text-align: justify">
											<xsl:text>на основании части 3 статьи 79 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" принимает решение:</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify; text-indent:5%;">
											<xsl:text>Взыскать таможенные платежи, специальные, антидемпинговые, компенсационные пошлины, проценты и пени на общую сумму </xsl:text>
											<span class="value">&#160;&#160;&#160;<xsl:value-of select="imar:DocumentInfo/imar:GroundsArrests/imar:Amount/imar:PaymentAmount"/>&#160;&#160;&#160;</span>
											<xsl:text> рублей, в том числе: таможенные платежи, специальные, антидемпинговые, компенсационные пошлины </xsl:text>
											<span class="value">&#160;&#160;&#160;<xsl:value-of select="imar:DocumentInfo/imar:GroundsArrests/imar:Amount/imar:FeesPaymentAmount"/>&#160;&#160;&#160;</span>
											<xsl:text> рублей, а также пени </xsl:text>
											<span class="value">&#160;&#160;&#160;<xsl:value-of select="imar:DocumentInfo/imar:GroundsArrests/imar:Amount/imar:FinePaymentAmount"/>&#160;&#160;&#160;</span>
											<xsl:text> рублей, проценты </xsl:text>
											<span class="value">&#160;&#160;&#160;<xsl:value-of select="imar:DocumentInfo/imar:GroundsArrests/imar:Amount/imar:PercentPaymentAmount"/>&#160;&#160;&#160;</span>
											<xsl:text> , за счет товаров </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="97%" class="value" align="center">
															<xsl:choose>
																<xsl:when test="string-length(imar:DocumentInfo/imar:Organization) &gt; 0">
																	<xsl:apply-templates mode="organization" select="imar:DocumentInfo/imar:Organization"/>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:text>сведения о плательщике отсутствуют</xsl:text>
																</xsl:otherwise>
															</xsl:choose>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td valign="bottom" width="3%">
															<xsl:text>, </xsl:text>
															<span class="graph8">
																<!--sup>2</sup-->
															</span>
														</td>
													</tr>
													<tr align="center">
														<td class="graph8">(сведения о плательщике: для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика; для индивидуального предпринимателя - фамилия, имя, отчество(при наличии, адрес (место нахождения), идентификационный номер налогоплательщика)<span>
																<!--sup>3</sup-->
															</span>
														</td>
														<td/>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>включающих:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr valign="top" align="center">
														<td class="bordered" width="10%">№ п/п</td>
														<td class="bordered" width="40%">Наименование</td>
														<td class="bordered" width="15%">Количество (ед. изм)</td>
														<td class="bordered" width="35%">Индивидуальные признаки</td>
													</tr>
													<xsl:for-each select="imar:DocumentInfo/imar:ListArrest">
														<tr align="center">
															<td class="bordered">
																<xsl:value-of select="imar:SerialNumber"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="imar:NameProperty"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="imar:Quantitypoint"/>&#160;<xsl:if test="imar:MeasureUnitOperation">
																	<xsl:value-of select="imar:MeasureUnitOperation"/>
																</xsl:if>
																<xsl:if test="imar:MeasureUnitOperationCode">
													(<xsl:value-of select="imar:MeasureUnitOperationCode"/>)
													</xsl:if>
															</td>
															<td class="bordered">
																<xsl:value-of select="imar:Characteristics"/>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="imar:DocumentInfo/imar:DocumentSignature/imar:CustChiefSignature"/>
							<br/>
							<xsl:apply-templates select="imar:DocumentInfo/imar:DocumentSignature/imar:ExecutiveSignature"/>
							<br/>
							<br/>
							<!--table width="100%">
								<tbody>
									<tr>
										<td width="30%" class="value"/>
										<td width="70%"/>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>1 </sup>
											<xsl:text>Федеральный закон от 14 ноября 2017 г. № 317-ФЗ "О ратификации Договора о Таможенном кодексе Евразийского экономического союза" (собрание законодательства российской Федерации, 2017, № 47, ст. 6843);</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>2 </sup>
											<xsl:text>При отсутствии сведений о плательщике таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней указывается: </xsl:text>
											<xsl:text>"сведения о плательщике отсутствуют";</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>3 </sup>
											<xsl:text>Указывается для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика, </xsl:text>
											<xsl:text>основной государственный регистрационный номер налогоплательщика (если известен);</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<xsl:text>указывается для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер </xsl:text>
											<xsl:text>налогоплательщика (индивидуального предпринимателя), основной государственный регистрационный номер предпринимателя (если известен).</xsl:text>
										</td>
									</tr>
								</tbody>
							</table-->
						</xsl:when>
						<!--Приложение 11 - Решение таможенного органа об отмене ареста товаров-->
						<xsl:when test="imar:DocumentInfo/imar:DocumentType='1' and imar:DocumentInfo/imar:OrderType='2'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td colspan="3">
											<br/>
											<br/>
											<b>
												<xsl:text>Решение таможенного органа Российской Федерации</xsl:text>
												<br/>
												<xsl:text>об отмене ареста товаров</xsl:text>
												<br> № <span class="value">&#160;  <xsl:value-of select="imar:DocumentInfo/imar:RequisitesDocument/cat_ru:PrDocumentNumber"/>&#160;  </span>
												</br>
											</b>
										</td>
									</tr>
									<tr>
										<td class="delim_3" colspan="3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value" width="35%">
											<xsl:value-of select="imar:DocumentInfo/imar:CustomsOffice/imar:City"/>
										</td>
										<td width="30%"/>
										<td align="right" width="35%">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="imar:DocumentInfo/imar:RequisitesDocument/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td align="center" class="graph8">(населенный пункт)</td>
										<td colspan="2"/>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:apply-templates select="imar:DocumentInfo/imar:CustomsOffice"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(наименование таможенного органа)</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>на основании подпункта "</xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="imar:DocumentInfo/imar:BaseCancellation"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<xsl:text>" части 41 статьи 78 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" принимает решение:</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify; text-indent:5%;">
											<xsl:text>Отменить решение таможенного органа о наложении ареста на товары от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="imar:DocumentInfo/imar:BaseDocument/imar:ForeclosureGoods/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> № </xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="imar:DocumentInfo/imar:BaseDocument/imar:ForeclosureGoods/cat_ru:PrDocumentNumber"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<xsl:text> и снять наложенный в отношении товаров </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="97%" class="value" align="center">
															<xsl:choose>
																<xsl:when test="string-length(imar:DocumentInfo/imar:Organization) &gt; 0">
																	<xsl:apply-templates mode="organization" select="imar:DocumentInfo/imar:Organization"/>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:text>сведения о плательщике отсутствуют</xsl:text>
																</xsl:otherwise>
															</xsl:choose>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td valign="bottom" width="3%">
															<xsl:text>, </xsl:text>
															<span class="graph8">
																<sup>1</sup>
															</span>
														</td>
													</tr>
													<tr align="center">
														<td class="graph8">(сведения о лице, на товары которого наложен арест)<span>
																<!--sup>2</sup-->
															</span>
														</td>
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
											<xsl:text>арест товаров, находящихся по адресу </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td class="value" width="99%">
															<xsl:value-of select="imar:DocumentInfo/imar:LocationInformation"/>
														</td>
														<td width="1%">
															<xsl:text>,</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td align="center" class="graph8">
											<xsl:text>(сведения о местонахождении арестованных товаров)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>включающих:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr valign="top" align="center">
														<td class="bordered" width="10%">№ п/п</td>
														<td class="bordered" width="40%">Наименование</td>
														<td class="bordered" width="15%">Количество (ед. изм)</td>
														<td class="bordered" width="35%">Индивидуальные признаки</td>
													</tr>
													<xsl:for-each select="imar:DocumentInfo/imar:ListArrest">
														<tr align="center">
															<td class="bordered">
																<xsl:value-of select="imar:SerialNumber"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="imar:NameProperty"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="imar:Quantitypoint"/>&#160;<xsl:if test="imar:MeasureUnitOperation">
																	<xsl:value-of select="imar:MeasureUnitOperation"/>
																</xsl:if>
																<xsl:if test="imar:MeasureUnitOperationCode">
													(<xsl:value-of select="imar:MeasureUnitOperationCode"/>)
													</xsl:if>
															</td>
															<td class="bordered">
																<xsl:value-of select="imar:Characteristics"/>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="imar:DocumentInfo/imar:DocumentSignature/imar:CustChiefSignature"/>
							<br/>
							<xsl:apply-templates select="imar:DocumentInfo/imar:DocumentSignature/imar:ExecutiveSignature"/>
							<br/>
							<br/>
							<table width="100%">
								<tbody>
									<tr>
										<td width="30%" class="value"/>
										<td width="70%"/>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>1 </sup>
											<xsl:text>При отсутствии сведений о плательщике таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней указывается: </xsl:text>
											<xsl:text>"сведения о плательщике отсутствуют";</xsl:text>
										</td>
									</tr>
									<!--tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>2 </sup>
											<xsl:text>Указывается для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика, </xsl:text>
											<xsl:text>основной государственный регистрационный номер налогоплательщика (если известен);</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<xsl:text>указывается для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер </xsl:text>
											<xsl:text>налогоплательщика (индивидуального предпринимателя), основной государственный регистрационный номер предпринимателя (если известен).</xsl:text>
										</td>
									</tr-->
								</tbody>
							</table>
						</xsl:when>
					</xsl:choose>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template mode="organization" match="*">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0"> (</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">)</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures and (cat_ru:OrganizationName or cat_ru:ShortName)">&#032;<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="imar:OKPOID">,&#032;ОКПО:&#032;<xsl:value-of select="imar:OKPOID"/>
		</xsl:if>
		<xsl:if test="imar:ITN">,&#032;ИТН:&#032;<xsl:value-of select="imar:ITN"/>
		</xsl:if>
		<xsl:if test="imar:Address">,&#032;Адрес:&#032;<xsl:for-each select="imar:Address">
				<xsl:for-each select="*">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">
						<xsl:text>, </xsl:text>
					</xsl:if>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="imar:AddressText">,&#032;Сведения об адресе:&#032;<xsl:value-of select="imar:AddressText"/>
		</xsl:if>
		<xsl:if test="imar:OKATOCode">,&#032;ОКАТО:&#032;<xsl:value-of select="imar:OKATOCode"/>
		</xsl:if>
		<xsl:if test="imar:Contact">,&#032;<xsl:for-each select="imar:Contact">
				<xsl:call-template name="imar:Contact"/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
			<span class="normal">,&#032;</span>
			<span class="italic">
				<xsl:if test="string-length(cat_ru:INN) &gt; 0">
					<span class="italic">ИНН</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:INN) &gt; 0 and string-length(cat_ru:KPP) &gt; 0">
					<span class="normal">/</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:KPP) &gt; 0">
					<span class="italic">КПП</span>
				</xsl:if>
				<span class="normal">:&#032;</span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="normal">&#032;/&#032;</span>
			</xsl:if>
			<xsl:value-of select="cat_ru:KPP"/>
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
			<span class="italic">№ справки об отсутв. НЗОУ</span>
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
	<xsl:template name="imar:Contact" match="*">
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
	<xsl:template match="imar:DocumentInfo/imar:GroundsArrests">
		<xsl:for-each select="imar:NotificationOrCorrDeclDocument">
			<tr align="center">
				<td class="bordered">
					<xsl:value-of select="imar:SerialNumber"/>
				</td>
				<td class="bordered">
					<xsl:value-of select="imar:PrDocumentNumber"/>
					<xsl:if test="imar:PrDocumentDate">
						<xsl:text> от </xsl:text>
						<xsl:apply-templates mode="russian_date" select="imar:PrDocumentDate"/>
					</xsl:if>
				</td>
				<td class="bordered">
					<xsl:apply-templates mode="russian_date" select="imar:DocDatePeriodExecution"/>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="document" match="*">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates mode="russian_date" select="cat_ru:PrDocumentDate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="imar:DocumentInfo/imar:DocumentSignature/imar:ExecutiveSignature">
		<table width="100%">
			<tbody>
				<tr valign="bottom">
					<td width="20%">Исполнитель</td>
					<td width="75%" class="value" align="center">
						<xsl:value-of select="cat_ru:PersonPost"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates mode="personBase" select="."/>
					</td>
					<td width="5%"/>
				</tr>
				<tr align="center" valign="top">
					<td/>
					<td class="graph8">(инициалы, фамилия должностного лица таможенного органа)</td>
					<td/>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="imar:DocumentInfo/imar:DocumentSignature/imar:CustChiefSignature">
		<table width="100%">
			<tbody>
				<tr align="center" valign="bottom">
					<td width="39%" align="left">Начальник таможенного органа<br/>(или лицо, им уполномоченное)</td>
					<td width="4%"/>
					<td class="value" width="12%"/>
					<td width="5%"/>
					<td class="value" width="40%">
						<xsl:value-of select="cat_ru:PersonPost"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:apply-templates mode="personBase" select="."/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</td>
				</tr>
				<tr align="center">
					<td class="graph8"/>
					<td/>
					<td class="graph8">(подпись)</td>
					<td/>
					<td class="graph8">(инициалы, фамилия)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="*" mode="personBase">
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonMiddleName"/>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="imar:DocumentInfo/imar:CustomsOffice">
		<xsl:value-of select="cat_ru:OfficeName"/>
		<xsl:text> (</xsl:text>
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:text>)</xsl:text>
	</xsl:template>
	<xsl:template match="imar:CustomsReceiptID">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="num_date" select="cat_ru:RegistrationDate"/>
		<xsl:text>/</xsl:text>
		<xsl:if test="imar:DocNumberPrefix">
			<xsl:value-of select="imar:DocNumberPrefix"/>
			<xsl:text>-</xsl:text>
		</xsl:if>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template mode="gtd_number" match="*">
		<xsl:if test="./*[local-name()='DocNumberPrefix']">
			<xsl:value-of select="./*[local-name()='DocNumberPrefix']"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:value-of select="./*[local-name()='CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="num_date" select="./*[local-name()='RegistrationDate']"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="./*[local-name()='RegNumber']|./*[local-name()='GTDNumber']"/>
		<xsl:if test="./*[local-name()='Code']">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="./*[local-name()='Code']"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="num_date" match="*">
		<xsl:param name="dateIn" select="."/>
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
	<xsl:template name="text_date">
		<xsl:param name="date"/>«<span class="value">&#160;<xsl:choose>
				<xsl:when test="substring($date,9,2)">
					<xsl:value-of select="substring($date,9,2)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>&#160;</span>
		<xsl:variable name="month" select="substring($date, 6, 2)"/>»&#160;<span class="value">&#160;<xsl:choose>
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
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>&#160;</span>&#160;<xsl:choose>
			<xsl:when test="substring($date,1,2)">
				<xsl:value-of select="substring($date,1,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>20</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<span class="value">
			<xsl:choose>
				<xsl:when test="substring($date,3,2)">
					<xsl:value-of select="substring($date,3,2)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</span> г.</xsl:template>
	<xsl:template mode="russian_date" match="*">
		<xsl:param name="dateIn" select="."/>
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
</xsl:stylesheet>
