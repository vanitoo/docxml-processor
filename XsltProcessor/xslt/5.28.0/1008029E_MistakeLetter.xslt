<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catWH_ru="urn:customs.ru:Information:WarehouseDocuments:WarehouseCommonAggregateTypesCust:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:ml="urn:customs.ru:Information:WarehouseDocuments:MistakeLetter:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="ml:MistakeLetter">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Письмо владельца СВХ о самостоятельно выявленных ошибках в отчетности по форме ДО-1</title>
				<style type="text/css">
			body {
					background: #ffffff;
				}

				div.page {
					width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}
				
				div.album_page {
					width: 297mm;
					height: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}

				h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
				}
				
				.remark {
					text-align:right;
					font: 15;
					font-family: Arial, serif;
					text-decoration: underline;
				}
				
				.header {
					font-weight: bold;
					margin-top:20px;
				}
				
				 table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
				}

				td {
					border: 1px solid gray;
					font-family: Courier, serif;
					vertical-align:top;
				}
				
				.low {
					font: 12;
					font-fase: Courier;
				}
				.graph {
							font-family: Arial;
							font-size: 10pt;
							}
				jh {
				font: 16;
				font-face: Arial;
				}
				dog1 {
	            position:relative;
	            left: 50px;
	            bottom: 50px;
	            }
	            .gra {
							font-family: Arial;
							font-size: 6pt;
							}
				.g{
							border-right:0pt solid;
							}
				</style>
			</head>
			<body>
				<div class="page">
					<table>
						<tr>
							<td align="center" class="graph" colspan="100%" style="border:solid 0pt">
								<font face="Times new roman" size="5">
									<b>
										<xsl:if test="ml:LetterDetails/ml:LetterName">
											<xsl:apply-templates select="ml:LetterDetails/ml:LetterName"/> 
					</xsl:if>№<xsl:apply-templates select="ml:LetterDetails/ml:LetterNumber"/>
									</b>
								</font>
							</td>
						</tr>
						<tr>
							<td class="graph" style="border:solid 0pt">Порядковый номер <u>
									<xsl:apply-templates select="ml:LetterDetails/ml:LetterOrderNumber"/>
								</u>
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="graph" style="border:solid 0pt">Сведения об отчете о принятии по форме ДО-1, в отношении которого составлено настоящее Письмо:
						№<xsl:apply-templates select="ml:DO1Report/catWH_ru:ReportNumber"/> от
						<xsl:apply-templates select="ml:DO1Report/catWH_ru:ReportDate" mode="russian_date"/>
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
						</tr>
						<tr>
							<td class="graph" style="border:solid 0pt">
								<b>Данные о владельце склада:</b>
							</td>
						</tr>
						<tr>
							<td class="graph" style="border:solid 0pt">
								<xsl:apply-templates select="ml:WarehouseOwner"/>
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
						</tr>
						<tr>
							<td class="graph" style="border:solid 0pt">
						Документ, на основании которого разрешено временное хранение:
						<xsl:apply-templates select="ml:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateKind"/> 
						№<xsl:apply-templates select="ml:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateNumber"/> 
						<xsl:if test="ml:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateDate">
									<xsl:apply-templates select="ml:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateDate" mode="russian_date"/>
								</xsl:if>
							</td>
						</tr>
						<xsl:if test="ml:WarehouseOwner/catWH_ru:WarehousePerson">
							<tr>
								<td class="graph" style="border:solid 0pt">Представитель СВХ:
						<u>
										<xsl:apply-templates select="ml:WarehouseOwner/catWH_ru:WarehousePerson"/>
									</u>
								</td>
							</tr>
						</xsl:if>
						<tr>
							<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
						</tr>
					</table>
					<table>
						<tr>
							<td align="center" class="graph" style="border:solid 0pt">Сведения о выявленных ошибках</td>
						</tr>
						<tr>
							<td class="graph" style="border:solid 0pt">Дата:
						<xsl:apply-templates select="ml:MistakesInfo/ml:Date" mode="russian_date"/> 
					    <xsl:apply-templates select="ml:MistakesInfo/ml:Time"/>
							</td>
						</tr>
						<tr>
							<td class="graph" style="border:solid 0pt">Описание причин ошибок и обстоятельств их выявления:
					    <xsl:for-each select="ml:MistakesInfo/ml:Reasons">
									<xsl:apply-templates select="."/>
									<xsl:if test="position()!=last()"> </xsl:if>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
						</tr>
						<xsl:if test="ml:MistakesInfo/ml:MistakesDescription/ml:CustomsDocsMistakes">
							<tr>
								<td align="center" class="graph" style="border:solid 0pt">Ошибки в реквизитах таможенных документов</td>
							</tr>
							<xsl:for-each select="ml:MistakesInfo/ml:MistakesDescription/ml:CustomsDocsMistakes">
								<xsl:call-template name="H1"/>
							</xsl:for-each>
							<tr>
								<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
							</tr>
						</xsl:if>
						<xsl:if test="ml:MistakesInfo/ml:MistakesDescription/ml:CommercialDocsMistakes">
							<tr>
								<td align="center" class="graph" style="border:solid 0pt">Ошибки в реквизитах коммерческих документов</td>
							</tr>
							<xsl:for-each select="ml:MistakesInfo/ml:MistakesDescription/ml:CommercialDocsMistakes">
								<xsl:call-template name="H1"/>
							</xsl:for-each>
							<tr>
								<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
							</tr>
						</xsl:if>
						<xsl:if test="ml:MistakesInfo/ml:MistakesDescription/ml:TransportDocsMistakes">
							<tr>
								<td align="center" class="graph" style="border:solid 0pt">Ошибки в реквизитах транспортных документов (в накладных)</td>
							</tr>
							<xsl:for-each select="ml:MistakesInfo/ml:MistakesDescription/ml:TransportDocsMistakes">
								<xsl:call-template name="H1"/>
							</xsl:for-each>
							<tr>
								<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
							</tr>
						</xsl:if>
					</table>
					<table>
						<tr>
							<td class="graph" style="border:solid 0pt">
								<u>
									<xsl:if test="ml:WareHousePerson/cat_ru:PersonPost">
										<xsl:apply-templates select="ml:WareHousePerson/cat_ru:PersonPost"/> </xsl:if>
									<xsl:apply-templates select="ml:WareHousePerson/cat_ru:PersonSurname"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:apply-templates select="ml:WareHousePerson/cat_ru:PersonName"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:apply-templates select="ml:WareHousePerson/cat_ru:PersonMiddleName"/>
								</u>
							</td>
							<td align="center" class="graph" style="border:solid 0pt">
								<u>
									<xsl:apply-templates select="ml:LetterDetails/ml:LetterDate" mode="russian_date"/>
								</u>
							</td>
						</tr>
						<tr>
							<td class="graph" style="border:solid 0pt">(уполномоченный сотрудник от получателя)</td>
							<td align="center" class="graph" style="border:solid 0pt">(дата оформления документа)</td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="ml:WarehouseOwner">
		<!--<xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:apply-templates select="cat_ru:OrganizationLanguage"/><br/>
	</xsl:if>-->
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName">(</xsl:if>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if> 
	
	<xsl:choose>
			<xsl:when test="cat_ru:RFOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			</xsl:when>
			<xsl:when test="cat_ru:RKOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			</xsl:when>
			<xsl:when test="cat_ru:RBOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="catWH_ru:Address">
			<xsl:apply-templates select="catWH_ru:Address"/>
		</xsl:if>
		<!--xsl:if test="RUScat_ru:IdentityCard">
         <xsl:apply-templates select="RUScat_ru:IdentityCard"/>
      </xsl:if>
      <xsl:if test="catWH_ru:IdentityCard">
         <xsl:apply-templates select="catWH_ru:IdentityCard"/>
      </xsl:if-->
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<span>ОГРН: <xsl:apply-templates select="cat_ru:OGRN"/>
			</span> 
	</xsl:if>
		<xsl:if test="cat_ru:INN">
			<span>ИНН: <xsl:apply-templates select="cat_ru:INN"/>
			</span> 
	</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<span>	КПП: <xsl:apply-templates select="cat_ru:KPP"/>
			</span> 
	</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span>УНП: <xsl:apply-templates select="cat_ru:UNP"/>
			</span> 
	</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span>Идентификационный номер: <xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
			</span> 
	</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span>БИН: <xsl:apply-templates select="cat_ru:BIN"/>
			</span> 
	</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<span>ИИН: <xsl:apply-templates select="cat_ru:IIN"/>
			</span> 
	</xsl:if>
		<xsl:for-each select="cat_ru:ITN">
			<span>	
			ИТН: 
			<xsl:apply-templates select="cat_ru:CategoryCode"/>/<xsl:apply-templates select="cat_ru:KATOCode"/>/<xsl:apply-templates select="cat_ru:RNN"/>
				<xsl:if test="cat_ru:ITNReserv">/<xsl:apply-templates select="cat_ru:ITNReserv"/>
				</xsl:if>
			</span> 
	</xsl:for-each>
	</xsl:template>
	<xsl:template match="catWH_ru:Address">
		<span class="header">Адрес:</span> 
	<xsl:if test="cat_ru:PostalCode"> Почтовый индекс: <xsl:apply-templates select="cat_ru:PostalCode"/>
		</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<xsl:apply-templates select="cat_ru:CounryName"/>
		</xsl:if>
		<xsl:if test="cat_ru:CountryCode">(<xsl:apply-templates select="cat_ru:CountryCode"/>)</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
			<xsl:apply-templates select="cat_ru:Region"/>
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
			<xsl:apply-templates select="cat_ru:City"/>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
			<xsl:apply-templates select="cat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="catWH_ru:AddressLine"> Информация об адресе: <xsl:apply-templates select="catWH_ru:AddressLine"/>
		</xsl:if>
	 
</xsl:template>
	<xsl:template match="RUScat_ru:IdentityCard | catWH_ru:IdentityCard">
		<span class="header">Документ, удостоверяющий личность:</span> 
	<xsl:if test="RUScat_ru:IdentityCardName">
			<xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardCode"> (код вида документа <xsl:apply-templates select="RUScat_ru:IdentityCardCode"/>)</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardName or RUScat_ru:IdentityCardCode"> </xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
			<span>
			Серия номер:
			<xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
			</span>
		 
	</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate or RUScat_ru:OrganizationName">
		Выдан
		<xsl:apply-templates select="RUScat_ru:IdentityCardDate" mode="russian_date"/>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
		 
	</xsl:if>
	 
</xsl:template>
	<xsl:template match="catWH_ru:WarehousePerson | ml:WareHousePerson">
		<xsl:apply-templates select="cat_ru:PersonSurname"/>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<xsl:apply-templates select="cat_ru:PersonName"/>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
		<xsl:if test="cat_ru:PersonPost">, должность - <xsl:apply-templates select="cat_ru:PersonPost"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="russian_date_gtd">
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
	<xsl:template match="//*[local-name()='MistakeLetter']//*" priority="-1">
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
	<xsl:template match="*" mode="russian_date_gtd">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_gtd">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="H1">
		<tr>
			<td class="graph" style="border:solid 0pt">
				<table>
					<tr>
						<td class="graph" colspan="3" style="border:solid 0pt">Порядковый номер документа в соответствующем списке документов отчета о принятии по форме ДО-1:
									<xsl:apply-templates select="ml:PrDocumentOrderNumber"/>
						</td>
					</tr>
					<tr>
						<td align="center" class="graph" style="border:solid 1pt #000000">Описание выявленных ошибок</td>
						<td align="center" class="graph" style="border:solid 1pt #000000">Ошибочное значение, указанное в отчете по форме ДО-1</td>
						<td align="center" class="graph" style="border:solid 1pt #000000">Правильное значение</td>
					</tr>
					<xsl:if test="ml:DocModeCodeMistake">
						<tr>
							<td class="graph" style="border:solid 1pt #000000">Ошибка в коде вида документа</td>
							<td align="center" class="graph" style="border:solid 1pt #000000">
								<xsl:if test="ml:DocModeCodeMistake/ml:CodeMistakeValue">
									<xsl:apply-templates select="ml:DocModeCodeMistake/ml:CodeMistakeValue"/>
								</xsl:if>
							</td>
							<td align="center" class="graph" style="border:solid 1pt #000000">
								<xsl:if test="ml:DocModeCodeMistake/ml:CodeValidValue">
									<xsl:apply-templates select="ml:DocModeCodeMistake/ml:CodeValidValue"/>
								</xsl:if>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="ml:DocNameMistake">
						<tr>
							<td class="graph" style="border:solid 1pt #000000">Ошибка в наименовании документа</td>
							<td class="graph" style="border:solid 1pt #000000">
								<xsl:if test="ml:DocNameMistake/ml:NameMistakeValue">
									<xsl:apply-templates select="ml:DocNameMistake/ml:NameMistakeValue"/>
								</xsl:if>
							</td>
							<td class="graph" style="border:solid 1pt #000000">
								<xsl:if test="ml:DocNameMistake/ml:NameValidValue">
									<xsl:apply-templates select="ml:DocNameMistake/ml:NameValidValue"/>
								</xsl:if>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="ml:DocNumberMistake">
						<tr>
							<td class="graph" style="border:solid 1pt #000000">Ошибка в номере документа</td>
							<td align="center" class="graph" style="border:solid 1pt #000000">
								<xsl:if test="ml:DocNumberMistake/ml:NumberMistakeValue">
									<xsl:apply-templates select="ml:DocNumberMistake/ml:NumberMistakeValue"/>
								</xsl:if>
							</td>
							<td align="center" class="graph" style="border:solid 1pt #000000">
								<xsl:apply-templates select="ml:DocNumberMistake/ml:NumberValidValue"/>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="ml:DocDateMistake">
						<tr>
							<td class="graph" style="border:solid 1pt #000000">Ошибка в дате документа</td>
							<td align="center" class="graph" style="border:solid 1pt #000000">
								<xsl:if test="ml:DocDateMistake/ml:DateMistakeValue">
									<xsl:apply-templates select="ml:DocDateMistake/ml:DateMistakeValue" mode="russian_date"/>
								</xsl:if>
							</td>
							<td align="center" class="graph" style="border:solid 1pt #000000">
								<xsl:if test="ml:DocDateMistake/ml:DateValidValue">
									<xsl:apply-templates select="ml:DocDateMistake/ml:DateValidValue" mode="russian_date"/>
								</xsl:if>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="ml:WaybillRegNumberMistake">
						<tr>
							<td class="graph" style="border:solid 1pt #000000">Ошибка в регистрационном номере накладной</td>
							<td class="graph" style="border:solid 1pt #000000">
								<xsl:if test="ml:WaybillRegNumberMistake/ml:MistakeValue">
									<xsl:apply-templates select="ml:WaybillRegNumberMistake/ml:MistakeValue/cat_ru:CustomsCode"/>/<xsl:apply-templates select="ml:WaybillRegNumberMistake/ml:MistakeValue/cat_ru:RegistrationDate" mode="russian_date_gtd"/>/<xsl:apply-templates select="ml:WaybillRegNumberMistake/ml:MistakeValue/cat_ru:GTDNumber"/>
									<br/>Порядковый номер по журналу регистрации: <xsl:apply-templates select="ml:WaybillRegNumberMistake/ml:MistakeValue/catWH_ru:WaybillNumPP"/>
								</xsl:if>
							</td>
							<td class="graph" style="border:solid 1pt #000000">
								<xsl:if test="ml:WaybillRegNumberMistake/ml:ValidValue">
									<xsl:apply-templates select="ml:WaybillRegNumberMistake/ml:ValidValue/cat_ru:CustomsCode"/>/<xsl:apply-templates select="ml:WaybillRegNumberMistake/ml:ValidValue/cat_ru:RegistrationDate" mode="russian_date_gtd"/>/<xsl:apply-templates select="ml:WaybillRegNumberMistake/ml:ValidValue/cat_ru:GTDNumber"/>
									<br/>Порядковый номер по журналу регистрации: <xsl:apply-templates select="ml:WaybillRegNumberMistake/ml:ValidValue/catWH_ru:WaybillNumPP"/>
								</xsl:if>
							</td>
						</tr>
					</xsl:if>
				</table>
			</td>
		</tr>
		<tr>
			<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
