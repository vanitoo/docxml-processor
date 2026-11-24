<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:stz_ppeg="urn:customs.ru:Information:ExchangeDocuments:STZ_PermitProcessingOrRepairGoods:5.28.0" xmlns:catProc_ru="urn:customs.ru:Information:ProcessingDocuments:ProcessingCommonAggregateTypes:5.28.0">
	
	<xsl:variable name="DocKind" select="stz_ppeg:STZ_PermitProcessingOrRepairGoods/stz_ppeg:DocKind"/>
	
	<xsl:template match="stz_ppeg:STZ_PermitProcessingOrRepairGoods">
		<xsl:param name="w" select="277"/>
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
                  .font10{
					  font-size: 9pt;
                  }
                  p{
					  padding: 0;
					  margin: 0;
                  }
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr valign="top">
								<td width="49%">
									<!--Отметка таможенного органа -->
									<table>
										<tbody>
											<tr valign="top">
												<td class="bordered">
													<xsl:text>Регистрационный № </xsl:text>
													<table style="display: inline-block; width: 25mm;">
														<tbody>
															<tr>
																<td align="center">
																	<xsl:apply-templates select="stz_ppeg:PermissionRegNumber/stz_ppeg:CustomsCode"/>
																</td>
															</tr>
															<tr align="center" valign="top">
																<td style="font-size: 8pt; border-top: 1px solid black;">
																	<xsl:text>(код таможенного органа)</xsl:text>
																</td>
															</tr>
														</tbody>
													</table>
													<xsl:text>/</xsl:text>
													<table style="display: inline-block; width: 25mm;">
														<tbody>
															<tr>
																<td align="center">
																	<xsl:apply-templates select="stz_ppeg:PermissionRegNumber/stz_ppeg:RegistrationDate" mode="num_date"/>
																</td>
															</tr>
															<tr align="center" valign="top">
																<td style="font-size: 8pt; border-top: 1px solid black;">
																	<xsl:text>(день, месяц, год)</xsl:text>
																</td>
															</tr>
														</tbody>
													</table>
													<xsl:text>/</xsl:text>
													<table style="display: inline-block; width: 25mm;">
														<tbody>
															<tr>
																<td align="center">
																	<xsl:apply-templates select="stz_ppeg:PermissionRegNumber/stz_ppeg:Number"/>
																</td>
															</tr>
															<tr align="center" valign="top">
																<td style="font-size: 8pt; border-top: 1px solid black;">
																	<xsl:text>(порядковый номер)</xsl:text>
																</td>
															</tr>
														</tbody>
													</table>
													<xsl:text>/ВВКМ</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td width="2%"></td>
								<td width="49%">
									<table>
										<tbody>
											<tr>
												<td>
													<!--xsl:text>От </xsl:text-->
													<xsl:apply-templates select="stz_ppeg:AppInfo/stz_ppeg:Resident"/>
												</td>
											</tr>
											<tr>
												<td align="justify" valign="top" style="font-size: 8pt; border-top: 1px solid black;">
													(наименование юридического лица или фамилия, имя, отчество (при наличии) индивидуального предпринимателя 
													с указанием идентификационного номера налогоплательщика
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:choose>
						<xsl:when test="$DocKind = 1">
							<br/>
							<br/>
							<table>
								<tbody>
									<tr>
										<td align="center" class="title">
											<font size="4">
												Разрешение<br/>
												таможенного органа на вывоз товаров,<br/>
												помещенных под таможенную процедуру свободной таможенной зоны,<br/>
												и (или) товаров, изготовленных (полученных) из товаров,<br/>
												помещенных под таможенную процедуру свободной таможенной зоны,<br/>
												без завершения таможенной процедуры свободной таможенной зоны в случаях,<br/>
												установленных подпунктами 1, 2 и 5 пункта 4 статьи 205 Таможенного кодекса<br/>
												Евразийского экономического союза
											</font>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<p style="text-indent: 5mm;">
								Настоящее разрешение свидетельствует о возможности вывоза товаров по заявлению № 
								<xsl:apply-templates select="stz_ppeg:AppRegNum"/> 
								для целей
								<table style="table-layout: fixed; width:100%; text-indent: 0mm;">
									<tbody>
										<tr>
											<td>
												<xsl:apply-templates select="stz_ppeg:AppInfo/stz_ppeg:RepairAndTestingOperations"/>
												<xsl:if test="stz_ppeg:AppInfo/stz_ppeg:RepairOrTesting">
													<br/>
													<xsl:apply-templates select="stz_ppeg:AppInfo/stz_ppeg:RepairOrTesting"/>
												</xsl:if>
												<xsl:for-each select="stz_ppeg:AppInfo/stz_ppeg:ProcessingOperations">
													<br/>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
												<xsl:if test="stz_ppeg:AppInfo/stz_ppeg:RepairAndTestingPerson">
													<br/>
													<xsl:text>лицо:</xsl:text>
													<xsl:for-each select="stz_ppeg:AppInfo/stz_ppeg:RepairAndTestingPerson">
														<br/>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
												</xsl:if>
												<xsl:if test="stz_ppeg:AppInfo/stz_ppeg:RepairAndTestingPlace">
													<br/>
													<xsl:text>место: </xsl:text>
													<xsl:apply-templates select="stz_ppeg:AppInfo/stz_ppeg:RepairAndTestingPlace"/>
												</xsl:if>
											</td>
										</tr>
										<tr align="center" valign="top">
											<td style="font-size:8pt; border-top: 1px solid black;">
												(указывается операция, для проведения которой товары вывозятся, лицо, которое будет осуществлять такие операции, и место их проведения)
											</td>
										</tr>
									</tbody>
								</table>
								<br/>
								Срок обратного ввоза товаров на территорию особой экономической зоны с учетом целей и обстоятельств вывоза товаров, в том числе с учетом способа транспортировки товаров:
								<xsl:apply-templates select="stz_ppeg:AppInfo/stz_ppeg:EntryGoodsTerm" mode="russian_date"/>
							</p>
						</xsl:when>
						<xsl:when test="$DocKind = 2">
							<br/>
							<br/>
							<table>
								<tbody>
									<tr>
										<td align="center" class="title">
											<font size="4">
												Разрешение<br/>
												таможенного органа об отказе в выдаче разрешения на вывоз товаров
											</font>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<p style="text-indent: 5mm;">
								Настоящим уведомляем  об отказе в выдаче разрешения на вывоз товаров по заявлению № 
								<xsl:apply-templates select="stz_ppeg:AppRegNum"/> 
								для целей
								<table style="table-layout: fixed; width:100%; text-indent: 0mm;">
									<tbody>
										<tr>
											<td>
												<xsl:apply-templates select="stz_ppeg:AppInfo/stz_ppeg:RepairAndTestingOperations"/>
												<xsl:if test="stz_ppeg:AppInfo/stz_ppeg:RepairOrTesting">
													<br/>
													<xsl:apply-templates select="stz_ppeg:AppInfo/stz_ppeg:RepairOrTesting"/>
												</xsl:if>
												<xsl:for-each select="stz_ppeg:AppInfo/stz_ppeg:ProcessingOperations">
													<br/>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</td>
										</tr>
										<tr align="center" valign="top">
											<td style="font-size:8pt; border-top: 1px solid black;">
												(указывается операция, для проведения которой товары предполагались к вывозу)
											</td>
										</tr>
									</tbody>
								</table>
								<br/>
								следующим основаниям:
								<xsl:apply-templates select="stz_ppeg:CustomsMark"/>
							</p>
						</xsl:when>
					</xsl:choose>
					<br/>
					<br/>
					<table style="table-layout: fixed; width: 200mm;">
						<tbody>
							<tr valign="bottom">
								<td width="30%">
									<xsl:apply-templates select="stz_ppeg:CustomsSignature/cat_ru:PersonPost"/>
								</td>
								<td width="5%"></td>
								<td width="25%"></td>
								<td width="5%"></td>
								<td width="35%">
									<xsl:for-each select="stz_ppeg:CustomsSignature/*[contains(local-name(), 'ame')]">
										<xsl:if test="position() != 1">
											<xsl:text> </xsl:text>
										</xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
								</td>
							</tr>
							<tr align="center" valign="top">
								<td style="font-size: 8pt; border-top: 1px solid black;">
									(начальник таможенного органа / лицо, его замещающее)
								</td>
								<td></td>
								<td style="font-size: 8pt; border-top: 1px solid black;">
									(подпись)
								</td>
								<td></td>
								<td style="font-size: 8pt; border-top: 1px solid black;">
									(фамилия, имя, отчество (при наличии)
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="stz_ppeg:ProcessingOperations">
		<xsl:apply-templates select="stz_ppeg:Operation"/>
	</xsl:template>
	
	<xsl:template match="stz_ppeg:AppRegNum">
		<xsl:apply-templates select="." mode="reg_num"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="stz_ppeg:AddNumber"/>
	</xsl:template>
	
	
	<xsl:template match="stz_ppeg:Resident|stz_ppeg:RepairAndTestingPerson">
		<xsl:choose>
			<xsl:when test="*[local-name() = 'PersonId' or local-name() = 'IdentityCard']">
				<!-- считаем, что это ФЛ -->
				<xsl:apply-templates select="cat_ru:OrganizationName"/>
				<xsl:if test="not(cat_ru:OrganizationName)">
					<xsl:apply-templates select="cat_ru:ShortName"/>
				</xsl:if>
				<xsl:if test="RUScat_ru:SubjectAddressDetails">
					<xsl:text>, адрес(а): </xsl:text>
					<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails" mode="address"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
					<xsl:text>, ИНН </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
					<xsl:text>, ОГРНИП </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
				</xsl:if>
				<xsl:if test="RUScat_ru:IdentityCard">
					<xsl:text>, </xsl:text>
					<xsl:apply-templates select="RUScat_ru:IdentityCard" mode="identityCard"/>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<!-- ЮЛ -->
				<xsl:apply-templates select="cat_ru:OrganizationName"/>
				<xsl:if test="not(cat_ru:OrganizationName)">
					<xsl:apply-templates select="cat_ru:ShortName"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
					<xsl:text>, ОГРН </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
					<xsl:text>, ИНН </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP and $DocKind = 1">
					<xsl:text>, КПП </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
				</xsl:if>
				<xsl:if test="RUScat_ru:SubjectAddressDetails">
					<xsl:text>, адрес(а): </xsl:text>
					<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails" mode="address"/>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="stz_ppeg:ResidentCertificate|stz_ppeg:ResidentCertificate">
			<xsl:text>; </xsl:text>
			<xsl:apply-templates select="stz_ppeg:ResidentCertificate"/>
			<xsl:apply-templates select="stz_ppeg:ConfirmTransferDoc" mode="doc"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="stz_ppeg:ResidentCertificate">
		<xsl:text>, свидетельство: </xsl:text>
		<xsl:text> № </xsl:text>
		<xsl:apply-templates select="stz_ppeg:CertificateNumber"/>
		<xsl:text> от </xsl:text>
		<xsl:apply-templates select="stz_ppeg:CertificateDate" mode="russian_date"/>
	</xsl:template>
	<xsl:template match="*" mode="identityCard">
		<xsl:apply-templates select="*[local-name() = 'IdentityCardName']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'IdentityCardSeries']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'IdentityCardNumber']"/>
		<xsl:if test="*[local-name() = 'IdentityCardDate']">
			<xsl:text> выдан </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'IdentityCardDate']" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="address">
		<xsl:if test="position() != 1">; </xsl:if>
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
	
	
	<xsl:template match="*" mode="reg_num">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'GTDNumber' or local-name() = 'Number']"/>
	</xsl:template>
	<xsl:template match="*" mode="quantity">
		<xsl:apply-templates select="*[local-name() = 'GoodsQuantity']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierName']"/>
		<xsl:if test="*[local-name() = 'MeasureUnitQualifierCode']">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierCode']"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="doc">
		<xsl:if test="*[local-name() = 'PrDocumentNumber']">
			<xsl:text>№ </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentNumber']"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'PrDocumentDate']">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentDate']" mode="russian_date"/>
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
	<xsl:template name="num_date">
		<xsl:param name="dateIn"/>
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
	
	<xsl:template match="//*[local-name()='STZ_PermitProcessingOrRepairGoods']//*" priority="-1">
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
