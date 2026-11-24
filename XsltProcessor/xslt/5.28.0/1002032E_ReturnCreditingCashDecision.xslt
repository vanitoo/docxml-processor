<?xml version="1.0" encoding="utf-8"?>
<!--
Приказ ФТС России от 10 января 2019 года № 7
DecisionIndicator = 0 - Приложение № 2 - Решение таможенного органа о возврате авансовых платежей
DecisionIndicator = 1 - Приложение № 3 - Уведомление об отказе в возврате авансовых платежей 
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:rccd="urn:customs.ru:Information:CommercialFinanceDocuments:ReturnCreditingCashDecision:5.28.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ReturnCreditingCashDecisionType -->
	<xsl:template match="rccd:ReturnCreditingCashDecision">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  font-family: Arial;
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

                  table.border tr td
                  {
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
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

                  td.graphMain
                  {
                  vertical-align:top;
                  }
                  td.value.graphMain
                  {
                  vertical-align:bottom;
                  }
                  
                  .inlinetable
					{
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display:-moz-inline-stack;/*Firefox 2*/
					display:inline-table; /*Хорошие браузеры*/
					_overflow:hidden;/*IE6, IE7*/
					*zoom:1;/*включаем hasLayout для IE6, IE7*/
					*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;
					}
					.descr{
						font-size: 8pt;
						text-align: center;
					}
					.indent{
						text-indent: 1.5em;
					}
					.underlined{
						border-bottom: 1px solid windowtext;
					}
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<xsl:if test="rccd:DecisionIndicator = 0">
						<table>
							<tbody>
								<tr>
									<td align="center" class="title">
										<font size="4">
											<b>Решение таможенного органа Российской Федерации<br/>о возврате авансовых платежей</b>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table width="100%">
							<tbody>
								<tr>
									<td width="35%">
										<table class="inlinetable" style="min-width: 100%; width: 100%;">
											<tbody>
												<tr align="center">
													<td class="value">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="rccd:RegistrationReq/cat_ru:PrDocumentDate"/>
														</xsl:call-template>
														<br/>
													</td>
												</tr>
												<tr align="center">
													<td class="descr">
														(дата заявления)
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td width="30%"></td>
									<td width="35%">
										<xsl:text>№ </xsl:text>
										<table class="inlinetable" style="min-width: 90%; width: 90%mm;">
											<tbody>
												<tr align="center">
													<td class="value">
														<xsl:apply-templates select="rccd:RegistrationReq/cat_ru:PrDocumentNumber"/>
														<br/>
													</td>
												</tr>
												<tr align="center">
													<td class="descr">
														(номер заявления)
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td>
										<xsl:text>На основании</xsl:text>
										<br/>
										<xsl:text>заявления о возврате авансовых платежей от </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="rccd:RegistrationReq/cat_ru:PrDocumentDate"/>
												</xsl:call-template>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(дата регистрации заявления о возврате авансовых платежей)'"/>
											<xsl:with-param name="width" select="'40mm'"/>
										</xsl:call-template>
										<xsl:text> № </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="rccd:RegistrationReq/cat_ru:PrDocumentNumber"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(регистрационный номер заявления о возврате авансовых платежей)'"/>
											<xsl:with-param name="width" select="'40mm'"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr valign="top">
									<td>
										<xsl:text>или исполнительного документа </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates mode="doc" select="rccd:DecisionReturn/rccd:JudicialActReq"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(реквизиты исполнительнго документа)'"/>
											<xsl:with-param name="width" select="'99%'"/>
										</xsl:call-template>
										<xsl:text>, </xsl:text>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:text>или решения таможенного органа Российской Федерации</xsl:text><sup>1</sup>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates mode="doc" select="rccd:DecisionReturn/rccd:DecisionCustomsReq"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(реквизиты решения таможенного органа)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:text>о возврате авансовых платежей в размере</xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="rccd:DecisionReturn/rccd:ClaimedAmount"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(сумма, заявленная к возврату)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:text>в соответствии со статьей 36 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" произвести возврат в валюте Российской Федерации авансовых платежей, внесенных на счет Федерального казначейства:</xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="rccd:ApplicantInfo" mode="org"/>
												<xsl:if test="rccd:RegistrationReq">
													<xsl:text>; </xsl:text>
													<xsl:apply-templates select="rccd:RegistrationReq"/>
												</xsl:if>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(наименование юридического лица/фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<table>
											<tbody>
												<tr align="center" valign="top" style="font-weight: bold;">
													<td class="bordered">Код бюджетной классификации</td>
													<td class="bordered">Наименование кода бюджетной классификации</td>
													<td class="bordered">Сумма возврата</td>
												</tr>
												<xsl:for-each select="rccd:DecisionReturn/rccd:AmountReturn">
													<tr align="center" valign="top">
														<td class="bordered">
															<xsl:value-of select="rccd:BCC"/>
														</td>
														<td class="bordered">
															<xsl:value-of select="rccd:PaymentModeName"/>
														</td>
														<td class="bordered" align="right">
															<xsl:value-of select="rccd:Amount"/>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:text>Задолженность по уплате таможенных пошлин, налогов, таможенных пошлин и внутренних налогов в отношении товаров электронной торговли и иных платежей на дату принятия решения составляет </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:for-each select="rccd:DecisionReturn/rccd:AmountDue">
													<xsl:variable name="rub">
														<xsl:value-of select="substring-before(., '.')"/>
													</xsl:variable>
													<xsl:variable name="kop">
														<xsl:value-of select="substring(concat(substring-after(.,'.'), '00'), 1, 2)"/>
													</xsl:variable>
													<xsl:value-of select="$rub"/>
													<xsl:text> руб. </xsl:text>
													<xsl:value-of select="$kop"/>
													<xsl:text> коп.</xsl:text>
												</xsl:for-each>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(указывается сумма задолженности)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<xsl:apply-templates mode="signature" select="rccd:HeadCustoms">
							<xsl:with-param name="post">Начальник (заместитель начальника) таможенного органа</xsl:with-param>
						</xsl:apply-templates>
						<xsl:apply-templates mode="signature" select="rccd:HeadDepartment">
							<xsl:with-param name="post">Начальник отдела</xsl:with-param>
						</xsl:apply-templates>
						<xsl:apply-templates mode="signature" select="rccd:Executor">
							<xsl:with-param name="post"><xsl:value-of select="rccd:Executor/cat_ru:PersonPost"/></xsl:with-param>
						</xsl:apply-templates>
						<br/>
						<br/>
						<div style="width: 30mm; border-bottom: 1px solid black;"/>
						<div class="descr" style="text-align: left">
							<sup>1</sup>
							<xsl:text> Далее - таможенный орган</xsl:text>
						</div>
					</xsl:if>
					<xsl:if test="rccd:DecisionIndicator = 1 and not(rccd:RefusalPayPercentSign)">
						<table>
							<tbody>
								<tr>
									<td align="center" class="title">
										<font size="4">
											<b>Уведомление об отказе в возврате авансовых платежей</b>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table width="100%">
							<tbody>
								<tr>
									<td width="35%">
										<xsl:text>от </xsl:text>
										<table class="inlinetable" style="min-width: 90%; width: 90%;">
											<tbody>
												<tr align="center">
													<td class="value">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="rccd:RegistrationReq/cat_ru:PrDocumentDate"/>
														</xsl:call-template>
														<br/>
													</td>
												</tr>
												<tr align="center">
													<td class="descr">
														(дата заявления)
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td width="30%"></td>
									<td width="35%">
										<xsl:text>№ </xsl:text>
										<table class="inlinetable" style="min-width: 90%; width: 90%;">
											<tbody>
												<tr align="center">
													<td class="value">
														<xsl:apply-templates select="rccd:RegistrationReq/cat_ru:PrDocumentNumber"/>
														<br/>
													</td>
												</tr>
												<tr align="center">
													<td class="descr">
														(номер заявления)
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<table>
							<tbody>
								<tr>
									<td>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="rccd:Customs" mode="spaced"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(наименование таможенного органа Российской Федерации, рассматривающего заявление)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:text>уведомляет</xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="rccd:ApplicantInfo" mode="org2"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(наименование юридического лица/фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:text>ИНН </xsl:text>
												<xsl:apply-templates select="rccd:ApplicantInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="description" select="'(для лиц, состоящих на учете в налоговых органах Российской Федерации)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:text>и (или) сведения о наименовании, серии, номере, стране выдачи документа, удостоверяющего личность</xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="rccd:ApplicantInfo/rccd:IdentityCard"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="description" select="'(для физического лица)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:text>или наименование страны и регистрационный номер (код налогоплательщика (налоговый номер) или его аналог) в стране регистрации</xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="rccd:ApplicantInfo" mode="IINorAnalog"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="description" select="'(для юридических лиц, не состоящих на учетет в налоговых органах Российской Федерации)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:text>об отказе в возврате авансовых платежей по заявлению о возврате авансовых платежей</xsl:text>
										<br/>
										<xsl:text> от </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="rccd:RegistrationReq/cat_ru:PrDocumentDate"/>
												</xsl:call-template>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(дата регистрации заявления о возврате авансовых платежей)'"/>
											<xsl:with-param name="width" select="'70mm'"/>
										</xsl:call-template>
										<xsl:text> № </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="rccd:RegistrationReq/cat_ru:PrDocumentNumber"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(регистрационный номер заявления о возврате авансовых платежей)'"/>
											<xsl:with-param name="width" select="'70mm'"/>
										</xsl:call-template>
										
									</td>
								</tr>
								<tr>
									<td>
										<xsl:text>на основании</xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:value-of select="rccd:NoticeRefusal/rccd:ParSt36Ch18/rccd:ParNumSt36Ch18"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="rccd:NoticeRefusal/rccd:ParSt36Ch18/rccd:ParTextSt36Ch18"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(указывается пункт части 18 статьи 36 Федерального закона от 3 августа 2018 г. № 289-ФЗ &quot;О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации&quot;, по которому не производится возврат авансовых платежей)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
					<br/>
					<br/>
					<br/>
					<xsl:apply-templates mode="signature" select="rccd:HeadCustoms">
							<xsl:with-param name="post">Начальник (заместитель начальника) таможенного органа</xsl:with-param>
						</xsl:apply-templates>
						<xsl:apply-templates mode="signature" select="rccd:HeadDepartment">
							<xsl:with-param name="post">Начальник отдела</xsl:with-param>
						</xsl:apply-templates>
						<xsl:apply-templates mode="signature" select="rccd:Executor">
							<xsl:with-param name="post"><xsl:value-of select="rccd:Executor/cat_ru:PersonPost"/></xsl:with-param>
						</xsl:apply-templates>
					<br/>
					<p align="left" style="font-size: 8pt;">
						____________________________________
						<br/>
						<sup>1</sup> Далее - таможенный орган.
					</p>
					</xsl:if>
					<xsl:if test="rccd:DecisionIndicator = 1 and rccd:RefusalPayPercentSign">
						<table>
							<tbody>
								<tr>
									<td align="center" class="title">
										<font size="4">
											<b>Уведомление об отказе в возврате процентов</b>
										</font>
									</td>
								</tr>
								<tr align="center">
									<td>
										<xsl:if test="rccd:RegistrationReqDoc/cat_ru:PrDocumentDate">
											<xsl:text> от </xsl:text>
											<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="rccd:RegistrationReqDoc/cat_ru:PrDocumentDate"/></xsl:call-template>
										</xsl:if>
										<xsl:if test="rccd:RegistrationReqDoc/cat_ru:PrDocumentNumber">
											<xsl:text> № </xsl:text>
											<xsl:value-of select="rccd:RegistrationReqDoc/cat_ru:PrDocumentNumber"/>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td class="descr">(дата, номер уведомления)</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td>
										<xsl:text>Таможенный орган</xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="rccd:Customs" mode="spaced"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(наименование таможенного органа, рассматривающего заявление)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:text>уведомляет об отказе в возврате процентов по заявлению</xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="rccd:RegistrationReq"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(указывается номер и дата заявления о возврате авансовых платежей)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:text>о выплате процентов, поданному</xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="rccd:ApplicantInfo" mode="org2"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(наименование юридического лица/фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<tr>
													<td width="5%">
														<xsl:text>ИНН</xsl:text><sup>*</sup>
													</td>
													<td width="45%" class="value" align="center">
														<xsl:value-of select="rccd:ApplicantInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
													</td>
													<td width="5%">
														<xsl:text>КПП</xsl:text><sup>**</sup>
													</td>
													<td width="45%" class="value" align="center">
														<xsl:value-of select="rccd:ApplicantInfo/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<xsl:choose>
									<xsl:when test="rccd:RefusalPayPercentSign = 1 or translate(substring(rccd:RefusalPayPercentSign,1,1), 'T', 't') = 't'">
										<tr>
											<td>
												<xsl:text>В связи с отказом Федерального Казначейства/Кредитной организации в возврате процентов на банковский счет, зачет процентов произведен на лицевой счет по КБК "Авансовые платежи".</xsl:text>
											</td>
										</tr>	
									</xsl:when>
									<xsl:when test="rccd:RefusalPayPercentSign = 0 or translate(substring(rccd:RefusalPayPercentSign,1,1), 'F', 'f') = 'f'">
										<tr>
											<td>
												<xsl:apply-templates select="rccd:NoticeRefusal/rccd:ParSt36Ch18/rccd:ParTextSt36Ch18"/>
											</td>
										</tr>
									</xsl:when>
								</xsl:choose>
							</tbody>
						</table>
						<br/>
						<br/>
						<table>
							<tbody>
								<tr>
									<td width="50%" colspan="2"></td>
									<td width="50%" colspan="2">
										Начальник (заместитель начальника)
										<br/>
										таможенного органа
										<br/>
										<br/>
									</td>
								</tr>
								<tr align="center">
									<td width="25%" class="value">
										<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="rccd:HeadCustoms/cat_ru:IssueDate"/></xsl:call-template>
									</td>
									<td width="25%"></td>
									<td width="25%" class="value"></td>
									<td width="25%" class="value">
										<xsl:value-of select="rccd:HeadCustoms/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="rccd:HeadCustoms/cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="rccd:HeadCustoms/cat_ru:PersonMiddleName"/>
									</td>
								</tr>
								<tr>
									<td class="descr">(дата)</td>
									<td></td>
									<td class="descr">(подпись)</td>
									<td class="descr">(инициалы, фамилия)</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<p align="left" style="font-size: 8pt;">
							____________________________________
							<br/>
							<sup>*</sup> Идентификационный номер налогоплательщика.
							<br/>
							<sup>**</sup> Указывается код причины постановки на учет юридического лица, содержащийся в Едином государственном реестре юридических лиц.
						</p>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="rccd:ApplicantInfo" mode="IINorAnalog">
		<xsl:apply-templates select="*[local-name() = 'CountryA2Code']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RKOrganizationFeatures']"/>
		<xsl:apply-templates select="*[local-name() = 'RBOrganizationFeatures']"/>
		<xsl:apply-templates select="*[local-name() = 'RAOrganizationFeatures']"/>
		<xsl:apply-templates select="*[local-name() = 'KGOrganizationFeatures']"/>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="*[local-name() = 'KGOrganizationFeatures']">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text> ИНН/ПИН </xsl:text>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="*[local-name() = 'RAOrganizationFeatures']">
		<xsl:if test="cat_ru:UNN">
			<xsl:text> УНН </xsl:text>
			<xsl:apply-templates select="cat_ru:UNN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="*[local-name() = 'RBOrganizationFeatures']">
		<xsl:if test="cat_ru:UNP">
			<xsl:text> УНП </xsl:text>
			<xsl:apply-templates select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text> УНФЛ </xsl:text>
			<xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="*[local-name() = 'RKOrganizationFeatures']">
		<xsl:if test="cat_ru:BIN">
			<xsl:text> БИН </xsl:text>
			<xsl:apply-templates select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text> ИИН </xsl:text>
			<xsl:apply-templates select="cat_ru:IIN"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="rccd:IdentityCard">
		<xsl:if test="RUScat_ru:IdentityCardName">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardName"/>
			</span>
		</xsl:if>
		<xsl:if test="string-length(RUScat_ru:IdentityCardSeries) &gt; 0 or string-length(RUScat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries">
			<span class="italic">серия</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
			</span>
			<xsl:if test="string-length(RUScat_ru:IdentityCardNumber) &gt; 0">
				<span class="normal">&#160;</span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardNumber">
			<span class="italic">№</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="italic">, страна</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:CountryCode"/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="org2">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="spaced">
		<xsl:for-each select="./*">
			<xsl:if test="position() &gt; 1">
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:value-of select="."/>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="*" mode="signature">
		<xsl:param name="post"></xsl:param>
		<br/>
		<table>
			<tbody>
				<tr valign="bottom" align="center">
					<td width="25%" >
						<xsl:if test="local-name() = 'Executor'">
							<xsl:attribute name="class">
								<xsl:value-of select="'value'"/>
							</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="$post"/>
					</td>
					<td width="2%"></td>
					<td width="20%" class="value"></td>
					<td width="1%"></td>
					<td width="20%" class="value">
						<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:IssueDate"/></xsl:call-template>
					</td>
					<td width="2%"></td>
					<td width="30%" class="value">
						<xsl:value-of select="cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonName"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
					</td>
				</tr>
				<tr>
					<td class="descr">
						<xsl:if test="local-name() = 'Executor'">(должностное лицо)</xsl:if>
					</td>
					<td></td>
					<td class="descr">(подпись)</td>
					<td></td>
					<td class="descr">(дата)</td>
					<td></td>
					<td class="descr">(фамилия, имя, отчество)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="*" mode="doc">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/></xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="rccd:RegistrationReq">
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/></xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="org">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
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
	
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="supIndexDescr"/>
		<xsl:param name="supIndexData"/>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value">
						<xsl:value-of select="$data" disable-output-escaping="yes"/><sup><xsl:value-of select="$supIndexData"/></sup>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="descr">
						<xsl:value-of select="$description" disable-output-escaping="yes"/><sup><xsl:value-of select="$supIndexDescr"/></sup>
					</td>
				</tr>
			</tbody>
		</table>
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
</xsl:stylesheet>
