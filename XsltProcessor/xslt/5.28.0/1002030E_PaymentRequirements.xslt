<?xml version="1.0" encoding="utf-8"?>
<!--
до версии 5.13.4 ГУФТДиТР 2018 № 00415 ФТ на ЛК и Задолженность по формам (пошлины) (приложение).tif (Приложения №№ 1, 9, 10, 11, 12, 13, 14) 
с версии 5.13.4 проекты Приказов ФТС в письме ГУФТДиТР 56307.pdf (примечания: РДЗ разделён на два - РДЗ и РПЗ) 
Сейчас (актуально с 5.14.3):
prs:DocType = РБП - Приказ ФТС России от 21.11.2018 № 1883
prs:DocType = РДЗ - Приказ ФТС России от 21.11.2018 № 1881
prs:DocType = РПЗ - Приказ ФТС России от 21.11.2018 № 1880
prs:DocType = РА   - Приказ ФТС России от 21.11.2018 № 1878
prs:DocType = РИ - Приказ ФТС России от 21.11.2018 № 1877 (Приложение № 1)
prs:DocType = ПИ - Приказ ФТС России от 21.11.2018 № 1877 (Приложение № 2)
- prs:DocType = ТГП - в приказах нет, оставлен, т.к. есть в п.26 ст.76 289-ФЗ; (был в ГУФТДиТР 2018 № 00415 ФТ на ЛК и Задолженность по формам (пошлины) (приложение).tif) - УБРАН отсюда в версии 5.14.5 (переехал в ReqGuarant.xsd)
- prs:DocType = ТА   - Приказ ФТС России от 21.11.2018 № 1882 - УБРАН отсюда в версии 5.14.5 (переехал в ReqGuarant.xsd)
- prs:DocType = УДЗ - Приказ ФТС России от 27.12.2018 № 2137 (Приложение № 1) - УБРАН отсюда в версии 5.14.5 (переехал в NotifAdvDep.xsd)
- prs:DocType = УАИ - Приказ ФТС России от 27.12.2018 № 2137 (Приложение № 2) - УБРАН отсюда в версии 5.14.5 (переехал в NotifAdvDep.xsd)
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:prs="urn:customs.ru:Information:CommercialFinanceDocuments:PaymentRequirements:5.28.0" xmlns:catComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonAgregateTypesCust:5.24.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.28.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:include href="SumInWords.xslt"/>
	<!-- Шаблон для типа PaymentRequirementsType -->
	<xsl:template match="prs:PaymentRequirements">
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
									font-family: Arial;
									font-size: 10pt;
									}

									.value
									{
									border-bottom: solid 1px black;
									font-style: italic;
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
						<xsl:when test="prs:DocType='РБП'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td>
											<b>
												<xsl:text>Решение таможенного органа о взыскании денежных средств</xsl:text>
												<br/>
												<xsl:text>со счетов в бесспорном порядке</xsl:text>
												<br/>
												<br/>
												<xsl:text>от </xsl:text>
												<xsl:call-template name="text_date">
													<xsl:with-param select="prs:DocDate" name="date"/>
												</xsl:call-template>
												<xsl:text> № </xsl:text>
												<span class="value">
													<xsl:value-of select="prs:PRSRegNumber"/>
												</span>
											</b>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:apply-templates select="prs:PRSCustoms"/>
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
											<xsl:text>в связи с неисполнением (ненадлежащим исполнением)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="prs:PrincipalInfo"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(полное наименование организации или фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица), идентификационный номер налогоплательщика (при наличии))</td>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>обязанности по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней, исчисленных (начисленных) в:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="KDTorCPCID" select="."/>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>в сроки, указанные в уведомлении(уведомлениях) (уточнении(уточнениях) к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="NoticePayment" select="."/>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>на основании статьи 75 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" принимает решение о взыскании в бесспорном порядке денежных средств (драгоценных металлов), находящихся на счетах в банках, электронных денежных средств и цифровых рублей, учитываемых на счете цифрового рубля</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="prs:PrincipalInfo"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(полное наименование организации или фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица), идентификационный номер налогоплательщика (при наличии))</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>в размере </xsl:text>
											<span class="value">
												<xsl:value-of select="translate(translate(format-number(prs:Amount, '#,###.00'),',',' '),'.',',')"/>
											</span>
											<xsl:text> рублей, включая пени в размере  </xsl:text>
											<span class="value">
												<xsl:value-of select="translate(translate(format-number(prs:FineAmount, '#,###.00'),',',' '),'.',',')"/>
											</span>
											<xsl:text> рублей, начисленные на день составления данного решения, в том числе:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr align="center" valign="top">
														<td class="bordered">Код платежа<sup>2</sup></td>
														<td class="bordered">Сумма, рубли</td>
													</tr>
													<xsl:for-each select="prs:ChargesRecover">
														<tr align="center">
															<td class="bordered" align="center">
																<xsl:value-of select="prs:PaymentModeCode"/>
															</td>
															<td class="bordered" align="right">
																<div class="cellwidener">
																	<xsl:value-of select="translate(translate(format-number(prs:CompAmount, '#,###.00'),',',' '),'.',',')"/>
																</div>
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
							<xsl:apply-templates select="prs:CustomsChief"/>
							<br/>
							<xsl:call-template name="executor">
								<xsl:with-param name="executor" select="prs:Executor"/>
								<xsl:with-param name="hasPhone" select="'0'"/>
							</xsl:call-template>
							<br/>
							<table style="font-size: 8pt;" width="100%">
								<tbody>
									<tr>
										<td>
											<xsl:text>____________________________________</xsl:text>
										</td>
									</tr>
									<tr>
										<td colspan="2" style="text-align:justify; text-align: 5%">
											<sup>1</sup>Является обязательным для Российской Федерации в соответствии с Договором о Таможенном кодексе Евразийского экономического союза от 11 апреля 2017г., ратифицированным Федеральным законом от 14 ноября 2017 г. № 317-ФЗ "О ратификации Договора о Таможнном кодексе Евразийского экономического союза". Вступил в силу для Российской Федерации 1 января 2018 года.
										</td>
									</tr>
									<tr>
										<td style="text-align:justify; text-align: 5%" colspan="2">
											<sup>2</sup>Приложение №9 к Решению Комиссии Тмаоженного союза от 20 сентября 2010 г. № 378 "О классификаторах, используемых для заполнения таможенных документов". Является обязательным для Российской Федерации в соответствии с Договором об учреждении Евразийского экономического сообщества от 10 октября 2000г., ратифицированным Федеральным законом от 22 мая 2001 г. № 56-ФЗ "О ратификации Договора об учреждении Евразийского экономического сообщества" (Договор вступил в силу для Российской Федерации 30 мая 2001г.), Договором о Евразийском экономическом союзе от 29 мая 2014 г., ратифицированным Федеральным законом от 3 октября 2014 г. № 279-ФЗ "О ратификации Договора о Европейском экономическом союзе" (Договор вступил в силу для Российской Федерации 1 января 2015 г.). Вступило в силу для Российской Федерации 1 января 2011г.
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:when test="prs:DocType='РДЗ'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td>
											<b>
												<xsl:text>Решение таможенного органа об обращении взыскания на денежный залог, внесенный для обеспечения обязанностей 
														уполномоченного экономического оператора и (или) обязанностей юридического лица, осуществляющего деятельность 
														в сфере таможенного дела</xsl:text>
												<br/>
												<br/>
												<xsl:text> от </xsl:text>
												<xsl:call-template name="text_date">
													<xsl:with-param select="prs:DocDate" name="date"/>
												</xsl:call-template>
												<xsl:text> № </xsl:text>
												<span class="value">
													<xsl:value-of select="prs:PRSRegNumber"/>
												</span>
												<br/>
											</b>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:apply-templates select="prs:PRSCustoms"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(наименование таможенного органа)</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>в связи с неисполнением (ненадлежащим исполнением)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="prs:PrincipalInfo"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(полное наименование организации или фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица), идентификационный номер налогоплательщика (при наличии)</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней, исчисленных (начисленных) в:
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="KDTorCPCID" select="."/>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>в сроки, указанные в уведомлении(уведомлениях) (уточнении(уточнениях) к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="NoticePayment" select="."/>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>на основании статьи 76 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" принимает решение о взыскании таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней за счет денежного залога, внесенного </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:for-each select="prs:Guarantor">
												<xsl:apply-templates mode="organization" select="."/>
												<xsl:if test="position()!=last()">;<br/>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr align="center">
										<td class="graph8">(полное наименование или фамилия, имя, отчество (при наличии) плательщика и (или) лица, несущего солидарную обязанность, идентификационный номер налогоплательщика (при наличии))</td>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>для обеспечения обязанностей уполномоченного экономического оператора и (или) обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела, в размере </xsl:text>
											<span class="value">
												<xsl:value-of select="translate(translate(format-number(prs:Amount, '#,###.00'),',',' '),'.',',')"/>
											</span>
											<xsl:text> рублей, включая пени и (или) проценты в размере </xsl:text>
											<span class="value">
												<xsl:value-of select="translate(translate(format-number(prs:FineAmount, '#,###.00'),',',' '),'.',',')"/>
											</span>
											<xsl:text> рублей, начисленные на день составления данного решения.</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="prs:CustomsChief"/>
							<br/>
							<xsl:call-template name="executor">
								<xsl:with-param name="executor" select="prs:Executor"/>
								<xsl:with-param name="hasPhone" select="'0'"/>
							</xsl:call-template>
							<!--br/>
							<br/>
							<table width="100%">
								<tbody>
									<tr valign="top" align="left">
										<td>
											<xsl:text>&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;</xsl:text>
										</td>
									</tr>
									<tr valign="top" align="left">
										<td>
											<xsl:text>Регистрационные номера таможенных расписок, с которых произведено взыскание:</xsl:text>
										</td>
									</tr>
									<tr valign="top" align="left">
										<td class="value">
											<xsl:for-each select="prs:CustomsReceiptInfo">
												<xsl:for-each select="prs:CustomsReceipt">
													<xsl:apply-templates mode="gtd_number" select="./prs:CustomsReceiptID"/>
													<xsl:if test="position()!=last()">
														<xsl:text>, </xsl:text>
													</xsl:if>
												</xsl:for-each>
											</xsl:for-each>
										</td>
									</tr>
								</tbody>
							</table-->
						</xsl:when>
						<xsl:when test="prs:DocType='РПЗ'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td>
											<b>
												<br>
													<xsl:text>Решение таможенного органа об обращении взыскания на предмет залога</xsl:text>
													<br/>
													<br/>
													<xsl:text>от </xsl:text>
													<xsl:call-template name="text_date">
														<xsl:with-param select="prs:DocDate" name="date"/>
													</xsl:call-template>
													<xsl:text> № </xsl:text>
													<span class="value">
														<xsl:value-of select="prs:PRSRegNumber"/>
													</span>
												</br>
											</b>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:apply-templates select="prs:PRSCustoms"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(наименование таможенного органа)</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>в связи с неисполнением (ненадлежащим исполнением)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="prs:PrincipalInfo"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(полное наименование организации или фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица), идентификационный номер налогоплательщика (при наличии)</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней, исчисленных (начисленных) в:
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="KDTorCPCID_inline" select="."/>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>в сроки, указанные в уведомлении(уведомлениях) (уточнении(уточнениях) к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="NoticePayment" select="."/>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>на основании статьи 76 Федерального закона  от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" принимает решение об обращении взыскания на предмет залога, внесенного</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:for-each select="prs:Guarantor">
												<xsl:apply-templates mode="organization" select="."/>
												<xsl:if test="position()!=last()">;<br/>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(полное наименование или фамилия, имя, отчество (при наличии) плательщика и (или) лица, несущего солидарную обязанность, идентификационный номер налогоплательщика)</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>по договору залога </xsl:text>
											<xsl:choose>
												<xsl:when test="prs:GuaranteeInfo">
													<xsl:for-each select="prs:GuaranteeInfo">
														<xsl:apply-templates mode="DocPledgeObject" select="."/>
														<xsl:if test="position()!=last()">; </xsl:if>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text> от </xsl:text>
													<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>
													<xsl:text> № </xsl:text>
													<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:text>, в счет исполнения обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней в размере </xsl:text>
											<span class="value">
												<xsl:value-of select="translate(translate(format-number(prs:Amount, '#,###.00'),',',' '),'.',',')"/>
											</span>
											<xsl:text> рублей, включая пени и (или) проценты в размере </xsl:text>
											<span class="value">
												<xsl:value-of select="translate(translate(format-number(prs:FineAmount, '#,###.00'),',',' '),'.',',')"/>
											</span>
											<xsl:text> рублей, начисленные на день составления данного решения.</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="prs:CustomsChief"/>
							<br/>
							<xsl:call-template name="executor">
								<xsl:with-param name="executor" select="prs:Executor"/>
								<xsl:with-param name="hasPhone" select="'0'"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="prs:DocType='РА'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td>
											<b>
												<xsl:text>Решение таможенного органа о взыскании таможенных платежей, специальных, антидемпинговых, </xsl:text>
												<xsl:text>компенсационных пошлин, процентов и пеней за счет авансовых платежей</xsl:text>
												<br/>
												<br/>
												<xsl:text>от </xsl:text>
												<xsl:call-template name="text_date">
													<xsl:with-param select="prs:DocDate" name="date"/>
												</xsl:call-template>
												<xsl:text> № </xsl:text>
												<span class="value">
													<xsl:value-of select="prs:PRSRegNumber"/>
												</span>
											</b>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:apply-templates select="prs:PRSCustoms"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(наименование таможенного органа)</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>в связи с неисполнением (ненадлежащим исполнением)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="prs:PrincipalInfo"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(полное наименование организации или фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица), идентификационный номер налогоплательщика (при наличии)</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней, исчисленных (начисленных) в:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="KDTorCPCID_inline" select="."/>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>в сроки, указанные в уведомлении(ях) (уточнении(уточнениях) к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="NoticePayment" select="."/>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>на основании статьи 80 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" принимает решение о взыскании таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней за счет авансовых платежей в размере </xsl:text>
											<span class="value">
												<xsl:value-of select="translate(translate(format-number(prs:Amount, '#,###.00'),',',' '),'.',',')"/>
											</span>
											<xsl:text> рублей, в том числе включая пени и (или) проценты в размере </xsl:text>
											<span class="value">
												<xsl:value-of select="translate(translate(format-number(prs:FineAmount, '#,###.00'),',',' '),'.',',')"/>
											</span>
											<xsl:text> рублей, начисленные на день составления данного решения.</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="prs:CustomsChief"/>
							<br/>
							<xsl:call-template name="executor">
								<xsl:with-param name="executor" select="prs:Executor"/>
								<xsl:with-param name="hasPhone" select="'0'"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="prs:DocType='РИ'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td>
											<b>
												<xsl:text>Решение таможенного органа о взыскании таможенных платежей, специальных, </xsl:text>
												<xsl:text>антидемпинговых, компенсационных пошлин, процентов и пеней </xsl:text>
												<xsl:text>за счет имущества</xsl:text>
												<br/>
												<br/>
												<xsl:text>от </xsl:text>
												<xsl:call-template name="text_date">
													<xsl:with-param select="prs:DocDate" name="date"/>
												</xsl:call-template>
												<xsl:text> № </xsl:text>
												<span class="value">
													<xsl:value-of select="prs:PRSRegNumber"/>
												</span>
											</b>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:apply-templates select="prs:PRSCustoms"/>
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
											<xsl:text>в связи с неисполнением (ненадлежащим исполнением) обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней, исчисленных (начисленных):</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr align="center" valign="top">
														<td class="bordered" rowspan="2">№ п/п</td>
														<td class="bordered" colspan="2">Реквизиты корректировки декларации на товары, расчета таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин, корректировки таможенного приходного ордера, заявления, предусмотренного пунктом 4 статьи 277 Таможенного кодекса Евразийского экономического союза<sup>1</sup>, либо иного таможенного документа, определенного Евразийской экономической комиссией в соответствии с пунктом 24 статьи 266 Таможенного кодекса Евразийского экономического союза</td>
													</tr>
													<tr align="center">
														<td class="bordered">регистрационный номер</td>
														<td class="bordered">дата</td>
													</tr>
													<xsl:for-each select="prs:KDTorCPCID">
														<tr valign="top" align="center">
															<td class="bordered">
																<xsl:value-of select="position()"/>
															</td>
															<td class="bordered">
																<xsl:apply-templates mode="gtd_number" select="prs:KDTID|prs:CPCID"/>
															</td>
															<td class="bordered">
																<xsl:apply-templates mode="russian_date" select="prs:KDTID/cat_ru:RegistrationDate|prs:CPCID/cat_ru:RegistrationDate"/>
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
											<xsl:text>после истечения срока исполнения уведомления(ий) (уточнений к уведомлению) о не уплаченных в установленнй срок суммах таможенных платежей, специальных, антидеминговых компенсационных пошлин, процентов и пеней:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="NoticePayment" select="."/>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>в случае, указанном в пункте «</xsl:text>
											<span class="value">&#160;<xsl:value-of select="prs:Paragraph"/>&#160;</span>»<xsl:text> части 10 статьи 80 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российкой Федерации» принимает решение:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify" class="indent">
											<xsl:text>На основании части 11 статьи 80 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российкой Федерации» взыскать таможенные платежи, специальные, антидемпинговые, компансационные пошлины, проценты и пени за счет имущества</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates select="prs:PrincipalInfo"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(указываются сведения о плательщике (лице, несущем солидарную обязанность)</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>в сумме </xsl:text>
											<span class="value">&#160;<xsl:value-of select="translate(translate(format-number(prs:Amount, '#,###.00'),',',' '),'.',',')"/>&#160;</span> рублей,<xsl:text> в том числе: таможенные платежи, специальные, антидемпинговые, компенсационные пошлины </xsl:text>
											<span class="value">&#160;<xsl:value-of select="translate(translate(format-number(prs:PaymentsFeesAmount, '#,###.00'),',',' '),'.',',')"/>&#160;</span>
											<xsl:text> рублей, </xsl:text>
											<xsl:text>пени </xsl:text>
											<span class="value">&#160;<xsl:value-of select="translate(translate(format-number(prs:PenaltyAmount, '#,###.00'),',',' '),'.',',')"/>&#160;</span>
											<xsl:text> рублей, </xsl:text>
											<xsl:text> проценты </xsl:text>
											<span class="value">&#160;<xsl:value-of select="translate(translate(format-number(prs:PercentAmount, '#,###.00'),',',' '),'.',',')"/>&#160;</span>
											<xsl:text> рублей.</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="indent">Настоящее решение вступает в силу со дня его вынесения.</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<tr>
								<td>
									<table width="100%">
										<tbody>
											<tr align="center" valign="bottom">
												<td width="40%" align="left">Начальник таможенного органа<br/>(или лицо, им уполномоченное)</td>
												<td/>
												<td class="value" width="15%"/>
												<td/>
												<td class="value" width="30%">
													<xsl:value-of select="cat_ru:PersonName"/>
												</td>
											</tr>
											<tr align="center">
												<td class="graph8"/>
												<td/>
												<td class="graph8">(подпись)</td>
												<td/>
												<td class="graph8">(инициалы (отчество при наличии), фамилия)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<br/>
							<tr>
								<td>
									<table width="100%">
										<tbody>
											<tr valign="bottom">
												<td width="16%">Исполнитель</td>
												<td width="55%" class="value" align="center">
													<xsl:value-of select="prs:Executor/cat_ru:PersonSurname"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="prs:Executor/cat_ru:PersonName"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="prs:Executor/cat_ru:PersonMiddleName"/>
												</td>
											</tr>
											<tr align="center" valign="top">
												<td/>
												<td class="graph8">(инициалы (отчество при наличии), фамилия должностного лица таможенного органа)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</xsl:when>
						<xsl:when test="prs:DocType='ПИ'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td>
											<b>
												<xsl:text>Постановление таможенного органа о взыскании таможенных платежей, специальных, </xsl:text>
												<xsl:text>антидемпинговых, компенсационных пошлин, процентов и пеней </xsl:text>
												<xsl:text>за счет имущества</xsl:text>
												<br/>
												<br/>
												<xsl:text>от </xsl:text>
												<xsl:call-template name="text_date">
													<xsl:with-param select="prs:DocDate" name="date"/>
												</xsl:call-template>
												<xsl:text> № </xsl:text>
												<span class="value">
													<xsl:value-of select="prs:PRSRegNumber"/>
												</span>
											</b>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<xsl:if test="prs:PlaceName">
										<tr>
											<td width="100%">
												<table>
													<tbody>
														<tr align="center">
															<td width="70%"/>
															<td width="30%" class="value">
																<xsl:value-of select="prs:PlaceName"/>
															</td>
														</tr>
														<tr align="center">
															<td/>
															<td class="graph8">(наcеленный пункт)</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</xsl:if>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:apply-templates select="prs:PRSCustoms"/>
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
											<xsl:text>в связи с неисполнением (ненадлежащим исполнением) обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней, после истечения срока исполнения уведомления(ий) (уточнения(ий) к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="NoticePayment" select="."/>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>на основании принятого решения таможенного органа о взыскании таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней за счет имущества от  </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="prs:DecisionDate" name="date"/>
											</xsl:call-template>
											<xsl:text> № </xsl:text>
											<xsl:variable name="DecisionNumber">
												<xsl:choose>
													<xsl:when test="prs:DecisionNumber">
														<xsl:value-of select="prs:DecisionNumber"/>
													</xsl:when>
													<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
												</xsl:choose>
											</xsl:variable>
											<span class="value">
												<xsl:value-of select="$DecisionNumber"/>
											</span>
											<xsl:text>, постановляет:</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify" class="indent">
											<xsl:text>На основании части 11 статьи 80 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российкой Федерации» произвести взыскание таможенных платежей, специальных, антидемпинговых, компансационных пошлин, процентов и пеней за счет имущества</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates select="prs:PrincipalInfo"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(указываются сведения о плательщике (лице, несущем солидарную обязанность)</td>
									</tr>
									<tr>
										<td align="left">
											<xsl:text>в пользу</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates select="prs:PRSCustoms"/>
											<xsl:if test="prs:PRSCustoms/prs:CustomsAddress">; адрес: <xsl:apply-templates select="prs:PRSCustoms/prs:CustomsAddress"/>
											</xsl:if>
											<xsl:if test="prs:PRSCustoms/prs:INN">; ИНН: <xsl:value-of select="prs:PRSCustoms/prs:INN"/>
											</xsl:if>
											<xsl:if test="prs:PaymentRequisitions">; Банковские реквизиты: <xsl:apply-templates select="prs:PaymentRequisitions"/>
											</xsl:if>
											<xsl:if test="prs:CBC">; КБК: <xsl:value-of select="prs:CBC"/>
												<!--prs:CBC удален, основание:  IMO-000754 Письмо ГУФТДиТР от 21.08.2019 № 05-15/51496 "Об Альбоме форматов электронных
форм документов"-->
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="left">
											<xsl:text>в сумме </xsl:text>
											<span class="value">&#160;<xsl:value-of select="translate(translate(format-number(prs:Amount, '#,###.00'),',',' '),'.',',')"/>&#160;</span> рублей.</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="indent">Настоящее постановление вступает в силу со дня его вынесения.</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>Дата выдачи постановления: <xsl:call-template name="text_date">
												<xsl:with-param select="prs:IssueDate" name="date"/>
											</xsl:call-template>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<tr>
								<td>
									<table width="100%">
										<tbody>
											<tr align="center" valign="bottom">
												<td width="40%" align="left">Начальник таможенного органа<br/>(или лицо, им уполномоченное)</td>
												<td/>
												<td class="value" width="15%"/>
												<td/>
												<td class="value" width="30%">
													<xsl:value-of select="prs:CustomsChief/cat_ru:PersonName"/>
												</td>
											</tr>
											<tr align="center">
												<td class="graph8"/>
												<td/>
												<td valign="top" class="graph8">(подпись)</td>
												<td/>
												<td class="graph8">(инициалы (отчество при наличии), фамилия)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<br>
								<tr>
									<td>М.П.</td>
								</tr>
							</br>
						</xsl:when>
					</xsl:choose>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="RUScat_ru:SubjectAddressDetails | prs:FactAddressDetails | prs:CustomsAddress">
		<xsl:for-each select="RUScat_ru:PostalCode|RUScat_ru:CountryCode|RUScat_ru:CounryName|RUScat_ru:Region|RUScat_ru:District|RUScat_ru:Town|RUScat_ru:City|RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room|RUScat_ru:AddressText">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="prs:PaymentRequisitions">
		<!--xsl:value-of select="catComFin_ru:BankName"/-->
		<xsl:if test="catComFin_ru:OKPOID">
			<xsl:text>ОКПО: </xsl:text>
			<xsl:value-of select="catComFin_ru:OKPOID"/>
		</xsl:if>
		<xsl:if test="catComFin_ru:BICID">
			<xsl:text>, БИК: </xsl:text>
			<xsl:value-of select="catComFin_ru:BICID"/>
		</xsl:if>
		<xsl:if test="catComFin_ru:SWIFTID">
			<xsl:text>, SWIFT: </xsl:text>
			<xsl:value-of select="catComFin_ru:SWIFTID"/>
		</xsl:if>
		<xsl:if test="catComFin_ru:AccountNumeric">
			<xsl:text>, корр.счет: </xsl:text>
			<xsl:value-of select="catComFin_ru:AccountNumeric"/>
		</xsl:if>
		<xsl:if test="catComFin_ru:CurrentCurrencyAccount">
			<xsl:text>, валютный счет (текущий): </xsl:text>
			<xsl:for-each select="catComFin_ru:CurrentCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catComFin_ru:TransitCurrencyAccount">
			<xsl:text>, валютный счет (транзитный): </xsl:text>
			<xsl:for-each select="catComFin_ru:TransitCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catComFin_ru:SpecialTransitCurrencyAccount">
			<xsl:text>, валютный счет (специальный): </xsl:text>
			<xsl:for-each select="catComFin_ru:SpecialTransitCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catComFin_ru:RoubleCurrencyAccount">
			<xsl:text>, рублевый счет: </xsl:text>
			<xsl:value-of select="catComFin_ru:RoubleCurrencyAccount"/>
		</xsl:if>
		<xsl:if test="catComFin_ru:BankPostalAddress">
			<xsl:text>, адрес: </xsl:text>
			<xsl:for-each select="catComFin_ru:BankPostalAddress/*">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:text> (получатель платежа: </xsl:text>
		<xsl:value-of select="prs:RecipientName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="prs:RecipientINN"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="prs:RecipientKPP"/>
		<xsl:if test="prs:ExtPaymentInfo">
			<xsl:text>, Дополнительная информация для указания в платежном поручении: </xsl:text>
			<xsl:value-of select="prs:ExtPaymentInfo"/>
		</xsl:if>
		<xsl:text>)</xsl:text>
	</xsl:template>
	<xsl:template mode="sumWords" match="*">
		<xsl:variable name="splittedSum">
			<xsl:value-of select="translate(.,'.',',')"/>
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
	<xsl:template mode="DocPledgeObject" match="*">
		<xsl:text> от </xsl:text>
		<xsl:choose>
			<xsl:when test="cat_ru:PrDocumentDate">
				<span class="value">
					<xsl:apply-templates mode="russian_date" select="cat_ru:PrDocumentDate"/>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text> № </xsl:text>
		<xsl:choose>
			<xsl:when test="cat_ru:PrDocumentNumber">
				<span class="value">
					<xsl:value-of select="cat_ru:PrDocumentNumber"/>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="executor" match="prs:Executor">
		<xsl:param name="executor"/>
		<xsl:param name="hasPhone"/>
		<table width="100%">
			<tbody>
				<tr valign="bottom">
					<td width="16%">Исполнитель</td>
					<td width="55%" class="value" align="center">
						<xsl:value-of select="$executor/cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="$executor/cat_ru:PersonName"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="$executor/cat_ru:PersonMiddleName"/>
					</td>
					<td/>
					<xsl:if test="$hasPhone='1'">
						<td align="right">
							<xsl:text>Телефон&#160;&#160;</xsl:text>
						</td>
						<td class="value" align="center">
							<xsl:value-of select="$executor/prs:ExecutivePhone"/>
						</td>
					</xsl:if>
				</tr>
				<tr align="center" valign="top">
					<td/>
					<td class="graph8">(инициалы, фамилия должностного лица таможенного органа)</td>
					<td/>
					<xsl:if test="$hasPhone='1'">
						<td/>
						<td/>
					</xsl:if>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="prs:CustomsChief">
		<table width="100%">
			<tbody>
				<tr align="center" valign="bottom">
					<td width="40%" align="left">Начальник таможенного органа<br/>(или лицо, им уполномоченное)</td>
					<td/>
					<td class="value" width="15%"/>
					<td/>
					<td class="value" width="30%">
						<xsl:value-of select="cat_ru:PersonName"/>
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
	<xsl:template mode="organization" match="*">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
	</xsl:template>
	<xsl:template name="PrincipalInfo" match="*">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"> ОГРН <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="prs:RegistrationDate">, зарегистрирован: <xsl:apply-templates mode="russian_date" select="prs:RegistrationDate"/>
		</xsl:if>
		<xsl:if test="prs:PrincipalKind='2'">
			<xsl:if test="prs:RegistrationPlace">&#160;<xsl:value-of select="prs:RegistrationPlace"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails/RUScat_ru:AddressKindCode='1'">, адрес регистрации: </xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails/RUScat_ru:AddressKindCode='2'">, фактический адрес: </xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails/RUScat_ru:AddressKindCode='3'">, почтовый адрес: </xsl:if>
		<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails"/>
		<xsl:if test="prs:FactAddressDetails ">, место нахождения: <xsl:apply-templates select="prs:FactAddressDetails "/>
		</xsl:if>
		<xsl:if test="prs:PrincipalKind='2'">
			<xsl:if test="prs:Gender">, пол: <xsl:if test="prs:Gender='1'">женский</xsl:if>
				<xsl:if test="prs:Gender='2'">мужской</xsl:if>
			</xsl:if>
			<xsl:if test="prs:BirthDate">, дата рождения: <xsl:apply-templates mode="russian_date" select="prs:BirthDate"/>
			</xsl:if>
			<xsl:if test="prs:BirthPlace">, место рождения: <xsl:value-of select="prs:BirthPlace"/>
			</xsl:if>
			<xsl:if test="prs:Job">, место работы: <xsl:value-of select="prs:Job"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="NoticePayment" match="*">
		<table width="100%">
			<tbody>
				<tr valign="top" align="center">
					<td class="bordered" rowspan="2">№ п/п</td>
					<td class="bordered" colspan="3">Уведомление (уточнение к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсациоанных пошлин, процентов и пеней</td>
				</tr>
				<tr align="center">
					<td class="bordered">регистрационный номер</td>
					<td class="bordered">дата</td>
					<td class="bordered">срок исполнения</td>
				</tr>
				<xsl:for-each select="prs:NoticePayment">
					<tr align="center">
						<td class="bordered">
							<xsl:value-of select="position()"/>
						</td>
						<td class="bordered">
							<xsl:value-of select="cat_ru:PrDocumentNumber"/>
						</td>
						<td class="bordered">
							<xsl:apply-templates mode="russian_date" select="cat_ru:PrDocumentDate"/>
						</td>
						<td class="bordered">
							<xsl:apply-templates mode="russian_date" select="prs:PeriodExecution"/>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template mode="KDTorCPCID_inline" match="*">
		<table width="100%">
			<tbody>
				<tr>
					<td class="value">
						<xsl:choose>
							<xsl:when test="prs:KDTID">
								<xsl:text>КДТ №</xsl:text>
								<xsl:apply-templates select="prs:KDTID"/>
								<xsl:if test="prs:KDTID/cat_ru:RegistrationDate">
									<xsl:text> от </xsl:text>
									<xsl:apply-templates mode="russian_date" select="prs:KDTID/cat_ru:RegistrationDate"/>
								</xsl:if>
							</xsl:when>
							<xsl:when test="prs:CPCID">
								<xsl:text>Расчет №</xsl:text>
								<xsl:apply-templates select="prs:CPCID"/>
								<xsl:if test="prs:CPCID/cat_ru:RegistrationDate">
									<xsl:text> от </xsl:text>
									<xsl:apply-templates mode="russian_date" select="prs:CPCID/cat_ru:RegistrationDate"/>
								</xsl:if>
							</xsl:when>
							<xsl:when test="prs:KTPOID">
								<xsl:text>Корректировка ТПО №</xsl:text>
								<xsl:apply-templates select="prs:KTPOID"/>
								<xsl:if test="prs:KTPOID/prs:RegistrationDate">
									<xsl:text> от </xsl:text>
									<xsl:apply-templates mode="russian_date" select="prs:KTPOID/prs:RegistrationDate"/>
								</xsl:if>
							</xsl:when>
							<xsl:when test="prs:Application">
								<xsl:apply-templates select="prs:Application"/>
								<xsl:if test="prs:Application/cat_ru:PrDocumentDate">
									<xsl:text> от </xsl:text>
									<xsl:apply-templates mode="russian_date" select="prs:Application/cat_ru:PrDocumentDate"/>
								</xsl:if>
							</xsl:when>
							<xsl:when test="prs:OtherCustDocInfoID/prs:TPOID">
								<xsl:text>ТПО №</xsl:text>
								<xsl:apply-templates select="prs:OtherCustDocInfoID/prs:TPOID"/>
								<xsl:if test="prs:OtherCustDocInfoID/prs:TPOID/prs:RegistrationDate">
									<xsl:text> от </xsl:text>
									<xsl:apply-templates mode="russian_date" select="prs:OtherCustDocInfoID/prs:TPOID/prs:RegistrationDate"/>
								</xsl:if>
							</xsl:when>
							<xsl:when test="prs:OtherCustDocInfoID/prs:OtherCustDoc">
								<xsl:apply-templates select="prs:OtherCustDocInfoID/prs:OtherCustDoc"/>
								<xsl:if test="prs:OtherCustDocInfoID/prs:OtherCustDoc/cat_ru:PrDocumentDate">
									<xsl:text> от </xsl:text>
									<xsl:apply-templates mode="russian_date" select="prs:OtherCustDocInfoID/prs:OtherCustDoc/cat_ru:PrDocumentDate"/>
								</xsl:if>
							</xsl:when>
						</xsl:choose>
					</td>
				</tr>
				<tr align="center">
					<td class="graph8">
						(регистрационный номер и дата корректировки декларации на товары или расчета таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин,
						расчета таможенных пошлин, налогов, взимаемых по единым ставкам, либо таможенных пошлин, налогов, взимаемых в виде совокупного таможенного платежа, 
						корректировки таможенного приходного ордера, заявления, предусмотренного пунктом 4 статьи 277 Таможенного кодекса Евразийского экономического союза<sup>*</sup>, либо иного таможенного документа, определенного 
						Евразийской экономической комиссией в соответствии с пунктом 24 статьи 266 Таможенного кодекса Евразийского экономического союза)
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template mode="KDTorCPCID" match="*">
		<table width="100%">
			<tbody>
				<tr align="center" valign="top">
					<td class="bordered" rowspan="2">№ п/п</td>
					<td class="bordered" colspan="2">Реквизиты корректировки декларации на товары или расчета таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин,
						расчета таможенных пошлин, налогов, взимаемых по единым ставкам, либо таможенных пошлин, налогов, взимаемых в виде совокупного таможенного платежа, 
						корректировки таможенного приходного ордера, заявления, предусмотренного пунктом 4 статьи 277 Таможенного кодекса Евразийского экономического союза<sup>*</sup>, либо иного таможенного документа, определенного 
						Евразийской экономической комиссией в соответствии с пунктом 24 статьи 266 Таможенного кодекса Евразийского экономического союза
					</td>
				</tr>
				<tr align="center">
					<td class="bordered">регистрационный номер</td>
					<td class="bordered">дата</td>
				</tr>
				<xsl:for-each select="prs:KDTorCPCID">
					<tr valign="top" align="center">
						<td class="bordered">
							<xsl:value-of select="position()"/>
						</td>
						<td class="bordered">
							<xsl:choose>
								<xsl:when test="prs:KDTID">
									<xsl:text>КДТ </xsl:text>
									<xsl:apply-templates select="prs:KDTID"/>
								</xsl:when>
								<xsl:when test="prs:CPCID">
									<xsl:text>Расчет </xsl:text>
									<xsl:apply-templates select="prs:CPCID"/>
								</xsl:when>
								<xsl:when test="prs:KTPOID">
									<xsl:text>Корректировка ТПО </xsl:text>
									<xsl:apply-templates select="prs:KTPOID"/>
								</xsl:when>
								<xsl:when test="prs:Application">
									<xsl:apply-templates select="prs:Application"/>
								</xsl:when>
								<xsl:when test="prs:OtherCustDocInfoID/prs:TPOID">
									<xsl:text>ТПО </xsl:text>
									<xsl:apply-templates select="prs:OtherCustDocInfoID/prs:TPOID"/>
								</xsl:when>
								<xsl:when test="prs:OtherCustDocInfoID/prs:OtherCustDoc">
									<xsl:apply-templates select="prs:OtherCustDocInfoID/prs:OtherCustDoc"/>
								</xsl:when>
							</xsl:choose>
						</td>
						<td class="bordered">
							<xsl:choose>
								<xsl:when test="prs:KDTID">
									<xsl:apply-templates mode="russian_date" select="prs:KDTID/cat_ru:RegistrationDate"/>
								</xsl:when>
								<xsl:when test="prs:CPCID">
									<xsl:apply-templates mode="russian_date" select="prs:CPCID/cat_ru:RegistrationDate"/>
								</xsl:when>
								<xsl:when test="prs:KTPOID">
									<xsl:apply-templates mode="russian_date" select="prs:KTPOID/prs:RegistrationDate"/>
								</xsl:when>
								<xsl:when test="prs:Application">
									<xsl:apply-templates mode="russian_date" select="prs:Application/cat_ru:PrDocumentDate"/>
								</xsl:when>
								<xsl:when test="prs:OtherCustDocInfoID/prs:TPOID">
									<xsl:apply-templates mode="russian_date" select="prs:OtherCustDocInfoID/prs:TPOID/prs:RegistrationDate"/>
								</xsl:when>
								<xsl:when test="prs:OtherCustDocInfoID/prs:OtherCustDoc">
									<xsl:apply-templates mode="russian_date" select="prs:OtherCustDocInfoID/prs:OtherCustDoc/cat_ru:PrDocumentDate"/>
								</xsl:when>
							</xsl:choose>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<!--Шаблон для типа RUDECLcat:CustomDocIDType-->
	<xsl:template match="prs:KDTID | prs:CPCID">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn">
				<xsl:value-of select="cat_ru:RegistrationDate"/>
			</xsl:with-param>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
		<xsl:if test="RUDECLcat:Code">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="RUDECLcat:Code"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="prs:Application | prs:OtherCustDoc">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от </xsl:text>
			<xsl:apply-templates mode="russian_date" select="cat_ru:PrDocumentDate"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
	</xsl:template>
	<!--Шаблон для типа TPORegNumberType-->
	<xsl:template match="prs:KTPOID | prs:TPOID">
		<xsl:value-of select="prs:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn">
				<xsl:value-of select="prs:RegistrationDate"/>
			</xsl:with-param>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="prs:DocNumber"/>
		<xsl:if test="prs:Code">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="prs:Code"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="prs:PRSCustoms">
		<xsl:value-of select="cat_ru:OfficeName"/>
		<xsl:if test="not(cat_ru:OfficeName) and prs:FullOfficeName">
			<xsl:value-of select="prs:FullOfficeName"/>
		</xsl:if>
		<xsl:text> (</xsl:text>
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:text>)</xsl:text>
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
		<xsl:param name="date"/>«<span class="value">&#160;<xsl:value-of select="substring($date,9,2)"/>&#160;</span>
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
			</xsl:choose>&#160;</span>&#160;<xsl:value-of select="substring($date,1,2)"/>
		<span class="value">
			<xsl:value-of select="substring($date,3,2)"/>
		</span> г.
	</xsl:template>
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
