-- 72db23600bb4b4d3859a43d3e0fa39c5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemNameLabel" )
require( "ui.uieditor.widgets.CAC.cac_LockBig" )

CoD.browseCollectibleInspectionArea = InheritFrom( LUI.UIElement )
CoD.browseCollectibleInspectionArea.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.browseCollectibleInspectionArea )
	self.id = "browseCollectibleInspectionArea"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 772 )
	self:setTopBottom( true, false, 0, 490 )
	self.anyChildUsesUpdateState = true
	
	local extracam = LUI.UIImage.new()
	extracam:setLeftRight( true, false, 59.25, 867.25 )
	extracam:setTopBottom( true, false, 34.5, 490 )
	extracam:setRGB( 0.48, 0.48, 0.48 )
	extracam:setMaterial( LUI.UIImage.GetCachedMaterial( "extracam_2" ) )
	extracam:setShaderVector( 0, 0, 0, 1, 1 )
	extracam:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( extracam )
	self.extracam = extracam
	
	local nameLabel = CoD.InfoPaneItemNameLabel.new( menu, controller )
	nameLabel:setLeftRight( true, false, 0, 317.5 )
	nameLabel:setTopBottom( true, false, 0.5, 34.5 )
	nameLabel:linkToElementModel( self, "longName", true, function ( model )
		local longName = Engine.GetModelValue( model )
		if longName then
			nameLabel.itemName:setText( Engine.Localize( longName ) )
		end
	end )
	self:addElement( nameLabel )
	self.nameLabel = nameLabel
	
	local location = LUI.UIText.new()
	location:setLeftRight( true, false, 0, 271.5 )
	location:setTopBottom( true, false, 39, 58 )
	location:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	location:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	location:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	location:linkToElementModel( self, "mapDisplayName", true, function ( model )
		local mapDisplayName = Engine.GetModelValue( model )
		if mapDisplayName then
			location:setText( Engine.Localize( LocalizeIntoString( "COLLECTIBLE_FOUND_IN_MAP", mapDisplayName ) ) )
		end
	end )
	self:addElement( location )
	self.location = location
	
	local notFoundName = CoD.InfoPaneItemNameLabel.new( menu, controller )
	notFoundName:setLeftRight( true, false, 0, 317.5 )
	notFoundName:setTopBottom( true, false, 0.5, 34.5 )
	notFoundName:setAlpha( 0 )
	notFoundName.itemName:setText( Engine.Localize( "COLLECTIBLE_NOT_FOUND" ) )
	self:addElement( notFoundName )
	self.notFoundName = notFoundName
	
	local notFoundLocation = LUI.UIText.new()
	notFoundLocation:setLeftRight( true, false, 0, 271.5 )
	notFoundLocation:setTopBottom( true, false, 39, 58 )
	notFoundLocation:setAlpha( 0 )
	notFoundLocation:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	notFoundLocation:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	notFoundLocation:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	notFoundLocation:linkToElementModel( self, "mapDisplayName", true, function ( model )
		local mapDisplayName = Engine.GetModelValue( model )
		if mapDisplayName then
			notFoundLocation:setText( Engine.Localize( LocalizeIntoString( "COLLECTIBLE_NEEDS_DISCOVERING", mapDisplayName ) ) )
		end
	end )
	self:addElement( notFoundLocation )
	self.notFoundLocation = notFoundLocation
	
	local notFoundLock = CoD.cac_LockBig.new( menu, controller )
	notFoundLock:setLeftRight( true, false, 338, 434 )
	notFoundLock:setTopBottom( true, false, -90, 580 )
	notFoundLock:setAlpha( 0 )
	notFoundLock:linkToElementModel( self, nil, false, function ( model )
		notFoundLock:setModel( model, controller )
	end )
	notFoundLock:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "unlocked" )
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	notFoundLock:linkToElementModel( notFoundLock, "unlocked", true, function ( model )
		menu:updateElementState( notFoundLock, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "unlocked"
		} )
	end )
	self:addElement( notFoundLock )
	self.notFoundLock = notFoundLock
	
	local description = LUI.UIText.new()
	description:setLeftRight( true, false, 0, 240.5 )
	description:setTopBottom( true, false, 64, 83 )
	description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	description:linkToElementModel( self, "description", true, function ( model )
		local _description = Engine.GetModelValue( model )
		if _description then
			description:setText( Engine.Localize( _description ) )
		end
	end )
	self:addElement( description )
	self.description = description
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				extracam:completeAnimation()
				self.extracam:setAlpha( 1 )
				self.clipFinished( extracam, {} )

				nameLabel:completeAnimation()
				self.nameLabel:setAlpha( 1 )
				self.clipFinished( nameLabel, {} )

				location:completeAnimation()
				self.location:setAlpha( 1 )
				self.clipFinished( location, {} )

				notFoundName:completeAnimation()
				self.notFoundName:setAlpha( 0 )
				self.clipFinished( notFoundName, {} )

				notFoundLocation:completeAnimation()
				self.notFoundLocation:setAlpha( 0 )
				self.clipFinished( notFoundLocation, {} )

				notFoundLock:completeAnimation()
				self.notFoundLock:setAlpha( 0 )
				self.clipFinished( notFoundLock, {} )

				description:completeAnimation()
				self.description:setAlpha( 1 )
				self.clipFinished( description, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				extracam:completeAnimation()
				self.extracam:setAlpha( 0 )
				self.clipFinished( extracam, {} )

				nameLabel:completeAnimation()
				self.nameLabel:setAlpha( 0 )
				self.clipFinished( nameLabel, {} )

				location:completeAnimation()
				self.location:setAlpha( 0 )
				self.clipFinished( location, {} )

				notFoundName:completeAnimation()
				self.notFoundName:setAlpha( 1 )
				self.clipFinished( notFoundName, {} )

				notFoundLocation:completeAnimation()
				self.notFoundLocation:setAlpha( 1 )
				self.clipFinished( notFoundLocation, {} )

				notFoundLock:completeAnimation()
				self.notFoundLock:setAlpha( 1 )
				self.clipFinished( notFoundLock, {} )

				description:completeAnimation()
				self.description:setAlpha( 0 )
				self.clipFinished( description, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "unlocked" )
			end
		}
	} )
	self:linkToElementModel( self, "unlocked", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "unlocked"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.nameLabel:close()
		element.notFoundName:close()
		element.notFoundLock:close()
		element.location:close()
		element.notFoundLocation:close()
		element.description:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

