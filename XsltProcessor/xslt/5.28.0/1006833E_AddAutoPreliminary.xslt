<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0"
                xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0"
                xmlns:catpi_ru="urn:customs.ru:Information:PriorInformation:PriorCommonAggregateTypes:5.28.0"
                xmlns:aap="urn:customs.ru:Information:CustomsDocuments:AddAutoPreliminary:5.28.0">





  <xsl:template match="aap:AddAutoPreliminary">
    <xsl:param name="w" select="190"/>
    <html>
      <head>
        <title>
          <xsl:text>Дополнительные сведения к предварительной информации о товарах, предполагаемых к ввозу на таможенную территорию Евразийского экономического союза автомобильным транспортом</xsl:text>
        </title>
        <style>
          body
          {background: #cccccc;
          font-family: Arial;}

          div.page
          {width: 200mm!important;
          max-width: 300mm!important;
          margin: 5px auto!important;
          margin-top: 6pt!important;
          margin-bottom: 6pt!important;
          padding: 5mm 5mm 5mm 10mm!important;
          background: #ffffff;}


          .value
          {
          border-bottom: solid 1px black;
          font-family: Arial;
          font-size: 11pt;
          font-style: italic;
          }

          td.value{
          text-align: center;
          vertical-align: bottom;
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



          table.Aclass {
          border: 1px solid black;
          margin: auto;
          width: 100%;
          border-collapse: collapse;
          table-layout: fixed;
          font-size: 12px;
          word-wrap:break-word
          }
          table.Aclass td {
          border: 1px solid black;
          border-collapse: collapse;
          text-align: center;
          }
          table.Aclass tr {
          border: 1px solid black;
          border-collapse: collapse;
          }

        </style>
      </head>

      <body>
        <div class="page">
          <table style="width: 190mm;">
            <tr>
              <td align="center">
                <h4>
                  Дополнительные сведения к предварительной информации о товарах, предполагаемых к ввозу на таможенную территорию Евразийского экономического союза автомобильным транспортом
                </h4>
              </td>
            </tr>
          </table>

          <br/>
          <br/>

          <div>
            <div class="title">Сведения о лице, подающем документ </div>
            <div style="padding-left:5mm; width: 190mm;">
              <table>
                <tr>
                  <td class="annot" style="width:50%">Наименование организации / ФИО физического лица</td>
                  <td class="value">
                    <xsl:value-of select="aap:GTDPerson/cat_ru:OrganizationName"/>
                  </td>
                </tr>
                <tr>
                  <td class="annot">Код языка для заполнения наименования</td>
                  <td class="value">
                    <xsl:value-of select="aap:GTDPerson/cat_ru:OrganizationLanguage"/>
                  </td>
                </tr>
              </table>
            </div>
          </div>

          <br/>
          <br/>

          <div>
            <div class="title">Сведения об организации. Особенности Российской Федерации</div>
            <div style="padding-left:5mm; width: 190mm;">
              <table>
                <tr>
                  <td class="annot" style="width:50%">ИНН - Индивидуальный номер налогоплательщика</td>
                  <td class="value">
                    <xsl:value-of select="aap:GTDPerson/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                  </td>
                </tr>
                <tr>
                  <td class="annot">КПП - Код причины постановки на учет</td>
                  <td class="value">
                    <xsl:value-of select="aap:GTDPerson/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                  </td>
                </tr>
              </table>
            </div>
          </div>

          <br/>
          <br/>

          <div>
            <div class="title">Сведения о транспортном средстве в Предварительной информации </div>
            <div style="padding-left:5mm; width: 190mm;">
              <table>
                <tr>
                  <td class="annot" style="width:50%">Номер операции, который был оформлен при убытии для РФ перевозчика (Временный вывоз)</td>
                  <td class="value">
                    <xsl:value-of select="aap:DepartureOprNum"/>
                  </td>
                </tr>
                <tr>
                  <td class="annot">Наличие прицепа</td>
                  <td class="value">
                    <xsl:choose>
                      <xsl:when test="aap:TransportMeansItemDetails/aap:TrailerAvailability = 1 or aap:TransportMeansItemDetails/aap:TrailerAvailability = 'true'">Есть</xsl:when>
                      <xsl:otherwise>Нет</xsl:otherwise>
                    </xsl:choose>
                  </td>
                </tr>
                <tr>
                  <td class="annot">Номер прицепа</td>
                  <td class="value">
                    <xsl:value-of select="aap:TransportMeansItemDetails/aap:TrailerNumber"/>
                  </td>
                </tr>
                <tr>
                  <td class="annot">Марка транспортного средства</td>
                  <td class="value">
                    <xsl:value-of select="aap:TransportMeansItemDetails/aap:Mark"/>
                  </td>
                </tr>
              </table>
            </div>
          </div>

          <br/>
          <br/>

          <div>
            <div class="title">Сведения о наличии на транспортном средстве запасных частей или оборудования для ремонта </div>
            <div style="padding-left:5mm; width: 190mm;">
              <table class="Aclass">
                <col width="20%"></col>
                <col width="20%"></col>
                <col width="60%"></col>

                <tr>
                  <td>
                    Код вида информации
                  </td>
                  <td>
                    Признак наличия
                  </td>
                  <td>
                    Наименование и количество
                  </td>
                </tr>
                <xsl:for-each select="aap:TransportMeansItemDetails/aap:ControlledItemsDetails">
                  <tr>
                    <td>
                      <xsl:choose>
                        <xsl:when test="catpi_ru:InformationKindCode=1">1 - припасы</xsl:when>
                        <xsl:when test="catpi_ru:InformationKindCode=2">2 - лекарственные средства, в составе которых содержатся наркотические, сильнодействующие средства, психотропные и ядовитые вещества</xsl:when>
                        <xsl:when test="catpi_ru:InformationKindCode=3">3 - опасные товары (исключая оружие и (или) боеприпасы)</xsl:when>
                        <xsl:when test="catpi_ru:InformationKindCode=4">4 - запасные части и оборудование</xsl:when>
                        <xsl:when test="catpi_ru:InformationKindCode=5">5 - оружие и (или) боеприпасы</xsl:when>
                      </xsl:choose>
                    </td>
                    <td>
                      <xsl:choose>
                        <xsl:when test="catpi_ru:PresenceIndicator=1 or catpi_ru:PresenceIndicator='true'">Есть</xsl:when>
                        <xsl:otherwise>Нет</xsl:otherwise>
                      </xsl:choose>
                    </td>
                    <td>
                      <xsl:for-each select="catpi_ru:ItemDetails">
                        <xsl:if test="position()!=1">
                          <br/>
                        </xsl:if>
                        <xsl:apply-templates select="catpi_ru:GoodsDescription"/>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates mode="quantity" select="catpi_ru:Quantity"/>
                      </xsl:for-each>
                    </td>
                  </tr>
                </xsl:for-each>
              </table>
            </div>
          </div>

          <br/>
          <br/>

          <div>
            <div class="title">Сведения о транспортном средстве в Транзитной декларации</div>
            <div style="padding-left:5mm; width: 190mm;">
              <table>
                <tr>
                  <td class="annot" style="width:95mm">Наличие прицепа</td>
                  <td class="value" style="width:95mm">
                    <xsl:choose>
                      <xsl:when test="aap:TransportMeansDetails/aap:TrailerAvailability=1 or aap:TransportMeansDetails/aap:TrailerAvailability='true'">Есть</xsl:when>
                      <xsl:otherwise>Нет</xsl:otherwise>
                    </xsl:choose>
                  </td>
                </tr>
                <tr>
                  <td class="annot">Номер прицепа</td>
                  <td class="value">
                    <xsl:value-of select="aap:TransportMeansDetails/aap:TrailerNumber"/>
                  </td>
                </tr>
                <tr>
                  <td class="annot">Тип прицепа</td>
                  <td class="value">
                    <xsl:value-of select="aap:TransportMeansDetails/aap:TrailerType"/>
                  </td>
                </tr>
                <tr>
                  <td class="annot">Страна регистрации прицепа</td>
                  <td class="value">
                    <xsl:value-of select="aap:TransportMeansDetails/aap:RegistrationCountry"/>
                  </td>
                </tr>
              </table>
            </div>
          </div>

          <br/>
          <br/>

          <div>
            <div class="title">Сведения для транспортного контроля</div>
            <div style="padding-left:5mm; width: 190mm;">
              <table>
                <tr>
                  <td class="annot" style="width:50%">Изотермический кузов</td>
                  <td class="value">
                    <xsl:choose>
                      <xsl:when test="aap:TransportControl/aap:IsothermalBody=1 or aap:TransportControl/aap:IsothermalBody='true'">Да</xsl:when>
                      <xsl:otherwise>Нет</xsl:otherwise>
                    </xsl:choose>
                  </td>
                </tr>
                <tr>
                  <td class="annot" >Количество осей транспортного средства</td>
                  <td class="value">
                    <xsl:value-of select="aap:TransportControl/aap:PinCount"/>
                  </td>
                </tr>
                <tr>
                  <td class="annot">Количество колес транспортного средства по осям</td>
                  <td class="value">
                    <xsl:value-of select="aap:TransportControl/aap:WheelQuantity"/>
                  </td>
                </tr>
              </table>
            </div>
          </div>

          <br/>
          <br/>

          <div>
            <div class="title">Сведения для документального контроля</div>
            <div style="padding-left:5mm; width: 190mm;">
              <table>
                <tr>
                  <td class="annot" style="width:50%">Водительское удостоверение</td>
                  <td class="value">
                    №
                    <xsl:value-of select="aap:DocumentControl/aap:DrivingLicense/cat_ru:PrDocumentNumber"/>
                    от
                    <xsl:call-template name="russian_date">
                      <xsl:with-param name="dateIn" select="aap:DocumentControl/aap:DrivingLicense/cat_ru:PrDocumentDate"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <tr>
                  <td class="annot">Свидетельство о регистрации транспортного средства</td>
                  <td class="value">
                    №
                    <xsl:value-of select="aap:DocumentControl/aap:VehicleRegCertificate/cat_ru:PrDocumentNumber"/>
                    от
                    <xsl:call-template name="russian_date">
                      <xsl:with-param name="dateIn" select="aap:DocumentControl/aap:VehicleRegCertificate/cat_ru:PrDocumentDate"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <tr>
                  <td class="annot">Вид перевозки</td>
                  <td class="value">
                    <xsl:value-of select="aap:DocumentControl/aap:TransportationType"/>
                  </td>
                </tr>
                <tr>
                  <td class="annot">Вид поездки</td>
                  <td class="value">
                    <xsl:value-of select="aap:DocumentControl/aap:TripType"/>
                  </td>
                </tr>
                <tr>
                  <td class="annot">Вид грузоперевозки</td>
                  <td class="value">
                    <xsl:value-of select="aap:DocumentControl/aap:CargoTransportationType"/>
                  </td>
                </tr>
              </table>
            </div>
          </div>

          <br/>
          <br/>

          <div>
            <div class="title">Сведения о разрешении на осуществление перевозки грузов</div>

            <div style="padding-left:5mm; width: 190mm;">
              <table class="Aclass">
                <tr>
                  <td>
                    Наименование документа
                  </td>
                  <td>
                    Номер документа
                  </td>
                  <td>
                    Дата документа
                  </td>
                  <td>
                    Дата окончания действия
                  </td>
                  <td>
                    Вид разрешения
                  </td>
                </tr>
                <tr>
                  <td>
                    <xsl:value-of select="aap:DocumentControl/aap:CargoTransportationPermit/cat_ru:PrDocumentName"/>
                  </td>
                  <td>
                    <xsl:value-of select="aap:DocumentControl/aap:CargoTransportationPermit/cat_ru:PrDocumentNumber"/>
                  </td>
                  <td>
                    <xsl:call-template name="russian_date">
                      <xsl:with-param name="dateIn" select="aap:DocumentControl/aap:CargoTransportationPermit/cat_ru:PrDocumentDate"/>
                    </xsl:call-template>
                  </td>
                  <td>
                    <xsl:call-template name="russian_date">
                      <xsl:with-param name="dateIn" select="aap:DocumentControl/aap:CargoTransportationPermit/aap:DocValidityDate"/>
                    </xsl:call-template>
                  </td>
                  <td>
                    <xsl:value-of select="aap:DocumentControl/aap:CargoTransportationPermit/aap:PermitType"/>
                  </td>
                </tr>
              </table>
            </div>

          </div>


          <br/>
          <br/>

          <xsl:for-each select="aap:Goods">
            <div>
              <div class="title">
                <xsl:value-of select="position()"/> Сведения о товарах
              </div>
              <div style="padding-left:5mm; width: 190mm;">
                <table>
                  <tr>
                    <td class="annot" style="width:95mm">Порядковый номер товара</td>
                    <td class="value" style="width:95mm">
                      <xsl:value-of select="aap:GoodsNumeric"/>
                    </td>
                  </tr>
                  <tr>
                    <td class="annot">Номер грузового места</td>
                    <td class="value">
                      <xsl:value-of select="aap:PakageNumber"/>
                    </td>
                  </tr>
                </table>

                <br/>
                <br/>

                <div>
                  <div class="title">Сведения для ветеринарного контроля</div>
                  <div style="padding-left:5mm;">
                    <table>
                      <tr>
                        <td class="annot" style="width:90mm">Номер идентификатора, полученного в Россельхознадзоре</td>
                        <td class="value" style="width:90mm">
                          <xsl:value-of select="aap:VeterinaryControl/aap:IDNumber"/>
                        </td>
                      </tr>
                    </table>
                  </div>
                </div>

                <br/>
                <br/>

                <div>
                  <div class="title">Сведения для санитарно-карантинного контроля</div>
                  <div style="padding-left:5mm;">
                    <table>
                      <tr>
                        <td class="annot" style="width:90mm">Область применения товара</td>
                        <td class="value" style="width:90mm">
                          <xsl:value-of select="aap:SanitaryQuarantineControl/aap:GoodsUse"/>
                        </td>
                      </tr>
                      <tr>
                        <td class="annot">Характеристика пищевых продуктов</td>
                        <td class="value">
                          <xsl:value-of select="aap:SanitaryQuarantineControl/aap:FoodGoods"/>
                        </td>
                      </tr>
                      <tr>
                        <td class="annot">Характеристика промышленных товаров</td>
                        <td class="value">
                          <xsl:value-of select="aap:SanitaryQuarantineControl/aap:PromGoods"/>
                        </td>
                      </tr>
                    </table>
                  </div>
                </div>
                
              </div>
            </div>

            <br/>
            <br/>

          </xsl:for-each>

          <div>
            <div class="title">Прилагаемые документы</div>
            <div style="padding-left:5mm; width: 190mm;">
              <table class="Aclass">
                <tr>
                  <td style="width: 10mm;">
                    № п/п
                  </td>
                  <td style="width: 30mm;">
                    Код вида документа
                  </td>
                  <td style="width: 35mm;">
                    Наименование документа
                  </td>
                  <td style="width: 25mm;">
                    Количество экземпляров
                  </td>
                  <td style="width: 25mm;">
                    Количество листов
                  </td>
                  <td style="width: 30mm;">
                    Способ предоставления документа
                  </td>
                  <td>
                    Примечание
                  </td>
                </tr>
                <xsl:for-each select="aap:InventDocument">
                  <tr>
                    <td>
                      <xsl:value-of select="position()"/>
                    </td>
                    <td>
                      <xsl:value-of select="aap:InvDocCode"/>
                    </td>
                    <td>
                      <xsl:value-of select="aap:InvDocName"/>
                      №
                      <xsl:value-of select="aap:InvDocNumber"/>
                      от
                      <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="aap:InvDocDate"/>
                      </xsl:call-template>
                    </td>
                    <td>
                      <xsl:value-of select="aap:InvDocCopies"/>
                    </td>
                    <td>
                      <xsl:value-of select="aap:InvDocLists"/>
                    </td>
                    <td>
                      <xsl:choose>
                        <xsl:when test="aap:DocumentFormSign=0">0 - в электронной форме</xsl:when>
                        <xsl:when test="aap:DocumentFormSign=1">1 - в виде бумажного документа</xsl:when>
                      </xsl:choose>
                    </td>
                    <td>
                      <xsl:if test="aap:ArchDocID">
                        ИН документа в ЭАДД -
                        <xsl:value-of select="aap:ArchDocID"/>
                      </xsl:if>
                    </td>
                  </tr>
                </xsl:for-each>
              </table>
            </div>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="*" mode="quantity">
    <xsl:apply-templates select="*[local-name() = 'GoodsQuantity']|*[local-name() = 'MeasuredAmount']"/>
    <xsl:if test="*[local-name() = 'MeasureUnitQualifierName']">
      <xsl:text> </xsl:text>
      <xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierName']"/>
    </xsl:if>
    <xsl:if test="*[local-name() = 'MeasureUnitQualifierCode']">
      <xsl:text> (</xsl:text>
      <xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierCode']"/>
      <xsl:text>)</xsl:text>
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