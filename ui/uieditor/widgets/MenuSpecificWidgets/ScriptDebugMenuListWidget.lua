-- ca7f67f2a7e3ff6949b79a9f60d8ff76
-- This hash is used for caching, delete to decompile the file again

CoD.ScriptDebugMenuListWidget = InheritFrom( LUI.UIElement )
CoD.ScriptDebugMenuListWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ScriptDebugMenuListWidget )
	self.id = "ScriptDebugMenuListWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 600 )
	self:setTopBottom( true, false, 0, 30 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local selectedImage = LUI.UIImage.new()
	selectedImage:setLeftRight( true, true, 0, -600 )
	selectedImage:setTopBottom( true, true, 0, 0 )
	selectedImage:setRGB( 1, 0.64, 0 )
	selectedImage:setAlpha( 0 )
	self:addElement( selectedImage )
	self.selectedImage = selectedImage
	
	local listItemName = LUI.UITightText.new()
	listItemName:setLeftRight( true, false, 15, 185 )
	listItemName:setTopBottom( false, false, -12, 8 )
	listItemName:setZoom( 10 )
	listItemName:setTTF( "fonts/default.ttf" )
	self:addElement( listItemName )
	self.listItemName = listItemName
	
	self.listItemName:linkToElementModel( self, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			listItemName:setRGB( color )
		end
	end )
	self.listItemName:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			listItemName:setText( Engine.Localize( name ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				selectedImage:completeAnimation()
				self.selectedImage:setAlpha( 0 )
				self.clipFinished( selectedImage, {} )

				listItemName:completeAnimation()
				self.listItemName:setLeftRight( true, false, 1, 157 )
				self.listItemName:setTopBottom( false, false, -12, 8 )
				self.clipFinished( listItemName, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )

				selectedImage:completeAnimation()
				self.selectedImage:setLeftRight( true, true, 0, -592 )
				self.selectedImage:setTopBottom( true, true, 0, 0 )
				self.selectedImage:setAlpha( 1 )
				self.clipFinished( selectedImage, {} )

				listItemName:completeAnimation()
				self.listItemName:setLeftRight( true, false, 15, 171 )
				self.listItemName:setTopBottom( false, false, -12, 8 )
				self.clipFinished( listItemName, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 2 )

				local selectedImageFrame2 = function ( selectedImage, event )
					if not event.interrupted then
						selectedImage:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					selectedImage:setLeftRight( true, true, 0, -592 )
					selectedImage:setTopBottom( true, true, 0, 0 )
					selectedImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( selectedImage, event )
					else
						selectedImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectedImage:completeAnimation()
				self.selectedImage:setLeftRight( true, true, 0, -600 )
				self.selectedImage:setTopBottom( true, true, 0, 0 )
				self.selectedImage:setAlpha( 0 )
				selectedImageFrame2( selectedImage, {} )

				listItemName:completeAnimation()
				self.listItemName:setLeftRight( true, false, 15, 171 )
				self.listItemName:setTopBottom( false, false, -12, 8 )
				self.clipFinished( listItemName, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.listItemName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

