<?xml version="1.0" encoding="utf-8"?>
<!--Приказ ФТС России от 28.01.2019 № 103 "Об утверждении Административного регламента Федеральной таможенной службы по предоставлению таможенными органами государственной услуги ведения реестра владельцев складов временного хранения" 
ApplicationType="ВК" - Приложение 1 (Заявление о включении в реестр владельцев складов временного хранения)
(ApplicationType=ИЗ (Изменение) и ApplicationType=ИС (Исключение) сделаны по аналогии с Приложениями 2 и 3 к Приказу ФТС от 25.03.2019 № 491 (как для ApplicationFreeWarehousesRegistry))-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:RegOwn="urn:customs.ru:Information:RegistrationDocuments:ApplicationWarehouseOwnersRegistry:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0">
	<!-- Шаблон для типа ApplicationWarehouseOwnersRegistryType -->
	<xsl:template match="RegOwn:ApplicationWarehouseOwnersRegistry">
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
                  vertical-align:bottom;
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
					text-align: center;
					}

                  .bordered { border-collapse: collapse; }
                  td.bordered
                  {
                  border: solid 1px windowtext;
                  }
                  

				.delim_3 {
				height: 3pt;
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
					<table class="graphMain" width="100%">
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>
											<xsl:text>Заявление</xsl:text>
											<br/>
											<xsl:choose>
												<xsl:when test="RegOwn:ApplicationType='ВК'">
													<xsl:text>о включении в реестр владельцев складов временного хранения</xsl:text>
												</xsl:when>
												<xsl:when test="RegOwn:ApplicationType='ИЗ'">
													<xsl:text>о внесении изменений в реестр владельцев складов временного хранения</xsl:text>
												</xsl:when>
												<xsl:when test="RegOwn:ApplicationType='ИС'">
													<xsl:text>владельца склада временного хранения об исключении его из реестра владельцев складов временного хранения</xsl:text>
												</xsl:when>
											</xsl:choose>
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
												<td align="right" width="40%"/>
												<td align="right" width="15%">
													<xsl:text>Начальнику</xsl:text>
												</td>
												<td align="center" width="35%" class="value">
													<xsl:apply-templates select="RegOwn:Customs" mode="CustomsOffice"/>
												</td>
											</tr>
											<tr>
												<td colspan="2"/>
												<td class="graphLittle">
													<xsl:text>(наименование таможни)</xsl:text>
												</td>
											</tr>
											<tr>
												<td/>
												<td colspan="2" class="value" align="center">
													<xsl:apply-templates select="RegOwn:CustomsPerson" mode="PersonBase"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td colspan="2" class="graphLittle">
													<xsl:text>(инициалы, фамилия)</xsl:text>
												</td>
											</tr>
											<tr>
												<td colspan="2"/>
												<td class="value">
													<xsl:call-template name="Date">
														<xsl:with-param select="RegOwn:ApplicationDate" name="date"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td colspan="2"/>
												<td class="graphLittle">
													<xsl:text>(дата)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates mode="organizationBase" select="RegOwn:AppOrganizationInfo"/>
									<xsl:if test="RegOwn:AppOrganizationOPF">
										<xsl:text> (</xsl:text>
										<xsl:value-of select="RegOwn:AppOrganizationOPF"/>
										<xsl:text>)</xsl:text>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="graphLittle">
									<xsl:choose>
										<xsl:when test="RegOwn:ApplicationType='ВК' or RegOwn:ApplicationType='ИЗ'">
											<xsl:text>(полное наименование организации с указанием организационно-правовой формы)</xsl:text>
										</xsl:when>
										<xsl:when test="RegOwn:ApplicationType='ИС'">
											<xsl:text>(наименование организции - владельца склада временного хранения)</xsl:text>
										</xsl:when>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<xsl:choose>
								<xsl:when test="RegOwn:ApplicationType='ВК'">
									<tr>
										<td>
											<xsl:text>просит включить в реестр владельцев складов временного хранения</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates select="." mode="WarehouseInfo"/>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%">
											<xsl:text>К заявлению прилагаются следующие документы, подтверждающие заявленные сведения:</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:for-each select="RegOwn:AttachedDocuments">
												<xsl:value-of select="position()"/>
												<xsl:text>) </xsl:text>
												<xsl:apply-templates select="." mode="DocumentInfo"/>
												<xsl:text>;</xsl:text>
												<br/>
											</xsl:for-each>
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
											<xsl:text>Общее количество листов </xsl:text>
											<u>&#160;&#160;<xsl:value-of select="RegOwn:TotalSheetNumber"/>&#160;&#160;</u>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates select="RegOwn:AppOrganizationChief"/>
										</td>
									</tr>
									<tr>
										<td align="left">
											<br/>
											<br/>
											<xsl:text>М.П.</xsl:text>
											<br/>
											<br/>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="RegOwn:ApplicationType='ИЗ'">
									<tr>
										<td style="text-align: justify">
											<xsl:text>просит рассмотреть возможность внесения изменений в реестр владельцев складов временного хранения следующих сведений: </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:for-each select="RegOwn:ChangeDetails">
												<xsl:value-of select="."/>
												<!--xsl:if test="position()!=last()">
													<xsl:text> </xsl:text>
												</xsl:if-->
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="graphLittle">
											<xsl:text>(указываются сведения о владельце склада временного хранения, подлежащие изменению)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify; text-align: 5%">
											<xsl:text>К заявлению прикладываются следующие документы, подтверждающие заявленные сведения:</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:for-each select="RegOwn:AttachedDocuments">
												<xsl:value-of select="position()"/>
												<xsl:text>) </xsl:text>
												<xsl:apply-templates select="." mode="DocumentInfo"/>
												<xsl:text>;</xsl:text>
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
										<td>
											<xsl:text>Общее количество листов </xsl:text>
											<u>&#160;&#160;<xsl:value-of select="RegOwn:TotalSheetNumber"/>&#160;&#160;</u>
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
											<xsl:apply-templates select="RegOwn:AppOrganizationChief"/>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="RegOwn:ApplicationType='ИС'">
									<tr>
										<td style="text-align: justify">
											<xsl:text>В связи с </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:for-each select="RegOwn:RegistryChangeReasons">
												<xsl:value-of select="."/>
												<xsl:if test="position()!=last()">
													<xsl:text> </xsl:text>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="graphLittle">
											<xsl:text>(указывается причина прекращения деятельности в качестве владельца склада временного хранения)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>на основании подпункта 2 пункта 1  статьи 413 Таможенного кодекса Евразийского экономического союза прошу рассмотреть возможность исключения из реестра владельцев складов временного хранения.</xsl:text>
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
											<xsl:apply-templates select="RegOwn:AppOrganizationChief"/>
										</td>
									</tr>
								</xsl:when>
							</xsl:choose>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template mode="TechBase" match="*">
		<xsl:if test="RegOwn:MeanKind">
			<xsl:text>тип технического средства: </xsl:text>
			<xsl:value-of select="RegOwn:MeanKind"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="RegOwn:MeanModel">
			<xsl:text>модель: </xsl:text>
			<xsl:value-of select="RegOwn:MeanModel"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="RegOwn:MeansNumber">
			<xsl:text>кол-во:  </xsl:text>
			<xsl:value-of select="RegOwn:MeansNumber"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="RegOwn:VerificationInfo">
			<xsl:text>(поверка: </xsl:text>
			<xsl:value-of select="RegOwn:VerificationInfo/RegOwn:VerificationDetails"/>
			<xsl:if test="RegOwn:VerificationInfo/RegOwn:VerificationTerm">
				<xsl:text> срок действия: </xsl:text>
				<xsl:call-template name="russian_date">
					<xsl:with-param select="RegOwn:VerificationInfo/RegOwn:VerificationTerm" name="dateIn"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:text>) </xsl:text>
		</xsl:if>
		<xsl:for-each select="RegOwn:MeanDetails">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="RegOwn:InsuranceAgreement">
		<xsl:if test="RegOwn:AgreemNumber">
			<xsl:text> №  </xsl:text>
			<xsl:value-of select="RegOwn:AgreemNumber"/>
		</xsl:if>
		<xsl:if test="RegOwn:AgreemDate">
			<xsl:text> от   </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param select="RegOwn:AgreemDate" name="dateIn"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="RegOwn:AgreemTill">
			<xsl:text>, срок действия до:    </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param select="RegOwn:AgreemTill" name="dateIn"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="RegOwn:InsurSum">
			<xsl:text>, общая сумма страхования: </xsl:text>
			<xsl:value-of select="RegOwn:InsurSum"/>
			<xsl:text>, руб.</xsl:text>
		</xsl:if>
		<xsl:if test="RegOwn:InsurCompanyName">
			<xsl:text> страховая компания: </xsl:text>
			<xsl:value-of select="RegOwn:InsurCompanyName"/>
		</xsl:if>
		<xsl:if test="RegOwn:InsurCompanyINN">
			<xsl:text>, ИНН: </xsl:text>
			<xsl:value-of select="RegOwn:InsurCompanyINN"/>
		</xsl:if>
		<xsl:if test="RegOwn:InsurCompanyKPP">
			<xsl:text>, КПП: </xsl:text>
			<xsl:value-of select="RegOwn:InsurCompanyKPP"/>
		</xsl:if>
		<xsl:if test="RegOwn:InsurCompanyOGRN">
			<xsl:text>, ОГРН: </xsl:text>
			<xsl:value-of select="RegOwn:InsurCompanyOGRN"/>
		</xsl:if>
		<xsl:if test="RegOwn:InsurCertificate">
			<xsl:text>, лицензия: </xsl:text>
			<xsl:apply-templates select="RegOwn:InsurCertificate" mode="Certificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="DocumentInfo" match="*">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> №  </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от   </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param select="cat_ru:PrDocumentDate" name="dateIn"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="RegOwn:DocCode">
			<xsl:text> (код: </xsl:text>
			<xsl:value-of select="RegOwn:DocCode"/>
			<xsl:text>) </xsl:text>
		</xsl:if>
		<xsl:if test="RegOwn:PrDocumentTerm">
			<xsl:text>, срок действия до:    </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param select="RegOwn:PrDocumentTerm" name="dateIn"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="RegOwn:DocumentIssueAgency">
			<xsl:text> </xsl:text>
			<xsl:value-of select="RegOwn:DocumentIssueAgency"/>
		</xsl:if>
		<xsl:if test="RegOwn:DocumentSheetNumber">
			<xsl:text> &#8212; </xsl:text>
			<xsl:value-of select="RegOwn:DocumentSheetNumber"/>
			<xsl:text> л.</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="CollateralDocument" match="*">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> №  </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от   </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param select="cat_ru:PrDocumentDate" name="dateIn"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="RegOwn:Amount">
			<xsl:text> </xsl:text>
			<xsl:value-of select="RegOwn:Amount"/>
			<xsl:text> </xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="OwnershipConfirmInfo" match="*">
		<xsl:value-of select="RegOwn:PropObjectName"/>
		<xsl:if test="RegOwn:PropObjectPurpose">
			<xsl:text> </xsl:text>
			<xsl:value-of select="RegOwn:PropObjectPurpose"/>
		</xsl:if>
		<xsl:if test="RegOwn:PropObjectArea">
			<xsl:text>, площадь: </xsl:text>
			<xsl:apply-templates select="RegOwn:PropObjectArea" mode="supQuantity"/>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="RegOwn:OwnStoragePlace">
				<xsl:text>, в собственности, </xsl:text>
				<xsl:apply-templates select="RegOwn:OwnStoragePlace"/>
			</xsl:when>
			<xsl:when test="RegOwn:RentStoragePlace">
				<xsl:text>, в аренде, </xsl:text>
				<xsl:apply-templates select="RegOwn:RentStoragePlace"/>
			</xsl:when>
			<xsl:when test="RegOwn:OperManagementStoragePlace">
				<xsl:text>, в хозяйственном владении / оперативном управлении, </xsl:text>
				<xsl:apply-templates mode="Manage" select="RegOwn:OperManagementStoragePlace"/>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="RegOwn:PropObjectDetails">
			<xsl:text> </xsl:text>
			<xsl:value-of select="RegOwn:PropObjectDetails"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RegOwn:OwnStoragePlace">
		<xsl:apply-templates select="RegOwn:OwnershipCertificate" mode="Certificate"/>
		<xsl:choose>
			<xsl:when test="RegOwn:EncumbrancesIndicator='true' or RegOwn:EncumbrancesIndicator='t'  or RegOwn:EncumbrancesIndicator='1'">
				<xsl:text> (с обременениями</xsl:text>
			</xsl:when>
			<xsl:when test="RegOwn:EncumbrancesIndicator='false' or RegOwn:EncumbrancesIndicator='f'  or RegOwn:EncumbrancesIndicator='0'">
				<xsl:text> (без обременений</xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="not(RegOwn:EncumbrancesDetails)">
			<xsl:text>)</xsl:text>
		</xsl:if>
		<xsl:if test="RegOwn:EncumbrancesDetails">
			<xsl:text>: </xsl:text>
			<xsl:value-of select="RegOwn:EncumbrancesDetails"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RegOwn:RentStoragePlace">
		<xsl:choose>
			<xsl:when test="RegOwn:TempIndicator='true' or RegOwn:TempIndicator='t' or RegOwn:TempIndicator='1'">
				<xsl:text>временное владение и пользование, </xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:apply-templates select="RegOwn:RentAgreement" mode="RentAgreement"/>
		<xsl:if test="RegOwn:AgreementDetails">
			<xsl:text>, условия аренды: </xsl:text>
			<xsl:value-of select="RegOwn:AgreementDetails"/>
		</xsl:if>
		<xsl:if test="RegOwn:PermittedUsing">
			<xsl:text>, разрешенное использование: </xsl:text>
			<xsl:value-of select="RegOwn:PermittedUsing"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="Manage" match="*">
		<xsl:choose>
			<xsl:when test="RegOwn:Certificate">
				<xsl:apply-templates select="RegOwn:Certificate" mode="Certificate"/>
			</xsl:when>
			<xsl:when test="RegOwn:Agreement">
				<xsl:apply-templates select="RegOwn:Agreement" mode="RentAgreement"/>
			</xsl:when>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:value-of select="RegOwn:OperManagementNotes"/>
	</xsl:template>
	<xsl:template mode="RentAgreement" match="*">
		<xsl:text> договор: </xsl:text>
		<xsl:if test="RegOwn:AgreemNumber">
			<xsl:text> №  </xsl:text>
			<xsl:value-of select="RegOwn:AgreemNumber"/>
		</xsl:if>
		<xsl:if test="RegOwn:AgreemDate">
			<xsl:text> от   </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param select="RegOwn:AgreemDate" name="dateIn"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="RegOwn:AgreemTill">
			<xsl:text>, срок действия до:    </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param select="RegOwn:AgreemTill" name="dateIn"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="RegOwn:RegistryAgreemNumber or RegOwn:RegistryAgreemDate">
			<xsl:text> (по Росреестру: </xsl:text>
			<xsl:if test="RegOwn:RegistryAgreemNumber">
				<xsl:text> №  </xsl:text>
				<xsl:value-of select="RegOwn:RegistryAgreemNumber"/>
			</xsl:if>
			<xsl:if test="RegOwn:RegistryAgreemDate">
				<xsl:text> от   </xsl:text>
				<xsl:call-template name="russian_date">
					<xsl:with-param select="RegOwn:RegistryAgreemDate" name="dateIn"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="Certificate" match="*">
		<xsl:if test="RegOwn:CertificateSeries">
			<xsl:text> серия </xsl:text>
			<xsl:value-of select="RegOwn:CertificateSeries"/>
		</xsl:if>
		<xsl:if test="RegOwn:CertificateNumber">
			<xsl:text> №  </xsl:text>
			<xsl:value-of select="RegOwn:CertificateNumber"/>
		</xsl:if>
		<xsl:if test="RegOwn:CertificateDate">
			<xsl:text> от   </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param select="RegOwn:CertificateDate" name="dateIn"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="RegOwn:CertificateAgency">
			<xsl:text> </xsl:text>
			<xsl:value-of select="RegOwn:CertificateAgency"/>
		</xsl:if>
		<xsl:if test="RegOwn:CertificateTerm">
			<xsl:text>, срок действия до     </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param select="RegOwn:CertificateTerm" name="dateIn"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="supQuantity" match="*">
		<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="bankInfo">
		<xsl:value-of select="cat_ru:BankName"/>
		<xsl:if test="cat_ru:BankAccount">
			<xsl:text> номер счета: </xsl:text>
			<xsl:for-each select="cat_ru:BankAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:BankAccountDescription">
			<xsl:text> тип счета: </xsl:text>
			<xsl:for-each select="cat_ru:BankAccountDescription">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()"> </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:BankMFO">
			<xsl:text> МФО: </xsl:text>
			<xsl:value-of select="cat_ru:BankMFO"/>
		</xsl:if>
		<xsl:if test="cat_ru:OKPOID">
			<xsl:text> ОКПО: </xsl:text>
			<xsl:value-of select="cat_ru:OKPOID"/>
		</xsl:if>
		<xsl:if test="cat_ru:BICID">
			<xsl:text> БИК: </xsl:text>
			<xsl:value-of select="cat_ru:BICID"/>
		</xsl:if>
		<xsl:if test="cat_ru:SWIFTID">
			<xsl:text> SWIFT: </xsl:text>
			<xsl:value-of select="cat_ru:SWIFTID"/>
		</xsl:if>
		<xsl:if test="cat_ru:CorrAccount">
			<xsl:text> корр.счет: </xsl:text>
			<xsl:value-of select="cat_ru:CorrAccount"/>
		</xsl:if>
		<xsl:if test="cat_ru:TransitCurrencyAccount">
			<xsl:text> валютный счет (транзитный): </xsl:text>
			<xsl:for-each select="cat_ru:TransitCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:SpecialTransitCurrencyAccount">
			<xsl:text> валютный счет (специальный транзитный): </xsl:text>
			<xsl:for-each select="cat_ru:SpecialTransitCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="PersonBase">
		<xsl:if test="cat_ru:PersonPost">
			<xsl:value-of select="cat_ru:PersonPost"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonSurname">
			<xsl:text>&#160;</xsl:text>
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
	<xsl:template mode="addressStr" match="*">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="Contact" match="*">
		<xsl:if test="cat_ru:Phone"> Тел: <xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>,&#032;</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">Факс: <xsl:value-of select="cat_ru:Fax"/>,&#032;</xsl:if>
		<xsl:if test="cat_ru:Telex">Телекс: <xsl:value-of select="cat_ru:Telex"/>,&#032;</xsl:if>
		<xsl:if test="cat_ru:E_mail">Email: <xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">,&#032;</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="orgName" match="*">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0"> (</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">)</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="organizationBase" match="*">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0"> (</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">)</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures and (cat_ru:OrganizationName or cat_ru:ShortName)">&#032;<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="organizationFull" match="*">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0"> (</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">)</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures and (cat_ru:OrganizationName or cat_ru:ShortName)">&#032;<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="cat_ru:OKPOID">,&#032;ОКПО:&#032;<xsl:value-of select="cat_ru:OKPOID"/>
		</xsl:if>
		<xsl:if test="cat_ru:OKATOCode">,&#032;ОКАТО:&#032;<xsl:value-of select="cat_ru:OKATOCode"/>
		</xsl:if>
		<xsl:if test="cat_ru:Contact">,&#032;<xsl:apply-templates select="cat_ru:Contact" mode="Contact"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RegOwn:AppOrganizationChief">
		<table class="graphMain" width="100%">
			<tbody>
				<tr>
					<td width="40%">
						<xsl:text>Руководитель организации</xsl:text>
					</td>
					<td class="value" width="15%"/>
					<td width="5%"/>
					<td align="center" class="value" width="40%">
						<xsl:apply-templates select="." mode="PersonBase"/>
					</td>
				</tr>
				<tr>
					<td/>
					<td class="graphLittle">
						<xsl:text>(подпись)</xsl:text>
					</td>
					<td/>
					<td class="graphLittle">
						<xsl:text>(фамилия, инициалы)</xsl:text>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="Date">
		<xsl:param name="date"/>
		<table>
			<tbody align="center" class="graphMain">
				<tr>
					<td width="2%" align="right">" </td>
					<td width="13%" class="border_bottom">
						<xsl:value-of select="substring($date,9,2)"/>
					</td>
					<td width="2%" align="left"> "</td>
					<td width="3%"> </td>
					<td width="58%" class="border_bottom">
						<xsl:variable name="month" select="substring($date, 6, 2)"/>
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
					</td>
					<td width="5%"> </td>
					<td width="2%" align="right">
						<xsl:choose>
							<xsl:when test="substring($date,1,2)">
								<xsl:value-of select="substring($date,1,2)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>20</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td width="9%" class="border_bottom" align="left">
						<xsl:value-of select="substring($date,3,2)"/>
					</td>
					<td width="4%"> </td>
					<td width="2%"> г. </td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="*" mode="CustomsReceip">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="RegOwn:DocNumberPrefix"/>
		<xsl:text>-</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
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
	<xsl:template mode="WarehouseInfo" match="*">
		<table class="graphMain" width="100%">
			<tbody>
				<tr>
					<td width="5%"/>
					<td width="55%"/>
					<td width="40%"/>
				</tr>
				<tr>
					<td class="bordered" align="center" colspan="3">
						<b><xsl:text>I. Сведения о заявителе</xsl:text></b>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center">
						<xsl:text>1</xsl:text>
					</td>
					<td class="bordered">
						<xsl:text>Организационно-правовая форма, полное и сокращенное наименование юридического лица</xsl:text>
					</td>
					<td class="bordered">
						<xsl:if test="RegOwn:AppOrganizationOPF">
							<xsl:value-of select="RegOwn:AppOrganizationOPF"/>
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:apply-templates mode="orgName" select="RegOwn:AppOrganizationInfo"/>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center">
						<xsl:text>2</xsl:text>
					</td>
					<td class="bordered">
						<xsl:text>Место нахождения юридического лица</xsl:text>
					</td>
					<td class="bordered">
						<xsl:apply-templates mode="addressStr" select="RegOwn:AppOrganizationInfo/cat_ru:Address"/>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center">
						<xsl:text>3</xsl:text>
					</td>
					<td class="bordered">
						<xsl:text>Банковские счета юридического лица, которые будут им использоваться при осуществлении деятельности в качестве владельца склада временного хранения</xsl:text>
					</td>
					<td class="bordered">
						<xsl:for-each select="RegOwn:BankAccountInfo">
							<xsl:value-of select="position()"/>
							<xsl:text>) </xsl:text>
							<xsl:apply-templates select="." mode="bankInfo"/>
							<xsl:if test="position()!=last()">
								<xsl:text>; </xsl:text>
								<br/>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center">
						<xsl:text>4</xsl:text>
					</td>
					<td class="bordered">
						<xsl:text>Идентификационный номер налогоплательщика юридического лица</xsl:text>
					</td>
					<td class="bordered">
						<xsl:value-of select="RegOwn:AppOrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center">
						<xsl:text>5</xsl:text>
					</td>
					<td class="bordered">
						<xsl:text>Серия, номер и дата выдачи свидетельства о постановке на налоговый учет юридического лица</xsl:text>
					</td>
					<td class="bordered">
						<xsl:apply-templates mode="Certificate" select="RegOwn:INNCertificate"/>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center">
						<xsl:text>6</xsl:text>
					</td>
					<td class="bordered">
						<xsl:text>Номер и дата выдачи свидетельства о внесении записи в Единый государственный реестр юридических лиц</xsl:text>
					</td>
					<td class="bordered">
						<xsl:apply-templates mode="Certificate" select="RegOwn:EGRULCertificate"/>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center">
						<xsl:text>7</xsl:text>
					</td>
					<td class="bordered">
						<xsl:text>Сведения о договоре страхования риска гражданской ответственности</xsl:text>
					</td>
					<td class="bordered">
						<xsl:apply-templates select="RegOwn:InsuranceAgreement"/>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center">
						<xsl:text>8</xsl:text>
					</td>
					<td class="bordered">
						<xsl:text>Сведения о документах, подтверждающих предоставление обеспечения уплаты таможенных пошлин, налогов</xsl:text>
					</td>
					<td class="bordered">
						<xsl:for-each select="RegOwn:GuaranteeDocuments">
							<xsl:value-of select="position()"/>
							<xsl:text>) </xsl:text>
							<xsl:apply-templates mode="DocumentInfo" select="."/>
							<xsl:if test="RegOwn:Customs">
								<xsl:text> таможенный орган: </xsl:text>
								<xsl:apply-templates select="RegOwn:Customs" mode="CustomsOffice"/>
							</xsl:if>
							<xsl:if test="RegOwn:GuaranteeAmount">
								<xsl:text>, сумма документа:  </xsl:text>
								<xsl:value-of select="RegOwn:GuaranteeAmount"/>
								<xsl:text> руб.</xsl:text>
							</xsl:if>
							<xsl:if test="RegOwn:DocumentDetails">
								<xsl:text>, сведения о гос. регистрации:  </xsl:text>
								<xsl:value-of select="RegOwn:DocumentDetails"/>
							</xsl:if>
							<xsl:choose>
								<xsl:when test="RegOwn:GuaranteeInfoBank">
									<xsl:text>, банковская гарантия: </xsl:text>
									<xsl:value-of select="RegOwn:GuaranteeInfoBank/RegOwn:BankName"/>
									<xsl:if test="RegOwn:GuaranteeInfoBank/RegOwn:BankINN">
										<xsl:text>, ИНН: </xsl:text>
										<xsl:value-of select="RegOwn:GuaranteeInfoBank/RegOwn:BankINN"/>
									</xsl:if>
								</xsl:when>
								<xsl:when test="RegOwn:PropCollateral">
									<xsl:text>, залог имущества: </xsl:text>
									<xsl:value-of select="RegOwn:PropCollateral/RegOwn:GuarantName"/>
									<xsl:if test="RegOwn:PropCollateral/RegOwn:GuarantINN">
										<xsl:text>, ИНН: </xsl:text>
										<xsl:value-of select="RegOwn:PropCollateral/RegOwn:GuarantINN"/>
									</xsl:if>
									<xsl:text> </xsl:text>
									<xsl:value-of select="RegOwn:PropCollateral/RegOwn:GuarantDetails"/>
								</xsl:when>
								<xsl:when test="RegOwn:Surety">
									<xsl:text>, поручительство: </xsl:text>
									<xsl:value-of select="RegOwn:PropCollateral/RegOwn:GuarantName"/>
									<xsl:if test="RegOwn:PropCollateral/RegOwn:GuarantINN">
										<xsl:text>, ИНН: </xsl:text>
										<xsl:value-of select="RegOwn:PropCollateral/RegOwn:GuarantINN"/>
									</xsl:if>
									<xsl:text> </xsl:text>
									<xsl:value-of select="RegOwn:PropCollateral/RegOwn:GuarantDetails"/>
								</xsl:when>
								<xsl:when test="RegOwn:CashCollateral">
									<xsl:text>, денежный залог (ТР: </xsl:text>
									<xsl:apply-templates select="RegOwn:CashCollateral/RegOwn:CustomsReceiptRegNumber" mode="CustomsReceip"/>
									<xsl:text>)</xsl:text>
								</xsl:when>
							</xsl:choose>
							<xsl:if test="position()!=last()">
								<xsl:text>; </xsl:text>
								<br/>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center">
						<xsl:text>9</xsl:text>
					</td>
					<td class="bordered">
						<xsl:text>Сведения о документах, подтверждающих право владения предназначенными для использования в качестве склада временного хранения помещениями и (или) открытыми площадками, а также прилегающей к складу временного хранения территорией</xsl:text>
					</td>
					<td class="bordered">
						<xsl:for-each select="RegOwn:OwnershipConfirmDocuments">
							<xsl:value-of select="position()"/>
							<xsl:text>) </xsl:text>
							<xsl:apply-templates select="." mode="OwnershipConfirmInfo"/>
							<xsl:if test="position()!=last()">
								<xsl:text>; </xsl:text>
								<br/>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center">
						<xsl:text>10</xsl:text>
					</td>
					<td class="bordered">
						<xsl:text>Сведения о разрешительных документах, подтверждающих право юридического лица осуществлять хранение товаров отдельных категорий</xsl:text>
					</td>
					<td class="bordered">
						<xsl:for-each select="RegOwn:PermitWarehouseDocuments">
							<xsl:value-of select="position()"/>
							<xsl:text>) </xsl:text>
							<xsl:apply-templates mode="DocumentInfo" select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>; </xsl:text>
								<br/>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center" colspan="3">
						<b><xsl:text> II. Сведения о помещениях и (или) открытых площадках, предназначенных для использования в качестве склада временного хранения</xsl:text></b>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center">
						<xsl:text>11</xsl:text>
					</td>
					<td class="bordered">
						<xsl:text>Тип склада временного хранения</xsl:text>
						<br>
						<xsl:text>Товары, принимаемые на хранение (для СВХ закрытого типа)</xsl:text>
						</br>
					</td>
					<td class="bordered">
						<xsl:choose>
							<xsl:when test="RegOwn:WarehouseType/RegOwn:WarehouseKindIndicator='true' or RegOwn:WarehouseType/RegOwn:WarehouseKindIndicator='t' or RegOwn:WarehouseType/RegOwn:WarehouseKindIndicator='1'">
								<xsl:text>Открытый</xsl:text>
							</xsl:when>
							<xsl:when test="RegOwn:WarehouseType/RegOwn:WarehouseKindIndicator='false' or RegOwn:WarehouseType/RegOwn:WarehouseKindIndicator='f' or RegOwn:WarehouseType/RegOwn:WarehouseKindIndicator='0'">
								<xsl:text>Закрытый</xsl:text>
							</xsl:when>
						</xsl:choose>
						<br/>
						<xsl:choose>
							<xsl:when test="RegOwn:WarehouseType/RegOwn:StoreGoodsIndicator='true' or RegOwn:WarehouseType/RegOwn:StoreGoodsIndicator='t' or RegOwn:WarehouseType/RegOwn:StoreGoodsIndicator='1'">
								<xsl:text>определенные товары</xsl:text>
							</xsl:when>
							<xsl:when test="RegOwn:WarehouseType/RegOwn:StoreGoodsIndicator='false' or RegOwn:WarehouseType/RegOwn:StoreGoodsIndicator='f' or RegOwn:WarehouseType/RegOwn:StoreGoodsIndicator='0'">
								<xsl:text>товары владельца склада</xsl:text>
							</xsl:when>
						</xsl:choose>
						<xsl:if test="RegOwn:WarehouseType/RegOwn:StoreGoodsDetails">
							<br/>
							<xsl:value-of select="RegOwn:WarehouseType/RegOwn:StoreGoodsDetails"/>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center">
						<xsl:text>12</xsl:text>
					</td>
					<td class="bordered">
						<xsl:text>Общая площадь склада временного хранения, площадь и полезный объем помещения, площадь и полезная площадь открытой площадки, площадь прилегающей к складу временного хранения территории</xsl:text>
					</td>
					<td class="bordered">
						<xsl:for-each select="RegOwn:WarehouseAreaMeasure">
							<xsl:if test="RegOwn:IndoorArea">
								<xsl:text> площадь помещения: </xsl:text>
								<xsl:apply-templates mode="supQuantity" select="RegOwn:IndoorArea"/>
							</xsl:if>
							<xsl:if test="RegOwn:IndoorUsefulVolume">
								<xsl:text> полезный объем помещения: </xsl:text>
								<xsl:apply-templates mode="supQuantity" select="RegOwn:IndoorUsefulVolume"/>
							</xsl:if>
							<xsl:if test="RegOwn:OutdoorArea">
								<xsl:text> площадь открытой площадки: </xsl:text>
								<xsl:apply-templates mode="supQuantity" select="RegOwn:OutdoorArea"/>
							</xsl:if>
							<xsl:if test="RegOwn:OutdoorUsefulArea">
								<xsl:text> полезная площадь открытой площадки: </xsl:text>
								<xsl:apply-templates mode="supQuantity" select="RegOwn:OutdoorUsefulArea"/>
							</xsl:if>
							<xsl:if test="RegOwn:AdjacentArea">
								<xsl:text> площадь прилегающей территории: </xsl:text>
								<xsl:apply-templates mode="supQuantity" select="RegOwn:AdjacentArea"/>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center">
						<xsl:text>13</xsl:text>
					</td>
					<td class="bordered">
						<xsl:text>Обеспечение сохранности товаров, исключения доступа к ним посторонних лиц (не являющихся работниками склада, не обладающих полномочиями в отношении товаров и не являющихся представителями лиц, обладающих такими полномочиями), возможности проведения в отношении товаров таможенного контроля</xsl:text>
					</td>
					<td class="bordered">
						<xsl:value-of select="RegOwn:GoodsSafety"/>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center">
						<xsl:text>14</xsl:text>
					</td>
					<td class="bordered">
						<xsl:text>Обустройство и оборудование прилегающей к складу временного хранения прилегающей территории, тип покрытия</xsl:text>
					</td>
					<td class="bordered">
						<xsl:for-each select="RegOwn:WarehouseEquipment">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text> </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center">
						<xsl:text>15</xsl:text>
					</td>
					<td class="bordered">
						<xsl:text>Подъездные пути к складу временного хранения, удаленность от автомагистралей, железнодорожных станций, аэропортов, морских (речных) портов, вид транспорта, которым возможна доставка товаров на склад временного хранения</xsl:text>
					</td>
					<td class="bordered">
						<xsl:for-each select="RegOwn:WarehouseAccess">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text> </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center">
						<xsl:text>16</xsl:text>
					</td>
					<td class="bordered">
						<xsl:text>Обустройство и оборудование места для проведения таможенного досмотра товаров и транспортных средств</xsl:text>
					</td>
					<td class="bordered">
						<xsl:for-each select="RegOwn:InspectionEquipment">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text> </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center">
						<xsl:text>17</xsl:text>
					</td>
					<td class="bordered">
						<xsl:text>Неразрывность территории склада временного хранения по периметру, ограждение открытой площадки и прилегающей к складу временного хранения территории</xsl:text>
					</td>
					<td class="bordered">
						<xsl:choose>
							<xsl:when test="RegOwn:PerimeterContinuity/RegOwn:ContinuityIndicator='true' or RegOwn:PerimeterContinuity/RegOwn:ContinuityIndicator='t'  or RegOwn:PerimeterContinuity/RegOwn:ContinuityIndicator='1'">
								<xsl:text>обеспечена</xsl:text>
							</xsl:when>
							<xsl:when test="RegOwn:PerimeterContinuity/RegOwn:ContinuityIndicator='false' or RegOwn:PerimeterContinuity/RegOwn:ContinuityIndicator='f'  or RegOwn:PerimeterContinuity/RegOwn:ContinuityIndicator='0'">
								<xsl:text>не обеспечена</xsl:text>
							</xsl:when>
						</xsl:choose>
						<xsl:if test="RegOwn:PerimeterContinuity/RegOwn:ContinuityDetails">
							<br/>
							<xsl:for-each select="RegOwn:PerimeterContinuity/RegOwn:ContinuityDetails">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text> </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center">
						<xsl:text>18</xsl:text>
					</td>
					<td class="bordered">
						<xsl:text>Обустройство и оборудование контрольно-пропускных пунктов, наличие соответствующих средств обеспечения контроля за перемещением товаров и транспортных средств через границы территории склада временного хранения</xsl:text>
					</td>
					<td class="bordered">
						<xsl:for-each select="RegOwn:KppEquipment">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text> </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center">
						<xsl:text>19</xsl:text>
					</td>
					<td class="bordered">
						<xsl:text>Оборудование склада временного хранения техническими средствами таможенного контроля делящихся и радиоактивных материалов</xsl:text>
					</td>
					<td class="bordered">
						<xsl:for-each select="RegOwn:RadioactivityControlEquipment">
							<xsl:value-of select="position()"/>
							<xsl:text>) </xsl:text>
							<xsl:apply-templates select="." mode="TechBase"/>
							<xsl:if test="position()!=last()">
								<xsl:text>; </xsl:text>
								<br/>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center">
						<xsl:text>20</xsl:text>
					</td>
					<td class="bordered">
						<xsl:text>Оборудование склада временного хранения досмотровой рентгеновской техники</xsl:text>
					</td>
					<td class="bordered">
						<xsl:for-each select="RegOwn:XRayInspectionEquipment">
							<xsl:value-of select="position()"/>
							<xsl:text>) </xsl:text>
							<xsl:apply-templates select="." mode="TechBase"/>
							<xsl:if test="RegOwn:XRayCertificate">
								<xsl:text>, лицензия: </xsl:text>
								<xsl:apply-templates select="RegOwn:XRayCertificate" mode="Certificate"/>
							</xsl:if>
							<xsl:if test="RegOwn:SanitaryCertificate">
								<xsl:text>, санитарно-эпидемологическое заключение: </xsl:text>
								<xsl:apply-templates select="RegOwn:XRayCertificate" mode="Certificate"/>
							</xsl:if>
							<xsl:if test="position()!=last()">
								<xsl:text>; </xsl:text>
								<br/>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center">
						<xsl:text>21</xsl:text>
					</td>
					<td class="bordered">
						<xsl:text>Весовое оборудование, предназначенное для использования на складе временного хранения</xsl:text>
					</td>
					<td class="bordered">
						<xsl:for-each select="RegOwn:WeighingEquipment">
							<xsl:value-of select="position()"/>
							<xsl:text>) </xsl:text>
							<xsl:apply-templates select="." mode="TechBase"/>
							<xsl:if test="RegOwn:VerificationCertificate">
								<xsl:text>,свидетельство о поверке: </xsl:text>
								<xsl:apply-templates select="RegOwn:VerificationCertificate" mode="Certificate"/>
							</xsl:if>
							<xsl:if test="RegOwn:WeightCapacity">
								<xsl:text>, грузоподъемность: </xsl:text>
								<xsl:apply-templates select="RegOwn:WeightCapacity" mode="supQuantity"/>
							</xsl:if>
							<xsl:if test="position()!=last()">
								<xsl:text>; </xsl:text>
								<br/>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center">
						<xsl:text>22</xsl:text>
					</td>
					<td class="bordered">
						<xsl:text>Используемая на складе временного хранения автоматизированной системы учета товаров</xsl:text>
					</td>
					<td class="bordered">
						<xsl:value-of select="RegOwn:GoodsAccountingSystem"/>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center">
						<xsl:text>23</xsl:text>
					</td>
					<td class="bordered">
						<xsl:text>Оборудование склада временного хранения телефонной связью, компьютерной, множительной техникой</xsl:text>
					</td>
					<td class="bordered">
						<xsl:value-of select="RegOwn:CommunicationSystems"/>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center">
						<xsl:text>24</xsl:text>
					</td>
					<td class="bordered">
						<xsl:text>Обеспечение информационного взаимодействия между владельцем склада временного хранения и таможенным органом посредством личного кабинета</xsl:text>
					</td>
					<td class="bordered">
						<xsl:if test="RegOwn:PersonalCabinetRegDateTime">
							<xsl:text>Дата и время регистрации участника ВЭД в личном кабинете: </xsl:text>
						</xsl:if>
						<br/>
						<xsl:call-template name="russian_date">
							<xsl:with-param select="RegOwn:PersonalCabinetRegDateTime" name="dateIn"/>
						</xsl:call-template>
						<xsl:text> </xsl:text>
						<xsl:value-of select="substring(RegOwn:PersonalCabinetRegDateTime,12,8)"/>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center">
						<xsl:text>25</xsl:text>
					</td>
					<td class="bordered">
						<xsl:text>Оборудование склада временного хранения погрузо-разгрузочной техникой</xsl:text>
					</td>
					<td class="bordered">
						<xsl:for-each select="RegOwn:LoadingEquipment">
							<xsl:value-of select="position()"/>
							<xsl:text>) </xsl:text>
							<xsl:apply-templates select="." mode="TechBase"/>
							<xsl:if test="RegOwn:WeightCapacity">
								<xsl:text>, грузоподъемность: </xsl:text>
								<xsl:apply-templates select="RegOwn:WeightCapacity" mode="supQuantity"/>
							</xsl:if>
							<xsl:if test="RegOwn:StateRegCertificate">
								<xsl:text>, государственный регистрационный знак: </xsl:text>
								<xsl:apply-templates select="RegOwn:StateRegCertificate" mode="Certificate"/>
							</xsl:if>
							<xsl:if test="position()!=last()">
								<xsl:text>; </xsl:text>
								<br/>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
				<tr>
					<td class="bordered" align="center">
						<xsl:text>26</xsl:text>
					</td>
					<td class="bordered">
						<xsl:text>Возможность хранения товаров, требующих особых условий хранения, возможность поддержания в помещении склада временного хранения определенного температурного режима</xsl:text>
					</td>
					<td class="bordered">
						<xsl:value-of select="RegOwn:StoreSpecialConditions"/>
					</td>
				</tr>
			</tbody>
		</table>
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
