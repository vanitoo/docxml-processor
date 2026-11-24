<?xml version="1.0" encoding="utf-8"?>
<!--Приказ ФТС России от 27.12.2018 № 2137
PaymentType = 0 - Приложение № 1 (Уведомление о взыскании таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней за счет денежного залога)
PaymentType = 1 - Приложение № 2 (Уведомление о взыскании таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней за счет авансовых платежей)-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:req_gr="urn:customs.ru:Information:CommercialFinanceDocuments:ReqGuarant:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0">
	<!-- Шаблон для типа ReqGuarantType -->
	<xsl:template match="req_gr:ReqGuarant">
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
					<table width="100%">
						<tbody>
							<tr align="center" valign="top">
								<td>
									<b>
										<xsl:choose>
											<xsl:when test="req_gr:DocumentInfo/req_gr:PaymentType=0">
												<xsl:text>Требование об уплате денежных средств </xsl:text>
												<br/>
												<xsl:text>по банковской гарантии/договору поручительства</xsl:text>
												<br/>
											</xsl:when>
											<xsl:when test="req_gr:DocumentInfo/req_gr:PaymentType=1">
												<xsl:text>Требование об уплате денежных средств гарантирующим объединением (ассоциацией)</xsl:text>
												<br/>
											</xsl:when>
										</xsl:choose>
										<br/>
										<xsl:text>от </xsl:text>
										<xsl:call-template name="text_date">
											<xsl:with-param select="req_gr:DocumentInfo/req_gr:RequisitesDocument/cat_ru:PrDocumentDate" name="date"/>
										</xsl:call-template>
										<xsl:text> № </xsl:text>
										<span class="value">
											<xsl:text>&#160; </xsl:text>
											<xsl:value-of select="req_gr:DocumentInfo/req_gr:RequisitesDocument/cat_ru:PrDocumentNumber"/>
											<xsl:text>&#160; </xsl:text>
										</span>
									</b>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr valign="top" align="center">
								<td class="value">
									<xsl:apply-templates select="req_gr:DocumentInfo/req_gr:CustomsOffice"/>
								</td>
							</tr>
							<tr align="center">
								<td class="graph8">(наименование таможенного органа)</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
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
									<xsl:apply-templates mode="organization" select="req_gr:DocumentInfo/req_gr:Organization"/>
								</td>
							</tr>
							<xsl:choose>
								<xsl:when test="req_gr:DocumentInfo/req_gr:PaymentType=0">
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr align="center">
										<td class="graph8">(полное наименование принципала по банковской гарантии (должника по договору поручительства), идентификационный номер налогоплательщика/код причины постановки на учет (если имеется)</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">обязанности по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, процентов и пени, или обязанностей уполномоченного экономического оператора либо юридического лица, осущетсвляющего деятельность в сфере таможенного дела, в сроки, указанные в уведомлениях (уточнениях к уведомлению) об уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пени:</td>
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
														<td class="bordered" rowspan="2">№ п/п</td>
														<td class="bordered" colspan="3">Уведомление (уточнение к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсациоанных пошлин, процентов и пеней</td>
													</tr>
													<tr align="center">
														<td class="bordered">регистрационный номер</td>
														<td class="bordered">дата</td>
														<td class="bordered">срок исполнения</td>
													</tr>
													<xsl:for-each select="req_gr:DocumentInfo/req_gr:NotificationDocument">
														<tr align="center">
															<td class="bordered">
																<xsl:value-of select="req_gr:SerialNumber"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="req_gr:PrDocumentNumber"/>
															</td>
															<td class="bordered">
																<xsl:apply-templates mode="russian_date" select="req_gr:PrDocumentDate"/>
															</td>
															<td class="bordered">
																<xsl:apply-templates mode="russian_date" select="req_gr:DocDatePeriodExecution"/>
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
										<td>обеспеченной (ых)</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="req_gr:DocumentInfo/req_gr:DocumentSupportinformation/req_gr:OrganizationGuarant"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graph8">(полное наименование гаранта (поручителя))</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:value-of select="req_gr:DocumentInfo/req_gr:DocumentSupportinformation/req_gr:RequisitesDocument/cat_ru:PrDocumentName"/>
											<xsl:if test="req_gr:DocumentInfo/req_gr:DocumentSupportinformation/req_gr:RequisitesDocument/cat_ru:PrDocumentNumber">
												<xsl:text> №  </xsl:text>
												<xsl:value-of select="req_gr:DocumentInfo/req_gr:DocumentSupportinformation/req_gr:RequisitesDocument/cat_ru:PrDocumentNumber"/>
											</xsl:if>
											<xsl:if test="req_gr:DocumentInfo/req_gr:DocumentSupportinformation/req_gr:RequisitesDocument/cat_ru:PrDocumentDate">
												<xsl:text> от </xsl:text>
												<xsl:apply-templates mode="russian_date" select="req_gr:DocumentInfo/req_gr:DocumentSupportinformation/req_gr:RequisitesDocument/cat_ru:PrDocumentDate"/>
											</xsl:if>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(способ обеспечения (банковская гарантия или договор поручительства), регистрационный номер и дата банковской гарантии (договора поручительства))</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">на основании статьи 76 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" требует не позднее пяти рабочих дней со дня получения указанного требования об уплате денежных средств по банковской гарантии (договору поручительства) перечислить дененые средства в размере:</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:value-of select="translate(translate(format-number(req_gr:DocumentInfo/req_gr:DocumentPaymentReqs/req_gr:PaymentAmount, '#,###.00'),',',' '),'.',',')"/>
											<xsl:if test="req_gr:DocumentInfo/req_gr:DocumentPaymentReqs/req_gr:PaymentAmountText">
												<xsl:if test="req_gr:DocumentInfo/req_gr:DocumentPaymentReqs/req_gr:PaymentAmount">
													<xsl:text> (</xsl:text>
												</xsl:if>
												<xsl:value-of select="req_gr:DocumentInfo/req_gr:DocumentPaymentReqs/req_gr:PaymentAmountText"/>
												<xsl:if test="req_gr:DocumentInfo/req_gr:DocumentPaymentReqs/req_gr:PaymentAmount">
													<xsl:text>)</xsl:text>
												</xsl:if>
											</xsl:if>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(сумма денежных средств, подлежащая уплате по требованию, цифрами и прописью)</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>на счет Федерального казначейства: </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="value">
											<xsl:apply-templates mode="PaymentReq" select="req_gr:DocumentInfo/req_gr:DocumentPaymentReqs"/>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-indent:5%">
											<xsl:text>В случае неисполнения (ненадлежащего исполнения) данного требования об уплате денежных средств таможенный орган реализует право списать причитающуюся сумму в бесспорном порядке, а также приять меры по ее взысканию, предусмотреные законодательством Российской Федерации</xsl:text>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="req_gr:DocumentInfo/req_gr:PaymentType=1">
									<tr align="center">
										<td class="graph8">(полное наименование организциии или фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица, идентификационный номер налогоплательщика (при наличии)</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационых пошлин, процентов и пеней, исчисленных (начисленных) в соответствии со статьей 52 Таможенного кодекса Евразийского экономического союза в расчете таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="req_gr:DocumentInfo/req_gr:RTPDocument/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> №  </xsl:text>
											<span class="value">
												<xsl:text>&#160; </xsl:text>
												<xsl:value-of select="req_gr:DocumentInfo/req_gr:RTPDocument/cat_ru:PrDocumentNumber"/>
												<xsl:text>&#160; </xsl:text>
											</span>
											<xsl:text> в отношении товаров, таможенное декларирование которых производилось с применением книжки МДП (карнета АТА) от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="req_gr:DocumentInfo/req_gr:DocumentSupportinformation/req_gr:RequisitesDocument/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> №  </xsl:text>
											<span class="value">
												<xsl:text>&#160; </xsl:text>
												<xsl:value-of select="req_gr:DocumentInfo/req_gr:DocumentSupportinformation/req_gr:RequisitesDocument/cat_ru:PrDocumentNumber"/>
												<xsl:text>&#160; </xsl:text>
											</span>
											<xsl:text> , обеспеченной в соответствии с международным договором </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="req_gr:DocumentInfo/req_gr:DocumentSupportinformation/req_gr:OrganizationGuarant"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(полное наименование гарантирующего объединения (ассоциации), идентификационный номер налогоплательщиа (при наличии)</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">на основании статьи 76 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" требует перечислить на счет Федерального казначейства:</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="value">
											<xsl:apply-templates mode="PaymentReq" select="req_gr:DocumentInfo/req_gr:DocumentPaymentReqs"/>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>денежные средства в размере:</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td width="99%" class="value" align="center">
															<xsl:value-of select="translate(translate(format-number(req_gr:DocumentInfo/req_gr:DocumentPaymentReqs/req_gr:PaymentAmount, '#,###.00'),',',' '),'.',',')"/>
															<xsl:if test="req_gr:DocumentInfo/req_gr:DocumentPaymentReqs/req_gr:PaymentAmountText">
																<xsl:if test="req_gr:DocumentInfo/req_gr:DocumentPaymentReqs/req_gr:PaymentAmount">
																	<xsl:text> (</xsl:text>
																</xsl:if>
																<xsl:value-of select="req_gr:DocumentInfo/req_gr:DocumentPaymentReqs/req_gr:PaymentAmountText"/>
																<xsl:if test="req_gr:DocumentInfo/req_gr:DocumentPaymentReqs/req_gr:PaymentAmount">
																	<xsl:text>)</xsl:text>
																</xsl:if>
															</xsl:if>
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
										<td class="graph8">(сумма денежных средств, подлежащих уплате по требованию, цифрами и прописью)</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>включая пени в размере </xsl:text>
											<span class="value">
												<xsl:text>&#160; </xsl:text>
												<xsl:value-of select="translate(translate(format-number(req_gr:DocumentInfo/req_gr:DocumentPaymentReqs/req_gr:FinePaymentAmount, '#,###.00'),',',' '),'.',',')"/>
												<xsl:text>&#160; </xsl:text>
											</span>
											<xsl:text> рублей, начисленные на день составления данного требования.</xsl:text>
										</td>
									</tr>
								</xsl:when>
							</xsl:choose>
						</tbody>
					</table>
					<br/>
					<br/>
					<br/>
					<xsl:apply-templates select="req_gr:DocumentInfo/req_gr:DocumentSignature/req_gr:CustChiefSignature"/>
					<br/>
					<br/>
					<xsl:apply-templates select="req_gr:DocumentInfo/req_gr:DocumentSignature/req_gr:ExecutiveSignature" mode="executor"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template mode="PaymentReq" match="*">
		<xsl:if test="req_gr:BankInfoRecipient">
			<xsl:text>Банк получателя: </xsl:text>
			<xsl:value-of select="req_gr:BankInfoRecipient"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="req_gr:BICBankRecipient">
			<xsl:text>БИК: </xsl:text>
			<xsl:value-of select="req_gr:BICBankRecipient"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="req_gr:AccountRecipient">
			<xsl:text>номер счета: </xsl:text>
			<xsl:value-of select="req_gr:AccountRecipient"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="req_gr:RecipientName">
			<xsl:text>получатель платежа: </xsl:text>
			<xsl:value-of select="req_gr:RecipientName"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="req_gr:RecipientINN">
			<xsl:text>ИНН: </xsl:text>
			<xsl:value-of select="req_gr:RecipientINN"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="req_gr:RecipientKPP">
			<xsl:text>КПП: </xsl:text>
			<xsl:value-of select="req_gr:RecipientKPP"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="req_gr:OKTMO">
			<xsl:text>ОКТОМО: </xsl:text>
			<xsl:value-of select="req_gr:OKTMO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="executor" match="req_gr:DocumentInfo/req_gr:DocumentSignature/req_gr:ExecutiveSignature">
		<xsl:param name="executor"/>
		<table width="100%">
			<tbody>
				<tr valign="bottom">
					<td width="15%">Исполнитель</td>
					<td width="45%" class="value" align="center">
						<xsl:value-of select="cat_ru:PersonPost"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonName"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
					</td>
					<td width="2%"/>
					<td width="15%" align="right">
						<xsl:text>Телефон&#160;&#160;</xsl:text>
					</td>
					<td width="22%" class="value" align="center">
						<xsl:value-of select="req_gr:Phone"/>
					</td>
				</tr>
				<tr align="center" valign="top">
					<td/>
					<td class="graph8">
						<xsl:choose>
							<xsl:when test="../../../req_gr:DocumentInfo/req_gr:PaymentType=0">
								<xsl:text>(Ф.И.О)</xsl:text>
							</xsl:when>
							<xsl:when test="../../../req_gr:DocumentInfo/req_gr:PaymentType=1">
								<xsl:text>(инициалы, фамилия должностного лица таможенного органа)</xsl:text>
							</xsl:when>
						</xsl:choose>
					</td>
					<td/>
					<td/>
					<td/>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="req_gr:DocumentInfo/req_gr:DocumentSignature/req_gr:CustChiefSignature">
		<table width="100%">
			<tbody>
				<xsl:choose>
					<xsl:when test="../../../req_gr:DocumentInfo/req_gr:PaymentType=0">
						<tr align="center" valign="bottom">
							<td colspan="5" align="left">
								<xsl:text>Начальник (заместитель начальника)</xsl:text>
							</td>
						</tr>
						<tr>
							<td class="delim_3" colspan="5"/>
						</tr>
						<tr align="center" valign="bottom">
							<td width="40%" class="value" align="char">
								<xsl:apply-templates select="../../../req_gr:DocumentInfo/req_gr:CustomsOffice"/>
							</td>
							<td width="8%"/>
							<td class="value" width="15%"/>
							<td width="7%"/>
							<td class="value" width="30%">
								<xsl:value-of select="cat_ru:PersonPost"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="cat_ru:PersonSurname"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="cat_ru:PersonName"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="cat_ru:PersonMiddleName"/>
							</td>
						</tr>
						<tr align="center">
							<td class="graph8">
								<xsl:text>(наименование таможенного органа)</xsl:text>
							</td>
							<td/>
							<td class="graph8">(подпись)</td>
							<td/>
							<td class="graph8" align="center">
								<xsl:text>(Ф.И.О)</xsl:text>
							</td>
						</tr>
					</xsl:when>
					<xsl:when test="../../../req_gr:DocumentInfo/req_gr:PaymentType=1">
						<tr align="center" valign="bottom">
							<td width="42%" align="left">
								<xsl:text>Начальник таможенного органа</xsl:text>
								<br>
									<xsl:text>(или лицо, им уполномоченное)</xsl:text>
								</br>
							</td>
							<td width="6%"/>
							<td class="value" width="15%"/>
							<td width="7%"/>
							<td class="value" width="30%">
								<xsl:value-of select="cat_ru:PersonPost"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="cat_ru:PersonSurname"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="cat_ru:PersonName"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="cat_ru:PersonMiddleName"/>
							</td>
						</tr>
						<tr align="center">
							<td/>
							<td/>
							<td class="graph8">(подпись)</td>
							<td/>
							<td class="graph8">
								<xsl:text>(инициалы, фамилия)</xsl:text>
							</td>
						</tr>
					</xsl:when>
				</xsl:choose>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="RUScat_ru:CommunicationDetails" match="*">
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
		<xsl:if test="cat_ru:OKPOID">,&#032;ОКПО:&#032;<xsl:value-of select="cat_ru:OKPOID"/>
		</xsl:if>
		<xsl:if test="req_gr:ITN">,&#032;ИТН:&#032;<xsl:value-of select="req_gr:ITN"/>
		</xsl:if>
		<xsl:if test="cat_ru:Address">,&#032;Адрес:&#032;<xsl:for-each select="cat_ru:Address">
				<xsl:for-each select="*">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">
						<xsl:text>, </xsl:text>
					</xsl:if>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:OKATOCode">,&#032;ОКАТО:&#032;<xsl:value-of select="cat_ru:OKATOCode"/>
		</xsl:if>
		<xsl:if test="cat_ru:Contact">,&#032;<xsl:for-each select="cat_ru:Contact">
				<xsl:call-template name="RUScat_ru:CommunicationDetails"/>
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
	<xsl:template match="req_gr:DocumentInfo/req_gr:CustomsOffice">
		<xsl:value-of select="cat_ru:OfficeName"/>
		<xsl:if test="not(cat_ru:OfficeName) and req_gr:FullOfficeName">
			<xsl:value-of select="req_gr:FullOfficeName"/>
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
		<xsl:param name="date"/>«<span class="value">
			<xsl:choose>
				<xsl:when test="substring($date,9,2)">
					<xsl:value-of select="substring($date,9,2)"/>
				</xsl:when>
				<xsl:otherwise>&#160;&#160;&#160;&#160;</xsl:otherwise>
			</xsl:choose>
		</span>
		<xsl:variable name="month" select="substring($date, 6, 2)"/>»&#160;<span class="value">&#160;&#160;<xsl:choose>
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
				<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
			</xsl:choose>&#160;&#160;</span>&#160;<xsl:choose>
			<xsl:when test="substring($date,1,2)">
				<xsl:value-of select="substring($date,1,2)"/>
			</xsl:when>
			<xsl:otherwise>20</xsl:otherwise>
		</xsl:choose>
		<span class="value">
			<xsl:choose>
				<xsl:when test="substring($date,3,2)">
					<xsl:value-of select="substring($date,3,2)"/>
				</xsl:when>
				<xsl:otherwise>&#160;&#160;&#160;&#160;</xsl:otherwise>
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
