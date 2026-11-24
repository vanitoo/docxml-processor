<?xml version="1.0" encoding="utf-8"?>
<!-- Проект приказа Минфина РФ взамен Приказа ФТС России от 18.03.2019 № 445 "Об утверждении формы заявления на совершение операций с товарами, помещенными под таможенную процедуру таможенного склада, и формы решения таможенного органа по результатам рассмотрения указанного заявления" Приложение №1 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.28.0" xmlns:agocw="urn:customs.ru:Information:WarehouseDocuments:AppGoodsOperationCW:5.28.0">
	<xsl:param name="signatures"/>
	  <!-- формат данных в signatures
		<root>
		  <cert id="4D2B4C8000010003BFAC" owner="Семенов Виталий Александрович" from="2022-12-06T15:59:18" to="2023-12-05T16:09:18" />
		  <cert ... />
		</root>
		-->
	<xsl:include href="ElSign.xslt"/>

	<!-- Шаблон для типа AppGoodsOperationCWType -->
	<xsl:template match="agocw:AppGoodsOperationCW">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				 <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<style>
			body {
			background: #cccccc;
			}

			div.page {
			width: 180mm;
			max-width: 190mm;
			margin: 10px auto;
			margin-top: 6pt;
			margin-bottom: 6pt;
			padding: 10mm;
			padding-left: 20mm;
			background: #ffffff;
			border: solid 1pt #000000;
			page-break-after: always;
			}

			.marg-top
			{
			margin-top:5mm;
			}

			table
			{
			table-layout: fixed;
			width: 100%;
			border: 0;
			empty-cells: show;
			border-collapse: collapse;
			margin-top: 1px;
			}

			.inlinetable
			{border: 0;
			empty-cells: show;
			border-collapse: collapse;
			margin-top: 1px;
			display: -moz-inline-stack;/*Firefox 2*/
			display: inline-table; /*Хорошие браузеры*/
			_overflow: hidden;/*IE6, IE7*/
			*zoom: 1;/*включаем hasLayout для IE6, IE7*/
			*display: inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
			text-indent: 0;
			vertical-align: top;
			align: center;
			text-align: center;}

			table.border tr td
			{
			border: 1px solid windowtext;
			}

			.graph {
			font-family: Arial;
			font-size: 10pt;
			}

			.value
			{
			border-bottom: solid 1px black;
			}

			div.title, tr.title td { font-weight:bold;  }
			.bordered { border-collapse: collapse; }
			td.bordered
			{
				border: solid 1px windowtext;
			}

			.border_bottom
			{
			border-bottom: 1px solid black;
			}

			.graphMain
			{
			font-family: Arial;
			font-size: 11pt;
			}

			.graphLittle 
			{
			font-family: Arial;
			font-size: 7pt;
			}
	
			.graphDelim 
			{
			font-family: Arial;
			font-size: 4pt;
			}

			td.graphMain
			{
			vertical-align:top;
			}
			td.value.graphMain
			{
			vertical-align:top;
			}

			.graphMaintable
			{font-family: Arial;
			font-size: 10pt;}
			td.graphMaintable
			{vertical-align:top;}

			.graphHeader
			{
			font-family: Arial;
			font-size: 12pt;
			font-weight:bold;
			}

			td.graphHeader
			{
			vertical-align:top;
			}
			td.value.graphHeader
			{
			vertical-align:bottom;
			}

			.normal
			{
			font-size: 11pt;
			font-family:Arial;
			}			

			.bold
			{
			font-weight: bold;
			font-family:Arial;
			font-size: 9pt;
			}			

			.italic
			{
			font-style: italic;
			font-family:Arial;
			font-size: 11pt;
			}		
			
			.delim {
				height: 7pt;
			}

			.delim_3 {
				height: 3pt;
			}

			.descr
			{font-size: 7pt;
			text-align: center;
			vertical-align: top;}
				</style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table width="100%">
						<tbody width="100%" class="graphMain">
							<br/>
							<br/>
							<tr>
								<!--td valign="bottom" align="right" class="normal">Начальнику</td-->
								<td align="center" class="value">
									<xsl:apply-templates select="agocw:CustomsName"/>
								</td>
							</tr>
							<tr align="center">
								<!--td class="graphLittle">&#160;</td-->
								<td class="graphLittle">(наименование таможенного поста, в регионе деятельности которого функционирует таможенный склад<br>или расположено место хранения, не являющееся таможенным складом, предусмотренное пунктом 4 статьи 155</br><br>Таможенного кодекса Евразийского экономического союза <sup>1</sup>)</br></td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody width="100%" class="graphMain">
							<br/>
							<br/>
							<tr>
								<td class="graphHeader" align="center">ЗАЯВЛЕНИЕ<br>на совершение операций с товарами, помещенными<br/>под таможенную процедуру таможенного склада</br>
								</td>
							</tr>
							<tr align="left">
								<td class="value" style="text-align: center;">
									<br/>
									<xsl:apply-templates select="agocw:Applicant"/>
								</td>
							</tr>
							<tr>
								<td class="graphLittle" align="center">(сведения о декларанте: полное наименование организации, содержащее указание на ее организационно-правовую форму,<br/>или фамилия, имя, отчество (при наличии), идентификационный номер налогоплательщика (при наличии))</td>
							</tr>
							<tr>
								<td class="delim">
									<br/>
								</td>
							</tr>
							<tr>
								<td class="normal" align="left" style="text-align: justify;">в соответствии со статьей 121 Федерального закона от 3 августа 2018 г. № 289-ФЗ<sup>2</sup> просит разрешить совершение операций в период с 
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:apply-templates select="agocw:OperationPeriod/agocw:BeginPeriodDate" mode="russian_date"/>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="description">(дата, месяц, год)</xsl:with-param>
									<xsl:with-param name="width" select="'30mm'"/>
								</xsl:call-template>
								&#160;по 
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:apply-templates select="agocw:OperationPeriod/agocw:EndPeriodDate" mode="russian_date"/>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="description">(дата, месяц, год)</xsl:with-param>
									<xsl:with-param name="width" select="'30mm'"/>
								</xsl:call-template>
								&#160;с товарами, помещенными под таможенную процедуру таможенного склада в соответствии с декларацией на товары № 
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:apply-templates select="agocw:GTDNumber" mode="gtd_num"/>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="width" select="'62mm'"/>
								</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="delim">
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody width="100%" align="center" class="graphMaintable">
							<tr valign="top">
								<td class="bordered" width="5%">№ п/п</td>
								<td class="bordered" width="15%">Порядковый номер товара в декларации на товары</td>
								<td class="bordered" width="25%">Количество товара, в отношении которого предполагается совершение операций, в основной или дополнительной единицах измерения</td>
								<td class="bordered" width="25%">Операции, предусмотренные пунктом 2 статьи 158 ТК ЕАЭС, которые предполагается совершать с товарами</td>
								<td class="bordered" width="30%">Номер свидетельства о включении в реестр владельцев таможенных складов либо номер и дата разрешения на хранение товаров в местах, не являющихся таможенными складами <sup>3</sup></td>
							</tr>
							<tr valign="top" align="center">
								<td class="bordered">1</td>
								<td class="bordered">2</td>
								<td class="bordered">3</td>
								<td class="bordered">4</td>
								<td class="bordered">5</td>
							</tr>
							<xsl:for-each select="agocw:CWGood">
								<tr align="center" valign="top">
									<td class="bordered">
										<xsl:apply-templates select="agocw:Number"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="agocw:DTNumber"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="agocw:Quantity" mode="quantity"/>
										<xsl:if test="count(agocw:Quantity) = 1"> / -</xsl:if>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="agocw:Operation"/>
										<xsl:if test="agocw:OtherOperation">
											<xsl:if test="agocw:Operation!=11">;<br/></xsl:if>
											<xsl:value-of select="agocw:OtherOperation"/>
										</xsl:if>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="agocw:CertificateNum" mode="Cert"/>
										<xsl:apply-templates select="agocw:PermissionNum"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<table width="100%" class="graphMain">
						<br/>
						<tbody>
							<xsl:for-each select="agocw:AttachedDocument">
								<tr width="35%">
									<td class="normal" valign="bottom">
										<xsl:if test="position()=1">Перечень прилагаемых документов:</xsl:if>
									</td>
									<td class="value" valign="bottom" width="65%">
										<xsl:value-of select="position()"/>) <xsl:apply-templates select="."/>
									</td>
								</tr>
								<tr valign="top" align="center" class="graphLittle">
									<td/>
									<xsl:if test="position()=1">
										<td>(документы, прилагаемые к настоящему заявлению)</td>
									</xsl:if>
								</tr>
								<tr>
									<td class="delim">
										<br/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<table width="100%" class="graphMain">
						<tbody>
							<br/>
							<br/>
							<tr>
								<td>
									<table>
										<tr valign="bottom">
											<td width="60%" class="value" align="center">
												<!--
												<xsl:for-each select="agocw:ApplicantSignature">
													<xsl:if test="$signatures">
														<xsl:variable name="FIO">
															<xsl:for-each select="*[local-name() = 'PersonSurname' or local-name() = 'PersonName' or local-name() = 'PersonMiddleName']">
																<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
																<xsl:value-of select="."/>
															</xsl:for-each>
														</xsl:variable>
														<xsl:apply-templates select="$signatures/cert[contains(@owner, $FIO)]" mode="Signature">
															<xsl:with-param name="firstCol" select="0"/>
															<xsl:with-param name="width" select="400"/>
														</xsl:apply-templates>
													</xsl:if>
												</xsl:for-each>
												-->
												<xsl:if test="$signatures">
													<xsl:apply-templates select="$signatures/cert[1]" mode="Signature">
														<xsl:with-param name="firstCol" select="0"/>
														<xsl:with-param name="width" select="400"/>
													</xsl:apply-templates>
												</xsl:if>
											</td>
											<td/>
											<td width="30%" align="center" valign="bottom" class="value">
												<xsl:apply-templates select="agocw:ApplicantSignature"/>
											</td>
										</tr>
										<tr align="center">
											<td valign="top" class="graphLittle">(подпись декларанта или уполномоченного им лица)</td>
											<td/>
											<td valign="top" class="graphLittle">(фамилия, имя, отчество (при наличии))</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td><br/></td>
							</tr>
							<tr>
								<td><br/></td>
							</tr>
							<tr class="normal">
								<td>
									<br/>
									Дата подачи настоящего заявления <xsl:apply-templates select="agocw:ApplicationDate" mode="russian_date_month"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody width="100%" class="graphLittle">
							<br/>
							<br/>
							<tr>
								<td>_____________________________________</td>
							</tr>
							<tr>
								<td style="text-align: justify;">
									<sup>1</sup> Является обязательным для Российской Федерации в соответствии с Договором о Таможенном кодексе Евразийского экономического союза от 11 апреля 2017 г., ратифицированным Федеральным законом от 14 ноября 2017 г. № 317-ФЗ «О ратификации Договора о Таможенном кодексе Евразийского экономического союза». Вступил в силу для Российской Федерации 1 января 2018 г. (далее – ТК ЕАЭС).</td>
							</tr>
							<tr>
								<td style="text-align: justify;">
									<sup>2</sup> «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации».</td>
							</tr>
							<tr>
								<td style="text-align: justify;">
									<sup>3</sup> Часть 2 статьи 120 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации».</td>
							</tr>
							<!--tr>
								<td>
									<sup>4</sup> Указывается количество товара в основной и дополнительной единицах измерения, в отношении которого предполагается совершать операции.</td>
							</tr>
							<tr>
								<td style="text-align: justify;">
									<sup>5</sup> Указывается десятизначный код товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза.</td>
							</tr>
							<tr>
								<td style="text-align: justify;">
									<sup>6</sup> Указываются операции, совершаемые с товарами, помещенными под таможенную процедуру таможенного склада, предусмотренные пунктом 2 статьи 158 Таможенного кодекса Евразийского экономического союза.</td>
							</tr>
							<tr>
								<td>
									<sup>7</sup> При наличии печати.</td>
							</tr-->
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="supIndexDescr"/>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="descr">
						<xsl:value-of select="$description"/><sup><xsl:value-of select="$supIndexDescr"/></sup>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template match="agocw:ApplicantSignature">
		<xsl:apply-templates select="*[local-name() = 'PersonName']" mode="initials"/>
		<xsl:apply-templates select="*[local-name() = 'PersonMiddleName']" mode="initials"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'PersonSurname']"/>
	</xsl:template>
	
	<xsl:template match="agocw:AttachedDocument | agocw:PermissionNum">
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

	<xsl:template match="agocw:Operation">
		<xsl:if test="position()!=1 and .!=11">;<br/></xsl:if>
		<xsl:for-each select=".">
			<xsl:choose>
				<xsl:when test=". = 1">
					<xsl:text>простые сборочные операции</xsl:text>
				</xsl:when>
				<xsl:when test=". = 2">
					<xsl:text>отбор проб и (или) образцов товаров</xsl:text>
				</xsl:when>
				<xsl:when test=". = 3">
					<xsl:text>техническое обслуживание</xsl:text>
				</xsl:when>
				<xsl:when test=". = 4">
					<xsl:text>дробление партии</xsl:text>
				</xsl:when>
				<xsl:when test=". = 5">
					<xsl:text>формирование отправок</xsl:text>
				</xsl:when>
				<xsl:when test=". = 6">
					<xsl:text>сортировка</xsl:text>
				</xsl:when>
				<xsl:when test=". = 7">
					<xsl:text>упаковка</xsl:text>
				</xsl:when>
				<xsl:when test=". = 8">
					<xsl:text>переупаковка</xsl:text>
				</xsl:when>
				<xsl:when test=". = 9">
					<xsl:text>маркировка</xsl:text>
				</xsl:when>
				<xsl:when test=". = 10">
					<xsl:text>улучшение товарного вида</xsl:text>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="*" mode="quantity">
		<xsl:if test="position()!=1"> / </xsl:if>
		<xsl:apply-templates select="*[local-name() = 'GoodsQuantity']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierName']"/>
		<!--xsl:if test="*[local-name() = 'MeasureUnitQualifierCode']">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierCode']"/>
			<xsl:text>)</xsl:text>
		</xsl:if-->
	</xsl:template>
	
	<xsl:template match="*" mode="gtd_num">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="gtd_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'GTDNumber']"/>
	</xsl:template>
	
	<xsl:template match="*" mode="Cert">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<!--xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="gtd_date"/-->
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'Number']"/>
		<xsl:if test="*[local-name() = 'AddNumber']">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="*[local-name() = 'AddNumber']"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="agocw:Applicant">
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>&#160;
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:if test="position()=1">; 
				<span class="normal">
						<br/>
					</span>
					<span class="italic">Адрес(а)</span>
					<span class="normal">: </span>
				</xsl:if>
				<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="RUScat_ru:SubjectAddressDetails">
		<xsl:if test="RUScat_ru:PostalCode">
			<span class="normal"> </span>
			<span class="normal">
				<xsl:apply-templates select="RUScat_ru:PostalCode"/>
			</span>
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal">
				<xsl:apply-templates select="RUScat_ru:CountryCode"/>
			</span>
			<xsl:if test="RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:CounryName">
			<span class="normal">
				<xsl:apply-templates select="RUScat_ru:CounryName"/>
			</span>
			<xsl:if test="RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<span class="normal">
				<xsl:apply-templates select="RUScat_ru:Region"/>
			</span>
			<xsl:if test="RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<span class="normal">
				<xsl:apply-templates select="RUScat_ru:District"/>
			</span>
			<xsl:if test="RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<span class="normal">
				<xsl:apply-templates select="RUScat_ru:Town"/>
			</span>
			<xsl:if test="RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<span class="normal">
				<xsl:apply-templates select="RUScat_ru:City"/>
			</span>
			<xsl:if test="RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<span class="normal">
				<xsl:apply-templates select="RUScat_ru:StreetHouse"/>
			</span>
			<xsl:if test="RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<span class="normal">
				<xsl:apply-templates select="RUScat_ru:House"/>
			</span>
			<xsl:if test="RUScat_ru:Room or RUScat_ru:AddressText ">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<span class="normal">
				<xsl:apply-templates select="RUScat_ru:Room"/>
			</span>
			<xsl:if test="RUScat_ru:AddressText">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<span class="normal">
				<xsl:apply-templates select="RUScat_ru:AddressText"/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
			<span class="normal">, </span>
			<span class="italic">
				<xsl:if test="string-length(cat_ru:INN) &gt; 0">
					<span class="italic">ИНН</span>
				</xsl:if>
				<!--xsl:if test="string-length(cat_ru:INN) &gt; 0 and string-length(cat_ru:KPP) &gt; 0">
					<span class="normal">/</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:KPP) &gt; 0">
					<span class="italic">КПП</span>
				</xsl:if-->
				<span class="normal">: </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:apply-templates select="cat_ru:INN"/>
		</xsl:if>
		<!--xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:apply-templates select="cat_ru:KPP"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			<span class="normal">, </span>
			<span class="italic">ОГРН</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="cat_ru:OGRN"/>
		</xsl:if-->
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span class="normal">, </span>
			<span class="italic">БИН</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				<span class="normal">, </span>
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<span class="normal">, </span>
			<span class="italic">ИТН</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="cat_ru:CategoryCode"/>
			<span class="normal"> / </span>
			<xsl:apply-templates select="cat_ru:KATOCode"/>
			<xsl:if test="cat_ru:RNN">
				<span class="normal"> / </span>
				<xsl:apply-templates select="cat_ru:RNN"/>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal"> / </span>
				<xsl:apply-templates select="cat_ru:ITNReserv"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span class="normal">, </span>
			<span class="italic">УНП</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span class="normal">, </span>
			<span class="italic">ИНФЛ</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<span class="normal">, </span>
			<span class="italic">УНН</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<span class="normal">, </span>
			<span class="italic">НЗОУ</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<span class="normal">, </span>
			<span class="italic">№ справки об отсутв. НЗОУ</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<span class="italic">, ИНН(ПИН)</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<span class="italic">, ОКПО</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:UITN">
		<span class="normal"> УИТН</span>
		<span class="normal">: </span>
		<xsl:apply-templates select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal"> (</span>
			<span class="normal">страна </span>
			<xsl:apply-templates select="RUScat_ru:CountryCode"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="agocw:CustomsName">
		<xsl:apply-templates select="cat_ru:OfficeName"/>
		<xsl:text> (</xsl:text>
		<xsl:apply-templates select="cat_ru:Code"/>
		<xsl:text>) </xsl:text>
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
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:text>"</xsl:text>
				<u>&#160;<xsl:value-of select="substring($dateIn,9,2)"/>&#160;</u>
				<xsl:text>" </xsl:text>
				<u>&#160;<xsl:call-template name="month">
						<xsl:with-param name="number" select="substring($dateIn,6,2)"/>
					</xsl:call-template>&#160;</u>
				<xsl:text> 20</xsl:text>
				<u>
					<xsl:value-of select="substring($dateIn,3,2)"/>
				</u>
				<xsl:text>г.</xsl:text>
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
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/><xsl:text></xsl:text><xsl:value-of select="substring($dateIn,6,2)"/><xsl:text></xsl:text><xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='AppGoodsOperationCW']//*" priority="-1">
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
	<xsl:template match="*" mode="russian_date_month">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_month">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="gtd_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="gtd_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="initials">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="concat(substring(.,1, 1),'.')"/>
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
