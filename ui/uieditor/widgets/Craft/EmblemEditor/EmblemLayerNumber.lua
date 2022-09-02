-- 9f31a69c61c14428c49e13b64167c77d
-- This hash is used for caching, delete to decompile the file again

CoD.EmblemLayerNumber = InheritFrom( LUI.UIElement )
CoD.EmblemLayerNumber.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.EmblemLayerNumber )
	self.id = "EmblemLayerNumber"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 72 )
	self:setTopBottom( true, false, 0, 24 )
	
	local topbar = LUI.UIImage.new()
	topbar:setLeftRight( true, false, 0, 64 )
	topbar:setTopBottom( true, false, 0, 16 )
	topbar:setRGB( 0, 0, 0 )
	topbar:setAlpha( 0 )
	self:addElement( topbar )
	self.topbar = topbar
	
	local layerNumber = LUI.UITightText.new()
	layerNumber:setLeftRight( true, false, 20, 50 )
	layerNumber:setTopBottom( true, true, 48, -48 )
	layerNumber:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	layerNumber:linkToElementModel( self, "layerNumberString", true, function ( model )
		local layerNumberString = Engine.GetModelValue( model )
		if layerNumberString then
			layerNumber:setText( Engine.Localize( layerNumberString ) )
		end
	end )
	self:addElement( layerNumber )
	self.layerNumber = layerNumber
	
	local groupIcon = LUI.UIImage.new()
	groupIcon:setLeftRight( true, false, 0, 20 )
	groupIcon:setTopBottom( false, false, -10, 10 )
	groupIcon:setImage( RegisterImage( "uie_t7_menu_emblem_group" ) )
	self:addElement( groupIcon )
	self.groupIcon = groupIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				layerNumber:completeAnimation()
				self.layerNumber:setLeftRight( true, false, 0, 29 )
				self.layerNumber:setTopBottom( true, true, 0, 0 )
				self.layerNumber:setAlpha( 1 )
				self.clipFinished( layerNumber, {} )

				groupIcon:completeAnimation()
				self.groupIcon:setLeftRight( true, false, 0, 20 )
				self.groupIcon:setTopBottom( false, false, -10, 10 )
				self.groupIcon:setAlpha( 0 )
				self.clipFinished( groupIcon, {} )
			end
		},
		GroupLayerNum = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				topbar:completeAnimation()
				self.topbar:setAlpha( 0 )
				self.clipFinished( topbar, {} )

				layerNumber:completeAnimation()
				self.layerNumber:setLeftRight( true, false, 20, 50 )
				self.layerNumber:setTopBottom( true, true, 0, 0 )
				self.layerNumber:setAlpha( 1 )
				self.clipFinished( layerNumber, {} )

				groupIcon:completeAnimation()
				self.groupIcon:setLeftRight( true, false, 0, 20 )
				self.groupIcon:setTopBottom( false, false, -10, 10 )
				self.groupIcon:setAlpha( 1 )
				self.clipFinished( groupIcon, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.layerNumber:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

