<?xml version="1.0" encoding="utf-8"?>
<!-- Проект Приказа Минфина России "Об утверждении порядка выдачи разрешения на переработку товаров на таможенной территории, отзыва, аннулирования, 
восстановления разрешения на переработку товаров на таможенной территории, передачи разрешения на переработку товаров на таможенной территории, 
формы заявления на переработку товаров на таможенной территории и порядка его заполнения, 
формы разрешения на переработку товаров на таможенной территории и порядка ее заполнения, 
формы заявления на передачу разрешения на переработку товаров на таможенной территории, 
формы заявления о внесении изменений в разрешение на переработку товаров на таможенной территории, 
формы отказа таможенного органа во внесении изменений в разрешение на переработку товаров на таможенной территории", Приложение № 4
 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:catProc_ru="urn:customs.ru:Information:ProcessingDocuments:ProcessingCommonAggregateTypes:5.28.0" xmlns:atp="urn:customs.ru:Information:ProcessingDocuments:AppTransferPermission:5.28.0">
	<!-- Шаблон для типа AppTransferPermissionType -->
	<xsl:template match="atp:AppTransferPermission">
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

                  td.annot
                  {
                  vertical-align:bottom;
                  padding-top: 5px;
                  }

                  .underline
                  {
                  font-family: Arial;
                  font-size: 7pt;
                  vertical-align:top;
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
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>
											<xsl:text>Заявление на передачу разрешения</xsl:text>
											<br/>
											<!--xsl:text>на переработку товаров на таможенной территории иному лицу</xsl:text-->
											<xsl:text>на переработку товаров на таможенной территории</xsl:text>
										</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tr>
							<td class="annot" style="width:35%"/>
							<td class="annot" style="width:17%">Начальнику</td>
							<td class="value" style="width:3%"/>
							<td class="value" style="width:45%">
								<xsl:for-each select="atp:Customs">
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
						</tr>
						<tr>
							<td class="underline" colspan="2"/>
							<td class="underline" colspan="2" align="center">(наименование таможни)</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot" style="width:35%"/>
							<td class="annot" style="width:7%">От</td>
							<td class="value" style="width:3%"/>
							<td class="value" style="width:55%">
								<xsl:for-each select="atp:ApplicantInfomation">
									<xsl:value-of select="atp:OrganizationName"/>
									<xsl:if test="atp:ShortName">
										<xsl:if test="atp:OrganizationName">
											<xsl:text> (</xsl:text>
										</xsl:if>
										<xsl:value-of select="atp:ShortName"/>
										<xsl:if test="atp:OrganizationName">
											<xsl:text>)</xsl:text>
										</xsl:if>
									</xsl:if>
									<xsl:if test="atp:OrganizationName or atp:ShortName">
										<br/>
									</xsl:if>
									<xsl:text>ИНН </xsl:text>
									<xsl:value-of select="atp:INN"/>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td class="underline" colspan="2"/>
							<td class="underline" colspan="2" align="center">(наименование лица, получившего разрешение на переработку товаров на таможенной территории, его идентификационный номер налогоплательщика (далее -  ИНН))</td>
						</tr>
					</table>
					<table class="ext">
						<tr>
							<td class="annot">
								<p style="text-indent: 5%;text-align: justify;">
									<xsl:text>1. Прошу разрешить передачу разрешения на переработку товаров на таможенной территории № </xsl:text>
									<u>&#160;&#160;<xsl:apply-templates select="atp:PermitNumber"/>&#160;&#160;</u>
									<xsl:text>&#160;следующему лицу:</xsl:text>
								</p>
							</td>
						</tr>
					</table>
					<table class="ext_border">
						<!--таблица в таблице для красивого отступа от внешних границ-->
						<tr>
							<td align="center">
								<table class="int">
									<tr>
										<td class="annot">
											<p style="text-indent: 5%;">
												<!--xsl:text>Указываются:</xsl:text-->
												<br/>
											</p>
										</td>
									</tr>
									<xsl:for-each select="atp:Recipient">
										<tr>
											<td class="value">
												<xsl:value-of select="cat_ru:OrganizationName"/>
												<xsl:if test="cat_ru:ShortName">
													<xsl:if test="cat_ru:OrganizationName">
														<xsl:text> (</xsl:text>
													</xsl:if>
													<xsl:value-of select="cat_ru:ShortName"/>
													<xsl:if test="cat_ru:OrganizationName">
														<xsl:text>)</xsl:text>
													</xsl:if>
												</xsl:if>
											</td>
										</tr>
										<tr>
											<td class="underline" align="center">
												<xsl:text>(полное и сокращенное наименование лица)</xsl:text>
											</td>
										</tr>
										<tr>
											<td class="annot">
												<table>
													<tr>
														<td class="annot" width="70%">
															<xsl:text>ИНН: </xsl:text>
														</td>
														<td class="value" width="30%">
															<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
														</td>
													</tr>
													<tr>
														<td class="annot">
															<xsl:text>Код причины постановки на учет (далее - КПП): </xsl:text>
														</td>
														<td class="value">
															<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
														</td>
													</tr>
													<tr>
														<td class="annot">
															<xsl:text>Основной государственный регистрационный номер (далее - ОГРН): </xsl:text>
														</td>
														<td class="value">
															<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td class="annot">
												<xsl:text>Юридический адрес: </xsl:text>
											</td>
										</tr>
										<tr>
											<td class="value">
												<xsl:for-each select="RUScat_ru:SubjectAddressDetails[not(RUScat_ru:AddressKindCode) or RUScat_ru:AddressKindCode='1']">
													<xsl:apply-templates select="."/>
													<xsl:if test="position()!=last()">
														<xsl:text>; </xsl:text>
													</xsl:if>
												</xsl:for-each>
												<br/>
											</td>
										</tr>
										<tr>
											<td class="annot">
												<xsl:text>Почтовый адрес: </xsl:text>
											</td>
										</tr>
										<tr>
											<td class="value">
												<xsl:for-each select="RUScat_ru:SubjectAddressDetails[RUScat_ru:AddressKindCode='3']">
													<xsl:apply-templates select="."/>
													<xsl:if test="position()!=last()">
														<xsl:text>; </xsl:text>
													</xsl:if>
												</xsl:for-each>
												<br/>
											</td>
										</tr>
										<tr>
											<td class="annot">
												<xsl:text>Адрес местонахождения: </xsl:text>
											</td>
										</tr>
										<tr>
											<td class="value">
												<xsl:for-each select="RUScat_ru:SubjectAddressDetails[RUScat_ru:AddressKindCode='2']">
													<xsl:apply-templates select="."/>
													<xsl:if test="position()!=last()">
														<xsl:text>; </xsl:text>
													</xsl:if>
												</xsl:for-each>
												<br/>
											</td>
										</tr>
										<tr>
											<td class="annot">
												<xsl:text>Адрес электронной почты, номер (номера) телефона (телефонов), факс, телекс: </xsl:text>
											</td>
										</tr>
										<tr>
											<td class="value">
												<xsl:for-each select="RUScat_ru:CommunicationDetails">
													<xsl:apply-templates select="."/>
													<xsl:if test="position()!=last()">
														<xsl:text>; </xsl:text>
													</xsl:if>
												</xsl:for-each>
												<br/>
											</td>
										</tr>
										<xsl:choose>
											<xsl:when test="atp:BankReqInfo">
												<xsl:for-each select="atp:BankReqInfo">
													<tr>
														<td class="annot">
															<xsl:text>Наименование банка: </xsl:text>
														</td>
													</tr>
													<tr>
														<td class="value">
															<xsl:value-of select="cat_ru:OrganizationName"/>
															<xsl:if test="cat_ru:ShortName">
																<xsl:if test="cat_ru:OrganizationName">
																	<xsl:text> (</xsl:text>
																</xsl:if>
																<xsl:value-of select="cat_ru:ShortName"/>
																<xsl:if test="cat_ru:OrganizationName">
																	<xsl:text>)</xsl:text>
																</xsl:if>
															</xsl:if>
															<xsl:if test="catProc_ru:BankMFO">
																<xsl:text>, МФО: </xsl:text>
																<xsl:value-of select="catProc_ru:BankMFO"/>
															</xsl:if>
															<xsl:if test="catProc_ru:OKPOID">
																<xsl:text>, ОКПО: </xsl:text>
																<xsl:value-of select="catProc_ru:OKPOID"/>
															</xsl:if>
															<xsl:if test="catProc_ru:BICID">
																<xsl:text>, БИК: </xsl:text>
																<xsl:value-of select="catProc_ru:BICID"/>
															</xsl:if>
														</td>
													</tr>
													<tr>
														<td class="underline" align="center">
															<xsl:text>(полное и сокращенное наименование)</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="annot">
															<table>
																<tr>
																	<td class="annot" width="20%">
																		<xsl:text>ИНН: </xsl:text>
																	</td>
																	<td class="value" width="80%">
																		<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
																	</td>
																</tr>
																<tr>
																	<td class="annot">
																		<xsl:text>КПП: </xsl:text>
																	</td>
																	<td class="value">
																		<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
																	</td>
																</tr>
																<tr>
																	<td class="annot">
																		<xsl:text>ОГРН: </xsl:text>
																	</td>
																	<td class="value">
																		<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td class="annot">
															<xsl:text>Рублевый счет  (счета): </xsl:text>
														</td>
													</tr>
													<tr>
														<td class="value">
															<xsl:for-each select="catProc_ru:BankAccountRUB">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last()">, </xsl:if>
															</xsl:for-each>
															<br/>
														</td>
													</tr>
													<tr>
														<td class="annot">
															<xsl:text>Валютный счет (счета): </xsl:text>
														</td>
													</tr>
													<tr>
														<td class="value">
															<xsl:for-each select="catProc_ru:BankAccountVAL">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last()">, </xsl:if>
															</xsl:for-each>
															<br/>
														</td>
													</tr>
												</xsl:for-each>
											</xsl:when>
											<xsl:otherwise>
												<tr>
													<td class="annot">
														<xsl:text>Наименование банка (банков): </xsl:text>
													</td>
												</tr>
												<tr>
													<td class="value">
														<br/>
													</td>
												</tr>
												<tr>
													<td class="underline" align="center">
														<xsl:text>(полное и сокращенное наименование)</xsl:text>
													</td>
												</tr>
												<tr>
													<td class="annot">
														<table>
															<tr>
																<td class="annot" width="20%">
																	<xsl:text>ИНН: </xsl:text>
																</td>
																<td class="value" width="80%">
																	<br/>
																</td>
															</tr>
															<tr>
																<td class="annot">
																	<xsl:text>КПП: </xsl:text>
																</td>
																<td class="value">
																	<br/>
																</td>
															</tr>
															<tr>
																<td class="annot">
																	<xsl:text>ОГРН: </xsl:text>
																</td>
																<td class="value">
																	<br/>
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td class="annot">
														<xsl:text>Рублевый счет  (счета): </xsl:text>
													</td>
												</tr>
												<tr>
													<td class="value">
														<br/>
													</td>
												</tr>
												<tr>
													<td class="annot">
														<xsl:text>Валютный счет (счета): </xsl:text>
													</td>
												</tr>
												<tr>
													<td class="value">
														<br/>
													</td>
												</tr>
											</xsl:otherwise>
										</xsl:choose>
										<tr>
											<td class="annot">
												<xsl:text>Адрес местонахождения производственных мощностей: </xsl:text>
											</td>
										</tr>
										<tr>
											<td class="value">
												<xsl:for-each select="atp:FactoryPlace">
													<xsl:apply-templates select="."/>
													<xsl:if test="position()!=last()">
														<xsl:text>; </xsl:text>
													</xsl:if>
												</xsl:for-each>
												<br/>
											</td>
										</tr>
									</xsl:for-each>
									<tr>
										<td class="underline">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="annot">
											<p style="text-indent: 5%;text-align: justify;">
												<xsl:text>Согласен на принятие разрешения на переработку товаров на таможенной территории № </xsl:text>
												<u>&#160;&#160;<xsl:apply-templates select="atp:PermitNumber"/>&#160;&#160;</u>
												<xsl:text>&#160;для последующего совершения операций по переработке товаров, помещенных под таможенную процедуру переработки на таможенной территории, </xsl:text>
												<xsl:text>и использования указанной таможенной процедуры в установленном порядке.</xsl:text>
											</p>
										</td>
									</tr>
									<tr>
										<td class="underline">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="annot">
											<xsl:apply-templates select="atp:RecipientPersonSignature">
												<xsl:with-param name="fio_descr" select="'Фамилия, имя, отчество (при наличии) руководителя лица, принимающего разрешение на переработку товаров на таможенной территории'"/>
											</xsl:apply-templates>
										</td>
									</tr>
									<tr>
										<td class="underline">
											<br/>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td align="center">
								<table class="int">
									<tr>
										<td class="value">
											<xsl:apply-templates select="atp:ProcessingDescription"/>
										</td>
									</tr>
									<tr>
										<td class="underline" align="center">
											<xsl:text>причины, обосновывающие невозможность использования таможенной процедуры переработки на таможенной </xsl:text>
											<xsl:text>территории лицом, первоначально получившим разрешение на переработку товаров на таможенной территории</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="underline">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="annot">
											<xsl:apply-templates select="atp:ApplicantPersonSignature">
												<xsl:with-param name="fio_descr" select="'Фамилия, имя, отчество (при наличии) руководителя лица, передающего разрешение на переработку товаров на таможенной территории'"/>
											</xsl:apply-templates>
										</td>
									</tr>
									<tr>
										<td class="underline">
											<br/>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- cat_ru:PersonSignatureType -->
	<xsl:template match="atp:RecipientPersonSignature | atp:ApplicantPersonSignature">
		<xsl:param name="fio_descr" select="''"/>
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
					<td class="underline" align="center">
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
					<td class="underline" colspan="5">
						<br/>
					</td>
				</tr>
				<tr>
					<td class="annot" colspan="5">
						<xsl:text>Оттиск печати (при наличии)</xsl:text>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<xsl:text>тел.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:if test="cat_ru:Phone">, </xsl:if>
			<xsl:text>факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax">, </xsl:if>
			<xsl:text>телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax or cat_ru:Telex">, </xsl:if>
			<xsl:text>e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType или cat_ru:AddressType-->
	<xsl:template match="RUScat_ru:SubjectAddressDetails | atp:FactoryPlace">
		<xsl:for-each select="*">
			<xsl:if test="local-name()='AddressKindCode'">Код вида адреса: </xsl:if>
			<xsl:if test="local-name()='PostalCode'">Почтовый индекс: </xsl:if>
			<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
			<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
			<xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
			<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
			<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if>
			<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
			<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
			<xsl:choose>
				<xsl:when test="local-name()='CountryCode'">
					<xsl:if test="not(../RUScat_ru:CounryName) and not(../cat_ru:CounryName)">
						<xsl:value-of select="."/>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
					<xsl:if test="local-name()='CounryName'">
						<xsl:if test="../RUScat_ru:CountryCode"> (<xsl:value-of select="../RUScat_ru:CountryCode"/>)</xsl:if>
						<xsl:if test="../cat_ru:CountryCode"> (<xsl:value-of select="../cat_ru:CountryCode"/>)</xsl:if>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:if test="local-name()!='CountryCode' or (local-name()='CountryCode' and not(../RUScat_ru:CounryName) and not(../cat_ru:CounryName))">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа catProc_ru:PermitNumberType -->
	<xsl:template match="atp:PermitNumber">
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
