<?xml version="1.0" encoding="utf-8"?>
<!--Проект приказа ФТС России от **.**.20** № *** "Об утверждении формы акта выверки расходования денежных средств, внесенных в качестве авансовых платежей, а также порядка проведения выверки расходования денежных средств и предоставления акта выверки расходования денежных средств, внесенных в качестве авансовых платежей"-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:cat_crd="urn:customs.ru:CardCommonAggregateTypes:5.21.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:aa="urn:customs.ru:Information:ELSDocuments:ELSAllignAct:5.28.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:decimal-format name="ruFormat" decimal-separator="," grouping-separator=" "/>
	<!-- Шаблон для типа ELSAllignActType -->
	<xsl:template match="aa:ELSAllignAct">
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
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
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
                </style>
			</head>
			<body>
				<xsl:choose>
					<xsl:when test="aa:DocType = 0 or translate(substring(aa:DocType, 1, 1), 'f', 'F') = 'F'">
						<div class="page" style="width: {$w}mm;">
							<table>
								<tbody>
									<tr>
										<td align="center">
											<b>
												<xsl:text>Акт выверки расходования денежных средств,</xsl:text><br/>
												<xsl:text>внесенных в качестве авансовых платежей</xsl:text>
											</b>
										</td>
									</tr>
									<tr>
										<td align="center">
											<br/>
											<!--br/>
											<xsl:text>по состоянию на </xsl:text>
											<span style="display: inline-block; width: 30mm; border-bottom: 1px solid black;">
												<xsl:apply-templates select="aa:ReportDate" mode="russian_date"/>
											</span-->
											<br/>
											<xsl:text>за период с </xsl:text>
											<span style="display: inline-block; width: 30mm; border-bottom: 1px solid black;">
												<xsl:apply-templates select="aa:PeriodBegin" mode="russian_date"/>
											</span>
											<xsl:text> по </xsl:text>
											<span style="display: inline-block; width: 30mm; border-bottom: 1px solid black;">
												<xsl:apply-templates select="aa:PeriodEnd" mode="russian_date"/>
											</span>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<xsl:text>По обращению от </xsl:text>
							<table class="inlinetable" style="min-width: 50mm; width: 50mm;">
								<tbody>
									<tr align="center">
										<td class="value">
											<xsl:apply-templates select="aa:AllignActReq/cat_ru:PrDocumentDate" mode="russian_date"/>
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
							<xsl:text>№ </xsl:text>
							<table class="inlinetable" style="min-width: 50mm; width: 50mm;">
								<tbody>
									<tr align="center">
										<td class="value">
											<xsl:apply-templates select="aa:AllignActReq/cat_ru:PrDocumentNumber"/>
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
							<br/>
							<table class="inlinetable" style="min-width: 100%; width: 100%;">
								<tbody>
									<tr align="center">
										<td class="value">
											<xsl:apply-templates select="aa:Payer/aa:OrganizationName"/>
											<br/>
										</td>
									</tr>
									<tr align="center">
										<td class="descr">
											(наименование юридического лица/фамилия, имя, отчество (при наличии) индивидуального предпринимателя, подавшего обращение)
										</td>
									</tr>
								</tbody>
							</table>
							<div style="width: 100%;">
								<xsl:text>Идентификационный номер налогоплательщика</xsl:text>
								<table class="inlinetable" style="min-width: 100%; width: 100%;">
									<tbody>
										<tr align="center">
											<td class="value">
												<xsl:apply-templates select="aa:Payer/aa:INN"/>
												<br/>
											</td>
										</tr>
										<tr align="center">
											<td class="descr">
												(для лиц, состоящих на учете в налоговых органах Российской Федерации)
											</td>
										</tr>
									</tbody>
								</table>
								<xsl:text>или наименование страны и регистрационный номер (код налогоплательщика (налоговый номер) или его аналог) в стране регистрации</xsl:text>
								<table class="inlinetable" style="min-width: 100%; width: 100%;">
									<tbody>
										<tr align="center">
											<td class="value">
												<xsl:apply-templates select="aa:Payer/aa:UITN/RUScat_ru:CountryCode"/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="aa:Payer/aa:UITN/RUScat_ru:UITNCode"/>
												<br/>
											</td>
										</tr>
										<tr align="center">
											<td class="descr">
												(для лиц, не состоящих на учете в налоговых органах Российской Федерации)
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<br/>
							<table>
								<tbody>
									<tr>
										<td>
											<table class="inlinetable" style="min-width: 100%; width: 100%;">
												<tbody>
													<tr align="center">
														<td class="value">
															<xsl:for-each select="aa:Customs/*">
																<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
																<xsl:apply-templates select="."/>
															</xsl:for-each>
															<br/>
														</td>
													</tr>
													<tr align="center">
														<td class="descr">
															(наименование таможенного органа Российской Федерации (далее - таможенный орган))
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table style="font-size: 10pt;">
								<tbody>
									<tr align="center" valign="top">
										<td class="bordered">Стороны</td>
										<td class="bordered">Остаток на <xsl:apply-templates select="aa:PeriodBegin" mode="russian_date"/></td>
										<td class="bordered">Поступило / зачтено за период</td>
										<td class="bordered">Списано / возвращено за период</td>
										<td class="bordered">Остаток на <xsl:apply-templates select="aa:PeriodEnd" mode="russian_date"/></td>
									</tr>
									<xsl:for-each select="aa:Balance">
										<xsl:sort order="ascending" data-type="number"/>
										<tr align="center">
											<td class="bordered">
												<xsl:text>Данные </xsl:text>
												<xsl:choose>
													<xsl:when test="aa:SideType = 0 or translate(substring(aa:SideType, 1, 1), 'f', 'F') = 'F'">таможенного органа</xsl:when>
													<xsl:when test="aa:SideType = 1 or translate(substring(aa:SideType, 1, 1), 't', 'T') = 'T'">лица, внесшего авансовые платежи</xsl:when>
												</xsl:choose>
											</td>
											<td class="bordered">
												<xsl:apply-templates select="aa:BalanceIn"/>
											</td>
											<td class="bordered">
												<xsl:apply-templates select="aa:Income"/>
											</td>
											<td class="bordered">
												<xsl:apply-templates select="aa:Outcome"/>
											</td>
											<td class="bordered">
												<xsl:apply-templates select="aa:BalanceOut"/>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<br/>
							<br/>
							<div style="width:100%; text-align: center;">Выверка поступления / зачета авансовых платежей</div>
							<br/>
							<table style="font-size: 10pt;">
								<tbody>
									<tr align="center" valign="top">
										<td class="bordered" rowspan="2">№ п/п</td>
										<td class="bordered" colspan="3">Реквизиты документа, в соответствии с которым денежные средства вносились в качестве авансовых платежей либо производился зачет излишне уплаченных (взысканных) платежей</td>
										<td class="bordered" colspan="2">Сумма поступивших/зачтенных денежных средств</td>
										<td class="bordered" rowspan="2">Сумма расхождения в данных таможенного органа и лица, внесшего авансовые платежи, руб.</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered">Наименование документа</td>
										<td class="bordered">Номер документа</td>
										<td class="bordered">Дата документа</td>
										<td class="bordered">даные таможенного органа, руб.</td>
										<td class="bordered">данные лица, внесшего авансовые платежи, руб.</td>
									</tr>
									<xsl:for-each select="aa:Allign[aa:OperationType = 0 or translate(substring(aa:OperationType, 1, 1), 'f', 'F') = 'F']">
										<tr align="right">
											<td class="bordered">
												<xsl:value-of select="position()"/>
											</td>
											<td class="bordered">
												<xsl:apply-templates select="cat_ru:PrDocumentName"/>
											</td>
											<td class="bordered">
												<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
											</td>
											<td class="bordered">
												<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
											</td>
											<td class="bordered">
												<xsl:apply-templates select="aa:SumCustoms"/>
											</td>
											<td class="bordered">
												<xsl:apply-templates select="aa:SumPayer"/>											
											</td>
											<td class="bordered">
												<xsl:apply-templates select="aa:Divergence"/>
											</td>
										</tr>
									</xsl:for-each>
									<tr align="right">
										<td class="bordered">Итого</td>
										<td class="bordered"></td>
										<td class="bordered"></td>
										<td class="bordered"></td>
										<td class="bordered">
											<xsl:value-of select="sum(aa:Allign[aa:OperationType = 0 or translate(substring(aa:OperationType, 1, 1), 'f', 'F') = 'F']/aa:SumCustoms)"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="sum(aa:Allign[aa:OperationType = 0 or translate(substring(aa:OperationType, 1, 1), 'f', 'F') = 'F']/aa:SumPayer)"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="sum(aa:Allign[aa:OperationType = 0 or translate(substring(aa:OperationType, 1, 1), 'f', 'F') = 'F']/aa:Divergence)"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<div style="width:100%; text-align: center;">Выверка списания / возврата авансовых платежей</div>
							<br/>
							<table style="font-size: 10pt;">
								<tbody>
									<tr align="center" valign="top">
										<td class="bordered" rowspan="2">№ п/п</td>
										<td class="bordered" colspan="3">Реквизиты документа, в соответствии с которым расходовались денежные средства</td>
										<td class="bordered" colspan="2">Сумма списанных / возвращенных на банковских счет денежных средств</td>
										<td class="bordered" rowspan="2">Сумма расхождения в данных таможенного органа и лица, внесшего авансовые платежи, руб.</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered">Наименование документа</td>
										<td class="bordered">Номер документа</td>
										<td class="bordered">Дата документа</td>
										<td class="bordered">даные таможенного органа, руб.</td>
										<td class="bordered">данные лица, внесшего авансовые платежи, руб.</td>
									</tr>
									<xsl:for-each select="aa:Allign[aa:OperationType = 1 or translate(substring(aa:OperationType, 1, 1), 't', 'T') = 'T']">
										<tr align="right">
											<td class="bordered">
												<xsl:value-of select="position()"/>
											</td>
											<td class="bordered">
												<xsl:apply-templates select="cat_ru:PrDocumentName"/>
											</td>
											<td class="bordered">
												<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
											</td>
											<td class="bordered">
												<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
											</td>
											<td class="bordered">
												<xsl:apply-templates select="aa:SumCustoms"/>
											</td>
											<td class="bordered">
												<xsl:apply-templates select="aa:SumPayer"/>											
											</td>
											<td class="bordered">
												<xsl:apply-templates select="aa:Divergence"/>
											</td>
										</tr>
									</xsl:for-each>
									<tr align="right">
										<td class="bordered">Итого</td>
										<td class="bordered"></td>
										<td class="bordered"></td>
										<td class="bordered"></td>
										<td class="bordered">
											<xsl:value-of select="sum(aa:Allign[aa:OperationType = 0 or translate(substring(aa:OperationType, 1, 1), 'f', 'F') = 'F']/aa:SumCustoms)"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="sum(aa:Allign[aa:OperationType = 0 or translate(substring(aa:OperationType, 1, 1), 'f', 'F') = 'F']/aa:SumPayer)"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="sum(aa:Allign[aa:OperationType = 0 or translate(substring(aa:OperationType, 1, 1), 'f', 'F') = 'F']/aa:Divergence)"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<table style="display:inline-block; width:45%; min-width:45%; max-width:45%">
								<tbody>
									<tr>
										<td width="40%"></td>
										<td width="1%"></td>
										<td width="59%"></td>
									</tr>
									<tr>
										<td colspan="3">
											Начальник таможенного органа<br/>(лицо, его замещающее)
										</td>
									</tr>
									<tr>
										<td>
											<table class="inlinetable" style="min-width: 100%; width: 100%;">
												<tbody>
													<tr align="left">
														<td class="value">
															<xsl:apply-templates select="aa:CustomSignature/cat_ru:IssueDate" mode="russian_date"/>
															<br/>
														</td>
													</tr>
													<tr align="center">
														<td class="descr">
															(дата, подпись)
														</td>
													</tr>
												</tbody>
											</table>
										</td>
										<td/>
										<td>
											<table class="inlinetable" style="min-width: 100%; width: 100%;">
												<tbody>
													<tr align="center">
														<td class="value">
															<xsl:apply-templates select="aa:CustomSignature" mode="FIO"/>
															<br/>
														</td>
													</tr>
													<tr align="left">
														<td class="descr">
															(фамилия, имя, отчество (при наличии)
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td align="center">
											<br/>
											<br/>
											<br/>
											М.П.
										</td>
									</tr>
								</tbody>
							</table>
							<span style="display: inline-block; width: 10%;"/>
							<table style="display:inline-block; width:45%; min-width:45%; max-width:45%">
								<tbody>
									<tr>
										<td width="40%"></td>
										<td width="1%"></td>
										<td width="59%"></td>
									</tr>
									<tr>
										<td colspan="3">
											Лицо, внесшее авансовые платежи
											<br/>
											<br/>
										</td>
									</tr>
									<tr valign="top">
										<td>
											<table class="inlinetable" style="min-width: 100%; width: 100%;">
												<tbody>
													<tr align="left">
														<td class="value">
															<xsl:apply-templates select="aa:PayerSignature/cat_ru:IssueDate" mode="russian_date"/>
															<br/>
														</td>
													</tr>
													<tr align="center">
														<td class="descr">
															(дата, подпись)
														</td>
													</tr>
												</tbody>
											</table>
										</td>
										<td/>
										<td>
											<table class="inlinetable" style="min-width: 100%; width: 100%;">
												<tbody>
													<tr align="center">
														<td class="value">
															<xsl:apply-templates select="aa:PayerSignature" mode="FIO"/>
															<br/>
														</td>
													</tr>
													<tr align="left">
														<td class="descr">
															(фамилия, имя, отчество (при наличии)
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td align="center">
											<br/>
											<br/>
											<br/>
											М.П.<br/>
											<span class="descr">(если, в соответствии с законодательством Российской Федерации лицо, подавшее заявление, имеет печать)</span>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<br/>
							<!--div style="width: 100%; font-size: 8pt; text-align: justify;">
								<sup>1</sup>
								<xsl:text> Указывается документ согласно приложению к порядку проведения выверки расходования денежных средств и предоставления акта выверки расходования денежных средств, внесенных в качестве авансовых платежей.</xsl:text>
								<br/>
								<sup>2</sup>
								<xsl:text> Указывается документ согласно приложению к порядку проведения выверки расходования денежных средств и предоставления акта выверки расходования денежных средств, внесенных в качестве авансовых платежей.</xsl:text>
								<br/>
								<sup>3</sup>
								<xsl:text> Если в соответствии с законодательством Российской Федерации лицо, подавшее заявление, имеет печать.</xsl:text>
							</div-->
						</div>
					</xsl:when>
					<xsl:when test="aa:DocType = 1 or translate(substring(aa:DocType, 1, 1), 't', 'T') = 'T'">
						<div class="page" style="width: {$w}mm;">
							<table>
								<tbody>
									<tr>
										<td align="center" class="title">
											<font size="4">
												<b>Возражения на акт выверки расходования денежных средств, внесенных в качестве авансовых платежей</b>
											</font>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
									<td class="value graphMain" style="width:50%">
										<xsl:apply-templates select="cat_crd:DocumentID"/>
									</td>
								</tr>
							</table>
							<xsl:if test="cat_crd:RefDocumentID">
								<table>
									<tr>
										<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
										<td class="value graphMain" style="width:50%">
											<xsl:apply-templates select="cat_crd:RefDocumentID"/>
										</td>
									</tr>
								</table>
							</xsl:if>
							<table>
								<tr>
									<td class="annot graphMain" style="width:50%">Дата отчета</td>
									<td class="value graphMain" style="width:50%">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="aa:ReportDate"/>
										</xsl:call-template>
									</td>
								</tr>
							</table>
							<table>
								<tr>
									<td class="annot graphMain" style="width:50%">Начало запрашиваемого периода</td>
									<td class="value graphMain" style="width:50%">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="aa:PeriodBegin"/>
										</xsl:call-template>
									</td>
								</tr>
							</table>
							<table>
								<tr>
									<td class="annot graphMain" style="width:50%">Конец запрашиваемого периода</td>
									<td class="value graphMain" style="width:50%">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="aa:PeriodEnd"/>
										</xsl:call-template>
									</td>
								</tr>
							</table>
							<xsl:if test="aa:AllignActReq">
								<div class="title marg-top">Запрос на предоставление акта выверки взаиморасчетов</div>
								<div>
									<xsl:apply-templates select="aa:AllignActReq">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</div>
							</xsl:if>
							<table>
								<tr>
									<td class="annot graphMain" style="width:50%">Тип документа</td>
									<td class="value graphMain" style="width:50%">
										<xsl:choose>
											<xsl:when test="aa:DocType='true' or aa:DocType='1'">
												<xsl:text>Акт выверки</xsl:text>
											</xsl:when>
											<xsl:when test="aa:DocType='false' or aa:DocType='0'">
												<xsl:text>Возражения на акт выверки</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="aa:DocType"/>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
							</table>
							<xsl:if test="aa:Customs">
								<div class="title marg-top">Таможенный орган</div>
								<div>
									<xsl:apply-templates select="aa:Customs">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="aa:Payer">
								<div class="title marg-top">Лицо, внесшее авансовые платежи</div>
								<div>
									<xsl:apply-templates select="aa:Payer">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="aa:Allign">
								<div class="title marg-top">Выверка авансовых платежей</div>
								<table class="bordered">
									<tbody>
										<tr class="title">
											<td class="graphMain bordered">Наименование документа</td>
											<td class="graphMain bordered">Номер документа</td>
											<td class="graphMain bordered">Дата документа</td>
											<td class="graphMain bordered">Тип операции</td>
											<td class="graphMain bordered">Данные таможенного органа</td>
											<td class="graphMain bordered">Данные лица, внесшего авансовые платежи</td>
											<td class="graphMain bordered">Расхождение</td>
											<td class="graphMain bordered">Код вида таможенного платежа</td>
											<td class="graphMain bordered">Код таможенного органа</td>
										</tr>
										<xsl:for-each select="aa:Allign">
											<xsl:apply-templates select=".">
												<xsl:with-param name="wdth" select="$w"/>
											</xsl:apply-templates>
										</xsl:for-each>
									</tbody>
								</table>
							</xsl:if>
							<xsl:if test="aa:Balance">
								<div class="title marg-top">Входящий остаток</div>
								<table class="bordered">
									<tbody>
										<tr class="title">
											<td class="graphMain bordered">Данные</td>
											<td class="graphMain bordered">Входящий остаток</td>
											<td class="graphMain bordered">Поступило/зачтено за отчетный период</td>
											<td class="graphMain bordered">Списано/возвращено за отчетный период</td>
											<td class="graphMain bordered">Исходящий остаток</td>
										</tr>
										<xsl:for-each select="aa:Balance">
											<xsl:apply-templates select=".">
												<xsl:with-param name="wdth" select="$w"/>
											</xsl:apply-templates>
										</xsl:for-each>
									</tbody>
								</table>
							</xsl:if>
							<xsl:if test="aa:CustomSignature">
								<div class="title marg-top">Начальник (заместитель начальника) таможенного органа</div>
								<div>
									<xsl:apply-templates select="aa:CustomSignature">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="aa:PayerSignature">
								<div class="title marg-top">Лицо, внесшее авансовые платежи</div>
								<div>
									<xsl:apply-templates select="aa:PayerSignature">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="aa:AttachedDocuments">
								<div class="title marg-top">Перечень прилагаемых документов</div>
								<table class="bordered">
									<tbody>
										<tr class="title">
											<td class="graphMain bordered">Наименование документа</td>
											<td class="graphMain bordered">Номер документа</td>
											<td class="graphMain bordered">Дата документа</td>
											<td class="graphMain bordered">Код вида электронного документа (сведений)</td>
											<td class="graphMain bordered">Идентификаторы, присвоенные документу (сведениям) при размещении в хранилище электронных документов</td>
										</tr>
										<xsl:for-each select="aa:AttachedDocuments">
											<xsl:apply-templates select=".">
												<xsl:with-param name="wdth" select="$w"/>
											</xsl:apply-templates>
										</xsl:for-each>
									</tbody>
								</table>
							</xsl:if>
						</div>
					</xsl:when>
				</xsl:choose>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="*" mode="FIO">
		<xsl:for-each select="*[contains(local-name(), 'ame')]">
			<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="*" mode="IOFamily">
		<xsl:value-of select="substring(cat_ru:PersonName, 1, 1)"/>
		<xsl:text>.</xsl:text>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:value-of select="substring(cat_ru:PersonMiddleName, 1, 1)"/>
			<xsl:text>.</xsl:text>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonSurname"/>
	</xsl:template>
	<!-- Шаблон для типа aa:AllignType -->
	<xsl:template match="aa:Allign">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
					</xsl:call-template>
				</td>
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="aa:OperationType='true' or aa:OperationType='1'">
							<xsl:text>списание/возврат</xsl:text>
						</xsl:when>
						<xsl:when test="aa:OperationType='false' or aa:OperationType='0'">
							<xsl:text>поступление/зачет</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="aa:OperationType"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="format-number(aa:SumCustoms,'##0,00','ruFormat')"/>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="format-number(aa:SumPayer,'##0,00','ruFormat')"/>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="format-number(aa:Divergence,'##0,00','ruFormat')"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="aa:PaymentModeCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="aa:PrDocumentCustomCode"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="aa:AllignActReq">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PrDocumentName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
							</xsl:call-template>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа aa:AttachedDocumentsType -->
	<xsl:template match="aa:AttachedDocuments">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
					</xsl:call-template>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="aa:EDocCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="aa:DocArchIdDetails">
						<xsl:apply-templates select="aa:DocArchIdDetails">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа aa:BalanceInfoType -->
	<xsl:template match="aa:Balance">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="aa:SideType='true' or aa:SideType='1'">
							<xsl:text>таможенного органа</xsl:text>
						</xsl:when>
						<xsl:when test="aa:SideType='false' or aa:SideType='0'">
							<xsl:text>лица, внесшего авансовые платежи</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="aa:SideType"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="format-number(aa:BalanceIn,'##0,00','ruFormat')"/>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="format-number(aa:Income,'##0,00','ruFormat')"/>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="format-number(aa:Outcome,'##0,00','ruFormat')"/>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="format-number(aa:BalanceOut,'##0,00','ruFormat')"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonSignatureType -->
	<xsl:template match="aa:CustomSignature">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Фамилия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:PersonSurname"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Имя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:PersonName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:PersonMiddleName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Отчество</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PersonPost">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Должность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonPost"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:IssueDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата подписания</td>
						<td class="value graphMain" style="width:50%">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
							</xsl:call-template>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="aa:Customs">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:Code"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:OfficeName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OfficeName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:RFBasePresentedDocIDType -->
	<xsl:template match="aa:DocArchIdDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="catESAD_cu:ElectronicDocumentID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификатор документа, присвоенный информационной системой таможенных органов при представлении документа в электронном виде</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_cu:ElectronicDocumentID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catESAD_cu:ElectronicArchID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификатор хранилища электронных документов при представлении документа в электронном виде</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_cu:ElectronicArchID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catESAD_cu:DocumentModeID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код вида представленного документа в соответствии с альбомом форматов электронных форм документов</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_cu:DocumentModeID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_crd:OrganizationBaseType -->
	<xsl:template match="aa:Payer">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_crd:INN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН - Индивидуальный номер налогоплательщика</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_crd:INN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_crd:KPP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">КПП - Код причины постановки на учет</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_crd:KPP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_crd:OrganizationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организации</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_crd:OrganizationName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonSignatureType -->
	<xsl:template match="aa:PayerSignature">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Фамилия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:PersonSurname"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Имя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:PersonName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:PersonMiddleName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Отчество</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PersonPost">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Должность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonPost"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:IssueDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата подписания</td>
						<td class="value graphMain" style="width:50%">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
							</xsl:call-template>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
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
	<xsl:template match="//*[local-name()='ELSAllignAct']//*" priority="-1">
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
	<xsl:template match="*" mode="date">
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
	<xsl:template match="*" mode="translate_number">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(.,'.', ',')"/>
		</element>
	</xsl:template>
</xsl:stylesheet>
