CREATE TABLE [dbo].[taxi-green] (
    [vendorID]             INT            NULL,
    [lpepPickupDatetime]   DATETIME2 (7)  NULL,
    [lpepDropoffDatetime]  DATETIME2 (7)  NULL,
    [passengerCount]       INT            NULL,
    [tripDistance]         DECIMAL(19,4)     NULL,
    [puLocationId]         NVARCHAR (10) NULL,
    [doLocationId]         NVARCHAR (10) NULL,
    [pickupLongitude]      FLOAT (24)     NULL,
    [pickupLatitude]       FLOAT (24)     NULL,
    [dropoffLongitude]     FLOAT (24)     NULL,
    [dropoffLatitude]      FLOAT (24)     NULL,
    [rateCodeID]           INT            NULL,
    [storeAndFwdFlag]      NVARCHAR (1) NULL,
    [paymentType]          INT            NULL,
    [fareAmount]           MONEY     NULL,
    [extra]                MONEY     NULL,
    [mtaTax]               MONEY     NULL,
    [improvementSurcharge] MONEY     NULL,
    [tipAmount]            MONEY     NULL,
    [tollsAmount]          MONEY     NULL,
    [ehailFee]             MONEY     NULL,
    [totalAmount]          MONEY     NULL,
    [tripType]             INT            NULL,
    [puYear]               INT            NULL,
    [puMonth]              INT            NULL
)
WITH (HEAP, DISTRIBUTION = ROUND_ROBIN);


GO

