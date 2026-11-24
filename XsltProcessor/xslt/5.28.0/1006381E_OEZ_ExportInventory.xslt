<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:invdoc="urn:customs.ru:Information:CustomsDocuments:OEZ_ExportInventory:5.25.0">
	
	<xsl:param name="OEZ_NotifReg"/>
	<!-- Шаблон для типа OEZ_ExportInventoryType -->
	<xsl:template match="invdoc:OEZ_ExportInventory">
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
                  padding: 10mm 10mm 10mm 10mm;
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
                  .graphLittle 
					{
					font-family: Arial;
					font-size: 7pt;
					text-align: center;
					}
                  td.value.graphMain
                  {
                  vertical-align:bottom;
                  }
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table class="graphMain" width="100%">
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>
											<xsl:text>Опись документов</xsl:text>
										</b>
									</font>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table class="graphMain" width="100%">
										<tbody>
											<tr>
												<td align="left" valign="bottom" width="45%" rowspan="5" class="graphMain">
													Отметки таможенного органа
													<br/>
													<span style="display: inline-block; width: 120mm; height: 15mm; border: 1px solid black;">
														Регистрационный № 
														<xsl:choose>
															<xsl:when test="$OEZ_NotifReg">
																<xsl:apply-templates select="$OEZ_NotifReg/*[local-name() = 'RegistrationNumber']" mode="reg_num"/>
															</xsl:when>
															<xsl:otherwise>________/________/________/ПС</xsl:otherwise>
														</xsl:choose>
													</span>
												</td>
												<td align="right" valign="bottom" width="1%">В </td>
												<td align="center" width="54%" class="value">
													<xsl:apply-templates select="invdoc:Customs" mode="CustomsOffice"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td valign="top" class="graphLittle">
													<xsl:text>(наименование таможенного органа с указанием кода таможенного органа</xsl:text><sup>*</sup><xsl:text>)</xsl:text>
												</td>
											</tr>
											<tr>
												<td align="right" valign="bottom">от </td>
												<td align="center" class="value">
													<xsl:apply-templates select="invdoc:Applicant/cat_ru:OrganizationName"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td class="graphLittle">
													<xsl:text>(полное наименование юридического лица или фамилия, имя, отчество (при наличии) физического лица</xsl:text>
												</td>
											</tr>
											<tr>
												<td/>
												<td align="left">
													<br/>
													<xsl:text>на </xsl:text>
													<span style="display: inline-block; width: 15mm; text-align: center;" class="value">
														<xsl:apply-templates select="invdoc:NumberSheets"/>
													</span>
													<xsl:text> л.</xsl:text>
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
							<tr align="center" valign="top">
								<td class="bordered" rowspan="2">№ п/п</td>
								<td class="bordered" rowspan="2">Наименование документа</td>
								<td class="bordered" rowspan="2">Реквизиты (номер, дата) документа</td>
								<td class="bordered" rowspan="2">Информация о предъявлении документа ранее в уполномоченный таможенный орган</td>
								<td class="bordered" colspan="2">Информация о документах, размещенных в электронном архиве документов декларанта (ЭАДД)</td>
								<td class="bordered" rowspan="2">Количество листов</td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered">идентификационный номер документа</td>
								<td class="bordered">номер идентификатора электронного архива декларанта</td>
							</tr>
							<tr align="center">
								<td class="bordered">1</td>
								<td class="bordered">2</td>
								<td class="bordered">3</td>
								<td class="bordered">4</td>
								<td class="bordered">5</td>
								<td class="bordered">6</td>
								<td class="bordered">7</td>
							</tr>
							<tr align="center">
								<td class="bordered" colspan="7">
									<xsl:text>Документы, подтверждающие статус вывозимых товаров как товаров Евразийского экономического созюза</xsl:text>
								</td>
							</tr>
							<xsl:apply-templates select="invdoc:ConfirmStatusDoc" mode="tableRow"/>
							<tr align="center">
								<td class="bordered" colspan="7">
									<xsl:text>Коммерческие, транспортные (перевозочные) документы</xsl:text>
								</td>
							</tr>
							<xsl:apply-templates select="invdoc:CommercialDoc" mode="tableRow"/>
							<tr align="center">
								<td class="bordered" colspan="7">
									<xsl:text>Коммерческие, транспортные (перевозочные) документы</xsl:text>
								</td>
							</tr>
							<xsl:apply-templates select="invdoc:CommercialDoc" mode="tableRow"/>
							<tr align="center">
								<td class="bordered" colspan="7">
									<xsl:text>Почтовые документы</xsl:text>
								</td>
							</tr>
							<xsl:apply-templates select="invdoc:PostalDoc" mode="tableRow"/>
							<tr align="center">
								<td class="bordered" colspan="7">
									<xsl:text>Документы, подтверждающие полномочия лица на совершение таможенных операций по подтверждению статуса товаров как товаров Евразийского экономического союза, представление документов и товаров в таможенный орган</xsl:text>
								</td>
							</tr>
							<xsl:apply-templates select="invdoc:ConfirmAuthorityDoc" mode="tableRow"/>
						</tbody>
					</table>
					<br/>
					<br/>
					<table class="graphMain" width="100%">
						<tbody>
							<tr>
								<td width="50%">
									<xsl:apply-templates select="invdoc:PersonSignature"/>
								</td>
								<td width="5%"></td>
								<td width="20%"></td>
								<td width="5%"></td>
								<td width="20%"></td>
							</tr>
							<tr valign="bottom">
								<td class="graphLittle" style="border-top: 1px solid black;" align="left">
									(должносить, инициалы и фамилия лица, подающего опись документов)
								</td>
								<td></td>
								<td class="graphLittle" style="border-top: 1px solid black;">
									(печать организации при наличии)
								</td>
								<td></td>
								<td class="graphLittle" style="border-top: 1px solid black;">
									(подпись)
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<xsl:if test="invdoc:GoodsList">
					<div class="page" style="width: {$w}mm;">
						<div style="width: 100%; text-align: center"><b>Опись товаров</b></div>
						<br/>
						<xsl:apply-templates select="invdoc:GoodsList">
							<xsl:sort select="invdoc:GoodsNumber" order="ascending" data-type="number"/>
						</xsl:apply-templates>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="invdoc:PersonSignature">
		<xsl:if test="*[local-name() = 'PersonPost']">
			<xsl:apply-templates select="*[local-name() = 'PersonPost']"/>
			<br/>
			<br/>
		</xsl:if>
		<xsl:value-of select="substring(*[local-name() = 'PersonName'], 1, 1)"/>
		<xsl:text>.</xsl:text>
		<xsl:if test="*[local-name() = 'PersonMiddleName']">
			<xsl:value-of select="substring(*[local-name() = 'PersonMiddleName'], 1, 1)"/>
			<xsl:text>.</xsl:text>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'PersonSurname']"/>
	</xsl:template>
	
	<xsl:template match="invdoc:GoodsList">
		<xsl:if test="position() != 1"><br/><br/></xsl:if>
		<b>
			<xsl:apply-templates select="invdoc:GoodsNumber"/>
		</b>
		<xsl:text>. </xsl:text>
		
		<xsl:apply-templates select="invdoc:GoodsDescription"/>

		<xsl:if test="invdoc:GoodsTNVEDCode">
			<xsl:text>. Код ТН ВЭД: </xsl:text>
			<xsl:apply-templates select="invdoc:GoodsTNVEDCode"/>
		</xsl:if>

		<xsl:if test="invdoc:GoodsIdentification">
			<xsl:text>. Признаки: </xsl:text>
			<xsl:apply-templates select="invdoc:GoodsIdentification"/>
		</xsl:if>

		<xsl:text>. Вес нетто (кг): </xsl:text>
		<xsl:apply-templates select="invdoc:WeighQuantity"/>

		<xsl:if test="invdoc:SupplementaryQuantity">
			<xsl:text>. Количество в ДЕИ: </xsl:text>
			<xsl:apply-templates select="invdoc:SupplementaryQuantity" mode="quantity"/>
		</xsl:if>

		<xsl:text>. Вид упаковки: </xsl:text>
		<xsl:apply-templates select="invdoc:PackagingKind"/>
		
		<xsl:text>. Стоимость: </xsl:text>
		<xsl:apply-templates select="invdoc:GoodsCost"/>
		
		<xsl:text>. Сведения о ДТ: </xsl:text>
		<xsl:apply-templates select="invdoc:DTInfo"/>
		
		<xsl:text>. Отправитель: </xsl:text>
		<xsl:apply-templates select="invdoc:Consignor" mode="organization_base"/>
		
		<xsl:text>. Получатель: </xsl:text>
		<xsl:apply-templates select="invdoc:Consignee" mode="organization_base"/>
		
		<xsl:text>. Наименование пункта погрузки товаров: </xsl:text>
		<xsl:apply-templates select="invdoc:LoadingPointName"/>
		
		<xsl:text>. Наименование пункта выгрузки товаров: </xsl:text>
		<xsl:apply-templates select="invdoc:UnloadingPointName"/>
	</xsl:template>
	
	<xsl:template mode="organization_base" match="*">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
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
			<span class="italic">N справки об отсутв. НЗОУ</span>
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
	
	
	<xsl:template match="invdoc:DTInfo">
		<xsl:if test="position() != 1">, </xsl:if>
		<xsl:apply-templates select="invdoc:GTDID" mode="reg_num"/>
		<xsl:text> (номер товара: </xsl:text>
		<xsl:apply-templates select="invdoc:GoodsNumeric"/>
		<xsl:text>)</xsl:text>
	</xsl:template>
	
	<xsl:template match="invdoc:GoodsCost">
		<xsl:for-each select="*">
			<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="*" mode="quantity">
		<xsl:apply-templates select="*[local-name() = 'GoodsQuantity']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierName']"/>
		<xsl:text> (</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierCode']"/>
		<xsl:text>)</xsl:text>
	</xsl:template>
	
	<xsl:template match="*" mode="tableRow">
		<tr valign="top" align="left">
			<td class="bordered">
				<xsl:apply-templates select="invdoc:DocOrder"/>
			</td>
			<td class="bordered">
				<xsl:choose>
					<xsl:when test="*[local-name() = 'GTDID']">ДТ/ТД</xsl:when>
					<xsl:when test="*[local-name() = 'AppIdentif']">Заявление об идентийикации</xsl:when>
				</xsl:choose>
				<xsl:apply-templates select="invdoc:OtherDoc/cat_ru:PrDocumentName"/>
				<xsl:apply-templates select="cat_ru:PrDocumentName"/>
			</td>
			<td class="bordered">
				<xsl:apply-templates select="*[local-name() = 'GTDID']" mode="reg_num"/>
				<xsl:apply-templates select="*[local-name() = 'AppIdentif']" mode="reg_num"/>
				<xsl:apply-templates select="invdoc:OtherDoc/cat_ru:PrDocumentNumber"/>
				<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
				<br/>
				<xsl:apply-templates select="*[local-name() = 'GTDID']/*[local-name() = 'RegistrationDate']|*[local-name() = 'AppIdentif']/*[local-name() = 'RegistrationDate']|invdoc:OtherDoc/cat_ru:PrDocumentDate|cat_ru:PrDocumentDate" mode="russian_date"/>
			</td>
			<td class="bordered">
				<xsl:apply-templates select="invdoc:DocSubmissionSign"/>
				<br/>
				<xsl:apply-templates select="invdoc:CustomsDocumentCode"/>
			</td>
			<td class="bordered">
				<xsl:apply-templates select="invdoc:ElectronicDocumentID"/>
			</td>
			<td class="bordered">
				<xsl:apply-templates select="invdoc:ElectronicArchID"/>
			</td>
			<td class="bordered">
				<xsl:apply-templates select="invdoc:DocNumSheets"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="*" mode="reg_num">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'GTDNumber' or local-name() = 'Number']"/>
		<xsl:if test="*[local-name() = 'DocKind']">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="*[local-name() = 'DocKind']"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="invdoc:DocSubmissionSign">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:variable name="firstLetter" select="translate(substring(., 1, 1), 'ft', 'FT')"/>
			<xsl:choose>
				<xsl:when test=". = 1 or $firstLetter = 'T'">предоставлялся ранее</xsl:when>
				<xsl:when test=". = 0 or $firstLetter = 'F'">не предоставлялся ранее</xsl:when>
			</xsl:choose>
		</element>
	</xsl:template>
	
	<xsl:template match="*" mode="CustomsOffice">
		<xsl:value-of select="cat_ru:OfficeName"/>
		<xsl:if test="cat_ru:Code">
			<xsl:if test="cat_ru:OfficeName">
				<xsl:text> (</xsl:text>
				<xsl:value-of select="cat_ru:Code"/>
				<xsl:text>)</xsl:text>
			</xsl:if>
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
	<xsl:template match="//*[local-name()='OEZ_ExportInventory']//*" priority="-1">
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
