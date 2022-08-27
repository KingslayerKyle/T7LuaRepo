-- 198074f4f6f9d81481ddc0a2481f2d59
-- This hash is used for caching, delete to decompile the file again

CoD.SpecialContracts_Timer = InheritFrom( LUI.UIElement )
CoD.SpecialContracts_Timer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpecialContracts_Timer )
	self.id = "SpecialContracts_Timer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 219 )
	self:setTopBottom( true, false, 0, 16 )
	
	local TriplePlayTimer = LUI.UIText.new()
	TriplePlayTimer:setLeftRight( true, true, 0, 0 )
	TriplePlayTimer:setTopBottom( true, false, 0, 16 )
	TriplePlayTimer:setRGB( 0.46, 0.8, 0.75 )
	TriplePlayTimer:setText( Engine.Localize( "MPUI_BM_PROMO_EXPIRES" ) )
	TriplePlayTimer:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	TriplePlayTimer:setLetterSpacing( -1 )
	TriplePlayTimer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	TriplePlayTimer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TriplePlayTimer:registerEventHandler( "menu_opened", function ( element, event )
		local f2_local0 = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )
	self:addElement( TriplePlayTimer )
	self.TriplePlayTimer = TriplePlayTimer
	
	local GrandSlamTimer = LUI.UIText.new()
	GrandSlamTimer:setLeftRight( true, true, 0, 0 )
	GrandSlamTimer:setTopBottom( true, false, 0, 16 )
	GrandSlamTimer:setRGB( 0.46, 0.8, 0.75 )
	GrandSlamTimer:setText( Engine.Localize( "MPUI_BM_PROMO_EXPIRES" ) )
	GrandSlamTimer:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	GrandSlamTimer:setLetterSpacing( -1 )
	GrandSlamTimer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	GrandSlamTimer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	GrandSlamTimer:registerEventHandler( "menu_opened", function ( element, event )
		local f3_local0 = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:addElement( GrandSlamTimer )
	self.GrandSlamTimer = GrandSlamTimer
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				TriplePlayTimer:completeAnimation()
				self.TriplePlayTimer:setAlpha( 0 )
				self.clipFinished( TriplePlayTimer, {} )
				GrandSlamTimer:completeAnimation()
				self.GrandSlamTimer:setAlpha( 0 )
				self.clipFinished( GrandSlamTimer, {} )
			end
		},
		TriplePlay = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				TriplePlayTimer:completeAnimation()
				self.TriplePlayTimer:setAlpha( 1 )
				self.clipFinished( TriplePlayTimer, {} )
				GrandSlamTimer:completeAnimation()
				self.GrandSlamTimer:setAlpha( 0 )
				self.clipFinished( GrandSlamTimer, {} )
			end
		},
		GrandSlam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				TriplePlayTimer:completeAnimation()
				self.TriplePlayTimer:setAlpha( 0 )
				self.clipFinished( TriplePlayTimer, {} )
				GrandSlamTimer:completeAnimation()
				self.GrandSlamTimer:setAlpha( 1 )
				self.clipFinished( GrandSlamTimer, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

