<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:pttf="urn:customs.ru:Information:ExchangeDocuments:PetitionToFTS:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0">
	<!-- Шаблон для типа PetitionToFTSType -->
	<xsl:template match="pttf:PetitionToFTS">
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

				.graphLittle 
				{
				font-family: Arial;
				font-size: 7pt;
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
                </style>
			</head>
			<body>
				<div class="page">
					<table width="100%" class="annot graphMain">
						<tbody>
							<tr>
								<td align="right" class="title">
									<font size="4">
										<b>В Федеральную таможенную службу</b>
									</font>
									<br/>
								</td>
							</tr>
							<tr>
								<td align="right" class="title">
									<font size="4">
										<xsl:apply-templates select="pttf:PetitionCustoms"/>
									</font>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<xsl:choose>
											<xsl:when test="pttf:PetitionType/pttf:ApplicationType='1'">
												<xsl:text>ОБРАЩЕНИЕ</xsl:text>
											</xsl:when>
											<xsl:when test="pttf:PetitionType/pttf:ApplicationType='2'">
												<xsl:text>ЖАЛОБА</xsl:text>
											</xsl:when>
											<xsl:when test="pttf:PetitionType/pttf:ApplicationType='3'">
												<xsl:text>ЗАПРОС ИНФОРМАЦИИ</xsl:text>
											</xsl:when>
											<xsl:when test="pttf:PetitionType/pttf:ApplicationType='4'">
												<xsl:text>ВОПРОС ПО ПРИМЕНЕНИЮ ТАМОЖЕННОГО ЗАКОНОДАТЕЛЬСТВА</xsl:text>
											</xsl:when>
											<xsl:when test="pttf:PetitionType/pttf:ApplicationType='5'">
												<xsl:text>ЗАЯВЛЕНИЕ НА ПРЕДОСТАВЛЕНИЕ ОТСРОЧКИ/РАССРОЧКИ УПЛАТЫ ТАМОЖЕННЫХ ПЛАТЕЖЕЙ</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="pttf:PetitionType/pttf:ApplicationType"/>
											</xsl:otherwise>
										</xsl:choose>
									</font>
									<br/>
								</td>
							</tr>
							<tr>
								<td align="center" class="title">
									<xsl:value-of select="pttf:PetitionType/pttf:ApplicationName"/>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
								</td>
							</tr>
							<xsl:if test="pttf:PersCabRegistration">
								<tr>
									<td class="annot graphMain" align="center">
										<xsl:if test="pttf:PersCabRegistration/pttf:RegistrationNumber">
											<xsl:text> № </xsl:text>
											<span class="value graphMain">
												<xsl:value-of select="pttf:PersCabRegistration/pttf:RegistrationNumber"/>
											</span>
										</xsl:if>
										<xsl:if test="pttf:PersCabRegistration/pttf:RegistrationDate">
											<xsl:text> от </xsl:text>
											<span class="value graphMain">
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="pttf:PersCabRegistration/pttf:RegistrationDate"/>
												</xsl:call-template>
											</span>
										</xsl:if>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="pttf:OutcomingNumber">
								<tr>
									<td class="annot graphMain" align="center">
										<xsl:text>Исходящий номер: </xsl:text>
										<xsl:if test="pttf:OutcomingNumber/pttf:DocNumber">
											<xsl:text> № </xsl:text>
											<span class="value graphMain">
												<xsl:value-of select="pttf:OutcomingNumber/pttf:DocNumber"/>
											</span>
										</xsl:if>
										<xsl:if test="pttf:OutcomingNumber/pttf:DocDate">
											<xsl:text> от </xsl:text>
											<span class="value graphMain">
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="pttf:OutcomingNumber/pttf:DocDate"/>
												</xsl:call-template>
											</span>
										</xsl:if>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="pttf:PetitionOrganization">
								<tr>
									<td>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="title marg-top">От </td>
								</tr>
								<tr>
									<td class="value graphMain">
										<xsl:apply-templates select="pttf:PetitionOrganization"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="pttf:PetitionOrganization/pttf:Organization/RUScat_ru:SubjectAddressDetails">
								<tr>
									<td>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="title marg-top">Адрес</td>
								</tr>
								<tr>
									<td class="value graphMain">
										<xsl:if test="pttf:PetitionOrganization/pttf:Organization/RUScat_ru:SubjectAddressDetails/RUScat_ru:OKATO">
											<xsl:text> ОКАТО: </xsl:text>
											<xsl:value-of select="pttf:PetitionOrganization/pttf:Organization/RUScat_ru:SubjectAddressDetails/RUScat_ru:OKATO"/>
										</xsl:if>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="pttf:PetitionOrganization/pttf:Organization/RUScat_ru:SubjectAddressDetails" mode="AdressStr"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="pttf:PetitionOrganization/pttf:Organization/RUScat_ru:CommunicationDetails">
								<tr>
									<td>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="title marg-top">Контактные данные</td>
								</tr>
								<tr>
									<td class="value graphMain">
										<xsl:for-each select="pttf:PetitionOrganization/pttf:Organization/RUScat_ru:CommunicationDetails">
											<xsl:apply-templates mode="contact" select="."/>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="pttf:Annotation">
								<tr>
									<td>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="title marg-top">Аннотация  </td>
								</tr>
								<tr>
									<td style="text-align: justify; text-indent: 5%" class="graphMain">
										<xsl:for-each select="pttf:Annotation">
											<xsl:value-of select="."/>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="pttf:MessageText">
								<tr>
									<td>
										<br/>
									</td>
								</tr>
								<xsl:for-each select="pttf:MessageText">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
								<tr>
									<td>
										<br/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="pttf:AttachedDocuments">
								<tr>
									<td>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="annot graphMain">
										<xsl:choose>
											<xsl:when test="count(pttf:AttachedDocuments)=1">
												<xsl:text>Приложение: </xsl:text>
											</xsl:when>
											<xsl:when test="count(pttf:AttachedDocuments)>1">
												<xsl:text>Приложения: </xsl:text>
											</xsl:when>
										</xsl:choose>
									</td>
								</tr>
								<xsl:for-each select="pttf:AttachedDocuments">
									<tr>
										<td>
											<xsl:apply-templates select="."/>
										</td>
									</tr>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="pttf:PetitionOrganization/pttf:OrganizationPerson">
								<tr>
									<td>
										<table class="annot graphMain">
											<tbody>
												<tr>
													<td colspan="5">
														<br/>
														<br/>
														<xsl:text>Подпись представителя организации:</xsl:text>
														<br/>
														<br/>
													</td>
												</tr>
												<tr align="center">
													<td width="25%" class="value graphMain">
														<xsl:value-of select="pttf:PetitionOrganization/pttf:OrganizationPerson/cat_ru:PersonPost"/>
													</td>
													<td width="10%"/>
													<td width="20%" class="value graphMain"/>
													<td width="10%"/>
													<td align="center" width="35%" class="value graphMain">
														<xsl:text> </xsl:text>
														<xsl:value-of select="pttf:PetitionOrganization/pttf:OrganizationPerson/cat_ru:PersonSurname"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="pttf:PetitionOrganization/pttf:OrganizationPerson/cat_ru:PersonName"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="pttf:PetitionOrganization/pttf:OrganizationPerson/cat_ru:PersonMiddleName"/>
													</td>
												</tr>
												<tr align="center">
													<td class="graphLittle">
														<xsl:text>(должность)</xsl:text>
													</td>
													<td/>
													<td class="graphLittle">
														<xsl:text>(подпись)</xsl:text>
													</td>
													<td/>
													<td class="graphLittle">
														<xsl:text>(Ф.И.О.)</xsl:text>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа pttf:AttachedDocumentType -->
	<xsl:template match="pttf:AttachedDocuments">
		<xsl:if test="pttf:RequestPosition">
			<xsl:value-of select="pttf:RequestPosition"/>
			<xsl:text>.  </xsl:text>
		</xsl:if>
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от  </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="pttf:DocCode">
			<xsl:text> (код вида документа: </xsl:text>
			<xsl:value-of select="pttf:DocCode"/>
			<xsl:text>) </xsl:text>
		</xsl:if>
		<xsl:if test="pttf:DocBeginDate or pttf:DocEndDate">
			<xsl:text> действует </xsl:text>
		</xsl:if>
		<xsl:if test="pttf:DocBeginDate">
			<xsl:text> с</xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="pttf:DocBeginDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="pttf:DocEndDate">
			<xsl:text> по: </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="pttf:DocEndDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="pttf:PagesAmount">
			<xsl:text> &#8212; </xsl:text>
			<xsl:value-of select="translate(pttf:PagesAmount, '.', ',')"/>
			<xsl:text> стр. </xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа pttf:MessageDocBodyType -->
	<xsl:template match="pttf:MessageText">
		<tr>
			<td class="graphMain">
				<b>
					<xsl:value-of select="pttf:SectionName"/>
				</b>
			</td>
		</tr>
		<tr>
			<td>
				<br/>
			</td>
		</tr>
		<xsl:for-each select="pttf:TextPara">
			<tr>
				<td style="text-align: justify; text-indent: 5%;" class="graphMain">
					<xsl:value-of select="."/>
				</td>
			</tr>
		</xsl:for-each>
		<tr>
			<td>
				<br/>
			</td>
		</tr>
		<tr>
			<td>
				<xsl:if test="pttf:TextTable">
					<table class="annot graphMain">
						<tbody>
							<tr>
								<td class="graphMain bordered">
									<xsl:text>Текст</xsl:text>
								</td>
								<td class="graphMain bordered">
									<xsl:text>Дата</xsl:text>
								</td>
								<td class="graphMain bordered">
									<xsl:text>Сумма</xsl:text>
								</td>
								<td class="graphMain bordered">
									<xsl:text>Валюта</xsl:text>
								</td>
								<td class="graphMain bordered">
									<xsl:text>Комментарии</xsl:text>
								</td>
							</tr>
							<xsl:for-each select="pttf:TextTable">
								<tr>
									<td class="graphMain bordered">
										<xsl:value-of select="pttf:TextTableText"/>
									</td>
									<td class="graphMain bordered">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="pttf:TextTableDate"/>
										</xsl:call-template>
									</td>
									<td class="graphMain bordered">
										<xsl:value-of select="translate(pttf:TextTableSum, '.', ',')"/>
									</td>
									<td class="graphMain bordered">
										<xsl:value-of select="pttf:TextTableCurrency"/>
									</td>
									<td class="graphMain bordered">
										<xsl:value-of select="pttf:TextTableComment"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td>
				<br/>
				<br/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template mode="contact" match="*">
		<xsl:if test="cat_ru:Phone">
			<xsl:text>телефон: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:text> факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:text> телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:text> e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<xsl:text> категория лица: </xsl:text>
		<xsl:value-of select="cat_ru:CategoryCode"/>
		<xsl:text> код КАТО: </xsl:text>
		<xsl:value-of select="cat_ru:KATOCode"/>
		<xsl:if test="cat_ru:RNN">
			<xsl:text> РНН: </xsl:text>
			<xsl:value-of select="cat_ru:RNN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text>ИНН / ПИН: </xsl:text>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<xsl:text> ОКПО: </xsl:text>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text>УНН: </xsl:text>
			<xsl:value-of select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<xsl:text> НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<xsl:text> Номер справки об отсутствии НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text>УНП: </xsl:text>
			<xsl:value-of select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text> Идентификационный номер физического лица: </xsl:text>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>ОГРН/ОГРНИП: </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН: </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП: </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text>БИН: </xsl:text>
			<xsl:value-of select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text> ИИН: </xsl:text>
			<xsl:value-of select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<b>
				<xsl:text>ИТН: </xsl:text>
			</b>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:OrganizationType -->
	<xsl:template match="pttf:Organization">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName">
				<xsl:text> (</xsl:text>
			</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">
				<xsl:text>) </xsl:text>
			</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures">
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:RKOrganizationFeatures">
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:RBOrganizationFeatures">
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:RAOrganizationFeatures">
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KGOrganizationFeatures">
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<xsl:text> УИТН: </xsl:text>
			<xsl:value-of select="RUScat_ru:UITN/RUScat_ru:UITNCode"/>
			<xsl:text> </xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template mode="Contact" match="*">
		<xsl:if test="cat_ru:Contact">
			<xsl:apply-templates select="cat_ru:Contact"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template mode="AdressStr" match="*">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:apply-templates select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:apply-templates select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								<xsl:otherwise>(код вида адреса: <xsl:apply-templates select="."/>) </xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="pttf:OrganizationPerson">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Фамилия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonSurname"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Имя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:PersonMiddleName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Отчество</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:PersonMiddleName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PersonPost">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Должность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:PersonPost"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа pttf:PetitionCustomsType -->
	<xsl:template match="pttf:PetitionCustoms">
		<xsl:value-of select="pttf:CustomsCode"/>
		<xsl:if test="pttf:CustomsOfficeName">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="pttf:CustomsOfficeName"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа pttf:PetitionOrganizationType -->
	<xsl:template match="pttf:PetitionOrganization">
		<xsl:if test="pttf:Organization">
			<xsl:apply-templates select="pttf:Organization"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа pttf:TextTableType -->
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
