-- f0b92180c9a26ad283df26378a10fe78
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )

CoD.FE_VialBreadcrumb = InheritFrom( LUI.UIElement )
CoD.FE_VialBreadcrumb.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_VialBreadcrumb )
	self.id = "FE_VialBreadcrumb"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 46 )
	self:setTopBottom( true, false, 0, 25 )
	self.anyChildUsesUpdateState = true
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 23 )
	Image0:setTopBottom( false, false, -11.5, 11.5 )
	Image0:setImage( RegisterImage( "uie_t7_hud_zm_vial_aar_256" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local StartMenuIdentitySubTitle = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle:setLeftRight( true, false, 18.5, 54.5 )
	StartMenuIdentitySubTitle:setTopBottom( true, false, 0, 25 )
	StartMenuIdentitySubTitle.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	StartMenuIdentitySubTitle:subscribeToGlobalModel( controller, "MegaChewTokens", "remainingTokens", function ( model )
		local remainingTokens = Engine.GetModelValue( model )
		if remainingTokens then
			StartMenuIdentitySubTitle.SubTitle:setText( Engine.Localize( remainingTokens ) )
		end
	end )
	self:addElement( StartMenuIdentitySubTitle )
	self.StartMenuIdentitySubTitle = StartMenuIdentitySubTitle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						if not event.interrupted then
							Image0:beginAnimation( "keyframe", 1409, false, false, CoD.TweenType.Linear )
						end
						Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint" ) )
						Image0:setShaderVector( 0, 1, 0, 0, 0 )
						if event.interrupted then
							self.clipFinished( Image0, event )
						else
							Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						Image0:setShaderVector( 0, 1, 0, 0, 0 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint" ) )
				self.Image0:setShaderVector( 0, 0, 0, 0, 0 )
				Image0Frame2( Image0, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuIdentitySubTitle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

