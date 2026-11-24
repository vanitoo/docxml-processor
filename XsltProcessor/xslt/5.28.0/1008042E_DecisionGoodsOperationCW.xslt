<?xml version="1.0" encoding="utf-8"?>
<!-- Проект приказа Минфина РФ вземен Приказа ФТС России от 18.03.2019 № 445 "Об утверждении формы заявления на совершение операций с товарами, помещенными под таможенную процедуру таможенного склада, и формы решения таможенного органа по результатам рассмотрения указанного заявления" Приложение №2 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.28.0" xmlns:dgocw="urn:customs.ru:Information:WarehouseDocuments:DecisionGoodsOperationCW:5.28.0">
	<xsl:param name="signatures"/>
	  <!-- формат данных в signatures
		<root>
		  <cert id="4D2B4C8000010003BFAC" owner="Семенов Виталий Александрович" from="2022-12-06T15:59:18" to="2023-12-05T16:09:18" />
		  <cert ... />
		</root>
		-->
	<xsl:include href="ElSign.xslt"/>
	
	<!-- Шаблон для типа DecisionGoodsOperationCWType -->
	<xsl:template match="dgocw:DecisionGoodsOperationCW">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				 <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<style>
                  	body {
					background: #cccccc;
					font-family: Arial;
					}

					div.page {
					width: 180mm;
					max-width: 180mm;
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
					max-width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
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
					}

					div.title, tr.title td { font-weight:bold;  }
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
					.graphMaintable
					{font-family: Arial;
					font-size: 10pt;}
					td.graphMaintable
					{vertical-align:top;}
					.descr{
						font-size: 8pt;
						text-align: center;
					}
					.indent{
						text-indent: 1.5em;
					}
					.underlined{
						border-bottom: 1px solid windowtext;
					}
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody width="100%" class="graphMain">
							<tr>
								<td width="100%" align="center">
									<b>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</b>
									<!--table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="center">
												<td class="value">
													<xsl:apply-templates select="dgocw:Customs"/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr">
													(наименование таможенного органа)
												</td>
											</tr>
										</tbody>
									</table-->
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody width="100%" class="graphMain">
							<tr align="center" valign="top">
								<td>
									<br/>
									<br/>
									<b>Решение<br/>таможенного органа Российской Федерации по результатам рассмотрения заявления на совершение операций с товарами, помещенными под таможенную процедуру таможенного склада</b>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="inlinetable" style="width: 100%;">
						<tbody width="100%" class="graphMain">
							<tr>
								<td align="left" valign="top">Принято</td>
								<td align="center" class="value">
									<xsl:apply-templates select="dgocw:Customs"/>
								</td>
							</tr>
							<tr align="center">
								<td></td>
								<td class="descr">
									(наименование таможенного поста, принявшего настоящее решение)
								</td>
							</tr>
						</tbody>
					</table>
					<table class="inlinetable" style="width: 100%;">
						<tbody width="100%" class="graphMain">
							<tr>
								<td align="left" valign="top" rowspan="4" width="35%">На основании заявления от</td>
								<td align="center" class="value" width="65%">
									<xsl:apply-templates select="dgocw:ApplicationDate" mode="russian_date"/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(дата подачи заявления)
								</td>
							</tr>
							<tr align="center">
								<td class="value">
									<xsl:apply-templates select="dgocw:Applicant" mode="organization"/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(сведения о декларанте: полное наименование организации, содержащее указание на ее организационно-правовую форму, или фамилия, имя, отчество (при наличии), идентификационный номер налогоплательщика (при наличии))
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody width="100%" class="graphMain">
							<tr>
								<td>
									<xsl:text>В соответствии с частями 2 и 3 статьи 121 Федерального закона от 3 августа 2018 г. № 289-ФЗ</xsl:text><sup>1</sup><xsl:text> принято настоящее решение в отношении товаров, помещенных под таможенную процедуру таможенного склада в соответствии с декларацией на товары № </xsl:text>
									<table class="inlinetable" style="width: 100mm;">
										<tbody>
											<tr align="center">
												<td class="value">
													<xsl:apply-templates select="dgocw:GTDNumber"/>
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
						<tbody width="100%" class="graphMain">
							<tr>
								<td>
									<xsl:text>1. О выдаче разрешения на совершение операций с товарами, помещенными под таможенную процедуру таможенного склада, в период с </xsl:text>
									<table class="inlinetable" style="width: 30mm;">
										<tbody>
											<tr align="center">
												<td class="value">
													<xsl:apply-templates select="dgocw:OperationPeriod/dgocw:BeginPeriodDate" mode="russian_date"/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr">
													(дата, месяц, год)
												</td>
											</tr>
										</tbody>
									</table>
									<xsl:text> по </xsl:text>
									<table class="inlinetable" style="width: 30mm;">
										<tbody>
											<tr align="center">
												<td class="value">
													<xsl:apply-templates select="dgocw:OperationPeriod/dgocw:EndPeriodDate" mode="russian_date"/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr">
													(дата, месяц, год)
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
						<tbody width="100%" class="graphMaintable">
							<tr valign="top" align="center">
								<td class="bordered">№ п/п</td>
								<td class="bordered">Порядковый номер товара в декларации на товары</td>
								<td class="bordered">Количество товара, в отношении которого предполагается совершение операций, в основной или дополнительной единицах измерения</td>
								<td class="bordered">Операции, предусмотренные пунктом 2 статьи 158 Таможенного кодекса Евразийского экономического союза<sup>2</sup>, которые предполагается совершать с товарами</td>
							</tr>
							<tr valign="top" align="center">
								<td class="bordered">1</td>
								<td class="bordered">2</td>
								<td class="bordered">3</td>
								<td class="bordered">4</td>
							</tr>
							<xsl:for-each select="dgocw:AllowedCWGood">
								<tr align="center" valign="top">
									<td class="bordered">
										<xsl:apply-templates select="dgocw:Number"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="dgocw:DTNumber"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="dgocw:Quantity" mode="quantity"/>
										<xsl:if test="count(dgocw:Quantity) = 1"> / -</xsl:if>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="dgocw:Operation"/>
										<xsl:if test="dgocw:OtherOperation">
											<xsl:if test="dgocw:Operation!=11">;<br/></xsl:if>
											<xsl:value-of select="dgocw:OtherOperation"/>
										</xsl:if>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<xsl:text>2. Об отказе в выдаче разрешения на совершение операций с товарами, помещенными под таможенную процедуру таможенного склада, указанными в декларации на товары под номером </xsl:text>
					<table class="inlinetable" style="width: 98%;">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:for-each select="dgocw:ProhibitedCWGood">
										<xsl:if test="position()!=1">, </xsl:if>
										<xsl:choose>
											<xsl:when test="dgocw:DTNumber">
												<xsl:apply-templates select="dgocw:DTNumber"/>
											</xsl:when>
											<xsl:when test="dgocw:Range">
												<xsl:apply-templates select="dgocw:Range/dgocw:FirstNumber"/>
												<xsl:text> - </xsl:text>
												<xsl:apply-templates select="dgocw:Range/dgocw:LastNumber"/>
											</xsl:when>
										</xsl:choose>
									</xsl:for-each>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(порядковый номер товара в декларации на товары)
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:text>, в связи с тем, что в результате их совершения могут измениться характеристики данных товаров, связанные с изменением кода единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза</xsl:text><sup>3</sup><xsl:text>.</xsl:text>
					<br/>
					<br/>
					<table width="100%">
						<tbody>
							<tr>
								<td width="30%" valign="bottom">Начальник таможенного поста (лицо, его замещающее)</td>
								<td/>
								<td width="50%" class="underlined" align="center" valign="bottom">
									<!--xsl:for-each select="dgocw:Customs/dgocw:CustomsPerson">
										<xsl:if test="$signatures">
											<xsl:variable name="FIO">
												<xsl:for-each select="*[local-name() = 'PersonSurname' or local-name() = 'PersonName' or local-name() = 'PersonMiddleName']">
													<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
													<xsl:value-of select="."/>
												</xsl:for-each>
											</xsl:variable>
											<xsl:apply-templates select="$signatures/cert[contains(@owner, $FIO)]" mode="Signature">
												<xsl:with-param name="firstCol" select="0"/>
												<xsl:with-param name="width" select="350"/>
											</xsl:apply-templates>
										</xsl:if>
									</xsl:for-each-->
									<!--xsl:apply-templates select="dgocw:Customs/dgocw:CustomsPerson/dgocw:LNP"/-->
									<xsl:if test="$signatures">
										<xsl:apply-templates select="$signatures/cert[1]" mode="Signature">
											<xsl:with-param name="firstCol" select="0"/>
											<xsl:with-param name="width" select="350"/>
										</xsl:apply-templates>
									</xsl:if>
								</td>
								<td/>
								<td width="20%" class="underlined" align="center" valign="bottom">
									<xsl:apply-templates select="dgocw:Customs/dgocw:CustomsPerson"/>
								</td>
							</tr>
							<tr valign="top" align="center">
								<td></td>
								<td></td>
								<td class="descr">(подпись)</td>
								<td></td>
								<td class="descr">(фамилия, имя, отчество (при наличии))</td>
							</tr>
							<tr>
								<td colspan="6"><br/><br/></td>
							</tr>
							<tr>
								<td colspan="6">
									Дата выдачи настоящего решения <xsl:apply-templates select="dgocw:DecisionDate" mode="russian_date_month"/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<div>_____________________________________</div>
					<div class="descr" style="text-align:left;">
						<sup>1</sup> «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации».<br/>
						<sup>2</sup> Является обязательным для Российской Федерации в соответствии с Договором о Таможенном кодексе Евразийского экономического союза от 11 апреля 2017 г., ратифицированным Федеральным законом от 14 ноября 2017 г. № 317-ФЗ «О ратификации Договора о Таможенном кодексе Евразийского экономического союза». Вступил в силу для Российской Федерации 1 января 2018 г.<br/>
						<sup>3</sup> Решение Совета Евразийской экономической комиссии от 14 сентября 2021 г. № 80 «Об утверждении единой Товарной номенклатуры внешнеэкономической деятельности Евразийского экономического союза и Единого таможенного тарифа Евразийского экономического союза, а также об изменении и признании утратившими силу некоторых решений Совета Евразийской экономической комиссии». Является обязательным для Российской Федерации в соответствии с Договором о Евразийском экономическом союзе от 29 мая 2014 г., ратифицированным Федеральным законом от 3 октября 2014 г. № 279-ФЗ «О ратификации Договора о Евразийском экономическом союзе». Вступило в силу для Российской Федерации 1 января 2022 г.<br/>
						<!--sup>4</sup>Указывается десятизначный код товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза.<br/>
						<sup>5</sup>Указываются операции, совершаемые с товарами, помещенными под таможенную процедуру таможенного склада, предусмотренные пунктом 2 статьи 158 Таможенного кодекса Евразийского экономического союза (Федеральный закон от 14 ноября 2017 г. N 317-ФЗ "О ратификации Договора о Таможенном кодексе Евразийского экономического союза" (Собрание законодательства Российской Федерации, 2017, N 47, ст. 6843).<br/-->
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="dgocw:Operation">
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
	
	<xsl:template match="dgocw:CustomsPerson">
		<xsl:apply-templates select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonName" mode="initials"/>
		<xsl:apply-templates select="cat_ru:PersonMiddleName" mode="initials"/>
	</xsl:template>
	
	<xsl:template match="dgocw:RefusalReason">
		<xsl:apply-templates select="dgocw:Reason"/>
		<xsl:text>; </xsl:text>
		<xsl:text> ст. </xsl:text>
		<xsl:apply-templates select="dgocw:ArticleNumber"/>
		<xsl:if test="dgocw:PartNumber">
			<xsl:text> ч.</xsl:text>
			<xsl:apply-templates select="dgocw:PartNumber"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template mode="quantity" match="*">
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
	
	<xsl:template match="dgocw:GTDNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	
	<xsl:template match="*" mode="organization">
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>&#160;
		</xsl:if>
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:apply-templates select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:text> адрес(а): </xsl:text>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="." mode="address"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:apply-templates select="cat_ru:INN"/>
		</xsl:if>
		<!--xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:apply-templates select="cat_ru:KPP"/>
		</xsl:if-->
	</xsl:template>
	<xsl:template match="*" mode="address">
		<xsl:for-each select="RUScat_ru:CounryName|RUScat_ru:Region|RUScat_ru:District|RUScat_ru:Town|RUScat_ru:City|RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room|RUScat_ru:AddressText">
			<xsl:apply-templates select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="dgocw:Customs">
		<xsl:apply-templates select="cat_ru:OfficeName"/>
		<xsl:text> </xsl:text>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text>(</xsl:text>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text>)</xsl:text>
		</xsl:if>
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
				<u>&#160;
				<xsl:value-of select="substring($dateIn,9,2)"/>
				&#160;</u>
				<xsl:text>"&#160;</xsl:text>
				<u>&#160;
				<xsl:call-template name="month"><xsl:with-param name="number" select="substring($dateIn,6,2)"/></xsl:call-template> 
				&#160;</u>
				<xsl:text>&#160;</xsl:text>
				<xsl:value-of select="substring($dateIn,1,2)"/>
				<u>
					<xsl:value-of select="substring($dateIn, 3, 2)"/>
				</u>
				<xsl:text> г.</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='DecisionGoodsOperationCW']//*" priority="-1">
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
