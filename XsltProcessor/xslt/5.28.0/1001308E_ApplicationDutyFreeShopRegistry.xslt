<?xml version="1.0" encoding="utf-8"?>
<!-- Письмо ГУИТ от 20.08.2019 г. № 09-126/51036,
Приказ ФТС России от 13.05.2019 г. № 776:
Приложение 1 - (ApplicationType = ВК) - Заявление о включении в Реестр владельцев магазинов беспошлинной торговли
Приложение 2 - (ApplicationType = ИЗ) - Заявление о внесении изменений в Реестр владельцев магазинов беспошлинной торговли
Приложение 3 - (ApplicationType = ИС) - Заявление владельца об исключении его из реестра владельцев магазинов беспошлинной торговли
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:RegDFS="urn:customs.ru:Information:RegistrationDocuments:ApplicationDutyFreeShopRegistry:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0">
	<!-- Шаблон для типа ApplicationDutyFreeShopRegistryType -->
	<xsl:template match="RegDFS:ApplicationDutyFreeShopRegistry">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  font-family: Arial;
                  }

                  div
                  {
                  /*white-space: normal;*/
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
                  /*font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;*/
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  /*font-family: Arial;
                  font-size: 11pt;*/
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
                  font-size: 11pt;
                  }

                  td.graphMain
                  {
                  vertical-align:top;
                  }
                  td.value.graphMain
                  {
                  vertical-align:bottom;
                  }
                  .descr {
					  font-size: 8pt;
                  }
                </style>
			</head>
			<body>
				<xsl:if test="RegDFS:ApplicationType='ВК'">
					<div class="page" style="width: {$w}mm;">
						<table>
							<tbody>
								<tr>
									<td width="55%"/>
									<td width="45%">
										Начальнику таможни
										<table>
											<tbody>
												<tr align="center">
													<td style="border-bottom:1px solid black;">
														<xsl:value-of select="RegDFS:CustomsPerson/cat_ru:PersonSurname"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="RegDFS:CustomsPerson/cat_ru:PersonName"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="RegDFS:CustomsPerson/cat_ru:PersonMiddleName"/>
													</td>
												</tr>
												<tr align="center">
													<td class="descr">(инициалы, фамилия)</td>
												</tr>
											</tbody>
										</table>
										<br/>
										<xsl:call-template name="text_date">
											<xsl:with-param name="date" select="RegDFS:ApplicationDate"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td class="title" align="center">
										Заявление о включении в Реестр<br/>владельцев магазинов беспошлинной торговли
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr align="center">
									<td style="border-bottom:1px solid black;">
										<xsl:value-of select="RegDFS:AppOrganizationInfo/cat_ru:OrganizationName"/>
									</td>
								</tr>
								<tr align="center">
									<td class="descr">(полное наименование организации)</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<div style="text-indent:10mm;">Просим рассмотреть представленные документы и включить</div>
						<table>
							<tbody>
								<tr align="center">
									<td style="border-bottom:1px solid black;">
										<xsl:value-of select="RegDFS:AppOrganizationInfo/cat_ru:OrganizationName"/>
									</td>
								</tr>
								<tr align="center">
									<td class="descr">(наименование организации)</td>
								</tr>
							</tbody>
						</table>
						<div>в Реестр владельцев магазинов беспошлинной торговли.</div>
						<br/>
						<div align="center">
							<b> СВЕДЕНИЯ О ЗАЯВИТЕЛЕ</b>
						</div>
						<br/>
						<table>
							<tbody>
								<tr align="center" valign="top">
									<td class="bordered" width="5%">1</td>
									<td class="bordered" width="45%">2</td>
									<td class="bordered" width="50%">3</td>
								</tr>
								<tr valign="top">
									<td class="bordered"/>
									<td class="bordered">Наименование владельца магазина беспошлинной торговли и организационно-правовая форма</td>
									<td class="bordered">
										<xsl:for-each select="RegDFS:AppOrganizationInfo">
											<xsl:value-of select="cat_ru:OrganizationName"/>
											<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
												<xsl:value-of select="cat_ru:ShortName"/>
											</xsl:if>
											<xsl:if test="RegDFS:AppOrganizationOPF">
												<br/>
												<xsl:value-of select="RegDFS:AppOrganizationOPF"/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered"/>
									<td class="bordered">Местонахождение организации</td>
									<td class="bordered">
										<xsl:apply-templates mode="comma" select="RegDFS:AppOrganizationInfo/cat_ru:Address"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered"/>
									<td class="bordered">Серия, номер и дата выдачи свидетельства о постановке на учет в налоговом органе</td>
									<td class="bordered">
										<xsl:apply-templates select="RegDFS:AppOrganizationInfo/RegDFS:FNSInfo"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered"/>
									<td class="bordered">Номер и дата выдачи Свидетельства о внесении записи в Единый государственный реестр юридических лиц</td>
									<td class="bordered">
										<xsl:apply-templates select="RegDFS:AppOrganizationInfo/RegDFS:OGRNInfo"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered"/>
									<td class="bordered">Сведения об открытых банковских счетах</td>
									<td class="bordered">
										<xsl:apply-templates select="RegDFS:BankAccountInfo"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered"/>
									<td class="bordered">Фактическое место нахождения сооружений и (или) помещений (части помещений), предназначенных для использования в качестве магазина беспошлинной торговли</td>
									<td class="bordered">
										<xsl:apply-templates mode="comma" select="RegDFS:DutyFreeShopInfo/RegDFS:DutyFreeShopAddress"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered"/>
									<td class="bordered">Общая площадь магазина беспошлинной торговли (в том числе торговых залов, подсобных помещений, складов)</td>
									<td class="bordered">
										<xsl:apply-templates mode="quantity" select="RegDFS:DutyFreeShopInfo/RegDFS:TotalAreaMeasure"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered"/>
									<td class="bordered">Сведения об устройстве, оборудовании и о материально-техническом оснащении магазина беспошлинной торговли</td>
									<td class="bordered">
										<xsl:apply-templates select="RegDFS:DutyFreeShopInfo/RegDFS:EquipmentInfo"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered"/>
									<td class="bordered">Общая сумма обеспечения исполнения обязанностей юридического лица, осуществляющего деятельность в качестве владельца магазина беспошлинной торговли (с указанием способа указанного обеспечения; номер и дата документов, подтверждающих предоставление обеспечения)</td>
									<td class="bordered">
										<xsl:apply-templates select="RegDFS:CollateralInfo"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered"/>
									<td class="bordered">Сведения о предоставлении обеспечении исполнения обязанностей юридического лица, осуществляющего деятельность в качестве владельца магазина беспошлинной торговли</td>
									<td class="bordered"/>
								</tr>
								<tr valign="top">
									<td class="bordered"/>
									<td class="bordered">Сведения о регистрационных или разрешительных документах на розничную торговлю</td>
									<td class="bordered">
										<xsl:for-each select="RegDFS:PermitsRetailTradeDocuments">
											<xsl:if test="position() &gt; 1">; </xsl:if>
											<xsl:value-of select="position()"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates mode="doc" select="."/>
										</xsl:for-each>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered"/>
									<td class="bordered">Сведения о согласовании открытия магазина беспошлинной торговли</td>
									<td class="bordered">
										<xsl:apply-templates select="RegDFS:ApprovalOpeningInfo"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered"/>
									<td class="bordered">Сведения о согласовании порядка функционирования магазина беспошлинной торговли (с указанием категории лиц, которым будет осуществляться реализация товара)</td>
									<td class="bordered">
										<xsl:apply-templates select="RegDFS:CoordFunctionInfo"/>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<div style="text-indent:10mm;">К заявлению прилагаются следующие документы:</div>
						<table>
							<tbody>
								<tr>
									<td class="value">
										<xsl:for-each select="RegDFS:PresentedDocuments/*">
											<br/>
											<xsl:value-of select="position()"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates mode="doc" select="."/>
											<xsl:if test="position()!=last()">; </xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr align="center">
									<td class="descr">(перечисляются все представляемые документы с указанием количества листов по каждому документу)</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<div>Общее количество листов <span style="display:inline-block;width: 20mm;text-align:center;" class="value">
								<xsl:value-of select="RegDFS:TotalSheetNumber"/>
							</span>
						</div>
						<br/>
						<br/>
						<table>
							<tbody>
								<tr valign="bottom">
									<td width="40%">Руководитель организации</td>
									<td width="5%"/>
									<td width="25%" align="center" class="value"/>
									<td width="5%"/>
									<td width="25%" align="center" class="value">
										<xsl:apply-templates mode="person" select="RegDFS:AppOrganizationEmployee"/>
									</td>
								</tr>
								<tr align="center">
									<td/>
									<td/>
									<td class="descr">(подпись)</td>
									<td/>
									<td class="descr">(инициалы, фамилия)</td>
								</tr>
							</tbody>
						</table>
						<div style="inline-block; width:50mm;text-align:right">М.П.<sup>1</sup>
						</div>
						<br/>
						<br/>
						<br/>
						<br/>
						<div style="inline-block; width: 50mm;" class="value"/>
						<div class="descr">
							<sup>1</sup> При наличии печати</div>
					</div>
				</xsl:if>
				<xsl:if test="RegDFS:ApplicationType='ИЗ'">
					<div class="page" style="width: {$w}mm;">
						<table>
							<tbody>
								<tr>
									<td class="title" align="center">
										Заявление о внесении изменений в реестр владельцев магазинов<br/>беспошлинной торговли
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td width="40%"/>
									<td width="60%">
										Руководителю
										<table>
											<tbody>
												<tr align="center">
													<td class="value">
														<xsl:value-of select="RegDFS:Customs/cat_ru:OfficeName"/>
														<xsl:if test="RegDFS:Customs/cat_ru:OfficeName"> (</xsl:if>
														<xsl:value-of select="RegDFS:Customs/cat_ru:Code"/>
														<xsl:if test="RegDFS:Customs/cat_ru:OfficeName">)</xsl:if>
													</td>
												</tr>
												<tr align="center">
													<td class="descr">(наименование таможенного органа)</td>
												</tr>
											</tbody>
										</table>
										<table>
											<tbody>
												<tr align="center">
													<td class="value">
														<xsl:apply-templates mode="person" select="RegDFS:CustomsPerson"/>
													</td>
												</tr>
												<tr align="center">
													<td class="descr">(инициалы, фамилия)</td>
												</tr>
											</tbody>
										</table>
										<br/>
										<div style="width:100%; text-align:right;">
											<xsl:call-template name="text_date">
												<xsl:with-param name="date" select="RegDFS:ApplicationDate"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr align="center">
									<td class="value">
										<xsl:value-of select="RegDFS:AppOrganizationInfo/cat_ru:OrganizationName"/>
										<xsl:if test="not(RegDFS:AppOrganizationInfo/cat_ru:OrganizationName) and RegDFS:AppOrganizationInfo/cat_ru:ShortName">
											<xsl:value-of select="RegDFS:AppOrganizationInfo/cat_ru:ShortName"/>
										</xsl:if>
									</td>
								</tr>
								<tr align="center">
									<td class="descr">(наименование организации)</td>
								</tr>
							</tbody>
						</table>
						<div>просит рассмотреть возможность внесения изменений в реестр владельцев магазинов беспошлинной торговли следующих сведений: </div>
						<table>
							<tbody>
								<tr>
									<td class="value">
										<xsl:apply-templates select="RegDFS:ChangeDetails"/>
									</td>
								</tr>
								<tr align="center">
									<td class="descr">указываются сведения о владельце магазина беспошлинной торговли, подлежащие изменению</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<div>К заявлению прилагаются следующие документы, подтверждающие заявленные сведения (перечисляются все представляемые документы с указанием количества листов по каждому документу): </div>
						<div>
							<xsl:for-each select="RegDFS:PresentedDocuments/*">
								<br/>
								<xsl:value-of select="position()"/>
								<xsl:text>. </xsl:text>
								<xsl:apply-templates mode="doc" select="."/>
								<xsl:if test="position()!=last()">; </xsl:if>
							</xsl:for-each>
						</div>
						<br/>
						<div>Общее количество листов <span style="display:inline-block;width: 20mm;text-align:center;" class="value">
								<xsl:value-of select="RegDFS:TotalSheetNumber"/>
							</span>
						</div>
						<br/>
						<br/>
						<table>
							<tbody>
								<tr valign="bottom">
									<td width="40%">Руководитель организации</td>
									<td width="5%"/>
									<td width="25%" align="center" class="value"/>
									<td width="5%"/>
									<td width="25%" align="center" class="value">
										<xsl:apply-templates mode="person" select="RegDFS:AppOrganizationEmployee">
											<xsl:with-param name="iof" select="'0'"/>
										</xsl:apply-templates>
									</td>
								</tr>
								<tr align="center">
									<td/>
									<td/>
									<td class="descr">(подпись)</td>
									<td/>
									<td class="descr">(инициалы, фамилия)</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<xsl:if test="RegDFS:ApplicationType='ИС'">
					<div class="page" style="width: {$w}mm;">
						<table>
							<tbody>
								<tr>
									<td class="title" align="center">
										Заявление владельца об исключении его из реестра владельцев магазинов<br/>беспошлинной торговли
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td width="40%"/>
									<td width="60%">
										Руководителю
										<table>
											<tbody>
												<tr align="center">
													<td class="value">
														<xsl:value-of select="RegDFS:Customs/cat_ru:OfficeName"/>
														<xsl:if test="RegDFS:Customs/cat_ru:OfficeName"> (</xsl:if>
														<xsl:value-of select="RegDFS:Customs/cat_ru:Code"/>
														<xsl:if test="RegDFS:Customs/cat_ru:OfficeName">)</xsl:if>
													</td>
												</tr>
												<tr align="center">
													<td class="descr">(наименование таможенного органа)</td>
												</tr>
											</tbody>
										</table>
										<table>
											<tbody>
												<tr align="center">
													<td class="value">
														<xsl:apply-templates mode="person" select="RegDFS:CustomsPerson"/>
													</td>
												</tr>
												<tr align="center">
													<td class="descr">(инициалы, фамилия)</td>
												</tr>
											</tbody>
										</table>
										<br/>
										<div style="width:100%; text-align:right;">
											<xsl:call-template name="text_date">
												<xsl:with-param name="date" select="RegDFS:ApplicationDate"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr align="center">
									<td class="value">
										<xsl:value-of select="RegDFS:AppOrganizationInfo/cat_ru:OrganizationName"/>
										<xsl:if test="not(RegDFS:AppOrganizationInfo/cat_ru:OrganizationName) and RegDFS:AppOrganizationInfo/cat_ru:ShortName">
											<xsl:value-of select="RegDFS:AppOrganizationInfo/cat_ru:ShortName"/>
										</xsl:if>
									</td>
								</tr>
								<tr align="center">
									<td class="descr">(наименование организации - владельца магазина беспошлинной торговли)</td>
								</tr>
							</tbody>
						</table>
						<div>В связи с</div>
						<table>
							<tbody>
								<tr>
									<td class="value">
										<xsl:apply-templates select="RegDFS:RegistryChangeReasons"/>
									</td>
								</tr>
								<tr align="center">
									<td class="descr">указывается причина прекращения деятельности в качестве владельца магазина беспошлинной торговли</td>
								</tr>
							</tbody>
						</table>
						<div>на основании подпункта 2 пункта 1 статьи 428 Таможенного кодекса Евразийского экономического союза прошу рассмотреть возможность об исключении из реестра владельцев магазинов беспошлинной торговли.</div>
						<br/>
						<br/>
						<table>
							<tbody>
								<tr valign="bottom">
									<td width="40%">Руководитель организации</td>
									<td width="5%"/>
									<td width="25%" align="center" class="value"/>
									<td width="5%"/>
									<td width="25%" align="center" class="value">
										<xsl:apply-templates mode="person" select="RegDFS:AppOrganizationEmployee">
											<xsl:with-param name="iof" select="'0'"/>
										</xsl:apply-templates>
									</td>
								</tr>
								<tr align="center">
									<td/>
									<td/>
									<td class="descr">(подпись)</td>
									<td/>
									<td class="descr">(инициалы, фамилия)</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<xsl:template mode="person" match="*">
		<xsl:param name="iof" select="'1'"/>
		<xsl:variable name="f" select="cat_ru:PersonSurname"/>
		<xsl:variable name="io">
			<xsl:value-of select="cat_ru:PersonName"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:PersonMiddleName"/>
			<xsl:text> </xsl:text>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$iof = '1'">
				<xsl:value-of select="concat($io,' ',$f )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat($f,' ',$io)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="RegDFS:InsurCertificate">
		<xsl:if test="RegDFS:CertificateSeries">
			<xsl:text> серия </xsl:text>
			<xsl:value-of select="RegDFS:CertificateSeries"/>
		</xsl:if>
		<xsl:text> № </xsl:text>
		<xsl:value-of select="RegDFS:CertificateNumber"/>
		<xsl:if test="RegDFS:CertificateDate">
			<xsl:text> дата выдачи </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RegDFS:CertificateDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RegDFS:InsuranceAgreement">
		<xsl:text>№ </xsl:text>
		<xsl:value-of select="RegDFS:AgreemNumber"/>
		<xsl:text> от </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="RegDFS:AgreemDate"/>
		</xsl:call-template>
		<xsl:text> до </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="RegDFS:AgreemDate"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="RegDFS:CollateralInfo">
		<xsl:text>Общая сумма: </xsl:text>
		<xsl:value-of select="RegDFS:CollateralAmount"/>
		<xsl:if test="RegDFS:CollateralMeans/RegDFS:CollMoneyDocAmount">
			<br/>
			<xsl:text>Внесение денежных средств: </xsl:text>
			<xsl:apply-templates mode="amount" select="RegDFS:CollateralMeans/RegDFS:CollMoneyDocAmount"/>
		</xsl:if>
		<xsl:if test="RegDFS:CollateralMeans/RegDFS:CollBankGuaranteeDocAmount">
			<br/>
			<xsl:text>Банковская гарантия: </xsl:text>
			<xsl:apply-templates mode="amount" select="RegDFS:CollateralMeans/RegDFS:CollBankGuaranteeDocAmount"/>
		</xsl:if>
		<xsl:if test="RegDFS:CollateralMeans/RegDFS:CollGuaranteeDocAmount">
			<br/>
			<xsl:text>Поручительство: </xsl:text>
			<xsl:apply-templates mode="amount" select="RegDFS:CollateralMeans/RegDFS:CollGuaranteeDocAmount"/>
		</xsl:if>
		<xsl:if test="RegDFS:CollateralMeans/RegDFS:CollPropertyPawningDocAmount">
			<br/>
			<xsl:text>Залог имущества: </xsl:text>
			<xsl:apply-templates mode="amount" select="RegDFS:CollateralMeans/RegDFS:CollPropertyPawningDocAmount"/>
		</xsl:if>
		<xsl:if test="RegDFS:CollateralMeans/RegDFS:CollOtherDocAmount">
			<br/>
			<xsl:for-each select="RegDFS:CollateralMeans/RegDFS:CollOtherDocAmount">
				<xsl:if test="position() &gt; 1">
					<br/>
				</xsl:if>
				<xsl:value-of select="RegDFS:CollOther"/>
				<xsl:text>: </xsl:text>
				<xsl:apply-templates mode="amount" select="RegDFS:DocAmount"/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RegDFS:CollateralMeans/RegDFS:CollLaterIndicator = 1 or RegDFS:CollateralMeans/RegDFS:CollLaterIndicator='true'">
			<br/>
			<xsl:text>Информация будет предоставлена после принятия предварительного решения</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="amount" match="*">
		<xsl:value-of select="RegDFS:Amount"/>
		<xsl:if test="count(*) &gt; 1">, </xsl:if>
		<xsl:apply-templates mode="doc" select="."/>
	</xsl:template>
	<xsl:template mode="doc" match="*">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="RegDFS:DocumentSheetNumber">
			<xsl:text> листов </xsl:text>
			<xsl:value-of select="RegDFS:DocumentSheetNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="quantity" match="*">
		<xsl:value-of select="cat_ru:GoodsQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="WarehouseAddressAndStuff" match="RegDFS:WarehouseEquipmentInfo">
		<xsl:apply-templates select="RegDFS:BuildingInfo"/>
		<xsl:if test="RegDFS:WarehouseAddress">
			<br/>
			<xsl:text>Местоположение: </xsl:text>
			<xsl:apply-templates mode="comma" select="RegDFS:WarehouseAddress"/>
		</xsl:if>
		<xsl:if test="RegDFS:EquipmentInfo">
			<br/>
			<xsl:text>Сведения: </xsl:text>
			<xsl:apply-templates select="RegDFS:EquipmentInfo"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RegDFS:BankAccountInfo">
		<xsl:if test="position() &gt;1">
			<br/>
			<br/>
		</xsl:if>
		<xsl:text>Банк: </xsl:text>
		<xsl:value-of select="cat_ru:BankName"/>
		<br/>
		<xsl:text>счет: </xsl:text>
		<xsl:for-each select="cat_ru:BankAccount">
			<xsl:if test="position() &gt; 1">, </xsl:if>
			<xsl:value-of select="."/>
		</xsl:for-each>
		<br/>
		<xsl:text>Описание: </xsl:text>
		<xsl:apply-templates select="cat_ru:BankAccountDescription"/>
		<xsl:if test="cat_ru:BankMFO">
			<br/>
			<xsl:text>МФО </xsl:text>
			<xsl:value-of select="cat_ru:BankMFO"/>
		</xsl:if>
		<xsl:if test="cat_ru:OKPOID">
			<br/>
			<xsl:text>ОКПО </xsl:text>
			<xsl:value-of select="cat_ru:OKPOID"/>
		</xsl:if>
		<xsl:if test="cat_ru:BICID">
			<br/>
			<xsl:text>БИК </xsl:text>
			<xsl:value-of select="cat_ru:BICID"/>
		</xsl:if>
		<xsl:if test="cat_ru:SWIFTID">
			<br/>
			<xsl:text>SWIFT </xsl:text>
			<xsl:value-of select="cat_ru:SWIFTID"/>
		</xsl:if>
		<xsl:if test="cat_ru:CorrAccount">
			<br/>
			<xsl:text>Корр.счет </xsl:text>
			<xsl:value-of select="cat_ru:CorrAccount"/>
		</xsl:if>
		<xsl:if test="cat_ru:TransitCurrencyAccount">
			<br/>
			<xsl:text>Валютный (транзитный) </xsl:text>
			<xsl:for-each select="cat_ru:TransitCurrencyAccount">
				<xsl:if test="position() &gt; 1">, </xsl:if>
				<xsl:value-of select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:SpecialTransitCurrencyAccount">
			<br/>
			<xsl:text>Валютный (специальный транзитный) </xsl:text>
			<xsl:for-each select="cat_ru:SpecialTransitCurrencyAccount">
				<xsl:if test="position() &gt; 1">, </xsl:if>
				<xsl:value-of select="."/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RegDFS:FNSInfo|RegDFS:OGRNInfo">
		<xsl:if test="RegDFS:CertificateSeries">
			<xsl:text>Серия </xsl:text>
			<xsl:value-of select="RegDFS:CertificateSeries"/>
		</xsl:if>
		<xsl:if test="RegDFS:CertificateNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="RegDFS:CertificateNumber"/>
		</xsl:if>
		<xsl:if test="RegDFS:CertificateDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RegDFS:CertificateDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="comma" match="*">
		<xsl:for-each select="*">
			<xsl:if test="position() &gt; 1">, </xsl:if>
			<xsl:value-of select="."/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="text_date">
		<xsl:param name="date"/>
		<xsl:text>«</xsl:text>
		<span class="value">
			<xsl:value-of select="substring($date,9,2)"/>
		</span>
		<xsl:variable name="month" select="substring($date, 6, 2)"/>
		<xsl:text>» </xsl:text>
		<span class="value">
			<xsl:choose>
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
			</xsl:choose>
		</span>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring($date,1,2)"/>
		<span class="value">
			<xsl:value-of select="substring($date,3,2)"/>
		</span>
		<xsl:text> </xsl:text>
		<xsl:text>г.</xsl:text>
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
