<?xml version="1.0" encoding="utf-8"?>
<!--Приказ ФТС России № 941 от 18 октября 2023 года "Об утверждении порядка создания зоны таможенного контроля на участке территории опережающего развития или предоставленном резиденту свободного порта Владивосток земельном участке для целей применения таможенной процедуры свободной таможенной зоны и формы заявления о создании такой зоны таможенного контроля"-->
<!--Приказ ФТС России № 915 от 15 октября 2020 года "Об утверждении Порядка принятия решения о создании зоны таможенного контроля на участке резидента Арктической зоны Российской Федерации для целей применения таможенной процедуры свободной таможенной зоны"-->
<!--Приказ ФТС России № 555 от 28 июня 2023 года "Об утверждении порядка принятия таможенным органом решения о создании зоны таможенного контроля на участке территории свободной экономической зоны, созданной на территориях Донецкой Народной Республики, Луганской Народной Республики, Запорожской области и Херсонской области, во внутренних морских водах и в территориальном море Российской Федерации, примыкающих к территориям Донецкой Народной Республики, Запорожской области и Херсонской области"-->
<xsl:stylesheet version="1.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:accz="urn:customs.ru:Information:ExchangeDocuments:STZ_AppCreationCCZ:5.28.0" xmlns:catProc_ru="urn:customs.ru:Information:ProcessingDocuments:ProcessingCommonAggregateTypes:5.28.0">
	<!-- Шаблон для типа STZ_AppCreationCCZType -->
	<xsl:template match="//*[local-name()='accz:STZ_AppCreationCCZ']//*" priority="-1">
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
	<xsl:template match="accz:STZ_AppCreationCCZ">
		<html>
			<head>
				<style>
					body
					{background: #cccccc;
					font-family: Arial;}

					div
					{white-space: normal;}

					div.page
					{width: 180mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					.marg-top
					{margin-top:5mm;}

					table
					{width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;}

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
					{border: 1px solid windowtext;}

					.value
					{border-bottom: solid 1px black;
					font-family: Arial;
					font-size: 11pt;
					font-style: italic;
					vertical-align:bottom;}

					.annot
					{font-family: Arial;
					font-size: 11pt;}


					.title
					{font-weight:bold;
					font-family: Arial;
					font-size: 11pt;}

					tr.title td
					{font-weight:bold;
					font-family: Arial;
					font-size: 9pt;}

					.graphLittle 
					{font-family: Arial;
					font-size: 7pt;
					text-align: center;}

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;
					font-size: 10pt;}

					.descr
					{font-size: 8pt;
					text-align: center;
					vertical-align: top;}

					.delim_3
					{height: 3pt;}

					td.graphMain
					{vertical-align:top;}

					td.value.graphMain
					{vertical-align:bottom;}
                </style>
			</head>
			<body>
				<div class="page">
					<table class="graphMain" width="100%">
						<tbody>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td align="center" class="title">
									<xsl:text>Заявление</xsl:text>
									<br/>
									<xsl:text>о создании зоны таможенного контроля</xsl:text>
									<xsl:choose>
										<xsl:when test="accz:ResidentKind = '1'">
											<xsl:text> на участке территории опережающего развития</xsl:text>
										</xsl:when>
										<xsl:when test="accz:ResidentKind = '2'">
											<xsl:text> на предоставленном резиденту свободного порта Владивосток земельном участке для целей применения таможенной процедуры свободной таможенной зоны</xsl:text>
										</xsl:when>
										<xsl:when test="accz:ResidentKind = '3'">
											<xsl:text> на участке резидента Арктической зоны Российской Федерации для целей применения таможенной процедуры свободной таможенной зоны</xsl:text>
										</xsl:when>
										<xsl:when test="accz:ResidentKind = '4'">
											<xsl:text> на участке территории свободной экономической зоны, созданной на территориях Донецкой Народной Республики, Луганской Народной Республики, Запорожской области и Херсонской области, во внутренних морских водах и в территориальном море Российской Федерации, примыкающих к территориям Донецкой Народной Республики, Запорожской области и Херсонской области</xsl:text>
										</xsl:when>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table class="graphMain" width="100%">
										<tbody>
											<tr>
												<td width="40%">
													<xsl:text>Отметки таможенного органа</xsl:text>
												</td>
												<td align="right" valign="bottom" width="5%">В&#160;</td>
												<td align="center" width="55%" class="value">
													<xsl:apply-templates select="accz:Customs" mode="CustomsOffice"/>
												</td>
											</tr>
											<tr>
												<td class="bordered">
													<xsl:text>Регистрационный № </xsl:text>
													<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>
													<!--xsl:value-of select="accz:AppRegNumber/accz:CustomsCode"/>
													<xsl:text>/</xsl:text>
													<xsl:apply-templates mode="gtd_date" select="accz:AppRegNumber/accz:RegistrationDate"/>
													<xsl:text>/</xsl:text>
													<xsl:value-of select="accz:AppRegNumber/accz:Number"/-->
													<xsl:text>/ЗЗТК</xsl:text>
												</td>
												<td/>
												<td valign="top" class="graphLittle">
													<xsl:text>(наименование таможенного органа (с указанием кода таможенного органа))</xsl:text>
												</td>
											</tr>
											<tr>
												<td/>
												<td align="right" valign="bottom">от&#160;</td>
												<td align="center" class="value">
													<xsl:apply-templates mode="organization" select="accz:Resident"/>
												</td>
											</tr>
											<tr>
												<td colspan="2"/>
												<td class="graphLittle">
													<xsl:text>(резидент </xsl:text>
													<xsl:choose>
														<xsl:when test="accz:ResidentKind = '1'">
															<xsl:text>территории опережающего развития</xsl:text>
														</xsl:when>
														<xsl:when test="accz:ResidentKind = '2'">
															<xsl:text>свободного порта Владивосток</xsl:text>
														</xsl:when>
														<xsl:when test="accz:ResidentKind = '3'">
															<xsl:text>Арктической зоны РФ</xsl:text>
														</xsl:when>
														<xsl:when test="accz:ResidentKind = '4'">
															<xsl:text>свободной экономической зоны</xsl:text>
														</xsl:when>
													</xsl:choose>
													<xsl:text> (далее - заявитель) (полное наименование организации, основной государственный регистрационный номер (ОГРН), идентификационный номер налогоплательщика (ИНН) и код причины постановки на учет в налоговом органе (КПП), присвоенные юридическому лицу в соответствии с законодательством Российской Федерации, адрес юридического лица в пределах его места нахождения - для юридического лица; фамилия, имя, отчество (при наличии), адрес, по которому постоянно проживает или зарегистрировано физическое лицо, ИНН, основной государственный регистрационный номер индивидуального предпринимателя (ОГРНИП) и сведения о документе, удостоверяющем личность физического лица (наименование, серия, номер, дата выдачи), - для физического лица; реквизиты свидетельства о включении в реестр резидентов свободного порта Владивосток или удостоверяющего регистрацию лица в качестве резидента территории опережающего развития)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>Прошу создать постоянную зону таможенного контроля для целей применения таможенной процедуры свободной таможенной зоны на участке территории: </xsl:text>
									<xsl:choose>
										<xsl:when test="accz:ResidentKind = '1'">
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:text>&#160;&#160;</xsl:text>
													<xsl:apply-templates select="accz:NameOfTerritory"/>
													<xsl:text>&#160;&#160;</xsl:text>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(наименование территории опережающего развития, на которой резидент осуществляет деятельность)'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="accz:ResidentKind = '2'">
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:text>&#160;&#160;</xsl:text>
													<xsl:apply-templates select="accz:NameOfTerritory"/>
													<xsl:text>&#160;&#160;</xsl:text>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(наименование свободного порта Владивосток, на которой резидент осуществляет деятельность)'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="accz:ResidentKind = '3'">
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:text>&#160;&#160;</xsl:text>
													<xsl:apply-templates select="accz:NameOfTerritory"/>
													<xsl:text>&#160;&#160;</xsl:text>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(наименование Арктической зоны РФ, на которой резидент осуществляет деятельность)'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="accz:ResidentKind = '4'">
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:text>&#160;&#160;</xsl:text>
													<xsl:apply-templates select="accz:NameOfTerritory"/>
													<xsl:text>&#160;&#160;</xsl:text>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(наименование свободной экономической зоне, на которой резидент осуществляет деятельность)'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
									<xsl:text> по адресу: </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:text>&#160;&#160;</xsl:text>
											<xsl:apply-templates select="accz:AddressOfTerritory" mode="ru_address"/>
											<xsl:text>&#160;&#160;</xsl:text>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(адрес участка заявителя в пределах его места нахождения)'"/>
										<xsl:with-param name="width" select="'140mm'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>Информация о параметрах планируемой зоны таможенного контроля.</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>1. Пределы (границы) территории участка, в пределах которого планируется создание постоянной зоны таможенного контроля (с указанием кадастрового номера участка, его площади в квадратных метрах, координат характерных точек границ земельного участка):</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:text>кадастровый номер - </xsl:text>
									<xsl:apply-templates select="accz:LimitsOfTerritory/accz:CadastralNumber"/>
									<xsl:text>, площадь - </xsl:text>
									<xsl:apply-templates select="accz:LimitsOfTerritory/accz:PlotArea"/>
									<xsl:text> (координаты характерных точек границ земельного участка: </xsl:text>
									<xsl:apply-templates select="accz:LimitsOfTerritory/accz:CoordinatesOfPoints"/>
									<xsl:text>)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>2. Сведения о документах, подтверждающих, что участок </xsl:text>
									<xsl:choose>
										<xsl:when test="accz:ResidentKind = '1'">
											<xsl:text>территории опережающего развития</xsl:text>
										</xsl:when>
										<xsl:when test="accz:ResidentKind = '2'">
											<xsl:text>свободного порта Владивосток</xsl:text>
										</xsl:when>
										<xsl:when test="accz:ResidentKind = '3'">
											<xsl:text>Арктической зоны РФ</xsl:text>
										</xsl:when>
										<xsl:when test="accz:ResidentKind = '4'">
											<xsl:text>свободной экономической зоны</xsl:text>
										</xsl:when>
									</xsl:choose>
									<xsl:text>, на котором планируется создание постоянной зоны таможенного контроля находится во владении, в том числе в аренде, у заявителя:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:for-each select="accz:OwnerRightsDoc">
										<xsl:apply-templates mode="doc_base" select="."/>
										<xsl:if test="position()!=last()">; </xsl:if>
										<br/>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td valign="top" class="graphLittle">
									<xsl:text>(наименование, номер и дата документа)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>3. Места пересечения границ участка резидента (планируемой постоянной зоны таможенного контроля) лицами, товарами и транспортными средствами:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:for-each select="accz:BorderCrossingPoints">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">; </xsl:if>
										<br/>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>4. Сведения об оборудовании и обустройстве территории участка заявителя для целей таможенного контроля в соответствии с требованиями, установленными частями 2 и 3 статьи 25.3 Федерального закона № 473-ФЗ</xsl:text>
									<sup>1</sup>
									<xsl:text> или частями 2 и 2.1 статьи 25 Федерального закона № 212-ФЗ</xsl:text>
									<sup>2</sup>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:apply-templates select="accz:EquipmentInformation"/>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>5. Обязательство о соблюдении условий использования товаров, помещенных под таможенную процедуру свободной таможенной зоны, с соблюдением срока перевозки и размещения иностранных товаров, помещенных под таможенную процедуру свободной таможенной зоны, на территории участка, на котором предполагается создание постоянной зоны таможенного контроля,</xsl:text>
									<xsl:if test="accz:ObligationSign = '0'">
										<xsl:text> не</xsl:text>
									</xsl:if>
									<xsl:text> прилагается.</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>6. Сведения о волеизъявлении заявителя в получении на руки копии приказа о создании постоянной зоны таможенного контроля, в случае принятия соответствующего решения (при желании):</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:choose>
										<xsl:when test="accz:ReceivingHandSign = '1' or accz:ReceivingHandSign = 'true' or accz:ReceivingHandSign = 't'">ДА</xsl:when>
										<xsl:when test="accz:ReceivingHandSign = '0' or accz:ReceivingHandSign = 'false' or accz:ReceivingHandSign = 'f'">НЕТ</xsl:when>
										<xsl:otherwise>
											<xsl:apply-templates select="accz:ReceivingHandSign"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>7. Перечень документов, подтверждающих заявленные в заявлении сведения и представленных одновременно с заявлением:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td>
									<table class="graphMain" width="100%">
										<tbody>
											<tr>
												<td width="5%"/>
												<td width="35%"/>
												<td width="35%"/>
												<td width="30%"/>
											</tr>
											<tr>
												<td class="bordered" align="center">N п/п</td>
												<td class="bordered" align="center">Наименование документа</td>
												<td class="bordered" align="center">Реквизиты (номер, дата) документа</td>
												<td class="bordered" align="center">Количество листов</td>
											</tr>
											<tr>
												<td class="bordered" align="center">1</td>
												<td class="bordered" align="center">2</td>
												<td class="bordered" align="center">3</td>
												<td class="bordered" align="center">4</td>
											</tr>
											<xsl:for-each select="accz:DocList">
												<tr valign="top">
													<td class="bordered">
														<xsl:apply-templates select="accz:Position"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="cat_ru:PrDocumentName"/>
													</td>
													<td class="bordered">
														<xsl:if test="cat_ru:PrDocumentNumber">
															<xsl:text> №  </xsl:text>
															<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
														</xsl:if>
														<xsl:if test="cat_ru:PrDocumentDate">
															<xsl:text> от </xsl:text>
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
															</xsl:call-template>
														</xsl:if>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="accz:SheetsNumber"/>
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
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr valign="bottom">
												<td align="center" class="value" width="55%">
													<xsl:apply-templates mode="PersonBase" select="accz:ResidentSignature"/>
												</td>
												<td width="15%"/>
												<td class="value" width="30%"/>
											</tr>
											<tr>
												<td class="graphLittle">(фамилия, имя, отчество (при наличии), должность (при наличии) лица, подающего заявление)</td>
												<td/>
												<td class="graphLittle">(подпись)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<br/>
					<div class="descr" style="text-align:left;">
						<sup>1</sup>
						<xsl:text> Федеральный закон от 29 декабря 2014 г. № 473-ФЗ "О территориях опережающего развития в Российской Федерации".</xsl:text>
						<br/>
						<sup>2</sup>
						<xsl:text> Федеральный закон от 13 июля 2015 г. № 212-ФЗ "О свободном порте Владивосток".</xsl:text>
					</div>
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
	<xsl:template match="*" mode="doc_base">
		<xsl:apply-templates select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="catProc_ru:CustomsDocumentCode"> (<xsl:apply-templates select="catProc_ru:CustomsDocumentCode"/>)</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="Certificate">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='CertificateDate'">
					<xsl:text> от </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="local-name()='CertificateValidity'">
					<xsl:text>(срок действия: до   </xsl:text>
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
	<xsl:template match="*" mode="PersonBase">
		<xsl:if test="cat_ru:PersonPost">
			<xsl:value-of select="cat_ru:PersonPost"/>
			<xsl:text>,&#160;</xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PersonSurname">
			<xsl:value-of select="cat_ru:PersonSurname"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonName">
			<xsl:text>&#160;</xsl:text>
			<xsl:value-of select="cat_ru:PersonName"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:text>&#160;</xsl:text>
			<xsl:value-of select="cat_ru:PersonMiddleName"/>
		</xsl:if>
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
	<xsl:template mode="organization" match="*">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates mode="identity" select="RUScat_ru:IdentityCard"/>
		<xsl:text> </xsl:text>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:text> адрес(а): </xsl:text>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="." mode="ru_address"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="accz:ResidentCertificate">
			<xsl:text> свидетельство  </xsl:text>
			<xsl:for-each select="accz:ResidentCertificate">
				<xsl:apply-templates select="." mode="Certificate"/>
				<xsl:if test="position()!=last()">
					<xsl:text>,</xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="identity" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='IdentityCardDate'">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:when test="local-name()='DocValidityDate'">
					<xsl:text>окончание срока действия: </xsl:text>
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last() and not(local-name()='IdentityCardSeries')">
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:if test="local-name()='IdentityCardSeries'">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
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
