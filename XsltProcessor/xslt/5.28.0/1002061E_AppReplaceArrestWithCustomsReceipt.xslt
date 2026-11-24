<?xml version="1.0" encoding="utf-8"?>
<!-- Приказ ФТС России от 21.11.2018 г. № 1876 "Об утверждении форм документов, применяемых таможенными органами в целях обеспечения взыскания таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней за счет имущества и обращения взыскания на товары"
Приложение 3 (DocKind = 0) - Заявление о замене ареста имущества на денежный залог
Приложение 4 (DocKind = 1) - Уведомление таможенного органа об отказе в замене ареста имущества на денежный залог
Приложение 5 (DocKind = 2) - Решение таможенного органа о замене ареста имущества на денежный залог
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:els_agr="urn:customs.ru:Information:ELSDocuments:ELSAggregateTypes:5.27.0" xmlns:arawc="urn:customs.ru:Information:CommercialFinanceDocuments:AppReplaceArrestWithCustomsReceipt:5.27.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа AppReplaceArrestWithCustomsReceiptType -->
	<xsl:template match="arawc:AppReplaceArrestWithCustomsReceipt">
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

					.inlinetable
					{border: 0;
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
					text-align: center;}

					.descr
					{font-size: 8pt;
					text-align: center;
					vertical-align:top;}
				</style>
			</head>
			<body>
				<div class="page">
					<xsl:choose>
						<!--Приложение 3 - Заявление о замене ареста имущества на денежный залог-->
						<xsl:when test="arawc:DocKind='0'">
							<table width="100%">
								<tbody>
									<tr valign="top">
										<td width="50%"/>
										<td width="50%"/>
									</tr>
									<tr valign="top">
										<td align="right">Начальнику</td>
										<td class="value">
											<xsl:apply-templates select="arawc:Customs"/>
										</td>
									</tr>
									<tr valign="top">
										<td/>
										<td align="center" class="graph8">(наименование таможенного органа)</td>
									</tr>
									<tr valign="top">
										<td align="right">от</td>
										<td class="value">
											<xsl:apply-templates select="arawc:ApplicantInfo"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr valign="top">
										<td/>
										<td align="center" class="graph8">(сведения о лице, на имущество которого наложен арест)<!--sup>1</sup--></td>
									</tr>
									<tr>
										<td class="delim_3" colspan="2">
											<br/>
										</td>
									</tr>
									<tr align="center" valign="top">
										<td colspan="2">
											<b>
												<xsl:text>Заявление о замене ареста имущества на денежный залог</xsl:text>
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
							<br/>
							<table width="100%">
								<tbody>
									<tr>
										<td style="text-align: justify">
											<xsl:text>На основании части 36 статьи 78 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" в связи с принятым решением таможенного органа о наложении ареста на имущество от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="arawc:ImpositionArrest/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> № </xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="arawc:ImpositionArrest/cat_ru:PrDocumentNumber"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<xsl:text> прошу заменить арест имущества на денежный залог.</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify; text-indent:5%;">
											<xsl:text>В качестве подтверждения внесения обеспечения исполнения обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин в виде денежного залога в соответствии с частью 5 статьи 60 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" оформлена таможенная расписка № </xsl:text>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:apply-templates select="arawc:CustomsReceipt"/>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="descr">
													<xsl:text>(реквизиты таможенной расписки)</xsl:text>
												</xsl:with-param>
												<xsl:with-param name="width" select="'70mm'"/>
											</xsl:call-template>
											&#160;<xsl:text>на сумму </xsl:text>
											<span class="value">&#160;&#160;&#160;<xsl:value-of select="arawc:Amount"/>&#160;&#160;&#160;</span>
											&#160;<xsl:text>руб.</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<table width="100%">
								<tbody>
									<tr align="center" valign="bottom">
										<td class="value" width="65%"/>
										<td width="5%"/>
										<td class="value" width="30%">
											<xsl:apply-templates mode="signature" select="arawc:ExecSignature"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr align="center" valign="top">
										<td class="graph8">(подпись руководителя организации (индивидуального предпринимателя) или уполномоченного от имени организации (индивидуального предпринимателя) лица)</td>
										<td/>
										<td class="graph8">(инициалы, фамилия)</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<table width="100%">
								<tbody>
									<tr>
										<td>
											<xsl:call-template name="text_date">
												<xsl:with-param select="arawc:AppNumber/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
										</td>
									</tr>
								</tbody>
							</table>
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
						<!--Приложение 4 - Уведомление таможенного органа об отказе в замене ареста имущества на денежный залог-->
						<xsl:when test="arawc:DocKind='1'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td colspan="3">
											<br/>
											<br/>
											<b>
												<xsl:text>Уведомление таможенного органа Российской Федерации</xsl:text>
												<br/>
												<xsl:text>об отказе в замене ареста имущества на денежный залог</xsl:text>
											</b>
										</td>
									</tr>
									<tr>
										<td class="delim_3" colspan="3">
											<br/>
										</td>
									</tr>
									<tr>
										<td width="35%">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="arawc:DecisionInfo/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
										</td>
										<td width="30%"/>
										<td align="right" class="value" width="35%">
											<xsl:text>№ </xsl:text>
											<xsl:value-of select="arawc:DecisionInfo/cat_ru:PrDocumentNumber"/>
										</td>
									</tr>
									<tr>
										<td colspan="3"/>
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
															<xsl:apply-templates select="arawc:Customs"/>
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
										<td class="graph8">(наименование таможенного органа)</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>рассмотрев обращение</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates select="arawc:ApplicantInfo"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(сведения о лице, на имущество которого наложен арест: для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика; для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер налогоплательщика)<!--sup>1</sup--></td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="arawc:AppNumber/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text>, уведомляет об отказе в замене ареста имущества согласно принятому решению таможенного органа Российской Федерации о наложении ареста на имущество от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="arawc:ImpositionArrest/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> № </xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="arawc:ImpositionArrest/cat_ru:PrDocumentNumber"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<xsl:text> на денежный залог в связи с </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:value-of select="arawc:RefusalReason"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(основания принятия решения)</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<table width="100%">
								<tbody>
									<tr align="center" valign="bottom">
										<td width="45%" align="left">Начальник таможенного органа<br/>(или лицо, им уполномоченное)</td>
										<td width="2%"/>
										<td class="value" width="21%"/>
										<td width="2%"/>
										<td class="value" width="30%">
											<xsl:apply-templates mode="signature" select="arawc:CustChiefSignature"/>
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
								</tbody>
							</table-->
						</xsl:when>
						<!--Приложение 5 - Решение таможенного органа о замене ареста имущества на денежный залог-->
						<xsl:when test="arawc:DocKind='2'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td colspan="3">
											<br/>
											<br/>
											<b>
												<xsl:text>Решение таможенного органа Российской Федерации</xsl:text>
												<br/>
												<xsl:text>о замене ареста имущества на денежный залог</xsl:text>
											</b>
										</td>
									</tr>
									<tr>
										<td class="delim_3" colspan="3">
											<br/>
										</td>
									</tr>
									<tr>
										<td width="35%">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="arawc:DecisionInfo/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
										</td>
										<td width="30%"/>
										<td align="right" class="value" width="35%">
											<xsl:text>№ </xsl:text>
											<xsl:value-of select="arawc:DecisionInfo/cat_ru:PrDocumentNumber"/>
										</td>
									</tr>
									<tr>
										<td colspan="3"/>
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
															<xsl:apply-templates select="arawc:Customs"/>
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
										<td class="graph8">(наименование таможенного органа)</td>
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
											<xsl:apply-templates select="arawc:ApplicantInfo"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(сведения о заявителе, на имущество которого наложен арест: для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика; для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер налогоплательщика)<!--sup>1</sup--></td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="arawc:AppNumber/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text>, на основании части 35 статьи 78 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" принимает решение:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify; text-indent:5%;">
											<xsl:text>Заменить арест имущества согласно принятому решению таможенного органа Российской Федерации о наложении ареста на имущество от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="arawc:ImpositionArrest/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> № </xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="arawc:ImpositionArrest/cat_ru:PrDocumentNumber"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<xsl:text> на денежный залог, внесенный в качестве обеспечения исполнения обязанности по уплате таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин по таможенной расписке № </xsl:text>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:apply-templates select="arawc:CustomsReceipt"/>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="descr">
													<xsl:text>(реквизиты таможенной расписки)</xsl:text>
												</xsl:with-param>
												<xsl:with-param name="width" select="'70mm'"/>
											</xsl:call-template>
											&#160;<xsl:text>на сумму </xsl:text>
											<span class="value">&#160;&#160;&#160;<xsl:value-of select="arawc:Amount"/>&#160;&#160;&#160;</span>
											&#160;<xsl:text>руб.</xsl:text>
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
							<table width="100%">
								<tbody>
									<tr align="center" valign="bottom">
										<td width="45%" align="left">Начальник таможенного органа<br/>(или лицо, им уполномоченное)</td>
										<td width="2%"/>
										<td class="value" width="21%"/>
										<td width="2%"/>
										<td class="value" width="30%">
											<xsl:apply-templates mode="signature" select="arawc:CustChiefSignature"/>
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
							<br/>
							<table width="100%">
								<tbody>
									<tr align="center" valign="bottom">
										<td width="30%" align="left">Исполнитель</td>
										<td width="5%"/>
										<td class="value" width="65%">
											<xsl:apply-templates mode="signature" select="arawc:ExecSignature"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8"/>
										<td/>
										<td class="graph8">(инициалы, фамилия должностного лица таможенного органа)</td>
									</tr>
								</tbody>
							</table>
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
								</tbody>
							</table-->
						</xsl:when>
					</xsl:choose>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="descr"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="comma" select="0"/>
		<xsl:param name="dot" select="0"/>
		<xsl:variable name="width_td1">
			<xsl:choose>
				<xsl:when test="$comma=0 and $dot=0">
					<xsl:value-of select="'100%'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'99%'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value" width="{$width_td1}">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
					<xsl:if test="$comma != 0">
						<td width="1%" valign="bottom">,</td>
					</xsl:if>
					<xsl:if test="$dot != 0">
						<td width="1%" valign="bottom">.</td>
					</xsl:if>
				</tr>
				<tr align="center">
					<td class="descr" width="{$width_td1}">
						<xsl:value-of select="$descr"/>
					</td>
					<xsl:if test="$comma != 0 or $dot != 0">
						<td class="descr" width="1%">
							<br/>
						</td>
					</xsl:if>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа els_agr:DeclarantInfoType -->
	<xsl:template match="arawc:ApplicantInfo">
		<xsl:if test="els_agr:OrganizationName">
			<xsl:value-of select="els_agr:OrganizationName"/>
		</xsl:if>
		<xsl:if test="els_agr:ShortName">
			<xsl:if test="string-length(els_agr:OrganizationName) &gt; 0"> (</xsl:if>
			<xsl:value-of select="els_agr:ShortName"/>
			<xsl:if test="string-length(els_agr:OrganizationName) &gt; 0">)</xsl:if>
		</xsl:if>
		<!--xsl:if test="els_agr:OrganizationLanguage">,&#032;Язык заполнения:&#032;<xsl:value-of select="els_agr:OrganizationLanguage"/>
		</xsl:if>
		<xsl:if test="els_agr:OKSM">,&#032;Страна:&#032;<xsl:value-of select="els_agr:OKSM"/>
		</xsl:if-->
		<xsl:if test="els_agr:Classification">,&#032;Классификация лицевого счета:&#032;
			<xsl:choose>
				<xsl:when test="els_agr:Classification=0">
					<xsl:text>юридическое лицо</xsl:text>
				</xsl:when>
				<xsl:when test="els_agr:Classification=1">
					<xsl:text>физическое лицо</xsl:text>
				</xsl:when>
				<xsl:when test="els_agr:Classification=2">
					<xsl:text>ИП</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="els_agr:Classification"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="string-length(els_agr:INN) &gt; 0 or string-length(els_agr:KPP) &gt; 0">
			<span class="normal">,&#032;</span>
			<span class="italic">
				<xsl:if test="string-length(els_agr:INN) &gt; 0">
					<span class="italic">ИНН</span>
				</xsl:if>
				<xsl:if test="string-length(els_agr:INN) &gt; 0 and string-length(els_agr:KPP) &gt; 0">
					<span class="normal">/</span>
				</xsl:if>
				<xsl:if test="string-length(els_agr:KPP) &gt; 0">
					<span class="italic">КПП</span>
				</xsl:if>
				<span class="normal">:&#032;</span>
			</span>
		</xsl:if>
		<xsl:if test="els_agr:INN">
			<xsl:value-of select="els_agr:INN"/>
		</xsl:if>
		<xsl:if test="els_agr:KPP">
			<xsl:if test="string-length(els_agr:INN) &gt; 0">
				<span class="normal">&#032;/&#032;</span>
			</xsl:if>
			<xsl:value-of select="els_agr:KPP"/>
		</xsl:if>
		<xsl:if test="els_agr:TaxpayerId">
			<span class="normal">,&#032;</span>
			<span class="italic">Идентификатор иностранного лица</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="els_agr:TaxpayerId"/>
		</xsl:if>
		<xsl:if test="els_agr:OKTMO">,&#032;ОКТМО:&#032;<xsl:value-of select="els_agr:OKTMO"/>
		</xsl:if>
		<xsl:if test="els_agr:Birthdate">,&#032;Дата рождения:&#032;<xsl:apply-templates mode="russian_date" select="els_agr:Birthdate"/>
		</xsl:if>
		<xsl:if test="els_agr:Address">,&#032;Адрес:&#032;<xsl:for-each select="els_agr:Address">
				<xsl:choose>
					<xsl:when test="*[local-name() = 'AddressText']">
						<xsl:value-of select="*[local-name() = 'AddressText']"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="*[local-name() != 'AddressText']">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
				
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="els_agr:IdentityCard">,&#032;Документ, удостоверяющий личность:&#032;<xsl:apply-templates select="els_agr:IdentityCard"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="els_agr:IdentityCard">
		<xsl:if test="RUScat_ru:IdentityCardCode or RUScat_ru:IdentityCardName or RUScat_ru:FullIdentityCardName">
			<xsl:apply-templates select="RUScat_ru:IdentityCardCode"/>
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
			<xsl:if test="not(RUScat_ru:IdentityCardName) and RUScat_ru:FullIdentityCardName">
				<xsl:apply-templates select="RUScat_ru:FullIdentityCardName"/>
			</xsl:if>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<xsl:text>(</xsl:text>
			<xsl:apply-templates select="RUScat_ru:CountryCode"/>
			<xsl:text>) </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries">
			<xsl:text>серия </xsl:text>
			<xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardNumber">
			<xsl:text>№ </xsl:text>
			<xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate or RUScat_ru:OrganizationName or RUScat_ru:IssuerCode"> выдан </xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate">
		<xsl:apply-templates select="RUScat_ru:IdentityCardDate" mode="russian_date"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:OrganizationName or RUScat_ru:IssuerCode">
			<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
			<xsl:if test="RUScat_ru:IssuerCode"> код подразделения: <xsl:apply-templates select="RUScat_ru:IssuerCode"/>
			</xsl:if>
			<xsl:text> </xsl:text>
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
	<xsl:template match="*" mode="personBase">
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonMiddleName"/>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template mode="signature" match="*">
		<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
		<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
		<xsl:if test="cat_ru:PersonName">.</xsl:if>
		<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
		<xsl:if test="cat_ru:PersonMiddleName">.</xsl:if>
	</xsl:template>
	<xsl:template match="arawc:Customs">
		<xsl:value-of select="cat_ru:OfficeName"/>
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
