<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.24.0" xmlns:avdi="urn:customs.ru:Information:CustomsAuditDocuments:ActVerificationDocAndIinformation:5.24.0">
	
	<xsl:param name="signatures"/>
	  <!-- формат данных в signatures
		<root>
		  <cert id="4D2B4C8000010003BFAC" owner="Семенов Виталий Александрович" from="2022-12-06T15:59:18" to="2023-12-05T16:09:18" />
		  <cert ... />
		</root>
		-->
	<xsl:include href="ElSign.xslt"/>
	
	<!-- Шаблон для типа ActVerificationDocAndIinformationType -->
	<xsl:template match="avdi:ActVerificationDocAndIinformation">
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
						vertical-align:top;
					}
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<xsl:choose>
						<xsl:when test="avdi:DocKind = 1">
							<table>
								<tbody>
									<tr>
										<td align="center">ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</td>
									</tr>
									<tr>
										<td align="center">
											<table class="inlinetable" style="width: 80%;">
												<tbody>
													<tr align="center">
														<td class="value">
															<xsl:value-of select="avdi:CustomsName"/>
															<br/>
														</td>
													</tr>
													<tr align="center">
														<td class="descr">
															(наименование таможенного орагана)
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
										<td align="center">
										Акт<br/>
										проверки таможенных, иных документов и (или) сведений
										<br/>
										№ <xsl:apply-templates select="avdi:ActNumber" mode="GTDNum"/>
										<br/>
										<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr valign="bottom" align="center">
														<td width="35%" class="graphMain">
															<xsl:call-template name="russian_date_month">
																<xsl:with-param name="dateIn" select="avdi:ActNumber/avdi:RegistrationDate"/>
															</xsl:call-template>
														</td>
														<td width="35%"/>
														<td width="30%" class="value">
															<xsl:apply-templates select="avdi:ActPlace"/>
														</td>
													</tr>
													<tr>
														<td class="descr">(дата)</td>
														<td/>
														<td class="descr">(место составления)</td>
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
										<td>Должностными лицами:</td>
									</tr>
									<tr>
										<td>
											<table class="inlinetable" style="width: 100%;">
												<tbody>
													<tr align="left">
														<td class="value">
															<xsl:for-each select="avdi:CustomsPersons">
																<xsl:if test="position() != 1"><br/></xsl:if>
																<xsl:apply-templates select="." mode="custPers_Act"/>
															</xsl:for-each>
															<br/>
														</td>
													</tr>
													<tr align="center">
														<td class="descr">
															(должность, структурное подразделение, инициалы, фамилии лиц, проводивших проверку)
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>c </xsl:text>
											<xsl:call-template name="russian_date_month"><xsl:with-param name="dateIn" select="avdi:StartControlDate"/></xsl:call-template>
											<xsl:text> на основании статей 361, 363, 367 Таможенного кодекса Российской Федерации</xsl:text>
										</td>
									</tr>
									<tr>
										<td>У</td>
									</tr>
									<tr>
										<td>
											<table class="inlinetable" style="width: 100%;">
												<tbody>
													<tr align="left">
														<td class="value">
															<xsl:apply-templates select="avdi:VerifiedPerson" mode="verPers_Act"/>
															<br/>
														</td>
													</tr>
													<tr align="center">
														<td class="descr">
															(наименование и местонахождение проверяемого лица)
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>после  выпуска  товаров и (или)  транспортных  средств  проведена  проверка документов  и  сведений,  представленных  при  таможенном  оформлении,  по:</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table class="inlinetable" style="width: 100%;">
												<tbody>
													<tr align="left">
														<td class="value">
															<xsl:for-each select="avdi:PreviousDocDocDetails/avdi:CustomsDeclarationIdDetails">
																<xsl:if test="position()!=1">, </xsl:if>
																<xsl:apply-templates select="." mode="TD_num"/>
															</xsl:for-each>
															<br/>
															<xsl:for-each select="avdi:PreviousDocDocDetails/avdi:OtherDocDetails">
																<xsl:if test="position()!=1">; </xsl:if>
																<xsl:apply-templates select="." mode="doc"/>
															</xsl:for-each>
														</td>
													</tr>
													<tr align="center">
														<td class="descr">
															(номера таможенных деклараций либо документов иной формы, установленной<br/>в соответствии с таможенным законодательством Российской Федерации)
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											Направления проверки:
										</td>
									</tr>
									<tr>
										<td>
											<table class="inlinetable" style="width: 100%;">
												<tbody>
													<tr align="left">
														<td class="value">
															<xsl:for-each select="avdi:CheckDirections">
																<xsl:if test="position()!=1"><br/></xsl:if>
																<xsl:apply-templates select="."/>
															</xsl:for-each>
															<br/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											Проверка проведена на основании следующих документов:
										</td>
									</tr>
									<tr>
										<td>
											<table class="inlinetable" style="width: 100%;">
												<tbody>
													<tr align="left">
														<td class="value">
															<xsl:for-each select="avdi:Applications">
																<xsl:if test="position()!=1">; </xsl:if>
																<xsl:apply-templates select="." mode="doc"/>
															</xsl:for-each>
															<br/>
															<xsl:if test="avdi:DocumentRequest">
																<xsl:text>Запрошенные:</xsl:text>
																<br/>
																<xsl:for-each select="avdi:DocumentRequest/avdi:Documents">
																	<xsl:if test="position() != 1">; </xsl:if>
																	<xsl:apply-templates select="." mode="doc"/>
																</xsl:for-each>
															</xsl:if>
															
														</td>
													</tr>
													<tr align="center">
														<td class="descr">
															(виды проверенных документов, включая дополнительно запрошенных,<br/>и при необходимости перечень конкретных документов)
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											В ходе проверки проведены следующие мероприятия:
										</td>
									</tr>
									<tr>
										<td>
											<table class="inlinetable" style="width: 100%;">
												<tbody>
													<tr align="left">
														<td class="value">
															<xsl:for-each select="avdi:Actions">
																<xsl:apply-templates select="."/>
															</xsl:for-each>
															<br/>
														</td>
													</tr>
													<tr align="center">
														<td class="descr">
															(сведения о мероприятиях таможенного контроля,<br/>проведенных при осуществлении проверки)
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											В ходе проверки установлено:
										</td>
									</tr>
									<tr>
										<td>
											<table class="inlinetable" style="width: 100%;">
												<tbody>
													<tr align="left">
														<td class="value">
															<xsl:apply-templates select="avdi:Results"/>
															<br/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											Выводы и предложения:
										</td>
									</tr>
									<tr>
										<td>
											<table class="inlinetable" style="width: 100%;">
												<tbody>
													<tr align="left">
														<td class="value">
															<xsl:for-each select="avdi:ConclusionsAndOffers">
																<xsl:if test="position()!=1"><br/><br/></xsl:if>
																<xsl:apply-templates select="."/>
															</xsl:for-each>
															<br/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											Должностные лица, проводившие проверку документов и сведений:
										</td>
									</tr>
									<tr>
										<td>
											<table class="inlinetable" style="width: 100%;">
												<tbody>
													<tr align="left">
														<td class="value">
															<xsl:for-each select="avdi:CustomsPersons">
																<xsl:if test="position() != 1"><br/><br/></xsl:if>
																<xsl:apply-templates select="." mode="custPers_Act_Signature"/>
																<xsl:if test="$signatures">
																	<xsl:variable name="FIO">
																		<xsl:for-each select="*[local-name() = 'PersonSurname' or local-name() = 'PersonName' or local-name() = 'PersonMiddleName']">
																			<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
																			<xsl:value-of select="."/>
																		</xsl:for-each>
																	</xsl:variable>
																	<xsl:apply-templates select="$signatures/cert[@owner = $FIO]" mode="Signature"/>
																</xsl:if>
															</xsl:for-each>
														</td>
													</tr>
													<tr align="center">
														<td class="descr">
															(Ф.И.О., подписи) 
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											Согласовано:
										</td>
									</tr>
									<tr>
										<td>
											<table class="inlinetable" style="width: 100%;">
												<tbody>
													<tr align="left">
														<td class="value">
															<xsl:apply-templates select="avdi:CustomsHeadPersons" mode="custHead_Act_Signature"/>
														</td>
													</tr>
													<tr align="center">
														<td class="descr">
															(должность, Ф.И.О., подпись)
														</td>
													</tr>
													<tr>
														<td>
															<xsl:for-each select="avdi:CustomsHeadPersons">
																<xsl:if test="$signatures">
																	<xsl:variable name="FIO">
																		<xsl:for-each select="*[local-name() = 'PersonSurname' or local-name() = 'PersonName' or local-name() = 'PersonMiddleName']">
																			<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
																			<xsl:value-of select="."/>
																		</xsl:for-each>
																	</xsl:variable>
																	<xsl:apply-templates select="$signatures/cert[@owner = $FIO]" mode="Signature"/>
																</xsl:if>
															</xsl:for-each>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:when test="avdi:DocKind = 2">
							<table>
								<tbody>
									<tr>
										<td align="center">
										УВЕДОМЛЕНИЕ<br/>
										о завершении проверки таможенных, иных документов и (или) сведений
										<br/>
										<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr valign="bottom" align="center">
														<td width="35%" class="graphMain">
															<xsl:call-template name="russian_date_month">
																<xsl:with-param name="dateIn" select="avdi:ActNumber/avdi:RegistrationDate"/>
															</xsl:call-template>
														</td>
														<td width="35%"/>
														<td width="30%" class="value">
															<xsl:apply-templates select="avdi:ActPlace"/>
														</td>
													</tr>
													<tr>
														<td class="descr">(дата)</td>
														<td/>
														<td class="descr">(место составления)</td>
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
										<td style="text-indent: 1.5em;">
											<xsl:text>В соответствии с частью 8 статьи 226 Федерального закона от 3 августа 2018 г. N 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении  изменений в отдельные законодательные акты Российской Федерации" уведомляю о том, что проводимая</xsl:text>
										</td>
									</tr>
									<tr>
										<td align="center">
											<table class="inlinetable" style="width: 100%;">
												<tbody>
													<tr align="center">
														<td class="value">
															<xsl:value-of select="avdi:CustomsName"/>
															<br/>
														</td>
													</tr>
													<tr align="center">
														<td class="descr">
															(наименование таможенного орагана)
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											на   основании   статей   326,   340   Таможенного   кодекса   Евразийского
											экономического союза <sup>1</sup> и статей 225, 239 Федерального закона от 3 августа
											2018  г.  N  289-ФЗ  "О таможенном регулировании в Российской Федерации и о
											внесении  изменений  в отдельные законодательные акты Российской Федерации"
											проверка   таможенных,   иных   документов   и   (или)  сведений  в   целях
										</td>
									</tr>
									<tr>
										<td align="center">
											<table class="inlinetable" style="width: 100%;">
												<tbody>
													<tr align="center">
														<td class="value">
															<xsl:choose>
																<xsl:when test="avdi:VerificationTarget">
																	<xsl:apply-templates select="avdi:VerificationTarget"/>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:apply-templates select="avdi:OtherVerificationTarget"/>
																</xsl:otherwise>
															</xsl:choose>
															<br/>
														</td>
													</tr>
													<tr align="center">
														<td class="descr">
															(указывается цель проверки в соответствии с пунктом 2 статьи 324 Таможенного кодекса<br/>
															Евразийского экономического союза либо иная конкретная цель)
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											в отношении:
										</td>
									</tr>
									<tr>
										<td align="center">
											<table class="inlinetable" style="width: 100%;">
												<tbody>
													<tr align="left">
														<td class="value">
															<xsl:for-each select="avdi:Applications">
																<xsl:if test="position() != 1">; </xsl:if>
																<xsl:apply-templates select="." mode="doc"/>
															</xsl:for-each>
															<br/>
														</td>
													</tr>
													<tr align="center">
														<td class="descr">
															(перечень проверенных таможенных, иных документов<br/>
															и (или) сведений с указанием их реквизитов)
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											представленных лицом:
										</td>
									</tr>
									<tr>
										<td align="center">
											<table class="inlinetable" style="width: 100%;">
												<tbody>
													<tr align="left">
														<td class="value">
															<xsl:apply-templates select="avdi:VerifiedPerson" mode="verPers_Notif"/>
															<br/>
														</td>
													</tr>
													<tr align="center">
														<td class="descr">
															(сведения о лице, чьи документы и (или) сведения проверялись:<br/>
															наименование, основной государственный регистрационный номер<br/>
															(при наличии), идентификационный номер налогоплательщика (при наличии),<br/>
															код причины постановки на учет (при наличии), место нахождения, адрес<br/>
															юридического лица/фамилия, имя, отчество (при наличии) индивидуального<br/>
															предпринимателя, основной государственный регистрационный номер<br/>
															индивидуального предпринимателя (при наличии), идентификационный<br/>
															номер налогоплательщика (при наличии), место жительства<br/>
															индивидуального предпринимателя/фамилия, имя, отчество<br/>
															(при наличии), идентификационный номер налогоплательщика<br/>
															(при наличии), место жительства физического лица, не являющегося<br/>
															индивидуальным предпринимателем)
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											завершена
											<xsl:call-template name="russian_date_month">
												<xsl:with-param name="dateIn" select="avdi:FinishControlDate"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 1.5em;">
											<xsl:text>По результатам проведения проверки таможенных, иных документов и (или)
											сведений нарушения регулирующих таможенные правоотношения международных
											договоров и актов, составляющих право Евразийского экономического союза, и
											законодательства Российской Федерации о таможенном регулировании не
											выявлены.</xsl:text>
										</td>
									</tr>
									<xsl:apply-templates select="avdi:CustomsHeadPersons" mode="custHead_Notif_Signature"/>
									<tr>
										<td>
											<br/>
											<br/>
											Настоящее уведомление получил <sup>2</sup>:
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td width="50%" class="value" align="left">
															<xsl:apply-templates select="avdi:ReceivedNoticePersons"/>
														</td>
														<td width="5%"><br/></td>
														<td width="45%" align="center">
															<xsl:call-template name="russian_date_month"><xsl:with-param name="dateIn" select="avdi:ReceivedNoticeDate"/></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="descr">
															(фамилия, инициалы, подпись лица,<br/>
															получившего уведомление)
														</td>
														<td></td>
														<td class="descr">
															(дата получения уведомления)
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td><br/><br/><br/><span style="display: inline-block; width: 50mm;" class="value"></span></td>
									</tr>
									<tr align="left">
										<td style="font-size:8pt;">
											<sup>1</sup> Федеральный закон от 14 ноября 2017 г. N 317-ФЗ "О ратификации Договора о Таможенном кодексе Евразийского экономического союза" (Собрание законодательства Российской Федерации, 2017, N 47, ст. 6843).
											<br/>
											<sup>2</sup> Заполняется при вручении уведомления о завершении проверки таможенных, иных документов и (или) сведений лицу, чьи документы и (или) сведения проверялись (его представителю).
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
	
	<xsl:template match="avdi:VerificationTarget">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">таможенной декларации</xsl:when>
				<xsl:when test=". = 2">иных таможенных документов, за исключением документов, составляемых таможенными органами</xsl:when>
				<xsl:when test=". = 3">документов, подтверждающих сведения, заявленные в таможенной декларации</xsl:when>
				<xsl:when test=". = 4">иных документов, представленных таможенному органу в соответствии с ТК ЕАЭС</xsl:when>
				<xsl:when test=". = 5">сведений, заявленных в таможенной декларации и (или) содержащихся в представленных таможенному органу документах</xsl:when>
				<xsl:when test=". = 6">иных сведений, представленных таможенному органу или полученных им в соответствии с ТК ЕАЭС</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	
	<xsl:template match="*" mode="custHead_Notif_Signature">
		<tr>
			<td>
				<br/>
				<br/>
				<table>
					<tbody>
						<tr valign="bottom">
							<td width="40%">Начальник (заместитель начальника)<br/>таможенного органа</td>
							<td width="2.5%"></td>
							<td width="20%" class="value"></td>
							<td width="2.5%"></td>
							<td width="35%" class="value" align="center">
								<xsl:apply-templates select="." mode="IOFamily"/>
							</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td class="descr">(подпись)</td>
							<td></td>
							<td class="descr">(инициалы, фамилия)</td>
						</tr>
						<tr>
							<td colspan="5">
								<xsl:if test="$signatures">
									<xsl:variable name="FIO">
										<xsl:for-each select="*[local-name() = 'PersonSurname' or local-name() = 'PersonName' or local-name() = 'PersonMiddleName']">
											<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
											<xsl:value-of select="."/>
										</xsl:for-each>
									</xsl:variable>
									<xsl:apply-templates select="$signatures/cert[@owner = $FIO]" mode="Signature"/>
								</xsl:if>
							</td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="*" mode="custHead_Act_Signature">
		<xsl:if test="*[local-name() = 'PersonPost']">
			<xsl:apply-templates select="*[local-name() = 'PersonPost']"/>
			<br/>
		</xsl:if>
		<xsl:apply-templates select="." mode="IOFamily"/>
	</xsl:template>
		
	<xsl:template match="avdi:CustomsPersons" mode="custPers_Act_Signature">
		<xsl:for-each select="*[position() &lt; 4]">
			<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="avdi:ConclusionsAndOffers">
		<xsl:apply-templates select="avdi:ConclAndOffersText"/>
		<xsl:if test="avdi:NeedSendActSign">
			<br/>
			<xsl:text>Необходимость направить акт и материалы проверки:</xsl:text>
			<br/>
			<xsl:for-each select="avdi:NeedSendActSign">
				<xsl:if test="position() !=  1"><br/></xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="avdi:ActionsSign">
			<br/>
			<xsl:text>Необходимость проведения мероприятий:</xsl:text>
			<br/>
			<xsl:for-each select="avdi:ActionsSign">
				<xsl:if test="position() !=  1"><br/></xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="avdi:ActionsSign">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:text>- </xsl:text>
			<xsl:choose>
				<xsl:when test=". = 1">внесение изменений в нормативные правовые акты</xsl:when>
				<xsl:when test=". = 2">разработка проекта профиля риска и ориентировки</xsl:when>
				<xsl:when test=". = 3">назначение проведения таможенной ревизии</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	
	<xsl:template match="avdi:NeedSendActSign">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:text>- </xsl:text>
			<xsl:choose>
				<xsl:when test=". = 1">в соответствующее структурное подразделение ТО для отмены ранее принятого решения и принятия нового решения по направлению Проверки, а также выставления требования об уплате таможенных платежей</xsl:when>
				<xsl:when test=". = 2">в правоохранительное подразделение ТО для возбуждения дела об АП и (или) УД</xsl:when>
				<xsl:when test=". = 3">в правоохранительные и иные контролирующие органы для проведения проверок по выявленным фактам несоблюдения законодательства РФ</xsl:when>
				<xsl:when test=". = 4">руководителю ТО для принятия решения о проведении служебной проверки по фактам несоблюдения должностными лицами таможенного органа таможенного законодательства РФ</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	
	<xsl:template match="avdi:Results">
		<xsl:apply-templates select="avdi:ResultsDescription"/>
		<xsl:if test="avdi:FalseInformation">
			<br/>
			<xsl:text>Недостоверные сведения:</xsl:text>
			<br/>
			<xsl:for-each select="avdi:FalseInformation">
				<xsl:if test="position() != 1"><br/></xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="avdi:Goods">
			<br/>
			<xsl:text>Проверяемые товары:</xsl:text>
			<br/>
			<xsl:for-each select="avdi:Goods">
				<xsl:if test="position()!=1"><br/></xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="avdi:Goods">
		<xsl:apply-templates select="avdi:GoodsTNVEDCode"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="avdi:GoodsDescription"/>
	</xsl:template>
	
	<xsl:template match="avdi:FalseInformation">
		<xsl:apply-templates select="avdi:TextResults"/>
		<xsl:if test="avdi:LegalActs">
			<xsl:text> НПА: </xsl:text>
			<xsl:for-each select="avdi:LegalActs">
				<xsl:if test="position() != 1">; </xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="avdi:LegalActs">
		<xsl:apply-templates select="." mode="doc"/>
		<xsl:if test="avdi:ArticleNumber">
			<xsl:text> ст. </xsl:text>
			<xsl:apply-templates select="avdi:ArticleNumber"/>
		</xsl:if>
		<xsl:if test="avdi:PartNumber">
			<xsl:text> ч. </xsl:text>
			<xsl:apply-templates select="avdi:PartNumber"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="avdi:CheckDirections">
		<xsl:text>Код: </xsl:text>
		<xsl:apply-templates select="avdi:CheckDirectionsCode"/>
		<xsl:if test="avdi:CheckDirectionsName">
			<xsl:text> Описание: </xsl:text>
			<xsl:apply-templates select="avdi:CheckDirectionsName"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="doc">
		<xsl:apply-templates select="*[local-name() = 'PrDocumentName']"/>
		<xsl:if test="*[local-name() = 'PrDocumentNumber']">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentNumber']"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'PrDocumentDate']">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentDate']" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="verPers_Notif">
		<xsl:choose>
			<xsl:when test="avdi:VerifiedPersonYUL">
				<xsl:for-each select="avdi:VerifiedPersonYUL/*">
					<xsl:apply-templates select="."/>
					<xsl:text>, </xsl:text>
				</xsl:for-each>
				<xsl:if test="*[local-name() = 'OGRN']">
					<xsl:text>ОГРН </xsl:text>
					<xsl:apply-templates select="*[local-name() = 'OGRN']"/>
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:if test="*[local-name() = 'INN']">
					<xsl:text>ИНН </xsl:text>
					<xsl:apply-templates select="*[local-name() = 'INN']"/>
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:if test="*[local-name() = 'KPP']">
					<xsl:text>КПП </xsl:text>
					<xsl:apply-templates select="*[local-name() = 'KPP']"/>
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:if test="avdi:FactAddress">
					<xsl:text> фактическое местонахождение: </xsl:text>
					<xsl:apply-templates select="avdi:FactAddress" mode="address"/>
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:text>адрес государственной регистрации: </xsl:text>
				<xsl:apply-templates select="avdi:Address" mode="address"/>
			</xsl:when>
			<xsl:when test="avdi:VerifiedPersonFL">
				<xsl:for-each select="avdi:VerifiedPersonFL/*">
					<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
				<xsl:if test="*[local-name() = 'OGRN']">
					<xsl:text>ОГРН </xsl:text>
					<xsl:apply-templates select="*[local-name() = 'OGRN']"/>
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:if test="*[local-name() = 'INN']">
					<xsl:text>, ИНН </xsl:text>
					<xsl:apply-templates select="*[local-name() = 'INN']"/>
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:text>, адрес </xsl:text>
				<xsl:apply-templates select="avdi:Address" mode="address"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="*" mode="verPers_Act">
		<xsl:choose>
			<xsl:when test="avdi:VerifiedPersonYUL">
				<xsl:for-each select="avdi:VerifiedPersonYUL/*">
					<xsl:apply-templates select="."/>
					<xsl:text>, </xsl:text>
				</xsl:for-each>
				<xsl:if test="*[local-name() = 'INN']">
					<xsl:text>ИНН </xsl:text>
					<xsl:apply-templates select="*[local-name() = 'INN']"/>
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:if test="*[local-name() = 'KPP']">
					<xsl:text>КПП </xsl:text>
					<xsl:apply-templates select="*[local-name() = 'KPP']"/>
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:if test="*[local-name() = 'OGRN']">
					<xsl:text>ОГРН </xsl:text>
					<xsl:apply-templates select="*[local-name() = 'OGRN']"/>
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:text>адрес государственной регистрации: </xsl:text>
				<xsl:apply-templates select="avdi:Address" mode="address"/>
				<xsl:if test="avdi:FactAddress">
					<xsl:text>, фактическое местонахождение: </xsl:text>
					<xsl:apply-templates select="avdi:FactAddress" mode="address"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="avdi:VerifiedPersonFL">
				<xsl:for-each select="avdi:VerifiedPersonFL/*">
					<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
				<xsl:if test="*[local-name() = 'INN']">
					<xsl:text>, ИНН </xsl:text>
					<xsl:apply-templates select="*[local-name() = 'INN']"/>
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:if test="*[local-name() = 'OGRN']">
					<xsl:text>ОГРН </xsl:text>
					<xsl:apply-templates select="*[local-name() = 'OGRN']"/>
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:if test="avdi:Passport">
					<xsl:text>паспорт </xsl:text>
					<xsl:apply-templates select="avdi:Passport" mode="passport"/>
				</xsl:if>
				<xsl:text>, адрес </xsl:text>
				<xsl:apply-templates select="avdi:Address" mode="address"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="*" mode="passport">
		<xsl:apply-templates select="*[local-name() = 'IdentityCardSeries']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'IdentityCardNumber']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'IdentityCardNumber']" mode="russian_date"/>
	</xsl:template>
	
	<xsl:template match="*" mode="address">
		<xsl:choose>
			<xsl:when test="*[local-name() = 'AddressText']">
				<xsl:apply-templates select="*[local-name() = 'AddressText']"/>
			</xsl:when>		
			<xsl:otherwise>
				<xsl:for-each select="*[local-name() != 'AddressText' and local-name() != 'AddressKindCode']">
					<xsl:if test="position() != 1">, </xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="*" mode="custPers_Act">
		<xsl:if test="*[local-name() = 'PersonPost']">
			<xsl:apply-templates select="*[local-name() = 'PersonPost']"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="*[local-name() = 'StructuralSubdivision']">
			<xsl:apply-templates select="*[local-name() = 'StructuralSubdivision']"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="." mode="IOFamily"/>
	</xsl:template>
	
	<xsl:template match="*" mode="FamilyIO">
		<xsl:apply-templates select="*[local-name() = 'PersonSurname']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'PersonName']" mode="initials"/>
		<xsl:apply-templates select="*[local-name() = 'PersonMiddleName']" mode="initials"/>
	</xsl:template>
	
	<xsl:template match="*" mode="IOFamily">
		<xsl:apply-templates select="*[local-name() = 'PersonName']" mode="initials"/>
		<xsl:apply-templates select="*[local-name() = 'PersonMiddleName']" mode="initials"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'PersonSurname']"/>
	</xsl:template>
	
	<xsl:template match="*" mode="initials">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="concat(substring(., 1, 1),'.')"/>
		</element>
	</xsl:template>
	
	<xsl:template match="*" mode="TD_num">
		<xsl:for-each select="*[position() &lt; 4]">
			<xsl:if test="position() != 1">/</xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'Date')">
					<xsl:apply-templates select="." mode="num_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="*" mode="GTDNum">
		<xsl:for-each select="*">
			<xsl:if test="position() != 1">/</xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'Date')">
					<xsl:apply-templates select="." mode="num_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="*" mode="customs">
		<xsl:for-each select="*">
			<xsl:if test="position() != 1">, </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="month">
		<xsl:param name="number"/>
		<xsl:if test="$number='01'">января</xsl:if>
		<xsl:if test="$number='02'">февраля</xsl:if>
		<xsl:if test="$number='03'">марта</xsl:if>
		<xsl:if test="$number='04'">апреля</xsl:if>
		<xsl:if test="$number='05'">мая</xsl:if>
		<xsl:if test="$number='06'">июня</xsl:if>
		<xsl:if test="$number='07'">июля</xsl:if>
		<xsl:if test="$number='08'">августа</xsl:if>
		<xsl:if test="$number='09'">сентября</xsl:if>
		<xsl:if test="$number='10'">октября</xsl:if>
		<xsl:if test="$number='11'">ноября</xsl:if>
		<xsl:if test="$number='12'">декабря</xsl:if>
	</xsl:template>
	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="$dateIn"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
					<xsl:text>"</xsl:text>
					<span style="font-style: italic"><u>&#160;<xsl:value-of select="substring($dateIn,9,2)"/>&#160;</u></span>
					<xsl:text>" </xsl:text>
					<span style="font-style: italic"><u>&#160;<xsl:call-template name="month"><xsl:with-param name="number" select="substring($dateIn,6,2)"/></xsl:call-template>&#160;</u></span>
					<xsl:text> 20</xsl:text>
					<span style="font-style: italic"><u><xsl:value-of select="substring($dateIn,3,2)"/></u></span>
					<xsl:text> г.</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$dateIn"/>
				</xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	
	<xsl:template name="num_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
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
	<xsl:template match="//*[local-name()='ActVerificationDocAndIinformation']//*" priority="-1">
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
	<xsl:template match="*" mode="num_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="num_date">
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
