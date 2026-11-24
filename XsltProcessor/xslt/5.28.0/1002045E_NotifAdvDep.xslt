<?xml version="1.0" encoding="utf-8"?>
<!-- Приказ ФТС России от 27.12.2018 № 2137
PaymentType = 0 - Приложение № 1 (Уведомление о взыскании таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней за счет денежного залога)
PaymentType = 1 - Приложение № 2 (Уведомление о взыскании таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней за счет авансовых платежей)
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:nad="urn:customs.ru:Information:CommercialFinanceDocuments:NotifAdvDep:5.28.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.28.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0">
	<!-- Шаблон для типа NotifAdvDepType -->
	<xsl:template match="nad:NotifAdvDep">
		<xsl:variable name="paymentType" select="nad:DocumentInfo/nad:PaymentType"/>
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
					<table width="100%">
						<tbody>
							<tr align="center" valign="top">
								<td>
									<b>
										<xsl:choose>
											<xsl:when test="$paymentType=0">
												<xsl:text>Уведомление о взыскании таможенных платежей, специальных,</xsl:text>
												<br/>
												<xsl:text>антидемпинговых, компенсационных пошлин, процентов</xsl:text>
												<br/>
												<xsl:text>и пеней за счет денежного залога</xsl:text>
											</xsl:when>
											<xsl:when test="$paymentType=1">
												<xsl:text>Уведомление о взыскании таможенных платежей, специальных, </xsl:text>
												<xsl:text>антидемпинговых, компенсационных пошлин, процентов и пеней </xsl:text>
												<xsl:text>за счет авансовых платежей</xsl:text>
											</xsl:when>
										</xsl:choose>
										<br/>
										<br/>
										<xsl:text>от </xsl:text>
										<xsl:call-template name="text_date">
											<xsl:with-param select="nad:DocumentInfo/nad:RequisitesDocument/cat_ru:PrDocumentDate" name="date"/>
										</xsl:call-template>
										<xsl:text> № </xsl:text>
										<span class="value">
											<xsl:text>&#160;  </xsl:text>
											<xsl:value-of select="nad:DocumentInfo/nad:RequisitesDocument/cat_ru:PrDocumentNumber"/>
											<xsl:text>&#160;  </xsl:text>
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
									<xsl:apply-templates select="nad:DocumentInfo/nad:CustomsOffice"/>
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
									<xsl:text>информирует</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value" align="center">
									<xsl:apply-templates mode="organization" select="nad:DocumentInfo/nad:Organization"/>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr align="center">
								<td class="graph8">(полное наименование организации или фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица), идентификационный номер налогоплательщика (при наличии))</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
						</tbody>
					</table>
					<table width="100%">
						<tbody>
							<xsl:choose>
								<xsl:when test="$paymentType=0">
									<tr>
										<td style="text-align: justify">о произведенном в соответствии со статьей 76 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" взыскании таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней за счет денежного залога по таможенной расписке (по таможенным распискам):</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr align="center">
														<td class="bordered" rowspan="2">№ п/п</td>
														<td class="bordered" colspan="2">Реквизиты таможенной расписки</td>
														<td class="bordered" rowspan="2">Взыскиваемая сумма, рубли</td>
													</tr>
													<tr align="center">
														<td class="bordered">регистрационный номер</td>
														<td class="bordered">сумма, рубли</td>
													</tr>
													<xsl:for-each select="nad:DocumentInfo/nad:ReceiptCustDocumentInfo/nad:ReceiptCustDocument">
														<tr>
															<td class="bordered" align="center">
																<xsl:value-of select="nad:SSerialNumber"/>
															</td>
															<td class="bordered" align="center">
																<xsl:value-of select="nad:SPrDocumentNumber"/>
															</td>
															<td class="bordered" align="right">
																<div class="cellwidener">
																	<xsl:value-of select="translate(translate(format-number(nad:SPaymentTRAmount, '#,###.00'),',',' '),'.',',')"/>
																</div>
															</td>
															<td class="bordered" align="right">
																<div class="cellwidener">
																	<xsl:value-of select="translate(translate(format-number(nad:SPaymentAmount, '#,###.00'),',',' '),'.',',')"/>
																</div>
															</td>
														</tr>
													</xsl:for-each>
													<tr>
														<td class="bordered" align="left" colspan="3">
																Итого:
															</td>
														<td class="bordered" align="right">
															<div class="cellwidener">
																<xsl:value-of select="translate(translate(format-number(nad:DocumentInfo/nad:Amount/nad:TotalAmount, '#,###.00'),',',' '),'.',',')"/>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="$paymentType=1">
									<tr>
										<td style="text-align: justify">
											<xsl:text>о произведенном в соответствии со статьей 80 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" взыскании таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней за счет авансовых платежей в размере: </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:value-of select="translate(translate(format-number(nad:DocumentInfo/nad:Amount/nad:TotalAmount, '#,###.00'),',',' '),'.',',')"/>
											<xsl:text> (</xsl:text>
											<xsl:value-of select="nad:DocumentInfo/nad:Amount/nad:TotalAmountText"/>
											<xsl:text>)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="center">
											<xsl:text> (сумма авансовых платежей)</xsl:text>
										</td>
									</tr>
								</xsl:when>
							</xsl:choose>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>в счет исполнения обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							
							<tr>
								<td>
									<table width="100%">
										<tbody>
											<tr align="center">
												<td class="bordered" rowspan="2">№ п/п</td>
												<td class="bordered" colspan="2">
													<xsl:text>Реквизиты корректировки декларации на товары или расчета таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин, </xsl:text>
													<xsl:text>расчета таможенных пошлин, налогов, взимаемых по единым ставкам, либо таможенных пошлин, налогов, взимаемых в виде совокупного таможенного </xsl:text>
													<xsl:text>платежа, корректировки таможенного приходного ордера, заявления, предусмотренного пунктом 4 статьи 277 Таможенного кодекса </xsl:text>
													<xsl:text>Евразийского экономического союза,</xsl:text>
													<sup>1</sup>
													<xsl:text> либо иного таможенного документа, определенного Евразийской экономической </xsl:text>
													<xsl:text>комиссией в соответствии с пунктом 24 статьи 266 Таможенного кодекса Евразийского экономического союза</xsl:text>
												</td>
												<xsl:if test="$paymentType = 1">
													<td class="bordered" rowspan="2">Код вида платежа<sup>2</sup></td>
													<td class="bordered" rowspan="2">Сумма взыскания, рубли</td>
												</xsl:if>
											</tr>
											<tr align="center">
												<td class="bordered">регистрационный номер</td>
												<td class="bordered">дата</td>
											</tr>
											<xsl:for-each select="nad:DocumentInfo/nad:CorrDeclDocumentInfo/nad:CorrDeclDocument">
												<tr>
													<td class="bordered" align="center">
														<xsl:value-of select="nad:SerialNumber"/>
													</td>
													<td class="bordered" align="center">
														<xsl:choose>
															<xsl:when test="nad:KDTID">
																<xsl:text>КДТ </xsl:text>
																<xsl:apply-templates select="nad:KDTID"/>
															</xsl:when>
															<xsl:when test="nad:CPCID">
																<xsl:text>Расчет </xsl:text>
																<xsl:apply-templates select="nad:CPCID"/>
															</xsl:when>
															<xsl:when test="nad:KTPOID">
																<xsl:text>Корректировка ТПО </xsl:text>
																<xsl:apply-templates select="nad:KTPOID"/>
															</xsl:when>
															<xsl:when test="nad:Application">
																<xsl:apply-templates select="nad:Application"/>
															</xsl:when>
															<xsl:when test="nad:OtherCustDocInfoID/nad:TPOID">
																<xsl:text>ТПО </xsl:text>
																<xsl:apply-templates select="nad:OtherCustDocInfoID/nad:TPOID"/>
															</xsl:when>
															<xsl:when test="nad:OtherCustDocInfoID/nad:OtherCustDoc">
																<xsl:apply-templates select="nad:OtherCustDocInfoID/nad:OtherCustDoc"/>
															</xsl:when>
														</xsl:choose>
													</td>
													<td class="bordered" align="center">
														<xsl:choose>
															<xsl:when test="nad:KDTID">
																<xsl:apply-templates mode="russian_date" select="nad:KDTID/cat_ru:RegistrationDate"/>
															</xsl:when>
															<xsl:when test="nad:CPCID">
																<xsl:apply-templates mode="russian_date" select="nad:CPCID/cat_ru:RegistrationDate"/>
															</xsl:when>
															<xsl:when test="nad:KTPOID">
																<xsl:apply-templates mode="russian_date" select="nad:KTPOID/nad:RegistrationDate"/>
															</xsl:when>
															<xsl:when test="nad:Application">
																<xsl:apply-templates mode="russian_date" select="nad:Application/cat_ru:PrDocumentDate"/>
															</xsl:when>
															<xsl:when test="nad:OtherCustDocInfoID/nad:TPOID">
																<xsl:apply-templates mode="russian_date" select="nad:OtherCustDocInfoID/nad:TPOID/nad:RegistrationDate"/>
															</xsl:when>
															<xsl:when test="nad:OtherCustDocInfoID/nad:OtherCustDoc">
																<xsl:apply-templates mode="russian_date" select="nad:OtherCustDocInfoID/nad:OtherCustDoc/cat_ru:PrDocumentDate"/>
															</xsl:when>
														</xsl:choose>
													</td>
													
													<xsl:if test="$paymentType = 1">
														<td class="bordered" align="center">
															<xsl:value-of select="nad:PaymentModeCode"/>
														</td>
														<td class="bordered" align="right">
															<xsl:if test="nad:PaymentAmount">
																<xsl:value-of select="translate(translate(format-number(nad:PaymentAmount, '#,###.00'),',',' '),'.',',')"/>
															</xsl:if>
														</td>
													</xsl:if>
												</tr>
											</xsl:for-each>
											<!--tr>
												<td class="bordered" align="left" colspan="4">
																Итого:
															</td>
												<td class="bordered" align="right">
													<xsl:if test="nad:DocumentInfo/nad:CorrDeclDocumentInfo/nad:TotalPaymentAmount">
														<xsl:value-of select="translate(translate(format-number(nad:DocumentInfo/nad:CorrDeclDocumentInfo/nad:TotalPaymentAmount, '#,###.00'),',',' '),'.',',')"/>
													</xsl:if>
												</td>
											</tr-->
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<xsl:apply-templates select="nad:DocumentInfo/nad:DocumentSignature/nad:ExecutiveSignature" mode="executor"/>
					<br/>
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
										<sup>1</sup>Является обязательным для Российской Федерации в соответствии с Договором о Таможенном кодексе Евразийского экономического союза от 11 апреля 2017г., ратифицированным Федеральным законом от 14 ноября 2017 г. № 317-ФЗ "О ратификации Договора о Таможнном кодексе Евразийского экономического союза". Вступил в силу для Российской Федерации 1 января 2018 года.</td>
								</tr>
								<xsl:if test="$paymentType = 1">
									<tr>
										<td style="text-align:justify; text-align: 5%" colspan="2">
											<sup>2</sup>Приложение №9 к Решению Комиссии Тмаоженного союза от 20 сентября 2010 г. № 378 "О классификаторах, используемых для заполнения таможенных документов". Является обязательным для Российской Федерации в соответствии с Договором об учреждении Евразийского экономического сообщества от 10 октября 2000г., ратифицированным Федеральным законом от 22 мая 2001 г. № 56-ФЗ "О ратификации Договора об учреждении Евразийского экономического сообщества" (Договор вступил в силу для Российской Федерации 30 мая 2001г.), Договором о Евразийском экономическом союзе от 29 мая 2014 г., ратифицированным Федеральным законом от 3 октября 2014 г. № 279-ФЗ "О ратификации Договора о Европейском экономическом союзе" (Договор вступил в силу для Российской Федерации 1 января 2015 г.). Вступило в силу для Российской Федерации 1 января 2011г.</td>
									</tr>
								</xsl:if>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template mode="executor" match="nad:DocumentInfo/nad:DocumentSignature/nad:ExecutiveSignature">
		<xsl:param name="executor"/>
		<table width="100%">
			<tbody>
				<tr valign="bottom">
					<td width="15%">Исполнитель</td>
					<td width="85%" class="value" align="center">
						<xsl:value-of select="cat_ru:PersonPost"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonName"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
					</td>
					<!--td width="2%"/>
					<td width="15%" align="right">
						<xsl:text>Телефон&#160;&#160;</xsl:text>
					</td>
					<td width="22%" class="value" align="center">
						<xsl:value-of select="../nad:Phone"/>
					</td-->
				</tr>
				<tr align="center" valign="top">
					<td/>
					<td class="graph8">(инициалы, фамилия должностного лица таможенного органа)</td>
					<!--td/>
					<td/>
					<td/-->
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="nad:CustomsChief">
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
		<xsl:if test="nad:OKPOID">,&#032;ОКПО:&#032;<xsl:value-of select="nad:OKPOID"/>
		</xsl:if>
		<xsl:if test="nad:ITN">,&#032;ИТН:&#032;<xsl:value-of select="nad:ITN"/>
		</xsl:if>
		<xsl:if test="nad:Address">,&#032;Адрес:&#032;<xsl:for-each select="nad:Address">
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
		<xsl:if test="nad:OKATOCode">,&#032;ОКАТО:&#032;<xsl:value-of select="nad:OKATOCode"/>
		</xsl:if>
		<xsl:if test="nad:Contact">,&#032;<xsl:for-each select="nad:Contact">
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
	<xsl:template match="nad:CustomsOffice">
		<xsl:value-of select="cat_ru:OfficeName"/>
		<xsl:if test="not(cat_ru:OfficeName) and nad:FullOfficeName">
			<xsl:value-of select="nad:FullOfficeName"/>
		</xsl:if>
		<xsl:text> (</xsl:text>
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:text>)</xsl:text>
	</xsl:template>
	<!--Шаблон для типа RUDECLcat:CustomDocIDType-->
	<xsl:template match="nad:KDTID | nad:CPCID">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="gtd_date" select="cat_ru:RegistrationDate"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
		<xsl:if test="RUDECLcat:Code">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="RUDECLcat:Code"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="nad:Application | nad:OtherCustDoc">
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
	<xsl:template match="nad:KTPOID | nad:TPOID">
		<xsl:value-of select="nad:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="gtd_date" select="nad:RegistrationDate"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="nad:DocNumber"/>
		<xsl:if test="nad:Code">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="nad:Code"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="gtd_number" match="*">
		<xsl:if test="./*[local-name()='DocNumberPrefix']">
			<xsl:value-of select="./*[local-name()='DocNumberPrefix']"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:value-of select="./*[local-name()='CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="gtd_date" select="./*[local-name()='RegistrationDate']"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="./*[local-name()='RegNumber']|./*[local-name()='GTDNumber']"/>
		<xsl:if test="./*[local-name()='Code']">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="./*[local-name()='Code']"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="gtd_date" match="*">
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
