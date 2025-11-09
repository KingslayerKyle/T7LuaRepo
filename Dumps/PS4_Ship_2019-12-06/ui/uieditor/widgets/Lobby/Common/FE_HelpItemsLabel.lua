CoD.FE_HelpItemsLabel = InheritFrom( LUI.UIElement )
CoD.FE_HelpItemsLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_HelpItemsLabel )
	self.id = "FE_HelpItemsLabel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 20 )
	self:setTopBottom( true, false, 0, 20 )
	
	local newImage = LUI.UIImage.new()
	newImage:setLeftRight( true, false, 0, 20 )
	newImage:setTopBottom( false, false, -10, 10 )
	newImage:setImage( RegisterImage( "uie_t7_menu_frontend_helptag" ) )
	self:addElement( newImage )
	self.newImage = newImage
	
	local PlaylistBreadcrumb = LUI.UIImage.new()
	PlaylistBreadcrumb:setLeftRight( true, false, 1, 39 )
	PlaylistBreadcrumb:setTopBottom( true, false, -9, 29 )
	PlaylistBreadcrumb:setImage( RegisterImage( "uie_t7_icon_breadcrumb_playlist" ) )
	PlaylistBreadcrumb:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint" ) )
	PlaylistBreadcrumb:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( PlaylistBreadcrumb )
	self.PlaylistBreadcrumb = PlaylistBreadcrumb
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				newImage:completeAnimation()
				self.newImage:setAlpha( 0 )
				self.clipFinished( newImage, {} )
				PlaylistBreadcrumb:completeAnimation()
				self.PlaylistBreadcrumb:setAlpha( 0 )
				self.clipFinished( PlaylistBreadcrumb, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				newImage:completeAnimation()
				self.newImage:setAlpha( 1 )
				self.clipFinished( newImage, {} )
				PlaylistBreadcrumb:completeAnimation()
				self.PlaylistBreadcrumb:setAlpha( 0 )
				self.clipFinished( PlaylistBreadcrumb, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Playlist = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				newImage:completeAnimation()
				self.newImage:setAlpha( 0 )
				self.clipFinished( newImage, {} )
				local PlaylistBreadcrumbFrame2 = function ( PlaylistBreadcrumb, event )
					local PlaylistBreadcrumbFrame3 = function ( PlaylistBreadcrumb, event )
						if not event.interrupted then
							PlaylistBreadcrumb:beginAnimation( "keyframe", 4300, false, false, CoD.TweenType.Linear )
						end
						PlaylistBreadcrumb:setAlpha( 1 )
						PlaylistBreadcrumb:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint" ) )
						PlaylistBreadcrumb:setShaderVector( 0, 1, 0, 0, 0 )
						if event.interrupted then
							self.clipFinished( PlaylistBreadcrumb, event )
						else
							PlaylistBreadcrumb:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PlaylistBreadcrumbFrame3( PlaylistBreadcrumb, event )
						return 
					else
						PlaylistBreadcrumb:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						PlaylistBreadcrumb:setShaderVector( 0, 1, 0, 0, 0 )
						PlaylistBreadcrumb:registerEventHandler( "transition_complete_keyframe", PlaylistBreadcrumbFrame3 )
					end
				end
				
				PlaylistBreadcrumb:completeAnimation()
				self.PlaylistBreadcrumb:setAlpha( 1 )
				self.PlaylistBreadcrumb:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint" ) )
				self.PlaylistBreadcrumb:setShaderVector( 0, 0, 0, 0, 0 )
				PlaylistBreadcrumbFrame2( PlaylistBreadcrumb, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		},
		{
			stateName = "Playlist",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

