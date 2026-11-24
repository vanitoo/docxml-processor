<?xml version="1.0" encoding="UTF-8"?>
<!--Приказ ФТС России от 14.01.2019 г. № 27-->
<xsl:stylesheet exclude-result-prefixes="cat_ru aatc" version="1.0" xmlns:aatc="urn:customs.ru:Information:CommercialFinanceDocuments:ApplicationAdvanceToCollateral:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0">
	<xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="aatc:ApplicationAdvanceToCollateral">
		<html>
			<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
			<style type="text/css">
			body {
			background: #cccccc;
			}
                    div.page {
                        width: 180mm;
                        margin: auto;
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        padding: 10mm;
                        padding-left: 20mm;
                        background: #ffffff;
                        border: solid 1pt #000000;
                    }

                    @media print {
                        div.page {
                            border: none;
                            padding: 0;
                        }
                    }

					table
					{
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin: 0;
					font-size: 11pt;
					font-family: Arial;
					}

					/*table.border tr td
					{
					border: 1px solid gray;
					}*/

					.value
					{
					border-bottom: solid 1px black;
					font-style: Italic;
					text-align: center;
					}

					td.graphMain
					{
					vertical-align:top;
					font-size: 10pt;
					}

					.graphHeader
					{
					vertical-align:top;
					font-size: 12pt;
					font-family: Arial;
					text-align: center;
					font-weight: bold;
					}		
					
					.normal
					{
					font-size: 11pt;
					font-family:Arial;
					}						

					.graphLittle 
					{						
					font-family: Arial;						
					font-size: 7pt;
					text-align: center;
					vertical-align:top;
					}

					.bordered{
					border-collapse: collapse;
					border: 1px solid black;
					}

					.footnote{
					font-family: Arial;						
					font-size: 7pt;
					text-align: left;
					}

					.delim_3 {
					height: 3pt;
					}

                    </style>
			<body>
				<div class="page">
					<table class="graphMain" width="100%">
						<tbody>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td width="50%"/>
												<td class="value" width="50%">
													<xsl:apply-templates select="aatc:Customs" mode="CustomsBase"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td class="graphLittle">
													<xsl:text>(наименование таможенного органа, в который подается заявление)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
								</td>
							</tr>
							<tr>
								<td class="graphHeader">
									<xsl:text>ЗАЯВЛЕНИЕ</xsl:text>
									<br>о зачете денежных средств, уплаченных в качестве авансовых платежей, в счет денежного залога</br>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
								</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="aatc:ApplicantInfo" mode="organization_name"/>
								</td>
							</tr>
							<tr>
								<td class="graphLittle">
									<xsl:text>(указывается один из следующих вариантов в зависимости от статуса лица:</xsl:text>
								</td>
							</tr>
							<tr>
								<td style="text-indent:5%" class="footnote">
									<xsl:text>1) для юридических лиц:</xsl:text>
								</td>
							</tr>
							<tr>
								<td style="text-indent:5%; text-align: justify" class="footnote">
									<xsl:text>наименование организации, место нахождения и полный адрес юридического лица, основной  государственный регистрационный номер, идентификационный номер налогоплательщика (далее - ИНН), телефон;</xsl:text>
								</td>
							</tr>
							<tr>
								<td style="text-indent:5%" class="footnote">
									<xsl:text>2) для иностранных юридических лиц:</xsl:text>
								</td>
							</tr>
							<tr>
								<td style="text-indent:5%; text-align: justify" class="footnote">
									<xsl:text>наименование организации, страна регистрации (инкорпорации), место нахождения и полный адрес юридического лица, аналог ИНН в соответствии с законодательством иностранного государства (при наличии);</xsl:text>
								</td>
							</tr>
							<tr>
								<td style="text-indent:5%" class="footnote">
									<xsl:text>3) для физических лиц, осуществляющих деятельность в качестве индивидуальных предпринимателей:</xsl:text>
								</td>
							</tr>
							<tr>
								<td style="text-indent:5%; text-align: justify" class="footnote">
									<xsl:text>фамилия,  имя,  отчество (при наличии), место жительства, ИНН, основной государственный   регистрационный  номер  индивидуального  предпринимателя, телефон (при наличии);</xsl:text>
								</td>
							</tr>
							<tr>
								<td style="text-indent:5%; text-align: justify" class="footnote">
									<xsl:text>4) для физических лиц, имеющих гражданство Российской Федерации (кроме физических  лиц,  осуществляющих  деятельность  в  качестве индивидуального предпринимателя):</xsl:text>
								</td>
							</tr>
							<tr>
								<td style="text-indent:5%; text-align: justify" class="footnote">
									<xsl:text>фамилия, имя, отчество (при наличии), наименование документа, удостоверяющего личность, серия и номер такого документа, место жительства, ИНН (при наличии), телефон (при наличии);</xsl:text>
								</td>
							</tr>
							<tr>
								<td style="text-indent:5%" class="footnote">
									<xsl:text>5) для иностранных физических лиц и лиц без гражданства:</xsl:text>
								</td>
							</tr>
							<tr>
								<td style="text-indent:5%; text-align: justify" class="footnote">
									<xsl:text>фамилия, имя, отчество (при наличии), наименование документа, удостоверяющего личность, серия и номер такого документа; страна регистрации (при наличии), место жительства или место пребывания в Российской Федерации (при наличии), место жительства в иностранном государстве; гражданство (для иностранных физических лиц), телефон (при наличии)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="aatc:ApplicantInfo" mode="organization_noname"/>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>в соответствии со статьей 35 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" настоящим заявлением распоряжается денежными средствами, уплаченными в качестве авансовых платежей и отраженными на лицевом счете, в сумме </xsl:text>
									<span class="value">
										<xsl:text>&#160;&#160;</xsl:text>
										<xsl:if test="aatc:AdvanceAmount">
											<xsl:value-of select="translate(translate(format-number(aatc:AdvanceAmount, '#,###.00'),',','&#160;'),'.',',')"/>
										</xsl:if>
										<xsl:text>&#160;&#160;</xsl:text>
									</span>
									<xsl:text> рублей в счет денежного залога.</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-indent:5%; text-align: justify">
									<xsl:text>Авансовые платежи надлежит использовать для</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:choose>
										<xsl:when test="aatc:PaymentTypeIndicator='1'">
											<xsl:text>обеспечения исполнения обязанности по уплате таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин</xsl:text>
										</xsl:when>
										<xsl:when test="aatc:PaymentTypeIndicator='2'">
											<xsl:text>обеспечения исполнения обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела</xsl:text>
										</xsl:when>
										<xsl:when test="aatc:PaymentTypeIndicator='3'">
											<xsl:text>обеспечения исполнения обязанностей уполномоченного экономического оператора</xsl:text>
										</xsl:when>
										<xsl:when test="aatc:PaymentTypeIndicator='4'">
											<xsl:text>генерального обеспечения исполнения обязанности по уплате таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин</xsl:text>
										</xsl:when>
										<xsl:when test="aatc:PaymentTypeIndicator='5'">
											<xsl:text>обеспечения исполнения обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела, и обеспечения исполнения обязанностей уполномоченного экономического оператора</xsl:text>
										</xsl:when>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="graphLittle">
									<xsl:text>(указываются следующие возможные варианты в зависимости от намерений лица, внесшего авансовые платежи:</xsl:text>
								</td>
							</tr>
							<tr>
								<td style="text-indent:5%; text-align: justify" class="footnote">
									<xsl:text>1) обеспечения исполнения обязанности по уплате таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин;</xsl:text>
								</td>
							</tr>
							<tr>
								<td style="text-indent:5%; text-align: justify" class="footnote">
									<xsl:text>2) обеспечения исполнения обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела;</xsl:text>
								</td>
							</tr>
							<tr>
								<td style="text-indent:5%; text-align: justify" class="footnote">
									<xsl:text>3) обеспечения исполнения обязанностей уполномоченного экономического оператора;</xsl:text>
								</td>
							</tr>
							<tr>
								<td style="text-indent:5%; text-align: justify" class="footnote">
									<xsl:text>4) генерального обеспечения исполнения обязанности по уплате таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин;</xsl:text>
								</td>
							</tr>
							<tr>
								<td style="text-indent:5%; text-align: justify" class="footnote">
									<xsl:text>5) обеспечения исполнения обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела, и обеспечения исполнения обязанностей уполномоченного экономического оператора</xsl:text>
									<sup>1</sup>).
								</td>
							</tr>
							<tr>
								<td style="delim_3">
									<br/>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td class="value" width="45%">
													<xsl:value-of select="aatc:ApplicantSignature/cat_ru:PersonPost"/>
												</td>
												<td width="5%"/>
												<td class="value" width="20%"/>
												<td width="5%"/>
												<td class="value" width="25%">
													<xsl:value-of select="aatc:ApplicantSignature/cat_ru:PersonSurname"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="aatc:ApplicantSignature/cat_ru:PersonName"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="aatc:ApplicantSignature/cat_ru:PersonMiddleName"/>
												</td>
											</tr>
											<tr>
												<td class="graphLittle">
													<xsl:text>(наименование должности руководителя юридического лица или лица, им уполномоченного)</xsl:text>
													<sup>2</sup>
												</td>
												<td/>
												<td class="graphLittle">
													<xsl:text>(подпись)</xsl:text>
												</td>
												<td/>
												<td class="graphLittle">
													<xsl:text>(инициалы, фамилия)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td style="delim_3">
									<br/>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td align="center" width="30%">
													<xsl:text>М.П.</xsl:text>
												</td>
												<td width="20%"/>
												<td width="50%"/>
											</tr>
											<tr>
												<td align="center" class="graphLittle">
													<xsl:text>(при наличии печати)</xsl:text>
												</td>
												<td/>
												<td/>
											</tr>
											<tr>
												<td colspan="3">
													<br/>
													<br/>
												</td>
											</tr>
											<tr>
												<td align="center">
													<xsl:text>дата заполнения</xsl:text>
												</td>
												<td class="value">
													<xsl:call-template name="russian_date">
														<xsl:with-param select="aatc:DocDate" name="dateIn"/>
													</xsl:call-template>
												</td>
												<td/>
											</tr>
											<tr>
												<td/>
												<td class="graphLittle">
													<xsl:text>(дата)</xsl:text>
												</td>
												<td/>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td style="delim_3">
									<br/>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td class="value" width="30%"/>
												<td width="70%"/>
											</tr>
											<tr>
												<td class="footnote" colspan="2">
													<sup>1</sup>
													<xsl:text> Указывается при включении (нахождении) лица, внесшего авансовые платежи, одновременно в реестр(е) таможенных представителей (реестр(е) таможенных перевозчиков) и в реестр(е) уполномоченных экономических операторов одновременно.</xsl:text>
												</td>
											</tr>
											<tr>
												<td class="footnote" colspan="2">
													<sup>2</sup>
													<xsl:text> Не указывается физическими лицами и индивидуальными предпринимателями.</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:SubjectDetailsType -->
	<xsl:template mode="organization_noname" match="*">
		<xsl:if test="RUScat_ru:CountryA2Code">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="RUScat_ru:CountryA2Code"/>
			<xsl:text>) </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:if test="string-length(RUScat_ru:CountryA2Code) &gt; 0">
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<xsl:if test="string-length(RUScat_ru:CountryA2Code) &gt; 0 or string-length(RUScat_ru:BusinessEntityTypeCode) &gt; 0">
				<xsl:text>, </xsl:text>
			</xsl:if>ОПФ: <xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<xsl:if test="string-length(RUScat_ru:CountryA2Code) &gt; 0 or string-length(RUScat_ru:BusinessEntityTypeCode) &gt; 0 or string-length(RUScat_ru:BusinessEntityTypeName) &gt; 0">
				<xsl:text>, </xsl:text>
			</xsl:if>УИТН: <xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<xsl:if test="string-length(RUScat_ru:CountryA2Code) &gt; 0 or string-length(RUScat_ru:BusinessEntityTypeCode) &gt; 0 or string-length(RUScat_ru:BusinessEntityTypeName) &gt; 0 or string-length(RUScat_ru:UITN) &gt; 0">
				<xsl:text>, </xsl:text>
			</xsl:if>УИ ФЛ: <xsl:value-of select="RUScat_ru:PersonId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<xsl:if test="string-length(RUScat_ru:CountryA2Code) &gt; 0 or string-length(RUScat_ru:BusinessEntityTypeCode) &gt; 0 or string-length(RUScat_ru:BusinessEntityTypeName) &gt; 0 or string-length(RUScat_ru:UITN) &gt; 0 or string-length(RUScat_ru:PersonId) &gt; 0">
				<xsl:text>, </xsl:text>
			</xsl:if>Документ, удостоверяющий личность: <xsl:apply-templates select="RUScat_ru:IdentityCard"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:if test="string-length(RUScat_ru:CountryA2Code) &gt; 0 or string-length(RUScat_ru:BusinessEntityTypeCode) &gt; 0 or string-length(RUScat_ru:BusinessEntityTypeName) &gt; 0 or string-length(RUScat_ru:UITN) &gt; 0 or string-length(RUScat_ru:PersonId) &gt; 0 or string-length(RUScat_ru:IdentityCard) &gt; 0">
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:if test="RUScat_ru:SubjectAddressDetails">Адрес(а): </xsl:if>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates mode="ru_address" select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<xsl:if test="string-length(RUScat_ru:CountryA2Code) &gt; 0 or string-length(RUScat_ru:BusinessEntityTypeCode) &gt; 0 or string-length(RUScat_ru:BusinessEntityTypeName) &gt; 0 or string-length(RUScat_ru:UITN) &gt; 0 or string-length(RUScat_ru:PersonId) &gt; 0 or string-length(RUScat_ru:IdentityCard) &gt; 0or string-length(RUScat_ru:SubjectAddressDetails) &gt; 0">
				<xsl:text>, </xsl:text>
			</xsl:if>
			<span class="normal">
				<xsl:for-each select="RUScat_ru:CommunicationDetails">
					<xsl:call-template name="CommunicationDetails"/>
				</xsl:for-each>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="organization_name" match="*">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal">) </span>
			</xsl:if>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
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
				<span class="normal">: </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
				<span class="normal">, </span>
			</xsl:if>
			<span class="italic">ОГРН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span class="italic">БИН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				<br/>
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<span class="italic">ИТН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:CategoryCode"/>
			<span class="normal"> / </span>
			<xsl:value-of select="cat_ru:KATOCode"/>
			<xsl:if test="cat_ru:RNN">
				<span class="normal"> / </span>
				<xsl:value-of select="cat_ru:RNN"/>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal"> / </span>
				<xsl:value-of select="cat_ru:ITNReserv"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span class="italic">УНП</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span class="italic">ИНФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<span class="italic">УНН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<span class="italic">НЗОУ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<span class="italic">№ справки об отсутв. НЗОУ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<span class="italic">ИНН(ПИН)</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<span class="italic">ОКПО</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UITN40Type -->
	<xsl:template match="RUScat_ru:UITN">
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">&#160;(<xsl:value-of select="RUScat_ru:CountryCode"/>)</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:BusinessEntityTypeCode-->
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">Код ОПФ: <xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId"> (по справ. <xsl:value-of select="RUScat_ru:CodeListId"/>)</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:CommunicationDetails-->
	<xsl:template name="CommunicationDetails">
		<span class="italic">Контактные данные</span>
		<span class="normal">: </span>
		<xsl:variable name="temp">
			<xsl:call-template name="RUScat_ru:CommunicationDetails"/>
		</xsl:variable>
		<xsl:value-of select="substring($temp,1,string-length($temp)-2)"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType строка -->
	<xsl:template name="RUScat_ru:CommunicationDetails" match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<span class="italic">Тел</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:Phone">
					<xsl:value-of select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<span class="italic">Факс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Fax"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<span class="italic">Телекс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Telex"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<span class="italic">Email</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:E_mail">
					<xsl:value-of select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='IdentityCardDate'">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="local-name()='DocValidityDate'">
					<xsl:text>(окончание срока действия: </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
					<xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="*" mode="ru_address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
					</xsl:choose>
				</xsl:if>
				<xsl:value-of select="RUScat_ru:AddressText"/>
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
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template mode="CustomsBase" match="*">
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text>(</xsl:text>
		</xsl:if>
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text>) </xsl:text>
			<xsl:value-of select="cat_ru:OfficeName"/>
		</xsl:if>
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
